

import 'package:AID/Views/MainPage/main_page.dart';
import 'package:get/get.dart';

import '../../Views/RegisterPage/register_page.dart';

class LoginController extends GetxController{
  void onLoginButtonPressed(){
    Get.offAll(MainPage());
  }
  void onSignUpButtonPressed(){
    Get.to(RegisterPage());
  }
}