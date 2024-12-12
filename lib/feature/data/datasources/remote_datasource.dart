import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  final http.Client client;
  RemoteDataSource({required this.client});

  Future<Map<String, dynamic>> getSections(
      {bool? originalSections, String? argument}) async {
    final headers = _buildHeaders();
    final url = _buildUrl(argument, originalSections);
    final response = await client.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      debugPrint('Request URL: ${response.request?.url}');
      return data;
    } else {
      if (response.body.contains('message')) {
        throw HttpException(jsonDecode(response.body)['message']);
      }
      throw HttpException(response.body);
    }
  }

  String _buildUrl(String? argument, bool? originalSections) {
    const baseUrl =
        'https://gateway-smartforce.yandeh.com.br/process/candidates/search-products';
    final queryParameters = <String, String>{
      'argument': argument ?? '*',
    };

    if (originalSections != null) {
      queryParameters['original'] = originalSections.toString();
    }

    return Uri.parse(baseUrl)
        .replace(queryParameters: queryParameters)
        .toString();
  }

  Map<String, String> _buildHeaders() {
    return {
      'token': '4e82bf6c-4ccd-4c4f-804e-8317a195d1ea',
      'Content-Type': 'application/json',
    };
  }
}
