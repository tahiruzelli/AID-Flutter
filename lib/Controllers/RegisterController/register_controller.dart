import 'package:AID/Globals/Widgets/custom_snackbar.dart';
import 'package:AID/Models/avatar_model.dart';
import 'package:AID/Repositories/RegisterRepository/register_repository.dart';
import 'package:AID/Views/AvatarSelectPage/avatar_select_view.dart';
import 'package:AID/Views/LoginPage/login_page.dart';
import 'package:AID/Views/MainPage/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RegisterRepository registerRepository = RegisterRepository();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxList<RxBool> avatarIsSelected = <RxBool>[].obs;

  RxBool avatarsLoading = false.obs;
  RxBool registerLoading = false.obs;

  List<AvatarModel> avatars = [];
  AvatarModel? selectedAvatar;

  void onAvatarCardPressed(int index) {
    selectedAvatar = avatars[index];
    makeAvatarListFalse();
    avatarIsSelected[index].value = true;
  }

  void getAvatars() {
    avatarsLoading.value = true;
    registerRepository.getAvatars().then((response) {
      avatarsLoading.value = false;
      if (response['success']) {
        avatars = (response['data'] as List)
            .map((e) => AvatarModel.fromJson(e))
            .toList();
        avatarIsSelected.value = List.generate(
          avatars.length,
          (index) => false.obs,
        );
      } else {
        errorSnackBar(response['error']);
      }
    });
  }

  void onSelectAvatarButtonPressed() {
    getAvatars();
    Get.to(AvatarSelectView());
  }

  void onRegisterButtonPressed() {
    if (checkValuesAreCorrect()) {
      registerLoading.value = true;
      registerRepository
          .register(
            name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
            avatarId: selectedAvatar!.id.toString(),
          )
          .then((value) {});
      Get.offAll(MainPage());
    }
  }

  void onSignInButtonPressed() {
    Get.offAll(LoginPage());
  }

  void makeAvatarListFalse() {
    avatarIsSelected.forEach((element) {
      element.value = false;
    });
  }

  bool checkValuesAreCorrect() {
    if (nameController.text.length < 10) {
      warningSnackBar('isim 10 karakterden kucuk olamaz');
      return false;
    }
    if (!GetUtils.isEmail(emailController.text)) {
      warningSnackBar('e mail formati uygun degil');
      return false;
    }
    if (passwordController.text.length < 8) {
      warningSnackBar('sifre 8 karakterden kucuk olamaz');
      return false;
    }
    if (selectedAvatar == null) {
      warningSnackBar('avatar seciniz');
      return false;
    }
    return true;
  }

  void clearVars() {
    nameController.text = '';
    emailController.text = '';
    passwordController.text = '';
    selectedAvatar = null;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
