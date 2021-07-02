import 'package:flutter/material.dart';
import 'package:tournament_app/app/equipo.dart';

class RegistrarResultadosPage extends StatefulWidget {
  static const routeName = '/registrarResultados';

  @override
  _RegistrarResultadosPageState createState() => _RegistrarResultadosPageState();
}

class _RegistrarResultadosPageState extends State<RegistrarResultadosPage> {

  List<Equipo> equipos = [];
  String equipo1, equipo2;

  @override
  Widget build(BuildContext context) {
    equipos = ModalRoute.of(context).settings.arguments as List<Equipo>;
    print(equipos);
    return Scaffold(
      appBar: AppBar(title: Text("Registrar resultados"),),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                isExpanded: true,
                value: equipo1,
                onChanged: (value) {
                  setState(() {
                    equipo1 = value;                    
                  });
                },
                items: equipos.map<DropdownMenuItem<String>>((equipo) => DropdownMenuItem<String>(
                  value: equipo.nombre,
                  child: Text(equipo.nombre)
                )).toList(),
                decoration: InputDecoration(
                  labelText: "Equipo 1"
                ),
              ),
              
              SizedBox(height: 24,),

              DropdownButtonFormField<String>(
                isExpanded: true,
                value: equipo2,
                onChanged: (value) {
                  setState(() {
                    equipo2 = value;                    
                  });
                },
                items: equipos.map<DropdownMenuItem<String>>((equipo) => DropdownMenuItem<String>(
                  value: equipo.nombre,
                  child: Text(equipo.nombre)
                )).toList(),
                decoration: InputDecoration(
                  labelText: "Equipo 2"
                ),
              ),
    
              SizedBox(height: 24,),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                    
                      decoration: InputDecoration(
                        labelText: "Puntos"
                      ),
                    ),
                  ),

                  SizedBox(width: 24,),

                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Puntos"
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24,),

              ElevatedButton(
                onPressed: () {},
                child: Text("Confirmar")
              )
            ]
          ),
        ),
      ),
    );
  }
}