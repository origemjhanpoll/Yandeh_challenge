import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class RemoteDataSource {
  final http.Client client;
  final String token;
  RemoteDataSource({required this.client, required this.token});

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
      'token': token,
      'Content-Type': 'application/json',
    };
  }
}
