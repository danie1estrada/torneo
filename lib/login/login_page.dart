import 'package:flutter/material.dart';
import 'package:tournament_app/torneos/torneos_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Form(
        child: Center(
          child: Container(
            color: Colors.white,
            width: 480,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /**
                 * Poner la imagen aquí
                 */
                
                

                /**
                 * Caja de texto para el usuario
                 */
                SizedBox(height: 24),
                TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: "Username"
                  ),
                ),
                
                /**
                 * Caja de texto para la contraseña
                 */
                SizedBox(height: 24),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: "Contraseña"
                  ),
                  obscureText: true,
                ),

                /**
                 * Botón para iniciar sesión
                 */
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(TorneosPage.routeName);
                    /* ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("usuario: ${usernameController.text}, contraseña: ${passwordController.text}")
                    )); */
                  },
                  child: Text("Login")
                )
              ]
            ),
          )
        )
      )
    );
  }
}