import 'package:AID/Controllers/BalanceController/balance_controller.dart';
import 'package:AID/Globals/Contants/colors.dart';
import 'package:AID/Globals/Widgets/loading_indicator.dart';
import 'package:AID/Views/MainPage/Widgets/my_app_bar.dart';
import 'package:AID/Views/WithdrawRequestsPage/Widgets/withdraw_request_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyWithdrawRequest extends StatelessWidget {
  BalanceController balanceController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: "Çekim İsteklerim"),
      backgroundColor: colorScaffoldColor,
      body: Obx(
        () => balanceController.isWithdrawRequestLoading.value
            ? Center(
                child: LoadingIndicator(),
              )
            : ListView.builder(
                itemCount: balanceController.withdrawRequests.length,
                itemBuilder: (context, index) {
                  return WithdrawRequestCard(balanceController.withdrawRequests[index]);
                },
              ),
      ),
    );
  }
}
