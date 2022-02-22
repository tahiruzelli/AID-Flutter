import 'dart:io';
import 'package:AID/Controllers/VideoController/video_controller.dart';
import 'package:AID/Views/LabelVideoPage/label_video_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import '../../Views/AdvertPage/adverts.dart';

class AdvertController extends GetxController {
  void onCardPressed() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowCompression: false,
    );
    if (result != null) {
      File file = File(result.files.single.path!);
      Get.to(LabelVideoPage());
      VideoController videoController = Get.put(VideoController());

      videoController.fullVideoFile = file;
      videoController.shredVideo();
    }
  }
}
