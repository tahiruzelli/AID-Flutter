import 'package:AID/Controllers/main_controller.dart';
import 'package:AID/Globals/Contants/colors.dart';
import 'package:AID/Views/MainPage/Widgets/bottom_app_bar.dart';
import 'package:AID/Views/MainPage/Widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'Widgets/my_center_button.dart';

class MainPage extends StatelessWidget {
  MainController mainController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: colorScaffoldColor,
        appBar: myAppBar(),
        body: mainController.bodyPages[mainController.bodyIndex.value],
        floatingActionButton: MyCenterButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: MyBottomAppBar(),
      ),
    );
  }
}