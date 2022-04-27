import '../../Globals/Contants/urls.dart';
import '../../Services/rest_connector.dart';

abstract class IVideoRepository {
  Future getAllVideos();
  Future getAllTags();
}

class VideoRepository implements IVideoRepository {
  @override
  Future getAllVideos() async {
    var response = await RestConnector(
      baseUrl + getVideosUrl,
    ).getData();
    return response;
  }

  @override
  Future getAllTags() async {
    var response = await RestConnector(
      baseUrl + getTagsUrl,
    ).getData();
    return response;
  }
}
