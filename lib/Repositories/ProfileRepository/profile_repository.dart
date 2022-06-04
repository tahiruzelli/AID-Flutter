import 'package:AID/Globals/Contants/urls.dart';

import '../../Services/rest_connector.dart';

abstract class IProfileRepository {
  Future getCurrentUser(int id);
}

class ProfileRepository implements IProfileRepository {
  @override
  Future getCurrentUser(int id) async {
    var response = await RestConnector(
      baseUrl + getUserUrl + id.toString(),
      requestType: "GET",
    ).getData();
    return response;
  }
}
