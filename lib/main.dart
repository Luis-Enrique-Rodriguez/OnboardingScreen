import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/assets/global_values.dart';
import 'package:login/assets/styles_app.dart';
import 'package:login/provider/test_provider.dart';
import 'package:login/routes.dart';
import 'package:login/screens/login_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
} 

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    globalValues().readValue();
}

@override
  Widget build(BuildContext context){
    return ValueListenableBuilder(
      valueListenable: globalValues.flagTheme,
      builder: (context, value, _) {
        return ChangeNotifierProvider(
          create: (context) => TestProvider(),
          child: MaterialApp(
            home: LoginScreen(),
            routes: getRoutes(),
            theme: value ? StylesApp.darkTheme(context) : StylesApp.lightTheme(context)
          ),
        );
      }
    ); 
  }
}
