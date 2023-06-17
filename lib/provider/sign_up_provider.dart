import 'dart:developer';

import 'package:data_mite/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  bool obscure = false;
  // sign user in method
  void signUpUser(formKey, BuildContext context) {
    if (formKey.currentState!.validate()) {
      log('valid');
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
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
}
