import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  final http.Client client;

  RemoteDataSource({required this.client});

  Future<Map<String, dynamic>?> getSections({bool? isOriginalSections}) async {
    final headers = {
      'token': '2e227fd8-3d5a-4fb7-b119-8a1c07830c96',
      'Content-Type': 'application/json',
    };

    try {
      final response = await client.get(
          Uri.parse(
              'https://gateway-smartforce.yandeh.com.br/process/candidates/search-products?argument=*'),
          headers: headers);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        return jsonData;
      } else {
        debugPrint('Failed to load JSON. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e, stacktrace) {
      debugPrint('Error fetching data: $e');
      debugPrint('Stacktrace: $stacktrace');
      return null;
    }
  }
}
