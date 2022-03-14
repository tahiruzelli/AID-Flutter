import 'package:AID/Controllers/ProfileController/profile_controller.dart';
import 'package:AID/Globals/Contants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScaffoldColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: 75,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                  'https://secure.gravatar.com/avatar/d6fd6bff19d7f0ad4024f3811474fe92?s=180&d=mm&r=g'),
            ),
          ),
          const Text(
            'Tahir Uzelli',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          const Divider(color: Colors.white),
          GestureDetector(
            onTap: (() => profileController.onMyMoneyButtonPressed()),
            child: profileDataRow('Mevcut Bakiye', '24 ₺'),
          ),
          const Divider(color: Colors.white),
          profileDataRow('Toplam kazanç', '64 ₺'),
          const Divider(color: Colors.white),
          profileDataRow('Etiketlenen video uzunluğu', '2s'),
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
        'Exit',
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
