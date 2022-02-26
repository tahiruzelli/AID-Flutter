import 'package:AID/Controllers/AdvertController/advert_controller.dart';
import 'package:AID/Globals/Contants/colors.dart';
import 'package:AID/Views/AdvertPage/Widgets/advert_card.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class AdvertsPage extends StatelessWidget {
  AdvertController advertController = Get.put(AdvertController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScaffoldColor,
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return AdvertCard();
        },
      ),
    );
  }
}