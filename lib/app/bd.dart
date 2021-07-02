import 'package:tournament_app/app/equipo.dart';
import 'package:tournament_app/app/torneo.dart';

class BD {
  static final _instance = BD._internal();

  factory BD() => _instance;

  BD._internal();

  List<Torneo> torneos = [
    Torneo(
      0,
      "nombre",
      [
        Equipo("equipo 1", "encargado", "telefono", ["jugadores"]),
        Equipo("equipo 2", "encargado", "telefono", ["jugadores"]),
        Equipo("equipo 3", "encargado", "telefono", ["jugadores"]),
        Equipo("equipo 4", "encargado", "telefono", ["jugadores"]),
      ])
  ];
}