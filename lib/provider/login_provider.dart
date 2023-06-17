import 'dart:developer';

import 'package:data_mite/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool obscure = true;
  // sign user in method
  void signUserIn(formKey, BuildContext context) {
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

// show password
  showPassword() {
    obscure = !obscure;
    log(obscure.toString());
    notifyListeners();
  }
}
