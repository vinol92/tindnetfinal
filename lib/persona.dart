import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tindnetfinal/persona_model.dart';
import 'package:tindnetfinal/tind.dart';
import '/singup.dart';
import 'package:firebase_database/firebase_database.dart';

//import 'package:firebase_database/firebase_database.dart';
String nombre = '';
String apellidos = '';
String telefono = '';
String categoria = '';

class Persona extends StatefulWidget {
  final String email;
  final String contrasena;
  final String localidad;
  final String codicop;
  final String edad;

  const Persona(
      {super.key,
      required this.email,
      required this.contrasena,
      required this.localidad,
      required this.codicop,
      required this.edad});
  @override
  _PersonaState createState() => _PersonaState();
}

class _PersonaState extends State<Persona> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidosController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  File? selectedImage;

  void pickimage(bool source) async {
    final picker;
    if (source) {
      picker = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picker == null) return;
      setState(() {
        selectedImage = File(picker.path);
        fotosPerfil.add(selectedImage!);
      });
    } else {
      picker = await ImagePicker().pickImage(source: ImageSource.camera);
      if (picker == null) return;
      setState(() {
        selectedImage = File(picker.path);
        fotosPerfil.add(selectedImage!);
      });
    }
  }

  List<File> fotosPerfil = [];
/* 
  DatabaseReference _personaRef =
      FirebaseDatabase.instance.reference().child('personas');
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro - Persona'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Imagen TINDNET2
              Image.asset('assets/TINDNET2.jpg'),

              SizedBox(height: 20),

              // Campo de Nombre
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    nombre = value;
                  });
                },
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Campo de Apellidos
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    apellidos = value;
                  });
                },
                controller: _apellidosController,
                decoration: InputDecoration(
                  labelText: 'Apellidos',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Campo de Teléfono
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    telefono = value;
                  });
                },
                controller: _telefonoController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Fotos de Perfil
              Text('Fotos de Perfil (hasta 3):'),
              SizedBox(height: 10),

              // Botón "Sube tu foto"
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: ElevatedButton(
                                onPressed: () {
                                  pickimage(true);
                                  Navigator.pop(
                                      context); // Cierra el modal bottom sheet
                                },
                                child: Text('De la Galería'),
                              ),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                // Código para la segunda opción
                                pickimage(false);
                                Navigator.pop(
                                    context); // Cierra el modal bottom sheet
                              },
                              child: SizedBox(
                                child: Text('Haz una Foto',
                                    textAlign: TextAlign.center),
                                width: MediaQuery.of(context).size.width * 0.9,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  'Sube tu foto',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Visibility(
                visible: !fotosPerfil.isEmpty,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: fotosPerfil.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 2.5,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.black38),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: Image.file(fotosPerfil[index]),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              // Botón "Regístrate"
              ElevatedButton(
                onPressed: () {
                  _registrarPersona();
                },
                child: Text('Regístrate'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Función para registrar la persona en la base de datos
  void _registrarPersona() async {
    // Crear una referencia a la base de datos de Firebase
    DatabaseReference _personaRef =
        await FirebaseDatabase.instance.ref().child('personas');
    Usuario usuario1 = Usuario(
        nombre: nombre,
        apellidos: apellidos,
        telefono: telefono,
        email: widget.email,
        categoria: categoria,
        contrasena: widget.contrasena,
        localidad: widget.localidad,
        codicop: widget.codicop,
        edad: widget.edad,
        fotosPerfil: fotosPerfil);
    // Crear un objeto Map para los datos de la persona
    Map<String, dynamic> personaData = {
      'nombre': nombre,
      'apellidos': apellidos,
      'telefono': telefono,
      'email': widget.email,
      'contrasena': widget.contrasena,
      'localidad': widget.localidad,
      'codicop': widget.codicop,
      'edad': widget.edad,
      'categoria': categoria,
      'fotosPerfil': fotosPerfil
          .map((file) => file.path)
          .toList(), // Guardar las rutas de las imágenes
    };
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => TinderCard(
                user: usuario1,
              )),
    );
    // Agregar los datos a Firebase
    _personaRef.push().set(personaData).then((_) {
      // Si se guardó correctamente, muestra un mensaje de éxito
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registro exitoso')));
    }).catchError((error) {
      // Si hubo un error, muestra un mensaje de error
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $error')));
    });
  }
}
  /*   // Guardar en la base de datos
    _personaRef.push().set({
      'nombre': nombre,   
      'apellidos': apellidos,
      'telefono': telefono,
      // Aquí puedes agregar más campos si es necesario
      // Por ejemplo, puedes guardar las URLs de las fotos de perfil
    }).then((_) {
      // Mostrar un mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registro exitoso'),
        ),
      );

      // Navegar de regreso a la página anterior
      Navigator.pop(context);
    }).catchError((error) {
      // En caso de error, mostrar un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $error'),
        ),
      );
    }); */

