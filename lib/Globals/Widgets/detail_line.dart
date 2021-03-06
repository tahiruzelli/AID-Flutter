import 'package:AID/Globals/Contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailLine extends StatelessWidget {
  late String title;
  late String content;
  DetailLine(this.title, this.content);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: Get.width * 0.04),
            child: Text(
              title,
              style: TextStyle(
                fontSize: Get.height * 0.02,
                color: Colors.grey,
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(right: Get.width * 0.04),
              child: Text(
                content,
                style: TextStyle(
                  fontSize: Get.height * 0.02,
                  color: Colors.purple,
                ),
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
