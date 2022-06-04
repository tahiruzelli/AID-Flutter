import 'package:AID/Globals/Contants/colors.dart';
import 'package:AID/Globals/Utils/format_datetime.dart';
import 'package:AID/Globals/Widgets/detail_line.dart';
import 'package:AID/Models/withdraw_request.dart';
import 'package:flutter/material.dart';

class WithdrawRequestCard extends StatelessWidget {
  late WithdrawRequest withdrawRequest;
  WithdrawRequestCard(this.withdrawRequest);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: colorScaffoldColor,
        shadowColor: Colors.white,
        elevation: 5,
        child: Column(
          children: [
            DetailLine("Çekim Tutarı", (withdrawRequest.balance ?? 0).toString()),
            DetailLine(
                "Kart Sahibi", (withdrawRequest.cardHolder ?? 0).toString()),
            DetailLine(
                "Oluşturma Tarihi",
                (formatDateTime(
                    DateTime.parse(withdrawRequest.createTime ?? "")))),
            DetailLine("Onay Durumu",
                withdrawRequest.isApproved! ? "Onaylı" : "Onaylanmadı"),
          ],
        ),
      ),
    );
  }
}
