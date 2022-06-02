import 'package:flutter/material.dart';

class MyMessageRow extends StatelessWidget {
  late Map messageDetail;
  MyMessageRow(this.messageDetail);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      // trailing: Container(
      //   height: 50,
      //   width: 50,
      //   decoration:
      //       const BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
      //   child: const Center(
      //     child: Text(
      //       "t",
      //       style: TextStyle(fontSize: 20),
      //     ),
      //   ),
      // ),
      title: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              color: Colors.grey,
              blurRadius: 1,
              spreadRadius: 0.5,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
          child: Text(
            messageDetail['message'].toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
            textAlign: TextAlign.end,
          ),
        ),
      ),
    );
  }
}
