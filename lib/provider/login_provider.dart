import 'dart:developer';

import 'package:data_mite/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginProvider extends ChangeNotifier {
  bool obscure = true;
  // text editing controllers
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  // sign user in method
  void signUserIn(BuildContext context, formKey) {
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

// show password
  showPassword() {
    obscure = !obscure;
    log(obscure.toString());
    notifyListeners();
  }

  disposeTextField(context) {
    final provider = Provider.of<LoginProvider>(context, listen: false);
    provider.passwordController.clear();
    provider.emailController.clear();
  }
}
