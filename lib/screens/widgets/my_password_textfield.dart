import 'package:flutter/material.dart';

class MyPasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Function()? onTap;
  const MyPasswordTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your password";
        } else if (value.trim().length < 6) {
          return "Password should more then 6 characters";
        }
        return null;
      },
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        suffix: GestureDetector(
          onTap: onTap,
          child: obscureText
              ? const Icon(Icons.visibility_off_outlined)
              : const Icon(Icons.visibility),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500]),
      ),
    );
  }
}
