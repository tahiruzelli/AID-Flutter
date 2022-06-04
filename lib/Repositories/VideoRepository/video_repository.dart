import 'dart:convert';

import '../../Globals/Contants/urls.dart';
import '../../Services/rest_connector.dart';

abstract class IVideoRepository {
  Future getAllVideos();
  Future getAllTags();
  Future createDataSet(String photoUrl, int tagId, int userId);
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

  @override
  Future createDataSet(String photoUrl, int tagId, int userId) async {
    Map body = {
      "id": 0,
      "photoUrl": photoUrl,
      "tagId": tagId,
      "userId": userId,
      "createTime": DateTime.now().toString().split(" ")[0] +
          "T" +
          DateTime.now().toString().split(" ")[1] +
          "Z",
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      baseUrl + postPhotoUrl,
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }
}
