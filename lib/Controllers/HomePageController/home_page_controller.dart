import 'package:AID/fakedata.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePageController extends GetxController {
  List? allList;
  List leftSideList = [];
  List rightSideList = [];
  void getLeftAndRightSideLists() {
    fakedataList.forEach((element) {
      if (element['id'] % 2 == 0) {
        leftSideList.add(element);
      } else {
        rightSideList.add(element);
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    allList = fakedataList;
    getLeftAndRightSideLists();
  }
}
