import '../../Globals/Contants/urls.dart';
import '../../Services/rest_connector.dart';

abstract class IVideoRepository {
  Future getAllVideos();
}

class VideoRepository implements IVideoRepository {
  @override
  Future getAllVideos() async {
    var response = await RestConnector(
      baseUrl + getVideosUrl,
    ).getData();
    return response;
  }
}
