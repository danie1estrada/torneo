import 'package:flutter/material.dart';
import 'package:tournament_app/app/torneo.dart';
import 'package:tournament_app/app/ver_equipo/ver_equipo_page.dart';
import 'package:tournament_app/registrar_resultados/registrar_resultados_page.dart';

class DetalleTorneoPage extends StatefulWidget {
  static const routeName = '/detalleTorneo';

  @override
  _DetalleTorneoPageState createState() => _DetalleTorneoPageState();
}

class _DetalleTorneoPageState extends State<DetalleTorneoPage> {

  Torneo torneo;
  final opciones = [
    'Visualizar equipos',
    'Tabla de posiciones',
    'Registrar resultados'
  ];

  @override
  Widget build(BuildContext context) {
    torneo = ModalRoute.of(context).settings.arguments as Torneo;
    return Scaffold(
      appBar: AppBar(title: Text('Torneo "${torneo.nombre}"'),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: opciones.length,
          separatorBuilder: (_, __) => Divider(),
          itemBuilder: (_, index) => ListTile(
            title: Text(opciones[index]),
            onTap: () {
              if (index == 0) {
                Navigator.of(context).pushNamed(VerEquipoPage.rounteName, arguments: torneo.equipos);
              } else if (index == 2) {
                Navigator.of(context).pushNamed(RegistrarResultadosPage.routeName, arguments: torneo.equipos);
              }
            },
          ),
        ),
      ),
    );
  }
}