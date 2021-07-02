import 'package:flutter/material.dart';
import 'package:tournament_app/app/ver_equipo/ver_equipo_page.dart';
import 'package:tournament_app/crear_equipo/crear_equipo_page.dart';
import 'package:tournament_app/crear_torneo/crear_torneo_page.dart';
import 'package:tournament_app/detalle_torneo/detalle_torneo_page.dart';
import 'package:tournament_app/login/login_page.dart';
import 'package:tournament_app/registrar_resultados/registrar_resultados_page.dart';
import 'package:tournament_app/torneos/torneos_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        TorneosPage.routeName: (_) => TorneosPage(),
        CrearTorneoPage.routeName: (_) => CrearTorneoPage(),
        CrearEquipoPage.routeName: (_) => CrearEquipoPage(),
        DetalleTorneoPage.routeName: (_) => DetalleTorneoPage(),
        VerEquipoPage.rounteName: (_) => VerEquipoPage(),
        RegistrarResultadosPage.routeName: (_) => RegistrarResultadosPage()
      },
    );
  }
}


