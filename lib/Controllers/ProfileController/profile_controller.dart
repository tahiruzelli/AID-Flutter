import 'package:AID/Controllers/BalanceController/balance_controller.dart';
import 'package:AID/Globals/Contants/keys.dart';
import 'package:AID/Views/LoginPage/login_page.dart';
import 'package:AID/Views/MyBalancePage/my_balance_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  double myMoney = 20.0;
  void onMyMoneyButtonPressed() {
    print('object');
    BalanceController balanceController = Get.put(BalanceController());
    balanceController.myMoney.value = myMoney;
    Get.to(MyBalancePage());
  }
  void onExitButtonPressed(){
    print('exit');
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
