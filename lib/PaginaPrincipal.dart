import 'dart:html' as html;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertiff/Firebase/visualizarDataFirebase.dart';
import 'package:fluttertiff/Firebase/visualizarImagenes.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:fluttertiff/Firebase/subirDataFirebase.dart';
import 'package:fluttertiff/Firebase/subirImagenesFirebase.dart';

class PaginaPrincipal extends StatefulWidget {
  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Storage Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Storage Example'),
      ),
      body: Center(
        child: Column(
          children: [
            SubirDataFireBase(),
            ElevatedButton(
              onPressed: () async {
                html.InputElement uploadInput = html.InputElement()
                  ..type = 'file';
                uploadInput.click();

                uploadInput.onChange.listen((event) async {
                  final file = uploadInput.files!.first;
                  await uploadFile(file);
                });
              },
              child: Text('Seleccionar y subir archivo'),
            ),
            Container(height: 200, width: 200, child: VisualizarImagen()),
            Container(height: 200, width: 200, child: DataDisplay()),

            //ImagenFirebase(),
          ],
        ),
      ),
    );
  }
}
