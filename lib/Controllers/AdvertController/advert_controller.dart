import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:AID/Controllers/VideoController/video_controller.dart';
import 'package:AID/Globals/Widgets/custom_snackbar.dart';
import 'package:AID/Repositories/VideoRepository/video_repository.dart';
import 'package:AID/Views/LabelFramePage/label_frame_page.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import '../../Models/advert.dart';
import 'dart:async';

class AdvertController extends GetxController {
  VideoRepository videoRepository = VideoRepository();

  List<Advert> adverts = [];
  RxBool advertsLoading = false.obs;

  Future<File> urlToFile(String strURL) async {
    final http.Response responseData = await http.get(Uri.parse(strURL));
    var uint8list = responseData.bodyBytes;
    var buffer = uint8list.buffer;
    ByteData byteData = ByteData.view(buffer);
    var tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/video').writeAsBytes(
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file;
  }

  void onCardPressed(Advert advert) async {
    // File file = await toFile(
    //     "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4");
    File file = await urlToFile(advert.videoUrl!);
    Get.to(LabelVideoPage());
    VideoController videoController = Get.put(VideoController());
    videoController.fullVideoFile = file;
    videoController.shredVideo();
  }

  Future getAllAdverts() async {
    adverts.clear();
    advertsLoading.value = true;
    videoRepository.getAllVideos().then((value) {
      if (value['success']) {
        adverts =
            (value['data'] as List).map((e) => Advert.fromJson(e)).toList();
      } else {
        errorSnackBar(value['error']);
      }
      advertsLoading.value = false;
    });
  }
}
