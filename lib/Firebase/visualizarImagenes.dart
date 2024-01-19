import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class VisualizarImagen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Reemplazar 'nombre_de_tu_imagen.jpg' con el nombre real de tu imagen en Firebase Storage
    var storageRef = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('techmall-410119.appspot.com/1705515433452.png')
        .getDownloadURL();
    print(storageRef);

    return FutureBuilder<String>(
      future: storageRef,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Text('No hay URL de imagen disponible.');
        } else {
          return Image.network(snapshot.data.toString());
        }
      },
    );
  }
}
