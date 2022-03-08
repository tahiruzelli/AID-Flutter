import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Controllers/main_controller.dart';

void main() async {
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AID',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: mainController.firstRoute(),
    );
  }
}

