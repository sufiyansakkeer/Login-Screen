import 'package:data_mite/core/constants.dart';
import 'package:data_mite/provider/sign_up_provider.dart';
import 'package:data_mite/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widgets/sign_up_form.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final mSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SizedBox(
          height: mSize.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              //background image
              Image.asset(
                backgroundImage,
                width: mSize.width,
                height: mSize.height,
                fit: BoxFit.cover,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: mSize.height * 0.15),
                  const Text("Sign Up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: mSize.height * 0.02),
                  // sign up form
                  SignUpForm(
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
                          "Already have an account ? ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Consumer<SignUpProvider>(
                          builder: (context, value, child) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                            value.disposeTextField(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: const Text(
                              "Login",
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
