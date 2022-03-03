import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Views/AdvertPage/adverts.dart';
import '../Views/HomePage/home_page.dart';

class MainController extends GetxController {
  RxInt bodyIndex = 0.obs;
  List bodyPages = [
    HomePage(),
    AdvertsPage(),
    Container(),
  ];
  void changePage(int index) {
    bodyIndex.value = index;
  }

}
