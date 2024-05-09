import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:tindnetfinal/singup.dart';
import 'package:tindnetfinal/tind.dart';
// ...

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 181, 217, 219)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//const List<String> scopes = <String>[
// 'email',
//  'https://www.googleapis.com/auth/contacts.readonly',
//];

//GoogleSignIn _googleSignIn = GoogleSignIn(
// Optional clientId
// clientId: 'your-client_id.apps.googleusercontent.com',
// scopes: scopes,
//);

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Future<void> _googleSingIn() async {
    GoogleSignIn googleSignIn = GoogleSignIn();

    // setState(() {
    //   print("pene");
    //  });

    try {
      final GoogleSignInAccount? gUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleauth =
          await gUser?.authentication;

      String? nombre = gUser?.displayName;
      String? imagen = gUser?.photoUrl;
      String? email = gUser?.email;
      String? idtoken = googleauth?.idToken;
      // String? userid = gUser?.
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
        title: Text('Mi Aplicación'),
      ), */
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Image.asset('assets/TINDNET2.jpg', height: 200),
              ),
              SizedBox(height: 20),

              // Email input
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Password input
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              // Sign in button
              ElevatedButton(
                onPressed: () {
                  // Implement sign-in logic here
                },
                child: Text('Iniciar sesión'),
              ),
              SizedBox(height: 10),

              // Forgot password link
              TextButton(
                onPressed: () {
                  // Implement forgot password logic here
                },
                child: Text('¿Has olvidado tu contraseña?'),
              ),
              SizedBox(height: 20),

              // "Conecta con" text
              Text('O conecta con:'),
              SizedBox(height: 10),

              // Social buttons (Google and Apple)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      // Implement Google sign-in logic here
                      _googleSingIn;
                    },
                    icon: Image.asset('assets/google.png', height: 110),
                  ),
                  IconButton(
                    onPressed: () {
                      // Implement Apple sign-in logic here
                    },
                    icon: Image.asset('assets/apple.png', height: 100),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // "No tienes cuenta?" link
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationPage()));
                },
                child: Text('¿No tienes cuenta? Regístrate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 // onPressed: _googleSingIn,
               //child: Text("Google Sing In"),
               // style: ButtonStyle(),