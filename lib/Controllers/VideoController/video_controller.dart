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
      for (double i = 0; i < miniVideoCount; i++) {
        if (i == 0) {
          var tmp = await _trimmer.saveTrimmedVideo(
              startValue: 0, endValue: i * 1000 + 1000);
          shrededVideos.add(File(tmp));
          if (shrededVideos.length == miniVideoCount) {
            getFirstFrames();
          }
        } else {
          var tmp = await _trimmer.saveTrimmedVideo(
              startValue: i * 1000, endValue: i * 1000 + 1000);
          shrededVideos.add(File(tmp));
          if (shrededVideos.length == miniVideoCount) {
            getFirstFrames();
          }
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
