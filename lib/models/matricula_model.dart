import 'package:matriculas_app_t1/models/Person_model.dart';
import 'package:matriculas_app_t1/models/carrera_model.dart';

class Matricula {
  String fecha;
  String hora;
  Person alumno;
  Carrera carrera;
  Matricula({
    required this.fecha,
    required this.hora,
    required this.alumno,
    required this.carrera,
  });
}
