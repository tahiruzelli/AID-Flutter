import 'package:AID/Globals/Contants/colors.dart';
import 'package:flutter/material.dart';

AppBar myAppBar({Widget? action,String title = "AID"}) {
  return AppBar(
    backgroundColor: colorPurple,
    title: Text(title),
    actions: [
      action ?? Container(),
    ],
  );
}
