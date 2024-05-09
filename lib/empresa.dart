import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:firebase_database/firebase_database.dart';

class Empresa extends StatefulWidget {
  @override
  _EmpresaState createState() => _EmpresaState();
}

class _EmpresaState extends State<Empresa> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _nifCifController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();

  String? _selectedCategory =
      'Ocio'; // Variable para almacenar la categoría seleccionada

  List<String> _categorias = [
    'Ocio',
    'Restauración',
    'Productos',
  ];
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
  /* DatabaseReference _empresaRef =
      FirebaseDatabase.instance.reference().child('empresas'); */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro - Empresa'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Campo de Nombre
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Campo de Teléfono
              TextFormField(
                controller: _telefonoController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Campo de NIF/CIF
              TextFormField(
                controller: _nifCifController,
                decoration: InputDecoration(
                  labelText: 'NIF/CIF',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Campo de Dirección
              TextFormField(
                controller: _direccionController,
                decoration: InputDecoration(
                  labelText: 'Dirección',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Campo de Descripción
              TextFormField(
                controller: _descripcionController,
                maxLines: 3, // Para hacer el campo de texto más grande
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Combo box de Categorías
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                items: _categorias.map((String category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Categoría de Servicio',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
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
                  //_registrarEmpresa();
                },
                child: Text('Regístrate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Función para registrar la empresa en la base de datos
/* void _registrarEmpresa() {
  // Recopilar datos
  String nombre = _nombreController.text;
  String telefono = _telefonoController.text;
  String nifCif = _nifCifController.text;
  String direccion = _direccionController.text;
  String descripcion = _descripcionController.text;
} */
    // Guardar en la base de datos
/*     _empresaRef.push().set({
      'nombre': nombre,
      'telefono': telefono,
      'nifCif': nifCif,
      'direccion': direccion,
      'descripcion': descripcion,
      'categoria': _selectedCategory,
      // Agrega más campos si es necesario
    }).then((_) {
      // Mostrar un mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registro exitoso'),
        ),
      );
 */
/*       // Navegar de regreso a la página anterior
      Navigator.pop(context);
    }).catchError((error) {
      // En caso de error, mostrar un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $error'),
        ),
      );
    }); */
 
