import 'dart:collection';
import 'dart:convert';

import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:logging/logging.dart';

import '../../model/api/image_upload_response.dart';

class RestApiClient {
  final log = Logger('ApiLogger');
  final String baseUrl;
  final CognitoUserPool userPool;

  RestApiClient({required this.baseUrl, required this.userPool});

  Future<CognitoUserSession> getCurrentSession() async {
    try {
      CognitoUser? user = await userPool.getCurrentUser();

      if (user == null) {
        throw 'Not a valid user';
      }

      CognitoUserSession? session = await user.getSession();

      if (session == null) {
        throw 'Invalid User Session';
      }

      return session;
    } catch (e) {
      log.severe(e.toString());
      rethrow;
    }
  }

  Future<ImageUploadResponse> uploadImage(
      String path, String fileName, String storeId, String type) async {
    // Fetch the file
    final tokenResp = await http.get(
      Uri.parse('$baseUrl/business/$storeId/image/token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    log.info('Response: ${tokenResp.body}');
    Map<String, dynamic> responseJson;
    if (tokenResp.statusCode == 200) {
      responseJson = json.decode(tokenResp.body);
    } else {
      throw Exception('Failed to load data');
    }

    // construct the request
    var uri = Uri.https('upload.imagekit.io', '/api/v1/files/upload');
    var request = http.MultipartRequest('POST', uri)
      ..fields['publicKey'] = 'public_Meql/vuDgEH948bofreYb2IpHCc='
      ..fields['signature'] = responseJson['signature']
      ..fields['expire'] = '${responseJson['expires']}'
      ..fields['token'] = responseJson['token']
      ..fields['fileName'] = fileName.split("/").last
      ..fields['folder'] = 'parchi-dev/$storeId/$type'
      ..files.add(await http.MultipartFile.fromPath(
        'file',
        path,
      ));
    var response = await request.send();
    if (response.statusCode == 200) {
      var resp = await response.stream.bytesToString();
      var jsonResp = json.decode(resp);
      return ImageUploadResponse(
          inputFileName: fileName, outputFilePath: jsonResp['filePath']);
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Future<String> getAuthToken() async {
  //   try {
  //     AuthSession token = await Amplify.Auth.fetchAuthSession(
  //         options: CognitoSessionOptions(getAWSCredentials: true));
  //     if (token is CognitoAuthSession) {
  //       return 'Bearer ${token.userPoolTokens!.idToken}';
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return "";
  // }

  Future<Map<String, String>> buildAuthHeader(
      CognitoUserSession session) async {
    Map<String, String> map = {
      "Authorization": "${session.idToken.jwtToken}",
      "x-api-key": 'API_KEY',
      "Content-Type": "application/json"
    };
    return map;
  }

  Future<Response> get({required RestOptions restOptions}) async {
    CognitoUserSession session = await getCurrentSession();
    Map<String, String> auth = await buildAuthHeader(session);
    Map<String, String> header = HashMap.from(auth);
    var _url = Uri.parse(baseUrl + restOptions.path);
    log.info("GET Request: ");
    log.info(_url);
    // print('************************');
    // print(header);
    // print('************************');
    final response = await http.get(_url, headers: header);
    log.info("GET Response: ${response.statusCode}");
    log.info(response.body);
    return response;
  }

  Future<Response> post({required RestOptions restOptions}) async {
    CognitoUserSession session = await getCurrentSession();
    Map<String, String> auth = await buildAuthHeader(session);
    Map<String, String> header = HashMap.from(auth);
    var _url = Uri.parse(baseUrl + restOptions.path);
    log.info("Post Request: ");
    log.info(restOptions);
    final response =
        await http.post(_url, headers: header, body: restOptions.body);
    log.info("Post Response: ${response.statusCode} | ${response.headers}");
    log.info(response.body);
    return response;
  }

  Response delete({required RestOptions restOptions}) {
    throw UnimplementedError('delete has not been implemented.');
  }

  Future<Response> put({required RestOptions restOptions}) async {
    CognitoUserSession session = await getCurrentSession();
    Map<String, String> auth = await buildAuthHeader(session);
    Map<String, String> header = HashMap.from(auth);
    var _url = Uri.parse(baseUrl + restOptions.path);
    log.info("Put Request: ");
    log.info(restOptions);
    final response =
        await http.put(_url, headers: header, body: restOptions.body);
    log.info("Put Response: ${response.statusCode} | ${response.headers}");
    log.info(response.body);
    return response;
  }

  Future<Response> rawPut({required RestOptions restOptions}) async {
    if (restOptions.url == null) {
      throw 'URL is required for rawPut';
    }

    var _url = Uri.parse(restOptions.url!);
    log.info("RawPut Request: ");
    log.info(restOptions);
    final response = await http.put(_url,
        headers: restOptions.headers, body: restOptions.body);
    log.info("RawPut Response: ${response.statusCode} | ${response.headers}");
    log.info(response.body);
    return response;
  }

  dynamic parsedResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        var res = ApiExceptionMessage.fromJson(json.decode(response.body));
        throw FetchDataException(res.message);
    }
  }
}

class AppException implements Exception {
  final dynamic message;
  final dynamic prefix;

  AppException(this.message, this.prefix);

  @override
  String toString() {
    return "$prefix $message";
  }
}

class FetchDataException extends AppException {
  FetchDataException(String message)
      : super(message, "Error during communication: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException(String message) : super(message, "Unauthorised: ");
}

class BadRequestException extends AppException {
  BadRequestException(String message) : super(message, "Invalid Request: ");
}

class RestOptions {
  String path;
  Object? body;
  String? url;
  Map<String, String>? queryParameters;
  Map<String, String>? headers;

  RestOptions({
    required this.path,
    this.body,
    this.url,
    this.queryParameters,
    this.headers,
  }) : assert(path.isNotEmpty || url != null);

  @override
  String toString() {
    return 'RestOptions{path: $path, body: $body, url: $url  queryParameters: $queryParameters, headers: $headers}';
  }
}

class RestResponse {}

class ApiExceptionMessage {
  late final String timestamp;
  late final String message;

  ApiExceptionMessage({required this.timestamp, required this.message});

  ApiExceptionMessage.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['message'] = message;
    return data;
  }
}
