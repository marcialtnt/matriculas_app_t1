import 'package:flutter/material.dart';
import 'package:matriculas_app_t1/models/Person_model.dart';
import 'package:matriculas_app_t1/models/carrera_model.dart';
import 'package:matriculas_app_t1/models/institucion_model.dart';
import 'package:matriculas_app_t1/models/matricula_model.dart';

class MatriculasHome extends StatefulWidget {
  @override
  State<MatriculasHome> createState() => _MatriculasHomeState();
}

class _MatriculasHomeState extends State<MatriculasHome> {
  List<Person> peopleList = [
    Person(name: "Ana", address: "av 1245", phone: "12345679"),
    Person(name: "Lia", address: "av lima", phone: "9751665"),
    Person(name: "Maria", address: "av mlsis", phone: "88888888"),
  ];

  List<Carrera> carrerasList = [
    Carrera(nombre: "Contabilidad", duracion: "5 años"),
    Carrera(nombre: "Diseño", duracion: "5 años"),
  ];

  List<Matricula> matriculasList = [];

//  List<Institucion> institucioneslist = [];
  List<Institucion> institucioneslist = [];

  String nombreInstitucion = '';
  String matriculaName = '';
  String matriculaAddress = '';
  String matriculaPhone = '';
  String matriculaDni = '';

  showPopupMatricula(BuildContext context, String institucionNombre) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ingrese la Matrícula:'),
          content: SingleChildScrollView(
            child: Column(children: [
              TextField(
                decoration: InputDecoration(hintText: 'Nombre'),
                onChanged: (String text) {
                  matriculaName = text;
                },
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Dirección'),
                onChanged: (String text) {
                  matriculaAddress = text;
                },
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Teléfono'),
                onChanged: (String text) {
                  matriculaPhone = text;
                },
              ),
              TextField(
                decoration: InputDecoration(hintText: 'DNI'),
                onChanged: (String text) {
                  matriculaDni = text;
                },
              ),
            ]),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancelar',
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                // AGREGANDO MATRÍCULAS
                int selectedInstitucion = 0;
                institucioneslist.forEach((element) {
                  if (element.nombre == institucionNombre)
                    selectedInstitucion = institucioneslist.indexOf(element);
                });
                institucioneslist[selectedInstitucion].matriculas.add(Matricula(
                      fecha: '',
                      hora: '',
                      alumno: Person(
                          name: matriculaName,
                          address: matriculaAddress,
                          phone: matriculaPhone),
                      carrera: Carrera(nombre: 'Contabilidad', duracion: ''),
                    ));
                Navigator.pop(context);
                setState(() {});
                ;
              },
              child: Text(
                'Aceptar',
              ),
            ),
          ],
        );
      },
    );
  }

  showPopupInstitucion(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ingrese la Institución:'),
          content: TextField(
            decoration: InputDecoration(hintText: 'Nombre'),
            onChanged: (String text) {
              nombreInstitucion = text;
            },
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancelar',
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                institucioneslist.add(
                  Institucion(
                    nombre: nombreInstitucion,
                    direccion: "",
                    ruc: "",
                    telefono: "",
                    matriculas: [],
                  ),
                );
                Navigator.pop(context);
                setState(() {});
                ;
              },
              child: Text(
                'Aceptar',
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Matriculas App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              //AGREGAR INSTITUCIONES
              showPopupInstitucion(context);
              setState(() {});
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
            ...institucioneslist.map(
            (institucionElement) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${institucionElement.nombre}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        print("agregando-............");
                        showPopupMatricula(context, institucionElement.nombre);
                        setState(() {});
                      },
                      icon: Icon(Icons.add),
                    ),
                    IconButton(
                      onPressed: () {
                        print("eliminandooo INSTITUCIÓN............");
                        institucioneslist.remove(institucionElement);
                        setState(() {});
                      },
                      icon: Icon(Icons.delete),
                    ),
                    IconButton(
                      onPressed: () {
                        print("eliminandooo MATRICULAS............");
                        institucionElement.matriculas.removeRange(
                            0, institucionElement.matriculas.length);
                        setState(() {});
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ],
                ),
                ...institucionElement.matriculas.map(
                  (e) => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.cyan,
                      // radius: 25,
                      child: Text(
                        e.alumno.name[0],
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    title: Text("${e.alumno.name} - ${e.carrera.nombre}"),
                    subtitle: Text(e.alumno.address),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            print("Editando....");
                            e.alumno = Person(
                                name: "ANITA",
                                address: "CCALLE 456",
                                phone: "9876543");
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            print("Eliminando....");
                            // matriculasList.removeLast();
                            // matriculasList.removeRange(0, 2);
                            // matriculasList.removeAt(1);
                            institucionElement.matriculas.remove(e);
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
