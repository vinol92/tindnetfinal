import 'package:flutter/material.dart';
import '/persona.dart';
import '/empresa.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  bool _isCompany = false;
  List<String> localidades = [
    'Álava',
    'Albacete',
    'Alicante',
    'Almería',
    'Asturias',
    'Ávila',
    'Badajoz',
    'Barcelona',
    'Burgos',
    'Cáceres',
    'Cádiz',
    'Cantabria',
    'Castellón',
    'Ciudad Real',
    'Córdoba',
    'La Coruña',
    'Cuenca',
    'Girona',
    'Granada',
    'Guadalajara',
    'Gipuzkoa',
    'Huelva',
    'Huesca',
    'Islas Baleares',
    'Jaén',
    'León',
    'Lleida',
    'Lugo',
    'Madrid',
    'Málaga',
    'Murcia',
    'Navarra',
    'Ourense',
    'Palencia',
    'Las Palmas',
    'Pontevedra',
    'La Rioja',
    'Salamanca',
    'Segovia',
    'Sevilla',
    'Soria',
    'Tarragona',
    'Santa Cruz de Tenerife',
    'Teruel',
    'Toledo',
    'Valencia',
    'Valladolid',
    'Bizkaia',
    'Zamora',
    'Zaragoza',
  ];
  String? selectedLocalidad = 'Álava';
  String email = '';
  String contrasena = '';
  String codigop = '';
  String edad = '';

  @override
  void dispose() {
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ajustes de la imagen
              Container(
                alignment: Alignment
                    .topCenter, // Alinear la imagen en la parte superior
                height: 50, // Reducir la altura de la imagen
                child: Image.asset('assets/TINDNET2.jpg'),
              ),
              SizedBox(height: 20),

              // Nombre input
              /*     TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 5),
 */
              // Email input
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 5),

              // Contraseña input
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    contrasena = value;
                  });
                },
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 5),

              // Repita contraseña input
              TextFormField(
                controller: _repeatPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Repita contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 5),
              DropdownButtonFormField(
                value: selectedLocalidad,
                menuMaxHeight: 300,
                items: localidades.map((String localidad) {
                  return DropdownMenuItem(
                    value: localidad,
                    child: Text(localidad),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLocalidad = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Selecciona una localidad',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 5),

              // Código postal input
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    codigop = value;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Código Postal',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 5),

              // Edad input
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    edad = value;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Edad',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 5),

              // ¿Eres una empresa? checkbox
              Row(
                children: [
                  Checkbox(
                    value: _isCompany,
                    onChanged: (value) {
                      setState(() {
                        _isCompany = value!;
                      });
                    },
                  ),
                  Text('¿Eres una empresa?'),
                ],
              ),
              SizedBox(height: 5),

              // Botón de registrarse
              ElevatedButton(
                onPressed: () {
                  // Verificar si todos los campos están completos
                  if (_isFieldsComplete() && (_isCompany || !_isCompany)) {
                    // Si todos los campos están completos y el checkbox está marcado o no,
                    // navegar a la clase correspondiente
                    if (_isCompany) {
                      // Si es una empresa, navegar a la clase Empresa
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Empresa()),
                      );
                    } else {
                      // Si no es una empresa, navegar a la clase Persona
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Persona(
                                  email: email,
                                  contrasena: contrasena,
                                  localidad: selectedLocalidad!,
                                  codicop: codigop,
                                  edad: edad,
                                )),
                      );
                    }
                  } else {
                    // Si no todos los campos están completos, mostrar un mensaje de error
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Completa todos los campos.'),
                      ),
                    );
                  }
                },
                child: Text('Continuar'),
              ),
              SizedBox(height: 5),

              // "¿Ya tienes cuenta?" link
              TextButton(
                onPressed: () {
                  // Navega a la página de inicio de sesión
                  // Implementa la lógica de navegación aquí
                  Navigator.pop(context);
                },
                child: Text('¿Ya tienes cuenta? Inicia sesión'),
              ),
              SizedBox(height: 5),

              // "Conecta con" text
              Text('O conecta con:'),
              SizedBox(height: 5),

              // Social buttons (Google and Apple)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      // Implementa la lógica de inicio de sesión con Google aquí
                    },
                    icon: Image.asset('assets/google.png', height: 35),
                  ),
                  IconButton(
                    onPressed: () {
                      // Implementa la lógica de inicio de sesión con Apple aquí
                    },
                    icon: Image.asset('assets/apple.png', height: 30),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Función para verificar si todos los campos están completos
  bool _isFieldsComplete() {
    return _passwordController.text.isNotEmpty &&
        _repeatPasswordController
            .text.isNotEmpty; // Añade condiciones adicionales si es necesario
  }
}
