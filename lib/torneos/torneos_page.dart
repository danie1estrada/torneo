import 'package:flutter/material.dart';
import 'package:tournament_app/app/bd.dart';
import 'package:tournament_app/app/torneo.dart';
import 'package:tournament_app/crear_torneo/crear_torneo_page.dart';
import 'package:tournament_app/detalle_torneo/detalle_torneo_page.dart';

class TorneosPage extends StatefulWidget {
  static const routeName = '/torneos';

  @override
  _TorneosPageState createState() => _TorneosPageState();
}

class _TorneosPageState extends State<TorneosPage> {

  List<Torneo> torneos = BD().torneos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Torneos"),
      ),
      body: Container(
        child: ListView.separated(
          itemCount: torneos.length,
          separatorBuilder: (_, __) => Divider(),
          itemBuilder: (_, index) => ListTile(
            title: Text(torneos[index].nombre),
            leading: Icon(Icons.sports_basketball),
            onTap: () {
                Navigator.of(context).pushNamed(DetalleTorneoPage.routeName, arguments: torneos[index]);
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(CrearTorneoPage.routeName);
          /* setState(() {
            BD().torneos.add(Torneo(0, "Torneo #1"));
            torneos = BD().torneos;       
          }); */
          
        },
      ),
    );
  }
}