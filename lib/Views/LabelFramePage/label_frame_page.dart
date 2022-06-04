import 'package:AID/Controllers/VideoController/video_controller.dart';
import 'package:AID/Globals/Contants/colors.dart';
import 'package:AID/Globals/Widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stick_it/stick_it.dart';

class LabelVideoPage extends StatefulWidget {
  @override
  _LabelVideoPage createState() => _LabelVideoPage();
}

class _LabelVideoPage extends State<LabelVideoPage> {
  VideoController videoController = Get.put(VideoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScaffoldColor,
      body: Obx(
        () => !videoController.shredLoading.value
            ? StickIt(
                child: Image.file(
                    videoController.images[videoController.inVideoIndex.value]),
                stickerList: [
                  Image.asset(
                    'assets/images/square.png',
                    color: Colors.white,
                  ),
                ],
                videoController: videoController,
              )
            : Center(child: LoadingIndicator()),
      ),
    );
  }
}
