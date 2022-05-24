import 'dart:convert';

import '../../Globals/Contants/urls.dart';
import '../../Services/rest_connector.dart';

abstract class IBalanceRepository {
  Future createRequest({
    required int balance,
    required String cardNo,
    required int cvv,
    required String expDate,
    required String cardHolder,
    required int userId,
  });
  Future getMyRequests();
}

class BalanceRepository implements IBalanceRepository {
  @override
  Future createRequest({
    required int balance,
    required String cardNo,
    required int cvv,
    required String expDate,
    required String cardHolder,
    required int userId,
  }) async {
    Map body = {
      "balance": balance,
      "cardNo": cardNo,
      "cvv": cvv,
      "expDate": expDate,
      "cardHolder": cardHolder,
      "userId": userId,
      "isApproved": false,
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      baseUrl + createWithdrawRequestUrl,
      data: jsonBody,
      requestType: "POST",
    ).getData();
    return response;
  }

  @override
  Future getMyRequests() {
    // TODO: implement getMyRequests
    throw UnimplementedError();
  }
}
