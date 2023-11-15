import 'dart:async';
import 'dart:io';
import 'package:login/models/carrera_model.dart';
import 'package:login/models/popular_model.dart';
import 'package:login/models/profesor_model.dart';
import 'package:login/models/task_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AgendaDB {
  static final nameDB = 'AGENDADB';
  static final versionDB = 1;
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database!;
    return _database = await _initDatabase();
  }

  Future<Database?> _initDatabase() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String pathDB = join(folder.path, nameDB);
    return openDatabase(pathDB, version: versionDB, onCreate: _createTables);
  }

  FutureOr<void> _createTables(Database db, int version) {
    String query ='''CREATE TABLE tblTareas(
      idTask INTEGER PRIMARY KEY,
      nameTask VARCHAR(50),
      dscTask VARCHAR(100),
      sttTask BYTE, 
      fecExpiracion DateTime, 
      fecRecordatorio DateTime, 
      idProfe INTEGER,
      FOREIGN KEY (idProfe) REFERENCES tblProfesor(idProfe)
    );''';

    String query2='''CREATE TABLE tblCarrera(
      idCarrera INTEGER PRIMARY KEY,
      nomCarrera VARCHAR(50)
    );''';

    String query3='''CREATE TABLE tblProfesor(
      idProfe INTEGER PRIMARY KEY, 
      nomProfe VARCHAR(50), 
      idCarrera INTEGER, 
      email VARCHAR(50),
      FOREIGN KEY (idCarrera) REFERENCES tblCarrera(idCarrera)
    );''';
         
    String query4 ='''CREATE TABLE tblPopular(
        backdrop_path TEXT, 
        id INTEGER, 
        original_language TEXT, 
        original_title TEXT, 
        overview TEXT, 
        popularity REAL, 
        poster_path TEXT, 
        release_date TEXT, 
        title TEXT, 
        vote_average REAL, 
        vote_count INTEGER
      );''';

    db.execute(query2);
    db.execute(query3);
    db.execute(query);
    db.execute(query4);
  }

  Future<int> INSERT(String tblName, Map<String, dynamic> data) async {
    var conexion = await database;
    return conexion!.insert(tblName, data);
  }

  Future<int> UPDATE(String tblName, Map<String, dynamic> data) async {
    var conexion = await database;
    return conexion!.update(tblName, data,
        where: 'idTask = ?', whereArgs: [data['idTask']]);
  }

  Future<int> DELETE(String tblName, int idTask) async {
    var conexion = await database;
    return conexion!.delete(tblName, where: 'idTask = ?', whereArgs: [idTask]);
  }

  Future<List<TaskModel>> GETALLTASK() async{
    var conexion = await database;
    var result = await conexion!.query('tblTareas');
    return result.map((task)=>TaskModel.fromMap(task)).toList();
  }
  
  Future<List<ProfesorModel>> GETALLPROFESOR() async{
    var conexion = await database;
    var result = await conexion!.query('tblProfesor');
    return result.map((profesor)=>ProfesorModel.fromMap(profesor)).toList();
  }
    
  Future<List<CarreraModel>> GETALLCARRERA() async{
    var conexion = await database;
    var result = await conexion!.query('tblCarrera');
    return result.map((carrera)=>CarreraModel.fromMap(carrera)).toList();
  }

  Future<List<PopularModel>> GETALLPOPULAR() async {
    var conexion = await database;
    var result = await conexion!.query('tblPopular');
    return result.map((event) => PopularModel.fromMap(event)).toList();
  }

  Future<List<PopularModel>> GETPOPULAR(int id) async {
    var conexion = await database;
    var result = await conexion!.query('tblPopular', where: 'id=$id');
    return result.map((event) => PopularModel.fromMap(event)).toList();
  }

}