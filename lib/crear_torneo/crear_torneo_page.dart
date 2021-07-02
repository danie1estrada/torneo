import 'package:flutter/material.dart';
import 'package:tournament_app/app/bd.dart';
import 'package:tournament_app/app/torneo.dart';
import 'package:tournament_app/crear_equipo/crear_equipo_page.dart';

class CrearTorneoPage extends StatefulWidget {
  static const routeName = '/crearTorneo';

  @override
  _CrearTorneoPageState createState() => _CrearTorneoPageState();
}

class _CrearTorneoPageState extends State<CrearTorneoPage> {

  final nameController = TextEditingController();
  final numEquiposController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crear torneo"),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Nombre"
                ),
              ),
              SizedBox(height: 24,),

              TextFormField(
                controller: numEquiposController,
                decoration: InputDecoration(
                  labelText: "Número de equipos"
                ),
              ),
              SizedBox(height: 24,),

              ElevatedButton(
                onPressed: () {
                  final idTorneo = BD().torneos.length;
                  BD().torneos.add(Torneo(
                    idTorneo,
                    nameController.text,
                    []
                  ));
                  Navigator.of(context).pushNamed(CrearEquipoPage.routeName, arguments: {
                    'idTorneo': idTorneo,
                    'numEquipos': int.parse(numEquiposController.text)
                  });
                },
                child: Text("Crear")
              )
            ],
          ),
        ),
      ),
    );
  }
}