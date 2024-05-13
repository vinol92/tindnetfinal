import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tindnetfinal/carusel.dart';
import 'package:tindnetfinal/persona_model.dart';
import 'card.dart';
import 'tind.dart';

class Favoritos {
  List<Usuario> tarjetasFavoritas = [];

  void agregarFavorito(Usuario tarjeta) {
    tarjetasFavoritas.add(tarjeta);
  }

  List<Usuario> obtenerFavoritos() {
    return tarjetasFavoritas;
  }
}

class FavoritosPage extends StatelessWidget {
  final Favoritos favoritos;

  FavoritosPage(this.favoritos);

  @override
  Widget build(BuildContext context) {
    List<Usuario> tarjetasFavoritas = favoritos.obtenerFavoritos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
      ),
      body: ListView.builder(
        itemCount: tarjetasFavoritas.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
                '${tarjetasFavoritas[index].nombre} ${tarjetasFavoritas[index].apellidos}'),
            subtitle: Text('Categoría: ${tarjetasFavoritas[index].categoria}'),
            // Otros detalles de la tarjeta favorita
          );
        },
      ),
    );
  }
}
