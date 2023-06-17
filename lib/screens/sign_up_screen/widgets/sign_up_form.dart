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
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;
  final GlobalKey<FormState> _formKey;
  @override
  Widget build(BuildContext context) {
    final mSize = MediaQuery.of(context).size;
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: sigmaX,
          sigmaY: sigmaY,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: const Color(0xFF000000).withOpacity(opacity),
              borderRadius: const BorderRadius.all(Radius.circular(30))),
          width: mSize.width * 0.9,
          height: mSize.height * 0.65,
          child: Consumer<SignUpProvider>(builder: (context, value, child) {
            return Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: mSize.height * 0.03),
                    // Name
                    MyTextField(
                      controller: value.nameController,
                      hintText: 'Name',
                      obscureText: false,
                      validate: true,
                    ),
                    SizedBox(height: mSize.height * 0.02),
                    // Email
                    MyEmailTextField(
                      controller: value.emailController,
                      hintText: 'Email',
                    ),
                    SizedBox(height: mSize.height * 0.02),
                    // Password
                    Consumer<SignUpProvider>(builder: (context, value, child) {
                      return MyPasswordTextField(
                        controller: value.passwordController,
                        hintText: 'Password',
                        obscureText: value.obscure,
                        onTap: () => value.showPassword(),
                      );
                    }),
                    SizedBox(height: mSize.height * 0.02),
                    // Date Picker
                    DateField(
                      dateController: value.dateController,
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
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
                          height: mSize.height * 0.02,
                        ),
                        // Agree and Continue Button
                        Consumer<SignUpProvider>(
                          builder: ((context, value, child) {
                            return MyButtonAgree(
                              text: "Agree and Continue",
                              onTap: () {
                                value.signUpUser(context, _formKey);
                              },
                            );
                          }),
                        ),
                      ],
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
