import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Views/AdvertPage/adverts.dart';

class MainController extends GetxController {
  RxInt bodyIndex = 0.obs;
  List bodyPages = [
    Container(),
    AdvertsPage(),
    Container(),
  ];
  void changePage(int index) {
    bodyIndex.value = index;
  }

}
