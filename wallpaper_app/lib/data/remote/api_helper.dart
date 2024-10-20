import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as httpClient;
import 'package:wallpaper_app/data/remote/app_exception.dart';
import 'package:wallpaper_app/constants/app_constants.dart';

class ApiHelper {
  Future<dynamic> getAPI({required String url}) async {
    var uri = Uri.parse(url);

    try {
      var res = await httpClient.get(
        uri,
        headers: {
          "Authorization": AppConstants.PIXELS_API_KEY // Use the actual API key
        },
      );

      return returnJsonResponse(res);
    } on SocketException {
      throw FetchDataException(errorMsg: 'No Internet connection!');
    } catch (e) {
      throw FetchDataException(errorMsg: 'An error occurred: $e');
    }
  }

  dynamic returnJsonResponse(httpClient.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(errorMsg: response.body.toString());
      case 401:
      case 403:
        throw UnauthorizedException(errorMsg: response.body.toString());
      case 500:
      default:
        throw FetchDataException(
          errorMsg:
              'Error occurred while communicating with server. Status code: ${response.statusCode}',
        );
    }
  }
}
