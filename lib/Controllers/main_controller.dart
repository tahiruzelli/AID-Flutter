import 'package:get/get.dart';
import '../Views/AdvertPage/adverts.dart';
import '../Views/HomePage/home_page.dart';
import '../Views/ProfilePage/profile_page.dart';

class MainController extends GetxController {
  RxInt bodyIndex = 0.obs;
  List bodyPages = [
    HomePage(),
    AdvertsPage(),
    ProfilePage(),
  ];
  void changePage(int index) {
    bodyIndex.value = index;
  }

}
