import 'package:flutter/material.dart';
import 'package:login/assets/global_values.dart';
import 'package:login/database/agendaDB.dart';
import 'package:login/models/task_model.dart';

class AddTask extends StatefulWidget {
 AddTask({super.key, this.taskModel});

  TaskModel? taskModel;

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

    TextEditingController txtConName = TextEditingController();
    TextEditingController txtConDsc = TextEditingController();
    TextEditingController txtConDate = TextEditingController();
    TextEditingController txtConTime = TextEditingController();

    String? dropDownValue = 'Pendiente';
    List<String> dropDownValues = [
      'Pendiente', 'Completado', 'En Proceso'
    ];

AgendaDB? agendaDB;
@override
void initState() {
  super.initState();
  agendaDB = AgendaDB();
    if(widget.taskModel != null){
    txtConName.text = widget.taskModel!.nameTask!;
    txtConDsc.text = widget.taskModel!.dscTask!; 
    switch (widget.taskModel!.sttTask!) {
      case 'C':
        dropDownValue = 'Completado';
        break;
      case 'E':
        dropDownValue = 'En Proceso';
        break;
      case 'P':
        dropDownValue = 'Pendiente';
        break;}
    }
}

  @override
  Widget build(BuildContext context) {
    
    final txtNameTask = TextFormField(
      decoration: const InputDecoration(
        label: Text('Tarea'),
        border: OutlineInputBorder()
      ),
      controller: txtConName,
    );

    final txtDscTask = TextField(
      decoration: const InputDecoration(
        label: Text('Descripción'),
        border: OutlineInputBorder()
      ),
      maxLines: 6,
      controller: txtConDsc,
    );

    final txtDateTask = TextFormField(
      decoration: const InputDecoration(
        label: Text('Fecha'),
        border: OutlineInputBorder()
      ),
      controller: txtConDate,
    );

final space = SizedBox(height: 10);

    final DropdownButton ddBStatus = DropdownButton(
      value: dropDownValue,
      items: dropDownValues.map(
        (status) => DropdownMenuItem(
          value: status,
          child: Text(status)
        )
      ).toList(), 
      onChanged: (value){
        dropDownValue = value;
        setState(() {});
      }
    );

    final ElevatedButton btnGuardar = ElevatedButton(
      onPressed: (){
        if(widget.taskModel == null){
        agendaDB!.INSERT('tblTareas', { 
          'nameTask': txtConName.text,
          'dscTask': txtConDsc.text,
          'sttTask': dropDownValue!.substring(0,1)
        }).then((value){
          var msj = (value > 0) 
          ? 'La insercion fue correcta' 
          : 'Error';
          var snackBar = const SnackBar(content: Text('Task saved'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pop(context);
        });
      }else{
         agendaDB!.UPDATE('tblTareas', {
          'idTask' : widget.taskModel!.idTask, 
          'nameTask': txtConName.text,
          'dscTask': txtConDsc.text,
          'sttTask': dropDownValue!.substring(0,1)
          }).then((value) {
            globalValues.flagTask.value = !globalValues.flagTask.value;
            var msj = (value > 0) 
            ? 'La insercion fue correcta' 
            : 'Error';
            var snackBar = const SnackBar(
            content: Text('Task saved'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pop(context);
          });
        }
      },
      child: Text('Save Task')
    );

    return Scaffold(
      appBar: AppBar(
        title: widget.taskModel == null 
        ? Text('Add Task') 
        : Text('Update Task')
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            txtNameTask,
            space,
            txtDscTask,
            ddBStatus,
            btnGuardar
          ],
        ),
      ),
    );
  }
}