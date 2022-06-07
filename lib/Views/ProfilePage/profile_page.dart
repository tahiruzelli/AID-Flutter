import 'package:AID/Controllers/ProfileController/profile_controller.dart';
import 'package:AID/Globals/Contants/colors.dart';
import 'package:AID/Globals/Utils/get_avatar_url_from_id.dart';
import 'package:AID/Globals/Widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Globals/Utils/format_double.dart';

class ProfilePage extends StatelessWidget {
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    profileController.getCurrentUser();
    return Scaffold(
      backgroundColor: colorScaffoldColor,
      body: Obx(
        () => profileController.isUserDataLoading.value
            ? Center(
                child: LoadingIndicator(),
              )
            : ListView(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 75,
                      backgroundColor: Colors.transparent,
                      child: Center(
                        child: SvgPicture.network(
                          getAvatarUrlFromId(
                              profileController.currentUser?.avatarId ?? 0),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    profileController.currentUser?.name ?? "",
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
                    child: profileDataRow('Mevcut Bakiye',
                        '${formatDouble(profileController.currentUser?.balance.toString() ?? "")} ₺'),
                  ),
                  const Divider(color: Colors.white),
                  profileDataRow('Toplam kazanç',
                      '${formatDouble(profileController.currentUser?.totalGain.toString() ?? "")} ₺'),
                  const Divider(color: Colors.white),
                  profileDataRow('Etiketlenen video süresi',
                      "${formatDouble(profileController.currentUser?.totalVideoEditetTime.toString() ?? "")} s"),
                  const Divider(color: Colors.white),
                  exitButton,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      withdrawButton,
                      withdrawRequestButton,
                    ],
                  )
                ],
              ),
      ),
    );
  }

  Widget get exitButton {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 4),
      child: ElevatedButton(
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
      ),
    );
  }

  Widget get withdrawButton {
    return ElevatedButton(
      onPressed: () {
        profileController.onMyMoneyButtonPressed();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colorSuccess),
      ),
      child: const Text(
        'Çekim Yap',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget get withdrawRequestButton {
    return ElevatedButton(
      onPressed: () {
        profileController.onSeeWithdrawRequestButtonPressed();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colorInfo),
      ),
      child: const Text(
        'Çekim İsteklerimi Gör',
        style: TextStyle(
          fontSize: 12,
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
