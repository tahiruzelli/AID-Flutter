import 'dart:convert';
import 'package:http/http.dart' as http;

class RestConnector {
  String url;
  String requestType;
  String data;
  RestConnector(
    this.url, {
    this.requestType = "GET",
    this.data = "",
  });

  getData() async {
    var response;
    if (requestType == 'GET') {
      response = await http.get(
        Uri.parse(url),
        headers: {
          'content-type': 'application/json',
        },
      );
    } else if (requestType == 'POST') {
      response = await http.post(
        Uri.parse(url),
        body: data,
        headers: {
          'content-type': 'application/json',
        },
      );
    } else if (requestType == "PUT") {
      response = await http.put(
        Uri.parse(url),
        body: data,
        headers: {
          'content-type': 'application/json',
        },
      );
    }
    var parsedResponse = json.decode(response.body);

    return parsedResponse;
  }
}