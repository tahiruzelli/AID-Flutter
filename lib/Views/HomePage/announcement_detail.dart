import 'package:AID/Globals/Contants/colors.dart';
import 'package:AID/Views/MainPage/Widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnouncementDetail extends StatelessWidget {
  late Map json;
  AnnouncementDetail(this.json);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      backgroundColor: colorScaffoldColor,
      body: Column(
        children: [
          const SizedBox(height: 10),
          Image.network(
            json['image'],
            height: Get.height / 5,
            width: Get.width,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
            child: Text(
              json['title'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            json['description'],
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
