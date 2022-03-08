import 'package:AID/Views/LoginPage/login_page.dart';
import 'package:AID/Views/MainPage/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../Views/AdvertPage/adverts.dart';
import '../Views/HomePage/home_page.dart';
import '../Views/ProfilePage/profile_page.dart';

class MainController extends GetxController {
  RxInt bodyIndex = 0.obs;
  List bodyPages = [
    HomePage(),
    AdvertsPage(),
    ProfilePage(),
  ];
  Widget firstRoute() {
    if (GetStorage().read('UserData') == null) {
      return LoginPage();
    } else {
      return MainPage();
    }
  }

  void changePage(int index) {
    bodyIndex.value = index;
  }
}
