import 'package:tournament_app/app/equipo.dart';

class Torneo {
  final int id;
  final String nombre;
  final List<Equipo> equipos;

  Torneo(this.id, this.nombre, this.equipos);
}