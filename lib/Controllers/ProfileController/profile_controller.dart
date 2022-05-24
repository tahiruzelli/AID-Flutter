import 'package:AID/Controllers/BalanceController/balance_controller.dart';
import 'package:AID/Globals/Contants/keys.dart';
import 'package:AID/Views/LoginPage/login_page.dart';
import 'package:AID/Views/MyBalancePage/my_balance_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Models/user_model.dart';

class ProfileController extends GetxController {
  User? currentUser;


  void onMyMoneyButtonPressed() {
    BalanceController balanceController = Get.put(BalanceController());
    balanceController.myMoney.value = (currentUser!.balance ?? 0).toDouble();
    Get.to(MyBalancePage());
  }
  void onExitButtonPressed(){
    GetStorage().remove(userDataKey);
    Get.offAll(LoginPage());
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
