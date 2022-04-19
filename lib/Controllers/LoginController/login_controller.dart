import 'package:AID/Globals/Contants/keys.dart';
import 'package:AID/Globals/Utils/generate_md5.dart';
import 'package:AID/Globals/Widgets/custom_snackbar.dart';
import 'package:AID/Repositories/LoginRepository/login_repository.dart';
import 'package:AID/Views/MainPage/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Models/user_model.dart';
import '../../Views/RegisterPage/register_page.dart';

class LoginController extends GetxController {
  LoginRepository loginRepository = LoginRepository();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void onLoginButtonPressed() {
    if (!GetUtils.isEmail(emailController.text)) {
      warningSnackBar("E-mail formatı hatalı!");
    } else if (passwordController.text.length < 8) {
      warningSnackBar("Şifre formatı hatalı!");
    } else {
      login();
    }
  }

  void onSignUpButtonPressed() {
    Get.to(RegisterPage());
  }

  Future login() async {
    loginRepository
        .login(
      emailController.text,
      generateMd5(passwordController.text),
    )
        .then((value) {
      if (value['success']) {
        GetStorage().write(userDataKey, value['data']);
        Get.offAll(MainPage());
        successSnackBar("Başarı ile giriş yaptınız!");
      } else {
        errorSnackBar(value['error']);
      }
    });
  }
}
