import 'package:flutter/widgets.dart';
import 'package:login/screens/dashboard_screen.dart';
import 'package:login/screens/lol_screen.dart';

Map<String, WidgetBuilder> getRoutes(){
  return{
    '/dash':(BuildContext context) => DashboardScreen(),
    '/card':(BuildContext context) => Home(),
  };
}