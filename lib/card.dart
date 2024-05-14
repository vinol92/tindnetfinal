import 'package:flutter/material.dart';
import 'package:tindnetfinal/models/persona_model.dart';

class UserCard extends StatelessWidget {
  final String user;
  final String categoria;
  final String localidad;

  final String imgList;

  const UserCard(
      {Key? key,
      required this.user,
      required this.imgList,
      required this.categoria,
      required this.localidad})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.network(
              imgList, // Cambia la ruta por la de tu imagen de fondo
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${user}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Categoría: ${categoria}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Localidad: ${localidad}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
