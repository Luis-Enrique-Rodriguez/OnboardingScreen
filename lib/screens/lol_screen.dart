import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:login/models/card_lol.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher_string.dart';


class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hola',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
      
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});
  final data = [
    CardChampData(
        title: 'League of Legends',
        subtitile: 'Elige un carril, domina la jungla, despeja el camino y destruye la base',
        image: const AssetImage("assets/logo.png"),
        backgroundColor: Colors.black,
        titleColor: Colors.white,
        subtitleColor: Colors.white,
        background: LottieBuilder.asset('assets/animation/bg-1.json')
      ),
          CardChampData(
        title: 'Campeones',
        subtitile: 'Elige entre más de 140 campeones. Domina a uno o dominalos a todos.',
        image: const AssetImage("assets/campeones.jpg"),
        backgroundColor: Color.fromRGBO(12, 33, 128, 1),
        titleColor: Colors.white,
        subtitleColor: Colors.white,
        background: LottieBuilder.asset("assets/animation/bg-1.json")

      ),
          CardChampData(
        title: 'Mapa',
        subtitile: 'Grieta del Invocador. Donde la energia es potente y muy concentrada, haciendola una localización muy buscada y deseada',
        image: const AssetImage("assets/mapa.jpg"),
        backgroundColor: Color.fromARGB(255, 134, 95, 74),
        titleColor: Colors.white,
        subtitleColor: Colors.white,
        background: LottieBuilder.asset("assets/animation/bg-1.json")

      ),  
  ];
    
  @override
  Widget build(BuildContext context) {
  final String URL = 'https://www.leagueoflegends.com/es-es/';
  final btnInternet= FloatingActionButton.extended(
  icon: Icon(Icons.keyboard_return),
  label: Text ('Visitar'),
  onPressed: (){
      launchUrlString(URL);
    }
  );

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: btnInternet,
      
      body: ConcentricPageView(
        itemCount: data.length,
        colors: data.map((e) => e.backgroundColor).toList(),
        itemBuilder: (int index) {
        return CardChamp(data: data[index]);
        },
      ),
    );
  }
}
