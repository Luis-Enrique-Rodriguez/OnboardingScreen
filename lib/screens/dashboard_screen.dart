import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:login/assets/global_values.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('sessionSaved');
    Navigator.pushReplacementNamed(context, '/dash_log');
  }

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
          ListTile(
            leading: Icon(Icons.task_alt_outlined),
            trailing: Icon(Icons.chevron_right),
            title: Text('Task Manager'),
            onTap: () => Navigator.pushNamed(context, '/task'), 
          ),
          ListTile(
            leading: Icon(Icons.movie),
            trailing: Icon(Icons.chevron_right),
            title: Text('Movies'),
            onTap: () => Navigator.pushNamed(context, '/popular'), 
          ),
          ListTile(
            leading: Icon(Icons.check),
            trailing: Icon(Icons.chevron_right),
            title: Text('Provider'),
            onTap: () => Navigator.pushNamed(context, '/prov'), 
          ),
          ListTile(
            leading: Icon(Icons.calendar_month),
            trailing: Icon(Icons.chevron_right),
            title: Text('Calendario'),
            onTap: () => Navigator.pushNamed(context, '/calendar'), 
          ),
          ListTile(
            leading: Icon(Icons.person),
            trailing: Icon(Icons.chevron_right),
            title: Text('Profesor'),
            onTap: () => Navigator.pushNamed(context, '/profesor'), 
          ),
          ListTile(
            leading: Icon(Icons.school),
            trailing: Icon(Icons.chevron_right),
            title: Text('Carrera'),
            onTap: () => Navigator.pushNamed(context, '/carrera'), 
          ),
          DayNightSwitcher(
            isDarkModeEnabled: globalValues.flagTheme.value,
            onStateChanged: (isDarkModeEnabled) {
            globalValues.flagTheme.value = isDarkModeEnabled;
            globalValues().saveValue(isDarkModeEnabled);
            },
          ),
          ListTile(
            leading: Icon(
                Icons.logout), // Ícono de cerrar sesión
            title: Text('Cerrar sesión'),
            onTap: () {
              logout(); // Llama a la función logout al hacer clic en "Cerrar sesión"
            },
          )
        ],
      ),
    );
  }
}
