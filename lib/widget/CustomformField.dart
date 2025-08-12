import 'package:flutter/material.dart';
import 'package:storeapp/const.dart';

class Customfield extends StatelessWidget {
  Customfield(
      {super.key,
      this.hinttext,
      this.onChanged,
      this.inputType,
      this.obscureText = false});
  String? hinttext;
  Function(String)? onChanged;
  TextEditingController mycontroller = TextEditingController();
  bool? obscureText;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: TextFormField(
        keyboardType: inputType,
        obscureText: obscureText!,
        controller: mycontroller,
        // validator: (data) {
        //   if (data!.isEmpty) {
        //     return "feild is required";
        //   }
        //   return null;
        // },
        decoration: InputDecoration(
            hintText: hinttext,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Ksecenderycolor)),
            hintStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.normal),
            contentPadding: const EdgeInsets.all(8),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ))),
        onChanged: onChanged,
      ),
    );
  }
}
