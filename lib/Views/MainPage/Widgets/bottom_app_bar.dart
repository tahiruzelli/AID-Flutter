import 'package:AID/Controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../../Globals/Contants/colors.dart';
import '../../../Globals/Contants/sizes.dart';

class MyBottomAppBar extends StatelessWidget {
  MainController mainController = Get.find();
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: colorPurple,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            alignment: Alignment.centerLeft,
            icon: const Icon(Icons.home),
            color: Colors.white,
            onPressed: () {
              mainController.changePage(0);
            },
          ),
          SizedBox(width: bottomNavigationBarSpace),
          IconButton(
            icon: const Icon(Icons.person),
            alignment: Alignment.centerRight,
            color: Colors.white,
            onPressed: () {
              mainController.changePage(2);
            },
          ),
        ],
      ),
    );
  }
}
