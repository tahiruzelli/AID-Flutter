import 'package:AID/Controllers/ProfileController/profile_controller.dart';
import 'package:AID/Globals/Widgets/custom_snackbar.dart';
import 'package:AID/Models/withdraw_request.dart';
import 'package:AID/Repositories/BalanceRepository/balance_repository.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';

import '../../Globals/Contants/keys.dart';
import '../../Models/user_model.dart';

class BalanceController extends GetxController {
  BalanceRepository balanceRepository = BalanceRepository();

  User? currentUser;

  RxDouble withDrawMoney = 0.0.obs;
  RxDouble myMoney = 0.0.obs;
  RxString cardNumber = ''.obs;
  RxString expiryDate = ''.obs;
  RxString cardHolderName = ''.obs;
  RxString cvvCode = ''.obs;
  RxBool isCvvFocused = false.obs;
  RxBool useGlassMorphism = false.obs;
  bool useBackgroundImage = false;

  RxBool isWithdrawRequestLoading = false.obs;
  List<WithdrawRequest> withdrawRequests = [];

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

  void onCreateButtonRequestButtonPressed() {
    currentUser = GetStorage().read(userDataKey);
    if (currentUser == null) {
      errorSnackBar(
          "Kullanıcı bilgilerinde hata var, uygulamayı yeniden başlatın!");
    } else if (withDrawMoney.value < 5) {
      warningSnackBar("Çekim tutarı 5 liranın altında olamaz!");
    } else if (withDrawMoney.value > myMoney.value) {
      errorSnackBar("Çekmek istediğiniz tutar bakiyenizden fazla olamaz!");
    } else if (cardNumber.value.length != 19) {
      warningSnackBar("Kart numaranız 16 karakterli olabilir");
    } else if (cvvCode.value.length != 4) {
      warningSnackBar("CVV kodunuz 3 karakterden oluşmalıdır!");
    } else if (!GetUtils.isNum(cvvCode.value)) {
      warningSnackBar("CVV kodunuz sadece sayılardan oluşabilir");
    } else if (cardHolderName.value.split(" ").isEmpty) {
      warningSnackBar("İsim formatı hatalıdır!");
    } else {
      createRequest(currentUser?.id ?? 0);
    }
  }

  Future createRequest(int userId) async {
    balanceRepository
        .createRequest(
      balance: withDrawMoney.value.toInt(),
      cardNo: cardNumber.value,
      cvv: int.parse(cvvCode.value),
      expDate: expiryDate.value,
      cardHolder: cardHolderName.value,
      userId: userId,
    )
        .then((value) {
      if (value['success']) {
        Get.back();
        infoSnackBar(
            "Başarı ile çekim isteğiniz oluşturulmuştur. En kısa zamanda ödemeniz gerçekleştirilecektir.");
        ProfileController profileController = Get.find();
        profileController.getCurrentUser();
      } else {
        errorSnackBar(value['error']);
      }
    });
  }

  Future getMyRequests() async {
    if (currentUser == null) {
      errorSnackBar("Bir hata ile karşılaştık, çıkış yapıp tekrar giriniz");
    } else {
      isWithdrawRequestLoading.value = true;
      balanceRepository.getMyRequests(currentUser!.id ?? 0).then((value) {
        if (value['success']) {
          withdrawRequests = (value['data'] as List)
              .map((e) => WithdrawRequest.fromJson(e))
              .toList();
        } else {
          errorSnackBar(value['error']);
        }
        isWithdrawRequestLoading.value = false;
      });
    }
  }
}
