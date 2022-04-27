import 'dart:io';

import 'package:AID/Controllers/VideoController/video_controller.dart';
import 'package:AID/Globals/Contants/colors.dart';
import 'package:AID/Views/LabelFramePage/Widgets/auto_complate_tf.dart';
import 'package:AID/Views/MainPage/Widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TagFramePage extends StatelessWidget {
  late File image;
  TagFramePage(this.image);
  VideoController videoController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: colorPurple,
        onPressed: () {
          videoController.postDataSet(image, videoController.selectedTag!.id!);
        },
        label: const Text("Kaydet"),
      ),
      body: Column(
        children: [
          AutoCompletTF(videoController.tags),
          Expanded(
            child: Image.file(image),
          ),
        ],
      ),
    );
  }
}
