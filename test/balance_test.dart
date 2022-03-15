import 'dart:math';

import 'package:AID/Controllers/BalanceController/balance_controller.dart';
import 'package:get/get.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Balance Test',
    () {
      Random random = Random();
      test(
        'Add Withdraw Money Test',
        () {
          BalanceController balanceController = Get.put(BalanceController());
          balanceController.myMoney.value = 100;
          double willAddMoney = random.nextDouble();
          balanceController.addWithDrawMoney(willAddMoney);
          expect(balanceController.withDrawMoney.value, willAddMoney);
        },
        retry: 100,
      );
      test(
        'Remove Withdraw Money Test',
        () {
          BalanceController balanceController = Get.put(BalanceController());
          balanceController.withDrawMoney.value = 100;
          balanceController.myMoney.value = 100;
          double willRemoveMoney = random.nextInt(100).toDouble();
          balanceController.removeWithDrawMoney(willRemoveMoney);
          expect(balanceController.withDrawMoney.value, 100 - willRemoveMoney);
        },
        retry: 100,
      );
    },
  );
}
