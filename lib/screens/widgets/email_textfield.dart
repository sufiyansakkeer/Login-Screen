import 'package:flutter/material.dart';

class MyEmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const MyEmailTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your email address.';
        }
        if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+$')
            .hasMatch(value)) {
          return 'Please enter a valid email address.';
        }
        return null;
      },
      controller: controller,
      obscureText: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          suffixIcon: null,
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500])),
    );
  }
}
