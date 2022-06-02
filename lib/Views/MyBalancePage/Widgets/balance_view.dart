import 'package:AID/Controllers/BalanceController/balance_controller.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BalanceView extends StatelessWidget {
  BalanceController balanceController = Get.find();
  double leftPadding = 20;
  double rightPadding = Get.width / 10;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        //total money
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: leftPadding),
              child: const Text(
                "Toplam Para: ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: rightPadding),
              child: Text(
                balanceController.myMoney.value.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
        //with draw
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: leftPadding),
                child: const Text(
                  'Çekmek İstenilen: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: rightPadding),
                child: AnimatedFlipCounter(
                  value: balanceController.withDrawMoney.value,
                  textStyle: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        // - -------
        SizedBox(
          height: 20,
          width: Get.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                '---',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: 1,
                  width: Get.width * 0.9,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        //remaining money
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: leftPadding),
                child: const Text(
                  "Kalan Para: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: rightPadding),
                child: Obx(
                  () => Text(
                    (balanceController.myMoney.value -
                            balanceController.withDrawMoney.value)
                        .toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        //buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [1, 5, 10, 20, 50].map(_buildButton).toList(),
        ),
      ],
    );
  }

  Widget _buildButton(num value) {
    return Column(
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white70),
          ),
          child: Text(
            '+$value',
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          onPressed: () => balanceController.addWithDrawMoney(value.toDouble()),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white70),
          ),
          child: Text(
            '-$value',
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          onPressed: () =>
              balanceController.removeWithDrawMoney(value.toDouble()),
        ),
      ],
    );
  }
}
