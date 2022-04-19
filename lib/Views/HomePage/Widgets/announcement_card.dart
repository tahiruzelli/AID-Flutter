import 'package:AID/Models/announcement.dart';
import 'package:AID/Views/HomePage/announcement_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Globals/Contants/colors.dart';

class AnnouncementCard extends StatelessWidget {
  Announcement announcement;
  AnnouncementCard(this.announcement);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Get.to(AnnouncementDetail(announcement));
        },
        child: Container(
          width: Get.width / 2 - 10,
          decoration: BoxDecoration(
            color: colorScaffoldColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 0),
                spreadRadius: 0.2,
                blurRadius: 2,
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.network(
                  announcement.photoUrl!,
                  fit: BoxFit.fitWidth,
                  height: Get.height / 10,
                  width: Get.width / 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  announcement.title ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
