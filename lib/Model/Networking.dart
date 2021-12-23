import 'dart:io';
import 'package:the_newes/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as conv;

import 'package:http/io_client.dart';

class Networking {
  ApiResult result =  ApiResult();

  Future getData(String url, String token) async {
    HttpClient client =  HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    IOClient ioClient = IOClient(client);

    try {
      http.Response response = await ioClient.get(Uri.parse(url),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

      if (response.statusCode >= 200 && response.statusCode <= 300) {
        result.data = conv.jsonDecode(response.body);
        result.hasError = false;
      } else {
        Map error = conv.jsonDecode(response.body);
        String errorMessage = error["error"];

        result.hasError = true;
        result.failure =  Failure(ErrorCodes.NO_RESPONSE_CODE, errorMessage);
      }
    } on FormatException {
      result.hasError = true;
      result.failure = Failure(ErrorCodes.NO_BODY_PARSING_CODE,
          "Error: Problem parsing data from the server");
    } on SocketException {
      result.hasError = true;
      result.failure = Failure(ErrorCodes.NO_CONNECTION_CODE,
          "Error: Cannot connect to the internet");
    } catch (ex) {
      result.hasError = true;
      result.failure =
          Failure(ErrorCodes.NO_CONNECTION_CODE, ex.toString());
    }
    return result;
  }

  Future postData(var body, String url, [String? token]) async {
    HttpClient client = HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    IOClient ioClient = IOClient(client);

    try {
      http.Response response = await ioClient.post(Uri.parse(url),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            HttpHeaders.authorizationHeader: 'Bearer $token'
          },
          body: conv.jsonEncode(body));

      if (response.statusCode >= 200 && response.statusCode <= 300) {
        result.data = conv.jsonDecode(response.body);
        result.hasError = false;
      } else {
        Map error = conv.jsonDecode(response.body);
        String errorMessage = error["error"];

        result.hasError = true;
        result.failure = Failure(ErrorCodes.NO_RESPONSE_CODE, errorMessage);
      }
    } on FormatException {
      result.hasError = true;
      result.failure = Failure(ErrorCodes.NO_BODY_PARSING_CODE,
          "Error: Problem parsing data from the server");
    } on SocketException {
      result.hasError = true;
      result.failure = Failure(ErrorCodes.NO_CONNECTION_CODE,
          "Error: Cannot connect to the internet");
    } catch (ex) {
      result.hasError = true;
      result.failure =
          Failure(ErrorCodes.NO_CONNECTION_CODE, ex.toString());
    }

    return result;
  }

  Future patchData(var body, String url, [String? token]) async {
    HttpClient client = HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
    IOClient ioClient = IOClient(client);

    try {
      http.Response response = await ioClient.patch(Uri.parse(url),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            HttpHeaders.authorizationHeader: 'Bearer $token'
          },
          body: conv.jsonEncode(body));

      if (response.statusCode >= 200 && response.statusCode <= 300) {
        result.data = conv.jsonDecode(response.body);
        result.hasError = false;
      } else {
        
        Map error = conv.jsonDecode(response.body);
        String errorMessage = error["error"];

        
        result.hasError = true;
        result.failure = Failure(
          ErrorCodes.NO_RESPONSE_CODE,
          errorMessage
          );
      }
    } on FormatException {
      result.hasError = true;
      result.failure =  Failure(ErrorCodes.NO_BODY_PARSING_CODE,
          "Error: Problem parsing data from the server");
    } on SocketException {
      result.hasError = true;
      result.failure =  Failure(ErrorCodes.NO_CONNECTION_CODE,
          "Error: Cannot connect to the internet");
    } catch (ex) {
      result.hasError = true;
      result.failure =
           Failure(ErrorCodes.NO_CONNECTION_CODE, ex.toString());
    }
    return result;
  }

  Future deleteData(String url, String? token, [var body]) async {
    HttpClient client =  HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);

    IOClient ioClient = IOClient(client);

    try {
      http.Response response = await ioClient.delete(Uri.parse(url),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            HttpHeaders.authorizationHeader: 'Bearer $token'
          },
          body: conv.jsonEncode(body));

      if (response.statusCode >= 200 && response.statusCode <= 300) {
        result.data = conv.jsonDecode(response.body);
        result.hasError = false;
      } else {
        Map error = conv.jsonDecode(response.body);
        String errorMessage = error["error"];
        
        result.hasError = true;
        result.failure =  Failure(
          ErrorCodes.NO_RESPONSE_CODE,
          errorMessage
          );
      }
    } on FormatException {
      result.hasError = true;
      result.failure =  Failure(ErrorCodes.NO_BODY_PARSING_CODE,
          "Error: Problem parsing data from the server");
    } on SocketException {
      result.hasError = true;
      result.failure =  Failure(ErrorCodes.NO_CONNECTION_CODE,
          "Error: Cannot connect to the internet");
    } catch (ex) {
      result.hasError = true;
      result.failure =
           Failure(ErrorCodes.NO_CONNECTION_CODE, ex.toString());
    }

    return result;
  }
}
