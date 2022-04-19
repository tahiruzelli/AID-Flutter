import 'package:AID/Globals/Contants/colors.dart';
import 'package:AID/Models/announcement.dart';
import 'package:AID/Views/MainPage/Widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnouncementDetail extends StatelessWidget {
  late Announcement announcement;
  AnnouncementDetail(this.announcement);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      backgroundColor: colorScaffoldColor,
      body: Column(
        children: [
          const SizedBox(height: 10),
          Image.network(
            announcement.photoUrl!,
            height: Get.height / 5,
            width: Get.width,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
            child: Text(
              announcement.title ?? "",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            announcement.description ?? "",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
