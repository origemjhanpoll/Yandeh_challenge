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
    // URL oficial: Não está mais disponível;
    // const baseUrl =
    //     'https://gateway-smartforce.yandeh.com.br/process/candidates/search-products';

    // URL fake: Buscando direto do JSON nos testes;
    const baseUrl =
        'https://raw.githubusercontent.com/origemjhanpoll/yandeh_challenge/refs/heads/main/test/json/data.json';
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
