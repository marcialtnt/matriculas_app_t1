import 'package:matriculas_app_t1/models/matricula_model.dart';

class Institucion {
  String nombre;
  String direccion;
  String ruc;
  String telefono;
  List<Matricula> matriculas;
  Institucion({
    required this.nombre,
    required this.direccion,
    required this.ruc,
    required this.telefono,
    required this.matriculas,
  });

  void obtenerNumMatriculados() {
    print("$nombre tiene ${matriculas.length} matriculados");
  }
}
