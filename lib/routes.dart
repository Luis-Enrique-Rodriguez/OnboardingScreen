import 'package:flutter/widgets.dart';
import 'package:login/screens/add_carrera.dart';
import 'package:login/screens/add_profe.dart';
import 'package:login/screens/add_task.dart';
import 'package:login/screens/calendar_screen.dart';
import 'package:login/screens/carrera_screen.dart';
import 'package:login/screens/dashboard_screen.dart';
import 'package:login/screens/detail_movie_screnn.dart';
import 'package:login/screens/login_screen.dart';
import 'package:login/screens/lol_screen.dart';
import 'package:login/screens/popular_screen.dart';
import 'package:login/screens/profesor_screen.dart';
import 'package:login/screens/provider_screen.dart';
import 'package:login/screens/register_screen.dart';
import 'package:login/screens/task_screen.dart';

Map<String, WidgetBuilder> getRoutes(){
  return <String, WidgetBuilder>{
    '/dash':(BuildContext context) => DashboardScreen(),
    '/dash_log':(BuildContext context) => LoginScreen(),
    '/card':(BuildContext context) => Home(),
    '/task':(BuildContext context) => TaskScreen(),
    '/add':(BuildContext context) => AddTask(),
    '/popular':(BuildContext context) => PopularScreen(), //Aqui se manda llamar detailMovie
    //'/detail':(BuildContext context) => DetailMovieScreen(model: ),
    '/prov': (BuildContext context) => ProviderScreen(),
    '/calendar' : (BuildContext context) => CalendarScreen(),
    '/profesor' : (BuildContext context) => ProfesorScreen(),
    '/carrera' : (BuildContext context) => CarreraScreen(),
    '/add_carrera': (BuildContext context) => AddCarrera(),
    '/add_profesor': (BuildContext context) => AddProfesor(),
    '/register': (BuildContext context) => RegisterScreen()
  };
}