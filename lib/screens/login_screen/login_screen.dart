import 'package:data_mite/core/constants.dart';
import 'package:data_mite/screens/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  // text editing controllers
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  final double _sigmaX = 5; // from 0-10
  final double _sigmaY = 5; // from 0-10
  final double _opacity = 0.2;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final size3 = SizedBox(height: mHeight * 0.03);
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
                  LoginForm(
                    sigmaX: _sigmaX,
                    sigmaY: _sigmaY,
                    opacity: _opacity,
                    formKey: _formKey,
                    size3: size3,
                    emailController: emailController,
                    passwordController: passwordController,
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
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ));
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
                      ),
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
