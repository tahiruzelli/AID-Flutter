import 'package:AID/Controllers/HomePageController/home_page_controller.dart';
import 'package:AID/Globals/Widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Globals/Contants/colors.dart';
import 'Widgets/announcement_card.dart';

class HomePage extends StatelessWidget {
  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    homePageController.getAnnouncements();

    return Scaffold(
      backgroundColor: colorScaffoldColor,
      body: Obx(
        () => homePageController.announcementsLoading.value
            ? Center(
                child: LoadingIndicator(),
              )
            : SingleChildScrollView(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: List.generate(
                          homePageController.leftSideList.length,
                          (index) => AnnouncementCard(
                              homePageController.leftSideList[index])),
                    ),
                    Column(
                      children: List.generate(
                          homePageController.rightSideList.length,
                          (index) => AnnouncementCard(
                              homePageController.rightSideList[index])),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
