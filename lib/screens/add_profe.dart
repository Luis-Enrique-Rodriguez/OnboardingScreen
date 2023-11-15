import 'package:flutter/material.dart';
import 'package:login/database/agendaDB.dart';
import 'package:login/assets/global_values.dart';
import 'package:login/models/profesor_model.dart';

class AddProfesor extends StatefulWidget {
  AddProfesor({super.key, this.profesorModel});

  ProfesorModel? profesorModel;

  @override
  State<AddProfesor> createState() => _AddProfesorState();
}

class _AddProfesorState extends State<AddProfesor> {
    TextEditingController txtConName = TextEditingController();
    TextEditingController txtConEmail = TextEditingController();
    TextEditingController txtConIdCarrera = TextEditingController();


AgendaDB? agendaDB;
@override
void initState() {
  super.initState();
  agendaDB = AgendaDB();
    if(widget.profesorModel != null){
    txtConName.text = widget.profesorModel!.nomProfe!;
    txtConEmail.text = widget.profesorModel!.email!;
    txtConIdCarrera.text = widget.profesorModel!.idCarrera! as String;
    /*switch (widget.profesorModel!.sttTask!) {
      case 'C':
        dropDownValue = 'Completado';
        break;
      case 'E':
        dropDownValue = 'En Proceso';
        break;
      case 'P':
        dropDownValue = 'Pendiente';
        break;}*/
    }
    //dropDownValue = widget.taskModel!.sttTask!;
}

  @override
  Widget build(BuildContext context) {
    
    final txtName = TextFormField(
      decoration: const InputDecoration(
        label: Text('Nombre'),
        border: OutlineInputBorder()
      ),
      controller: txtConName,
    );

    final txtEmail = TextField(
      decoration: const InputDecoration(
        label: Text('Email'),
        border: OutlineInputBorder()
      ),
      maxLines: 6,
      controller: txtConEmail,
    );

    final txtCarrera = TextField(
      decoration: const InputDecoration(
        label: Text('Carrera'),
        border: OutlineInputBorder()
      ),
      maxLines: 6,
      controller: txtConIdCarrera,
    );

final space = SizedBox(height: 10);

    /*final DropdownButton ddBStatus = DropdownButton(
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
    );*/

    final ElevatedButton btnGuardar = ElevatedButton(
      onPressed: (){
        if(widget.profesorModel == null){
        agendaDB!.INSERT('tblProfesor', { 
          'nomProf': txtConName.text,
          'email': txtConEmail.text,
          'idCarrera' : txtConIdCarrera.text
        }).then((value){
          var msj = (value > 0) 
          ? 'La insercion fue correcta' 
          : 'Error';
          var snackBar = const SnackBar(content: Text('Profesor saved'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pop(context);
        });
      }else{
         agendaDB!.UPDATE('tblProfesor', {
          'idProfe' : widget.profesorModel!.idProfe, 
          'nomProfe': txtConName.text,
          'email': txtConEmail.text,
          'idCarrera' : txtConIdCarrera.text
          //'sttTask': dropDownValue!.substring(0,1)
          }).then((value) {
            globalValues.flagTask.value = !globalValues.flagTask.value;
            var msj = (value > 0) 
            ? 'La insercion fue correcta' 
            : 'Error';
            var snackBar = const SnackBar(
            content: Text('Profesor saved'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pop(context);
            }
          );
        }
      },
      child: Text('Save Profesor')
    );

    return Scaffold(appBar: AppBar(
        title: widget.profesorModel == null 
        ? Text('Add Profesor') 
        : Text('Update Profesor')
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            txtName,
            space,
            txtEmail,
            space,
            txtCarrera,
            btnGuardar
          ],
        ),
      ),
    );
  }
}