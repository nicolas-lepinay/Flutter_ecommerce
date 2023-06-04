import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  late Map<String, String> _mainHeaders;
  final String appBaseUrl;

  // CONSTRUCTOR
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = "";
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  // GET METHOD
  Future<Response> getData(String uri) async {
    try {
      Response response = await get(uri); // URI = endpoint ("/api/v1/...")
      return response;
    } catch (err) {
      return Response(statusCode: 1, statusText: err.toString());
    }
  }
}
