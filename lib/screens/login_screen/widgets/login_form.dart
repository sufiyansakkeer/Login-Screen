// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:data_mite/core/constants.dart';
import 'package:data_mite/provider/login_provider.dart';
import 'package:data_mite/screens/widgets/email_textfield.dart';
import 'package:data_mite/screens/widgets/my_button.dart';
import 'package:data_mite/screens/widgets/my_password_textfield.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    final mSize = MediaQuery.of(context).size;
    final size3 = SizedBox(height: mSize.height * 0.03);
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            color: const Color(0xFF000000).withOpacity(opacity),
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          width: mSize.width * 0.9,
          height: mSize.height * 0.5,
          child: Consumer<LoginProvider>(builder: (context, value, child) {
            return Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    size3,
                    MyEmailTextField(
                      controller: value.emailController,
                      hintText: 'Email',
                    ),
                    size3,
                    MyPasswordTextField(
                      controller: value.passwordController,
                      hintText: 'Password',
                      obscureText: value.obscure,
                      onTap: () => value.showPassword(),
                    ),
                    size3,
                    MyButtonAgree(
                      text: "Continue",
                      onTap: () {
                        value.signUserIn(context, _formKey);
                      },
                    ),
                    size3,
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: colorBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
