import 'package:AID/Controllers/RegisterController/register_controller.dart';
import 'package:AID/Globals/Widgets/loading_indicator.dart';
import 'package:AID/Views/MainPage/Widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Globals/Contants/colors.dart';
import 'Widgets/avatar_card.dart';

class AvatarSelectView extends StatelessWidget {
  RegisterController registerController = Get.find();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: myAppBar(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => registerController.onRegisterButtonPressed(),
        label: const Text('Kayıt Ol'),
        backgroundColor: colorScaffoldColor,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      colorMediumStatePurple,
                      colorStatePurple,
                      colorDarkStatePurple,
                      colorIndigoPurple,
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Obx(
                () => registerController.avatarsLoading.value
                    ? Center(
                        child: LoadingIndicator(),
                      )
                    : GridView.count(
                        crossAxisCount: 3,
                        children: List.generate(
                          registerController.avatarIsSelected.length,
                          (index) => AvatarCard(
                            index,
                            registerController.avatars[index].avatarUrl ?? '',
                          ),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
