import 'package:AID/Controllers/BalanceController/balance_controller.dart';
import 'package:AID/Globals/Contants/colors.dart';
import 'package:AID/Views/MainPage/Widgets/my_app_bar.dart';
import 'package:AID/Views/MyBalancePage/Widgets/balance_view.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Widgets/payment_information.dart';

class MyBalancePage extends StatelessWidget {
  BalanceController balanceController = Get.put(BalanceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      backgroundColor: colorScaffoldColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            children: [
              BalanceView(),
              Expanded(
                child: PaymentInformation(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}