import 'package:AID/Globals/Contants/colors.dart';
import 'package:flutter/material.dart';

AppBar myAppBar({Widget? action}) {
  return AppBar(
    backgroundColor: colorPurple,
    actions: [
      action ?? Container(),
    ],
  );
}
