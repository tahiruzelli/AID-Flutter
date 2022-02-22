import 'package:AID/Controllers/VideoController/video_controller.dart';
import 'package:AID/Globals/Contants/colors.dart';
import 'package:AID/Globals/Widgets/loading_indicator.dart';
import 'package:AID/Views/MainPage/Widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:video_player/video_player.dart';

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
      appBar: myAppBar(),
      body: Obx(
        () => !videoController.shredLoading.value
            ? Column(
                children: [
                  videoController.videoPlayerController.value.isInitialized
                      ? SizedBox(
                        height: Get.height/2,
                        child: AspectRatio(
                            aspectRatio: videoController
                                .videoPlayerController.value.aspectRatio,
                            child: VideoPlayer(
                                videoController.videoPlayerController),
                          ),
                      )
                      : Container(),
                  Expanded(
                    child: SizedBox(
                      child: ListView.builder(
                        itemCount: videoController.images.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              videoController.videoPlayerController =
                                  VideoPlayerController.file(
                                      videoController.shrededVideos[index])
                                    ..initialize().then((_) {
                                      setState(() {
                                        videoController.videoPlayerController
                                            .play();
                                      });
                                    });
                            },
                            child: Image.file(
                              videoController.images[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )
            : Center(child: LoadingIndicator()),
      ),
    );
  }
}
