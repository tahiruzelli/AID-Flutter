import 'dart:io';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:video_trimmer/video_trimmer.dart';

class VideoController extends GetxController {
  final Trimmer _trimmer = Trimmer();
  late File fullVideoFile;
  List<File> shrededVideos = [];
  late int miniVideoCount;
  RxBool shredLoading = false.obs;
  List<File> images = [];
  late VideoPlayerController videoPlayerController;
  late VideoPlayerController videoPlayerController1;
  late VideoPlayerController videoPlayerController2;
  late VideoPlayerController videoPlayerController3;
  Future getFirstFrames() async {
    // for (int i = 0; i < shrededVideos.length; i++) {
    //   var tmp = await ExportVideoFrame.exportImage(shrededVideos[i].path, 1, 0);
    //   images.add(tmp.map((file) => Image.file(file)).toList());
    // }
    images.clear();
    for (int i = 0; i < shrededVideos.length; i++) {
      final fileName = await VideoThumbnail.thumbnailFile(
        video: shrededVideos[i].path,
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.PNG,
      );
      File file = File(fileName!);
      images.add(file);
    }
    shredLoading.value = false;
  }

  void shredVideo() {
    shredLoading.value = true;
    shrededVideos.clear();
    _trimmer.loadVideo(videoFile: fullVideoFile).then((value) async {
      Duration videoDuration = _trimmer.videoPlayerController!.value.duration;
      miniVideoCount = videoDuration.inSeconds;
      for (int i = 0; i < miniVideoCount; i++) {
        print('start value: ${i * 1000} endValue: ${i * 1000 + 1000}');
        try {
          _trimmer.saveTrimmedVideo(
              startValue: i * 1000,
              endValue: i * 1000 + 1000,
              videoFileName: DateTime.now().toString(),
              onSave: (value) {
                if (value != null) {
                  shrededVideos.add(File(value));
                  if (shrededVideos.length == miniVideoCount) {
                    getFirstFrames();
                  }
                }
              });
        } catch (e) {
          print(e);
        }
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    videoPlayerController = VideoPlayerController.network(
        'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4')
      ..initialize().then((_) {});
  }
}
