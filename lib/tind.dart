import 'package:flutter/material.dart';
import 'package:tindnetfinal/persona_model.dart';
import 'card.dart';

class TinderCard extends StatefulWidget {
  final Usuario user;

  const TinderCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _TinderCardState createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {
  Offset _dragStart = Offset.zero;
  late Offset _dragPosition;
  late double _dragDistance;

  @override
  void initState() {
    super.initState();
    _dragPosition = Offset.zero;
    _dragDistance = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(), // Elimina el botón de retroceso
        title: SizedBox(), // Elimina el texto del AppBar
        toolbarHeight: 20, // Ajusta la altura del AppBar
        backgroundColor: Colors.blue, // Color azul para el AppBar
      ),
      body: GestureDetector(
        onPanStart: (details) {
          setState(() {
            _dragStart = details.globalPosition;
          });
        },
        onPanUpdate: (details) {
          setState(() {
            _dragPosition = details.globalPosition;
            _dragDistance = _dragPosition.dx - _dragStart.dx;
          });
        },
        onPanEnd: (details) {
          setState(() {
            _dragStart = Offset.zero;
            _dragPosition = Offset.zero;
            _dragDistance = 0.0;
          });
          // Determinar si se deslizó hacia la derecha o hacia la izquierda
          bool isSwipedRight = _dragDistance > 0;
        },
        child: Transform.translate(
          offset: Offset(_dragDistance, 0.0),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Función para el botón de filtro
                      },
                      icon: Icon(Icons.filter),
                      iconSize: 32,
                    ),
                    Image.asset(
                      'assets/TINDNET2.jpg',
                      width: 120,
                      height: 40,
                    ),
                    IconButton(
                      onPressed: () {
                        // Función para el botón de chat
                      },
                      icon: Icon(Icons.chat),
                      iconSize: 32,
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/TINDNET2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child:
                        SizedBox(), // Eliminamos el botón de la casa del centro
                  ),
                ),
                Container(
                  color: Colors.blue, // Color del BottomNavigationBar
                  child: BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle),
                        label: 'Usuario',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Inicio',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite),
                        label: 'Favorito',
                      ),
                    ],
                    onTap: (index) {
                      // Función para manejar la selección de iconos en el BottomNavigationBar
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
