import 'package:data_mite/core/constants.dart';
import 'package:data_mite/provider/login_provider.dart';
import 'package:data_mite/screens/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SizedBox(
          height: mHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                backgroundImage,
                width: MediaQuery.of(context).size.width,
                height: mHeight,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: mHeight * 0.30),
                  const Text("Log in",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: mHeight * 0.02),
                  // Login Form
                  LoginForm(
                    formKey: _formKey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: const Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Consumer<LoginProvider>(builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ));
                            value.disposeTextField(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
