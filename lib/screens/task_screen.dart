import 'package:flutter/material.dart';
import 'package:login/assets/global_values.dart';
import 'package:login/database/agendaDB.dart';
import 'package:login/models/task_model.dart';
import 'package:login/widgets/CardTaskWidget.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

  AgendaDB? agendaDB;

@override
void initState(){
      super.initState();
      agendaDB = AgendaDB();
}

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text("Tareas"),
        actions:[
            IconButton(
              onPressed:()=>Navigator.pushNamed(context, '/add')
              .then((value) {
                  setState(() {});
                }
                ),
              icon: Icon(Icons.task)
            )
        ],
      ), 
      body: ValueListenableBuilder(
        valueListenable: globalValues.flagTask,
        builder: (context,value,_) {
          return FutureBuilder(
            future: agendaDB!.GETALLTASK(),
            builder: (BuildContext context, AsyncSnapshot<List<TaskModel>> snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index){
                    return CardTaskWidget(
                      taskModel: snapshot.data![index],
                      agendaDB:agendaDB
                    );
                  }
                );
              }else{
                if(snapshot.hasError){
                  return const Center(
                    child: Text("Something was wrong"),
                  );
                }else{
                  return const CircularProgressIndicator();
                }
              }
            }
          );
        }
      ),
    );
  }
}


