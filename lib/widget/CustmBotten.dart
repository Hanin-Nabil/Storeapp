import 'package:flutter/material.dart';
import 'package:storeapp/const.dart';

class Custmbotten extends StatelessWidget {
  Custmbotten({this.ontap, super.key, required this.text});
  String text;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        padding: const EdgeInsets.all(10),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Ksecenderycolor, borderRadius: BorderRadius.circular(20)),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 251, 253, 253),
              fontFamily: "Pacifico"),
        ),
      ),
    );
  }
}
