import '../../Services/rest_connector.dart';

abstract class IAnnouncementRepository {
  Future getAnnouncements();
}

class AnnouncementRepository implements IAnnouncementRepository {
  @override
  Future getAnnouncements() async {
    var response = await RestConnector(
      "https://aid-web.herokuapp.com/GetAllAnnouncemets",
      requestType: "GET",
    ).getData();
    return response;
  }
}
