import 'dart:io';
import 'package:AID/Globals/Widgets/custom_snackbar.dart';
import 'package:AID/Models/tag.dart';
import 'package:AID/Models/user_model.dart';
import 'package:AID/Repositories/VideoRepository/video_repository.dart';
import 'package:AID/Views/LabelFramePage/tag_frame_page.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stick_it/stick_it.dart';
import 'package:uuid/uuid.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:video_trimmer/video_trimmer.dart';

import '../../Globals/Contants/keys.dart';
import '../../Views/StaticPages/success_page.dart';

class VideoController extends GetxController {
  VideoRepository videoRepository = VideoRepository();
  late StickIt? stickIt;
  final Trimmer _trimmer = Trimmer();
  late File fullVideoFile;
  List<File> shrededVideos = [];
  late int miniVideoCount;
  RxBool shredLoading = false.obs;
  List<File> images = [];
  RxInt inVideoIndex = 0.obs;
  RxBool isTagsLoading = false.obs;
  List<Tag> tags = [];
  Tag? selectedTag;

  Future getFirstFrames() async {
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

  void toTagPage(File file) {
    Get.to(TagFramePage(file));
  }

  Future postDataSet(File file, int tagId) async {
    User currentUser = GetStorage().read(userDataKey);
    if (inVideoIndex.value != images.length - 1) {
      shredLoading.value = true;
      await Future.delayed(const Duration(milliseconds: 250));
      uploadImage(file, tagId, currentUser.id ?? 0);
      inVideoIndex.value++;
      shredLoading.value = false;
      Get.back();
    } else {
      Get.offAll(SuccessPage());
    }
  }

  Future uploadImage(File imageFile, int tagId, int userId) async {
    var uuid = const Uuid().v1();
    Reference ref = FirebaseStorage.instance.ref().child("post_$uuid.jpg");
    UploadTask uploadTask = ref.putFile(imageFile);
    (await uploadTask).ref.getDownloadURL().then((value) {
      createDataSet(value, tagId, userId);
    });
  }

  Future createDataSet(
    String photoUrl,
    int tagId,
    int userId,
  ) async {
    videoRepository.createDataSet(photoUrl, tagId, userId);
  }

  Future getTags() async {
    isTagsLoading.value = true;
    videoRepository.getAllTags().then((value) {
      if (value['success']) {
        tags = (value['data'] as List).map((e) => Tag.fromJson(e)).toList();
      } else {
        errorSnackBar(value['error']);
      }
      isTagsLoading.value = false;
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTags();
  }
}
