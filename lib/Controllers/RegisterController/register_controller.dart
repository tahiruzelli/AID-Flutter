import 'package:AID/Views/LoginPage/login_page.dart';
import 'package:AID/Views/MainPage/main_page.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RegisterController extends GetxController{
  void onRegisterButtonPressed(){
    Get.offAll(MainPage());
  }
  void onSignInButtonPressed(){
    Get.offAll(LoginPage());
  }
}