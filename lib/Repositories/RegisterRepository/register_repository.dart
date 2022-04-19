import 'dart:convert';

import 'package:AID/Globals/Contants/urls.dart';

import '../../Services/rest_connector.dart';

abstract class IRegisterRepository {
  Future getAvatars();
  Future register({
    required String name,
    required String email,
    required String password,
    required String avatarId,
  });
}

class RegisterRepository implements IRegisterRepository {
  @override
  Future getAvatars() async {
    var response = await RestConnector(
      baseUrl + getAvatarsUrl,
    ).getData();
    return response;
  }

  @override
  Future register({
    required String name,
    required String email,
    required String password,
    required String avatarId,
  }) async {
    Map body = {
      "name": name,
      "email": email,
      "password": password,
      "avatarId": avatarId,
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      baseUrl + registerUrl,
      data: jsonBody,
      requestType: "POST",
    ).getData();
    return response;
  }
}
