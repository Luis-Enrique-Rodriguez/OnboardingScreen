import 'package:flutter/material.dart';
import 'package:login/assets/styles_app.dart';
import 'package:login/routes.dart';
import 'package:login/screens/login_screen.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

@override
  Widget build(BuildContext context){
    return MaterialApp(
    home: loginScreen(),
    routes: getRoutes(),
    
    //theme: StylesApp.lightTheme(context)
    theme: StylesApp.darkTheme(context)
    /*routes: {
      '/dash':(BuildContext context) => loginScreen()
    },*/

    
    ); 
  }
}
