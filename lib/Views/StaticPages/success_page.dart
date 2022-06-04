import 'package:AID/Globals/Contants/colors.dart';
import 'package:AID/Views/MainPage/Widgets/my_app_bar.dart';
import 'package:AID/Views/MainPage/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      backgroundColor: colorScaffoldColor,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: colorPurple,
        onPressed: () {
          Get.offAll(MainPage());
        },
        label: const Text("Ana Sayfaya Dön"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: InkWell(
          onTap: () {
            Get.to(MainPage());
          },
          child: const Icon(
            Icons.done,
            color: Colors.green,
            size: 300,
          ),
        ),
      ),
    );
  }
}
