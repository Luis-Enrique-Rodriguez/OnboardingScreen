import 'package:flutter/material.dart';
import 'package:login/database/agendaDB.dart';
import 'package:login/models/carrera_model.dart';
import 'package:login/widgets/CardCarreraWidget.dart';
import 'package:login/assets/global_values.dart';

class CarreraScreen extends StatefulWidget {
  const CarreraScreen({super.key});

  @override
  State<CarreraScreen> createState() => _CarreraScreenState();
}

class _CarreraScreenState extends State<CarreraScreen> {
AgendaDB? agendaDB;
TextEditingController conBuscar = TextEditingController();

@override
void initState(){
      super.initState();
      agendaDB = AgendaDB();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: Text("Carreras"),
        actions:[
            IconButton(
              onPressed:()=>Navigator.pushNamed(context, '/add_carrera')
              .then((value) {
                  setState(() {});
                }
                ),
              icon: Icon(Icons.add)
            )
        ],
      ), 
      body: ValueListenableBuilder(
        valueListenable: globalValues.flagTask,
        builder: (context,value,_) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: conBuscar,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Buscar Carrera",
                  ),
                ),
              ),
              /*Expanded(
                child: ListView.builder(
                  //itemCount: agendaDB!.carrera.length,
                  //itemBuilder: (context, index) {
                  //  return CardCarreraWidget(
                  //    carrera: agendaDB!.carreras[index],
                  //  );
                  },
                ),
              ),*/
            ],
          );

          /*return FutureBuilder(
            future: agendaDB!.GETALLCARRERA(),
            builder: (BuildContext context, AsyncSnapshot<List<CarreraModel>> snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index){
                    return CardCarreraWidget(
                      carreraModel: snapshot.data![index],
                      agendaDB:agendaDB
                    );
                  }
                );
              }else{
                if(snapshot.hasError){
                  return const Center(
                    child: Text("NO HAY CARRERAS REGISTRADAS"),
                  );
                }else{
                  return const CircularProgressIndicator();
                }
              }
            }
          );*/
        }
      ),);
  }
}