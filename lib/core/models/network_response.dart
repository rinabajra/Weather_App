import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NetworkResponse {
  late bool ok;
  dynamic data;
  dynamic error;

  NetworkResponse({
    this.ok = false,
    this.data,
    this.error,
  });

  NetworkResponse.fromNetwork(Response<dynamic> res) {
    ok = res.isOk;

    if (ok) {
      data = res.body;
    } else {
      error = res.body;
    }
  }

  NetworkResponse.fromHttpResponse(http.Response res) {
    ok = res.statusCode == 200;

    if (ok) {
      if (res.body.isNotEmpty) {
        try {
          data = jsonDecode(res.body);
        } catch (e) {
          print("Error decoding response: $e");
          throw FormatException('Response is not valid JSON');
        }
      } else {
        data = null; // Handle empty responses
      }
    } else {
      if (res.body.isNotEmpty) {
        try {
          error = jsonDecode(res.body);
        } catch (e) {
          print(
            "Error decoding error response: $e",
          );
          throw FormatException('Error response is not valid JSON');
        }
      } else {
        error = 'Unknown error occurred';
      }
    }
  }
}
