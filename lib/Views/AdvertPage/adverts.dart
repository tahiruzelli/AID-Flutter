import 'package:AID/Controllers/AdvertController/advert_controller.dart';
import 'package:AID/Globals/Contants/colors.dart';
import 'package:AID/Globals/Widgets/loading_indicator.dart';
import 'package:AID/Views/AdvertPage/Widgets/advert_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class AdvertsPage extends StatelessWidget {
  AdvertController advertController = Get.put(AdvertController());
  @override
  Widget build(BuildContext context) {
    advertController.getAllAdverts();
    return Scaffold(
      backgroundColor: colorScaffoldColor,
      body: Obx(
        () => advertController.advertsLoading.value
            ? Center(
                child: LoadingIndicator(),
              )
            : advertController.adverts.isEmpty
                ? const Center(
                    child: Text(
                      "İlan bulunmamaktadır",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : ListView.builder(
                    itemCount: advertController.adverts.length,
                    itemBuilder: (context, index) {
                      return AdvertCard(advertController.adverts[index]);
                    },
                  ),
      ),
    );
  }
}
