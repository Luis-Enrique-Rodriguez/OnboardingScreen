import 'package:flutter/material.dart';
import 'package:login/firebase/email_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool isSessionSaved = false;

  final emailAuth = new EmailAuth();

  @override
  void initState() {
    super.initState();
    checkSavedSession(); 
  }

  void checkSavedSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? sessionSaved = prefs.getBool('sessionSaved');
    //if (sessionSaved != null && sessionSaved) {
      Navigator.pushReplacementNamed(context, '/dash'); 
    //}
  }

  void saveSession(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('sessionSaved', value);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController txtConUser = TextEditingController();
    TextEditingController txtConPass = TextEditingController();

    final txtUser = TextField(
      controller: txtConUser,
      decoration: const InputDecoration(border: OutlineInputBorder()),
    );

    final txtPass = TextField(
      controller: txtConPass,
      decoration: const InputDecoration(border: OutlineInputBorder()),
      obscureText: true,
    );

    final imgLogo = Container(
      width: 250,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQB-7TSWm7_shmJkg4sxk1UJAB30NaAsoDHPA&usqp=CAU'))),
    );

    final btnEntrar = FloatingActionButton.extended(
      icon: Icon(Icons.login),
      label: Text('Entrar'),
      onPressed: () async {
        //bool res = await emailAuth.validateUser(emailUser: txtConUser.text, pwdUser: txtConPass.text);
        //if(res){
          Navigator.pushNamed(context, '/dash');
        //}
        saveSession(isSessionSaved);
      },
    );

    final sessionCheckbox = Checkbox(
      value: isSessionSaved,
      onChanged: (value) {
        setState(() {
          isSessionSaved = value!;
        });
      },
    );

    final sessionCheckboxContainer = Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Text('Guardar sesión'),
          SizedBox(width: 10.0),
          sessionCheckbox,
        ],
      ),
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.8,
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR7sPI5GtEpNMAKR1IWXCl5C2Ugix0AFp2iQ&usqp=CAU'
              )
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 120.0),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 250,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(71, 77, 205, 255),
                ),
                child: Column(
                  children: [
                    txtUser,
                    const SizedBox(
                      height: 5,
                    ),
                    txtPass,
                  ],
                ),
              ),
              imgLogo,
              sessionCheckboxContainer,
              /*TextButton(
                onPressed: () => Navigator.pushNamed(context, '/register'), 
                child: const Text('Registrarse', 
                style: TextStyle(fontSize: 20),
                )
              ),*/
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: btnEntrar,
    );
  }
}

