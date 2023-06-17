import 'dart:ui';

import 'package:data_mite/core/constants.dart';
import 'package:data_mite/provider/login_provider.dart';
import 'package:data_mite/screens/widgets/email_textfield.dart';
import 'package:data_mite/screens/widgets/my_button.dart';
import 'package:data_mite/screens/widgets/my_password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required double sigmaX,
    required double sigmaY,
    required double opacity,
    required GlobalKey<FormState> formKey,
    required this.size3,
    required this.emailController,
    required this.passwordController,
  })  : _sigmaX = sigmaX,
        _sigmaY = sigmaY,
        _opacity = opacity,
        _formKey = formKey;

  final double _sigmaX;
  final double _sigmaY;
  final double _opacity;
  final GlobalKey<FormState> _formKey;
  final SizedBox size3;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final mSize = MediaQuery.of(context).size;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            color: const Color(0xFF000000).withOpacity(_opacity),
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          width: mSize.width * 0.9,
          height: mSize.height * 0.5,
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  size3,
                  MyEmailTextField(
                    controller: emailController,
                    hintText: 'Email',
                  ),
                  size3,
                  Consumer<LoginProvider>(builder: (context, provider, child) {
                    return MyPasswordTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: provider.obscure,
                      onTap: () => provider.showPassword(),
                    );
                  }),
                  size3,
                  MyButtonAgree(
                    text: "Continue",
                    onTap: () {
                      Provider.of<LoginProvider>(context, listen: false)
                          .signUserIn(_formKey, context);
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
          ),
        ),
      ),
    );
  }
}
