import 'package:AID/Controllers/BalanceController/balance_controller.dart';
import 'package:AID/Globals/Contants/keys.dart';
import 'package:AID/Globals/Widgets/custom_snackbar.dart';
import 'package:AID/Repositories/ProfileRepository/profile_repository.dart';
import 'package:AID/Views/LoginPage/login_page.dart';
import 'package:AID/Views/MyBalancePage/my_balance_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Models/user_model.dart';
import '../../Views/WithdrawRequestsPage/my_withdraw_requests.dart';

class ProfileController extends GetxController {
  User? currentUser;

  RxBool isUserDataLoading = false.obs;

  ProfileRepository profileRepository = ProfileRepository();

  void onMyMoneyButtonPressed() {
    BalanceController balanceController = Get.put(BalanceController());
    balanceController.myMoney.value = (currentUser!.balance ?? 0).toDouble();
    Get.to(MyBalancePage());
  }

  void onExitButtonPressed() {
    GetStorage().remove(userDataKey);
    Get.offAll(LoginPage());
  }

  void onSeeWithdrawRequestButtonPressed() {
    BalanceController balanceController = Get.put(BalanceController());
    balanceController.currentUser = currentUser;
    balanceController.getMyRequests();
    Get.to(MyWithdrawRequest());
  }

  Future getCurrentUser() async {
    isUserDataLoading.value = true;
    currentUser = GetStorage().read(userDataKey);
    profileRepository.getCurrentUser(currentUser?.id ?? 0).then((value) {
      if (value['success']) {
        currentUser = User.fromJson(value['data']);
        GetStorage().write(userDataKey, currentUser);
      } else {
        errorSnackBar(value['error']);
      }

      isUserDataLoading.value = false;
    });
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
