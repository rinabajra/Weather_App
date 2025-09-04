import 'package:get/get.dart';

import '../../utils/constants.dart';
import '../models/network_response.dart';

class NetworkService extends GetConnect {
  @override
  void onInit() async {
    httpClient.baseUrl = kApiUrl;
    httpClient.timeout = const Duration(seconds: 30);

    super.onInit();
  }

  Future<NetworkResponse> callApi(
    API method,
    String url, {
    dynamic body,
    Map<String, dynamic>? query,
  }) async {
    Response res;

    query ??= {};

    kLogger.i(
      'method: $method\nroute: $url${body != null ? '\nbody: $body' : ''}${'\nquery: $query'}',
    );

    switch (method) {
      case API.get:
        res = await get(url, query: query);
        break;
      case API.put:
        res = await put(url, body, query: query);
        break;
      case API.post:
        res = await post(url, body, query: query);
        break;

      case API.delete:
        res = await delete(url, query: query);
        break;
      case API.patch:
        res = await patch(url, body, query: query);
        break;
    }

    kLogger.t(res.statusCode);

    return NetworkResponse.fromNetwork(res);
  }
}
