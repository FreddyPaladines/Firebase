import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

Future<bool> uploadImage(File image) async {
  print(image.relativePath);
  /*  final String namefile = image.relativePath!.split("/").last;
  final Reference ref = storage.ref().child("image").child(namefile);
 */
  return false;
}
