

import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State <loginScreen> createState() =>  loginScreenState();
}

class  loginScreenState extends State <loginScreen> {
  @override
  Widget build(BuildContext context) {

    TextEditingController txtConUser = TextEditingController();
    TextEditingController txtConPass = TextEditingController();

    final txtUser  = TextField(
      controller: txtConUser,
      decoration: const InputDecoration(
        border: OutlineInputBorder()
      )
      );

    final txtPass  = TextField(
      controller: txtConPass,
      decoration: const InputDecoration(
        border: OutlineInputBorder()),
      obscureText: true,
      );

    final imgLogo = Container(
      width: 50,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB-7TSWm7_shmJkg4sxk1UJAB30NaAsoDHPA&usqp=CAU')
              )
            ),
        );

final btnEntrar = FloatingActionButton.extended(
  icon: Icon(Icons.login),
  label: Text ('Entrar'),
  onPressed: (){
      Navigator.pushNamed(context, '/dash');
    }
  );




    return Scaffold(
      body: Container(
        
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR7sPI5GtEpNMAKR1IWXCl5C2Ugix0AFp2iQ&usqp=CAU')
              )
            ),
        child: Padding(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
          Container(
            height: 200,
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey
              ),
            child: Column(
              children: [
                    txtUser,
                    const SizedBox(height: 10),
                    txtPass
                      ],
                    ),
          ),
          imgLogo
                ],
              ),
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: btnEntrar,
      
        );
       

       
  }
}