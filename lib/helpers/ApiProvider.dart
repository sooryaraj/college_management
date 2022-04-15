import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:college_management/helpers/CustomException.dart';
import 'package:college_management/utils/constant.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<dynamic> get({required String path}) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(Const.baseUrl + path));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:

      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
