import 'dart:developer';

import 'package:data_mite/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpProvider extends ChangeNotifier {
  bool obscure = false;

  // text editing controllers
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final dateController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUpUser(BuildContext context, formKey) {
    if (formKey.currentState!.validate()) {
      log('valid');
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
      disposeTextField(context);
    } else {
      log('not valid');
    }
    notifyListeners();
  }

  showPassword() {
    obscure = !obscure;
    log(obscure.toString());
    notifyListeners();
  }

  disposeTextField(context) {
    final provider = Provider.of<SignUpProvider>(context, listen: false);
    provider.passwordController.clear();
    provider.emailController.clear();
    provider.dateController.clear();
    provider.nameController.clear();
  }
}
