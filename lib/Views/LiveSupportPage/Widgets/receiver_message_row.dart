import 'package:flutter/material.dart';

class ReceiverMessageRow extends StatelessWidget {
  late Map messageDetail;
  ReceiverMessageRow(this.messageDetail);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Text(
          messageDetail['message'].toString(),
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
