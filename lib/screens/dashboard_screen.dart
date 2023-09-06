import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});


  @override
  Widget build(BuildContext context) {


  final btnLoL = FloatingActionButton.extended(

  icon: Icon(Icons.check),
  label: Text ('Vamos!'),
  
  onPressed: (){
      Navigator.pushNamed(context, '/card');
    }
  );

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido :)'),
      ),
      drawer: createDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: btnLoL,
    );

  }

  

  Widget createDrawer() {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              ),
              accountName: Text('Luis Enrique Moreno Rodriguez'),
              accountEmail: Text('luis_rodriguez420@hotmail.com')),
          ListTile(
            leading: Image.asset("assets/fresa.png"),
            //leading: Image.network('https://img.icons8.com/?size=1x&id=95287&format=png'),
            trailing: Icon(Icons.chevron_right),
            title: Text('FruitApp'),
            subtitle: Text('Carrousel'),
            onTap: () {},
          ),
          /*DayNightSwitcher(
            isDarkModeEnabled: isDarkModeEnabled,
            onStateChanged: (isDarkModeEnabled) {
              setState(() {
                this.isDarkModeEnabled = isDarkModeEnabled;
              });
            },
          ),*/
        ],
      ),
    );
  }
}
