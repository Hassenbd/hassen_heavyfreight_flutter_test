import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  String text;
  Icon icon;
  InputField({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: text,
        prefixIcon: icon,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none),
      ),
    );
    
  }
}
