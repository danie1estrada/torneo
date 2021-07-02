import 'package:flutter/material.dart';
import 'package:tournament_app/app/bd.dart';
import 'package:tournament_app/app/equipo.dart';
import 'package:tournament_app/torneos/torneos_page.dart';

class CrearEquipoPage extends StatefulWidget {
  static const routeName = '/crearEquipo';

  @override
  _CrearEquipoPageState createState() => _CrearEquipoPageState();
}

class _CrearEquipoPageState extends State<CrearEquipoPage> {

  final nombreEquipoController = TextEditingController();
  final nombreEncargadoController = TextEditingController();
  final telefonoController = TextEditingController();

  final jugador1Controller = TextEditingController();
  final jugador2Controller = TextEditingController();
  final jugador3Controller = TextEditingController();
  final jugador4Controller = TextEditingController();

  final pageController = PageController(initialPage: 0);
  int page = 0;
  int idTorneo = 0;
  double value = 0;
  int numEquipos = 0;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Map<String, int>;
    numEquipos = args['numEquipos'];
    idTorneo = args['idTorneo'];
    return Scaffold(
      appBar: AppBar(title: Text("Crear equipo"),),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: LinearProgressIndicator(
              minHeight: 8,
              value: (1 / numEquipos) * (page + 1),
            ),
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              children: List.generate(numEquipos, (index) => RegistrationForm(index)),
              onPageChanged: (page) {
                setState(() {
                  this.page = page;
                  value = (1 / numEquipos) * (page + 1);
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget RegistrationForm(int actual) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormField(
            controller: nombreEquipoController, 
            decoration: InputDecoration(
              labelText: "Nombre del equipo"
            ),
          ),
          SizedBox(height: 24,),

          TextFormField(
            controller: nombreEncargadoController,
            decoration: InputDecoration(
              labelText: "Nombre del encargado"
            ),
          ),
          SizedBox(height: 24,),

          TextFormField(
            controller: telefonoController,
            decoration: InputDecoration(
              labelText: "Teléfono"
            ),
          ),
          SizedBox(height: 24,),

          Text("Jugadores", style: TextStyle(
            fontSize: 24
          )),
          SizedBox(height: 24,),

          TextFormField(
            controller: jugador1Controller,
            decoration: InputDecoration(
              labelText: "Jugador #1"
            ),
          ),
          SizedBox(height: 24,),

          TextFormField(
            controller: jugador2Controller,
            decoration: InputDecoration(
              labelText: "Jugador #2"
            ),
          ),
          SizedBox(height: 24,),

          TextFormField(
            controller: jugador3Controller,
            decoration: InputDecoration(
              labelText: "Jugador #3"
            ),
          ),
          SizedBox(height: 24,),

          TextFormField(
            controller: jugador4Controller,
            decoration: InputDecoration(
              labelText: "Jugador #4"
            ),
          ),
          SizedBox(height: 24,),

          ElevatedButton(
            onPressed: () {          
              BD().torneos[idTorneo].equipos.add(Equipo(
                nombreEquipoController.text,
                nombreEncargadoController.text,
                telefonoController.text,
                [
                  jugador1Controller.text,
                  jugador2Controller.text,
                  jugador3Controller.text,
                  jugador4Controller.text
                ]
              ));

              nombreEquipoController.text = '';
              nombreEncargadoController.text = '';
              telefonoController.text = '';
                
              jugador1Controller.text = '';
              jugador2Controller.text = '';
              jugador3Controller.text = '';
              jugador4Controller.text = '';

              if (actual < (numEquipos - 1))
                pageController.animateToPage(
                  actual + 1,
                  duration: Duration(milliseconds: 350),
                  curve: Curves.easeIn
                );
              else {
                Navigator.of(context).pushNamedAndRemoveUntil(TorneosPage.routeName, (route) => false);
              }
            },
            child: Text(actual == (numEquipos - 1) ? "Terminar" : "Siguiente")
          )
        ],
      ),
    );
  }
}