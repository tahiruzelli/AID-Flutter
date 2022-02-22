import 'package:AID/Controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../../Globals/Contants/colors.dart';

class MyCenterButton extends StatelessWidget {
  MainController mainController = Get.find();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: colorPurple,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {
        mainController.changePage(1);
      },
    );
  }
}
