import 'package:flutter/material.dart';
import 'package:tournament_app/app/equipo.dart';

class VerEquipoPage extends StatefulWidget {
  static const rounteName = '/verEquipo';

  @override
  _VerEquipoPageState createState() => _VerEquipoPageState();
}

class _VerEquipoPageState extends State<VerEquipoPage> {

  List<Equipo> equipos = [];

  @override
  Widget build(BuildContext context) {
    equipos = ModalRoute.of(context).settings.arguments as List<Equipo>;
    return Scaffold(
      appBar: AppBar(title: Text('Equipos'),),
      body: ListView.separated(
        itemBuilder: (_, index) => ListTile(
          title: Text(equipos[index].nombre),
        ),
        separatorBuilder: (_, __) => Divider(),
        itemCount: equipos.length
      ),
    );
  }
}