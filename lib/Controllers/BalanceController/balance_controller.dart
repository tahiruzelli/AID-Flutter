import 'package:AID/Globals/Widgets/custom_snackbar.dart';
import 'package:get/state_manager.dart';

class BalanceController extends GetxController {
  RxDouble withDrawMoney = 0.0.obs;
  RxDouble myMoney = 0.0.obs;
  RxString cardNumber = ''.obs;
  RxString expiryDate = ''.obs;
  RxString cardHolderName = ''.obs;
  RxString cvvCode = ''.obs;
  RxBool isCvvFocused = false.obs;
  RxBool useGlassMorphism = false.obs;
  bool useBackgroundImage = false;
  void addWithDrawMoney(double count) {
    if ((withDrawMoney.value + count) > myMoney.value) {
      warningSnackBar("Eklemeye çalıştığınız para, paranızı aşmaktadır.");
    } else {
      withDrawMoney.value += count;
    }
  }

  void removeWithDrawMoney(double count) {
    if ((withDrawMoney.value - count) < 1) {
      warningSnackBar("Minimum çekim tutarı 1 tl'dir.");
    } else {
      withDrawMoney.value -= count;
    }
  }
}
