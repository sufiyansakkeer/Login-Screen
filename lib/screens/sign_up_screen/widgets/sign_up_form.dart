import 'dart:ui';
import 'package:data_mite/provider/sign_up_provider.dart';
import 'package:data_mite/screens/widgets/my_password_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants.dart';
import 'date_field.dart';
import '../../widgets/email_textfield.dart';
import '../../widgets/my_button.dart';
import 'my_textfield.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required double sigmaX,
    required double sigmaY,
    required double opacity,
    required GlobalKey<FormState> formKey,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.dateController,
  })  : _sigmaX = sigmaX,
        _sigmaY = sigmaY,
        _opacity = opacity,
        _formKey = formKey;

  final double _sigmaX;
  final double _sigmaY;
  final double _opacity;
  final GlobalKey<FormState> _formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: _sigmaX,
          sigmaY: _sigmaY,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: const Color(0xFF000000).withOpacity(_opacity),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.65,
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  // Name
                  MyTextField(
                    controller: nameController,
                    hintText: 'Name',
                    obscureText: false,
                    validate: true,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  // Email
                  MyEmailTextField(
                    controller: emailController,
                    hintText: 'Email',
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  // Password
                  Consumer<SignUpProvider>(builder: (context, value, child) {
                    return MyPasswordTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: value.obscure,
                      onTap: () => value.showPassword(),
                    );
                  }),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  // Date Picker
                  DateField(
                    dateController: dateController,
                  ),
                  kHeight30,

                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '',
                          children: <TextSpan>[
                            const TextSpan(
                              text:
                                  'By selecting Agree & Continue below, I agree to our ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            TextSpan(
                                text: 'Terms of Service and Privacy Policy',
                                style: TextStyle(
                                    color: colorBlue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      // Agree and Continue Button
                      Consumer<SignUpProvider>(
                        builder: ((context, value, child) {
                          return MyButtonAgree(
                            text: "Agree and Continue",
                            onTap: () {
                              value.signUpUser(_formKey, context);
                            },
                          );
                        }),
                      ),
                    ],
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
