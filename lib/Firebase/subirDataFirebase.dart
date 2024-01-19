import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SubirDataFireBase extends StatelessWidget {
  const SubirDataFireBase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        String id = "10";
        Map<String, dynamic> employeeInfoMap = {
          "Name": "Freddy Paladines",
          "age": "2",
          "Location": "Tungurahua y Nagera"
        };
        DatabaseMethods().addEmployeeDetails(employeeInfoMap, id).then((value) {
          Fluttertoast.showToast(
              msg: "Employee is correct",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        });
      },
      child: Text('Subir Datos'),
    );
  }
}

class DatabaseMethods {
  Future addEmployeeDetails(
      Map<String, dynamic> employeeInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(id)
        .set(employeeInfoMap);
  }
}
