import 'package:flutter/material.dart';
import 'package:login/database/agendaDB.dart';
import 'package:login/assets/global_values.dart';
import 'package:login/models/carrera_model.dart';
import 'package:login/models/profesor_model.dart';

class AddCarrera extends StatefulWidget {
  AddCarrera({super.key, this.carreraModel});

  CarreraModel? carreraModel;

  @override
  State<AddCarrera> createState() => _AddProfesorState();
}

class _AddProfesorState extends State<AddCarrera> {
    TextEditingController txtConName = TextEditingController();

    /*String? dropDownValue = 'Pendiente';
    List<String> dropDownValues = [
      'Pendiente', 'Completado', 'En Proceso'
    ];*/

AgendaDB? agendaDB;
@override
void initState() {
  super.initState();
  agendaDB = AgendaDB();
    if(widget.carreraModel != null){
    txtConName.text = widget.carreraModel!.nomCarrera!;
    //txtConEmail.text = widget.carreraModel!.email!;
    //txtConIdCarrera.text = widget.carreraModel!.idCarrera! as String;
    /*switch (widget.carreraModel!.sttTask!) {
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
        label: Text('Carrera'),
        border: OutlineInputBorder()
      ),
      controller: txtConName,
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
        if(widget.carreraModel == null){
        agendaDB!.INSERT('tblCarrera', { 
          'nomProf': txtConName.text,
        }).then((value){
          var msj = (value > 0) 
          ? 'La insercion fue correcta' 
          : 'Error';
          var snackBar = const SnackBar(content: Text('Carrera saved'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pop(context);
        });
      }else{
         agendaDB!.UPDATE('tblCarrera', {
          'idCarrera' : widget.carreraModel!.idCarrera, 
          'nomCarrera': txtConName.text
          }).then((value) {
            globalValues.flagTask.value = !globalValues.flagTask.value;
            var msj = (value > 0) 
            ? 'La insercion fue correcta' 
            : 'Error';
            var snackBar = const SnackBar(
            content: Text('Carrera saved'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pop(context);
            }
          );
        }
      },
      child: Text('Save Carrera')
    );

    return Scaffold(appBar: AppBar(
        title: widget.carreraModel == null 
        ? Text('Add Carrera') 
        : Text('Update Carrera')
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            txtName,
            space,
            //ddBStatus,
            btnGuardar
          ],
        ),
      ),
    );
  }
}