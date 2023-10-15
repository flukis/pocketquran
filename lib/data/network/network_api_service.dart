import 'dart:convert';
import 'dart:io';

import 'package:pocketquran/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;
import 'package:pocketquran/data/response/app_exception.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getResponse(String url) async {
    dynamic respJson;
    try {
      final resp = await http.get(Uri.parse(baseUrl + url));
      respJson = response(resp);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return respJson;
  }

  dynamic response(http.Response resp) {
    switch (resp.statusCode) {
      case 200:
        dynamic respJson = jsonDecode(resp.body);
        return respJson;
      case 400:
        throw BadRequestException(resp.toString());
      case 401:
      case 403:
        throw UnauthorisedException(resp.toString());
      case 500:
      default:
        throw FetchDataException(
            "Error occured during communication with server with status code: ${resp.statusCode}");
    }
  }
}
