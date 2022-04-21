import 'package:AID/Controllers/AdvertController/advert_controller.dart';
import 'package:AID/Globals/Contants/colors.dart';
import 'package:AID/Globals/Contants/paddings.dart';
import 'package:AID/Globals/Contants/sizes.dart';
import 'package:AID/Globals/Utils/second_to_time.dart';
import 'package:AID/Models/advert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdvertCard extends StatelessWidget {
  AdvertController advertController = Get.find();
  late Advert advert;
  AdvertCard(this.advert);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(paddingM),
      child: GestureDetector(
        onTap: () {
          advertController.onCardPressed(advert);
        },
        child: Container(
          decoration: BoxDecoration(
            color: colorScaffoldColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 0),
                spreadRadius: 0.2,
                blurRadius: 2,
              )
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  advert.coverImageUrl!,
                  height: advertCardHeight,
                  width: advertCardWidth,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${advert.totalGain} \$',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      secondToTime(advert.videoLength ?? 0),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
