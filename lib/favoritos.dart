import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tindnetfinal/carusel.dart';
import 'package:tindnetfinal/models/persona_model.dart';
import 'card.dart';
import 'tind.dart';

class Favoritos extends StatelessWidget {
  final List<String> _names = [
    // "Alquileres",
    "Peluqueria",
    "Tatto",
    // "Restaurante",
    "Bodorrios",
    "Vuelosbaratos",
  ];
  final List<String> categoria = [
    //"Casas",
    "Estetica",
    "Moda",
    //"Restauracion",
    "Eventos",
    "Viajes",
  ];
  final List<String> localidades = [
    // "Malaga",
    "Marbella",
    "Antequera",
    // "Ronda",
    "Malaga",
    "Madrid",
  ];

  final List<String> imgList = [
    //'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    //'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _names.length,
      itemBuilder: (context, index) {
        return Container(
          color:
              index % 2 == 0 ? Colors.white : Color.fromARGB(60, 170, 205, 233),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imgList[index],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(_names[index]),
            subtitle: Text('${categoria[index]} - ${localidades[index]}'),
            onTap: () {
              // Acción cuando se hace clic en el ListTile
              print('You tapped on ${_names[index]}');
            },
          ),
        );
      },
    );
  }
}
