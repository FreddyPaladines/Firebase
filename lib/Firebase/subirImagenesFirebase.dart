import 'dart:html' as html;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future<void> uploadFile(html.File file) async {
  try {
    if (file != null) {
      // Nombre único para el archivo en Firebase Storage
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      // Referencia al bucket de almacenamiento
      final firebase_storage.Reference storageRef = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('techmall-410119.appspot.com/$fileName.png');
      // Sube el archivo
      await storageRef.putBlob(file);
      // Obtiene la URL de descarga del archivo
      String downloadURL = await storageRef.getDownloadURL();
      print('Archivo subido con éxito. URL de descarga: $downloadURL');
    }
  } catch (e) {
    print('Error al subir el archivo: $e');
  }
}
