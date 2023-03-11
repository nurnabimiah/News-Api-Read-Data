import 'dart:convert';
import 'dart:developer';
import 'dart:ui';

import 'package:http/http.dart';

class NetworkUtils {
  Future<dynamic> getMethod(String url, {VoidCallback? onUnauthorized}) async {
    try {
      Uri uri = Uri.parse(url);
      final Response response = await get(uri, headers: {'token': ''});
      print(response.body);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        if (onUnauthorized != null) {
          onUnauthorized();
        } else {
          log('Status code: ${response.statusCode}');
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
