import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tindnetfinal/carusel.dart';
import 'package:tindnetfinal/models/persona_model.dart';
import 'package:tindnetfinal/swipe_cards.dart';
import 'card.dart';

class TinderCard extends StatefulWidget {
  Usuario user;
  TinderCard({super.key, required this.user});
  @override
  _TinderCardState createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  int _selectedIndex = 0; // Índice seleccionado en el BottomNavigationBar

  // Lista de Column para mostrar en el cuerpo

  // Función para manejar el cambio de índice en el BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     CarousselTindNet(
      //       user: widget.user,
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         IconButton(
      //           onPressed: () {
      //             // Acción al presionar el botón X
      //           },
      //           icon: Image.asset(
      //             'assets/letra-x.png', // Ruta de la imagen para el botón X
      //             width: 50,
      //             height: 50,
      //           ),
      //         ),
      //         IconButton(
      //           onPressed: () {
      //             // Acción al presionar el botón de chat
      //           },
      //           icon: Image.asset(
      //             'assets/charla.png', // Ruta de la imagen para el botón de chat
      //             width: 50,
      //             height: 50,
      //           ),
      //         ),
      //         IconButton(
      //           onPressed: () {
      //             // Acción al presionar el botón del corazón
      //           },
      //           icon: Image.asset(
      //             'assets/corazon.png', // Ruta de la imagen para el botón del corazón
      //             width: 50,
      //             height: 50,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
      SwipeCardsWidget(),

      Column(
        children: [
          // Contenido de la segunda columna
          // Puedes agregar cualquier widget aquí
          Text('Segunda Columna'),
        ],
      ),
      Column(
        children: [
          // Contenido de la tercera columna
          // Puedes agregar cualquier widget aquí
          Text('Tercera Columna'),
        ],
      ), // Agrega más columnas si es necesario
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:
              Color.fromARGB(255, 206, 205, 205), // Color azul para el AppBar
          leading: IconButton(
            onPressed: () {
              // Función para el botón de filtro
            },
            icon: Icon(Icons.filter),
            iconSize: 32,
          ),
          title: Image.asset(
            'assets/TINDNET2.jpg',
            width: 120,
            height: 40,
            alignment: Alignment.center, // Alinea la imagen al centro
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Función para el botón de chat
              },
              icon: Icon(Icons.chat),
              iconSize: 32,
            ),
          ],
        ),
        body: _pages[
            _selectedIndex], // Muestra el Column según el índice seleccionado
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Perfil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favoritos', // Cambia el texto si lo deseas
            ), // Agrega más ítems si es necesario
          ],
          currentIndex: _selectedIndex, // Índice seleccionado
          onTap: _onItemTapped, // Función para manejar el cambio de índice
        ),
      ),
    );
  }
}
