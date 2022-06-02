import 'package:AID/Controllers/ProfileController/profile_controller.dart';
import 'package:AID/Globals/Contants/colors.dart';
import 'package:AID/Globals/Contants/keys.dart';
import 'package:AID/Globals/Utils/get_avatar_url_from_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Models/user_model.dart';

class ProfilePage extends StatelessWidget {
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    profileController.currentUser =
        User.fromJson(GetStorage().read(userDataKey));
    return Scaffold(
      backgroundColor: colorScaffoldColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 75,
              backgroundColor: Colors.transparent,
              child: Center(
                child: SvgPicture.network(
                  getAvatarUrlFromId(profileController.currentUser!.avatarId!),
                ),
              ),
            ),
          ),
          Text(
            profileController.currentUser!.name ?? "",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          const Divider(color: Colors.white),
          GestureDetector(
            onTap: (() => profileController.onMyMoneyButtonPressed()),
            child: profileDataRow('Mevcut Bakiye', '${profileController.currentUser!.balance ?? ""} ₺'),
          ),
          const Divider(color: Colors.white),
          profileDataRow('Toplam kazanç', '${profileController.currentUser!.totalGain ?? ""} ₺'),
          const Divider(color: Colors.white),
          profileDataRow('Etiketlenen video uzunluğu', "${profileController.currentUser!.totalVideoEditetTime ?? ""}s"),
          const Divider(color: Colors.white),
          exitButton
        ],
      ),
    );
  }

  Widget get exitButton {
    return ElevatedButton(
      onPressed: () {
        profileController.onExitButtonPressed();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.red),
      ),
      child: const Text(
        'Çıkış',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget profileDataRow(String baslik, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: Get.width * 0.04),
          child: Text(
            baslik,
            style: GoogleFonts.sourceSansPro(
              fontSize: Get.height * 0.02,
              color: Colors.white,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: Get.width * 0.04),
          child: Text(
            data,
            style: GoogleFonts.sourceSansPro(
              fontSize: Get.height * 0.02,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
