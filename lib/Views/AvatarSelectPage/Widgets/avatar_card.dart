import 'package:AID/Controllers/RegisterController/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AvatarCard extends StatelessWidget {
  late int index;
  late String url;
  AvatarCard(this.index, this.url);
  RegisterController registerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        registerController.onAvatarCardPressed(index);

      },
      child: Obx(
        () => Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: registerController.avatarIsSelected[index].value == true
                  ? Colors.white
                  : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: SvgPicture.network(url),
        ),
      ),
    );
  }
}
