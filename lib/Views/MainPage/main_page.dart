import 'dart:math';

import 'package:AID/Controllers/ProfileController/profile_controller.dart';
import 'package:AID/Controllers/main_controller.dart';
import 'package:AID/Globals/Contants/colors.dart';
import 'package:AID/Globals/Utils/generate_md5.dart';
import 'package:AID/Views/LiveSupportPage/live_support_page.dart';
import 'package:AID/Views/MainPage/Widgets/bottom_app_bar.dart';
import 'package:AID/Views/MainPage/Widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../Globals/Contants/keys.dart';
import '../../Models/user_model.dart';
import 'Widgets/my_center_button.dart';

class MainPage extends StatelessWidget {
  MainController mainController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: colorScaffoldColor,
        appBar: myAppBar(
          action:
              mainController.bodyIndex.value == 2 ? chatBubble : Container(),
          title: mainController.bodyPageTitles[mainController.bodyIndex.value],
        ),
        body: mainController.bodyPages[mainController.bodyIndex.value],
        floatingActionButton: MyCenterButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: MyBottomAppBar(),
      ),
    );
  }

  Widget get chatBubble {
    return IconButton(
      onPressed: () {
        User currentUser = GetStorage().read(userDataKey);
        String roomId = generateMd5(Random().nextInt(100000).toString());
        Get.to(MessageDetailPage((currentUser.id ?? 0).toString(), roomId));
      },
      icon: const Icon(
        Icons.chat,
      ),
    );
  }
}
