import 'package:AID/Repositories/AnnoucementRepository/annoucement_repository.dart';
import 'package:get/state_manager.dart';
import '../../Models/announcement.dart';

class HomePageController extends GetxController {
  AnnouncementRepository announcementRepository = AnnouncementRepository();

  List<Announcement> leftSideList = [];
  List<Announcement> rightSideList = [];
  List<Announcement> announcements = [];

  RxBool announcementsLoading = false.obs;

  void getLeftAndRightSideLists() {
    announcements.forEach((element) {
      if (element.id! % 2 == 0) {
        rightSideList.add(element);
      } else {
        leftSideList.add(element);
      }
    });
  }

  Future getAnnouncements() async {
    announcementsLoading.value = true;
    announcements.clear();
    leftSideList.clear();
    rightSideList.clear();
    announcementRepository.getAnnouncements().then((value) {
      if (value['success']) {
        announcements = (value['data'] as List)
            .map((e) => Announcement.fromJson(e))
            .toList();
        getLeftAndRightSideLists();
      }
      announcementsLoading.value = false;
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getLeftAndRightSideLists();
  }
}
