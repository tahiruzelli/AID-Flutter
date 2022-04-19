import 'dart:convert';

import '../../Globals/Contants/urls.dart';
import '../../Services/rest_connector.dart';

abstract class ILoginRepository {
  Future login(String email, String password);
}

class LoginRepository implements ILoginRepository {
  @override
  Future login(String email, String password) async {
    Map body = {
      "email": email,
      "password": password,
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      baseUrl + loginUrl,
      data: jsonBody,
      requestType: "POST",
    ).getData();
    return response;
  }
}
