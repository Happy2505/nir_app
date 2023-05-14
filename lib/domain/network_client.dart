import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;

import '../configuration/configuration.dart';
import 'api_client_exception.dart';



class NetworkClient {
  final _client = HttpClient();

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('${Configuration.host}$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  Future<T> get<T>(
    String path,
    String? token,
    T Function(dynamic json) parser, [
    Map<String, dynamic>? parameters,
  ]) async {
    final url = _makeUri(path, parameters);
    final request = await http.get(
      url,
    );
    final response = convert.jsonDecode(request.body) as List<dynamic>;

    final result = parser(response);

    return result;
    // try {
    //   // final request = await _client.getUrl(url);
    //   // final response = await request.close();
    //   // final dynamic json = (await response.jsonDecode());
    //   // // _validateResponse(response, json);
    //   // final result = parser(json);
    //   // return result;
    //
    // }
  }

  Future<T> getMap<T>(
      String path,
      String? token,
      T Function(dynamic json) parser, [
        Map<String, dynamic>? parameters,
      ]) async {
    final url = _makeUri(path, parameters);
    try {

      final request = await http.get(
        url,
      );
      final response = convert.jsonDecode(request.body) as Map<String,dynamic>;

      final result = parser(response);

      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (_) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }

  Future<T> post<T>(
    String path,
    Map<String, dynamic> bodyParameters,
    T Function(dynamic json) parser, [
    Map<String, dynamic>? urlParameters,
  ]) async {
    try {
      final url = _makeUri(path, urlParameters);
      final request = await http.post(
        url,
        headers: {'ContentType': "application/x-www-form-urlencoded"},
        body: bodyParameters,
      );
      final response = convert.jsonDecode(request.body) as Map<String, dynamic>;
      // _validateResponse(request, response);
      final result = parser(response);
      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (e) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }
  Future<T> postLogin<T>(
      String path,
      Map<String, dynamic> bodyParameters,
      T Function(dynamic json) parser, [
        Map<String, dynamic>? urlParameters,
      ]) async {
    try {
      final url = _makeUri(path, urlParameters);
      final request = await http.post(
        url,
        headers: {'ContentType': "application/x-www-form-urlencoded"},
        body: bodyParameters,
      );
      final response = request.body;
      // _validateResponse(request, response);
      final result = parser(response);
      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (e) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }

  Future<T> postReg<T>(
    String path,
    Map<String, dynamic> bodyParameters,
    T Function(dynamic json) parser, [
    Map<String, dynamic>? urlParameters,
  ]) async {
    try {
      final url = _makeUri(path, urlParameters);
      final request = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: convert.jsonEncode(bodyParameters),
      );
      final response = convert.jsonDecode(request.body) as Map<String, dynamic>;
      _validateResponseReg(request, response);
      final result = parser(response);
      return result;
    } on SocketException {
      throw ApiClientExceptionReg(ApiClientExceptionRegType.network);
    } on ApiClientExceptionReg {
      rethrow;
    } catch (e) {
      throw ApiClientExceptionReg(ApiClientExceptionRegType.other);
    }
  }

  void _validateResponse(HttpClientResponse response, dynamic json) {
    print(response.statusCode);
    if (response.statusCode == 400) {
      final dynamic status = json['error_description'];
      if (status == 'Invalid username or password!') {
        throw ApiClientException(ApiClientExceptionType.auth);
      } else {
        throw ApiClientException(ApiClientExceptionType.other);
      }
    }
  }

  void _validateResponseReg(http.Response request, dynamic json) {
    if (request.statusCode == 403 || request.statusCode == 400) {
      if (request.statusCode == 403) {
        throw ApiClientExceptionReg(ApiClientExceptionRegType.repeat);
      } else if (request.statusCode == 400) {
        throw ApiClientExceptionReg(ApiClientExceptionRegType.other);
      }
    }
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(convert.utf8.decoder).toList().then((value) {
      final result = value.join();
      return result;
    }).then<dynamic>((v) => convert.json.decode(v));
  }
}
