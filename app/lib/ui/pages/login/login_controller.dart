import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/mock/mock_users.dart';
import '../../../../../domain/models/app_user.dart';
import '../home/home_page.dart';

class LoginController extends GetxController {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    final email = userController.text.trim();
    final password = passwordController.text.trim();

    AppUser? foundUser;

    for (final user in mockUsers) {
      if (user.email == email && user.password == password) {
        foundUser = user;
        break;
      }
    }

    if (foundUser != null) {
      Get.to(() => HomeScreen(user: foundUser!));
    } else {
      Get.snackbar(
        "Error",
        "Usuario o contraseña incorrectos",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  void onClose() {
    userController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
