import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {
  final http.Client client;
  RemoteDataSource({required this.client});

  Future<Map<String, dynamic>?> getSections(
      {bool? originalSections, String? argument}) async {
    final headers = _buildHeaders();
    final url = _buildUrl(argument, originalSections);

    try {
      final response = await client.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        debugPrint('Request URL: ${response.request?.url}');
        return data;
      } else {
        debugPrint(
            'Failed to load JSON. Status code: ${response.statusCode}, URL: $url');
        return null;
      }
    } on SocketException catch (e) {
      debugPrint('No internet connection: $e');
      return null;
    } on HttpException catch (e) {
      debugPrint('HTTP error: $e');
      return null;
    } catch (e, stacktrace) {
      debugPrint('Unexpected error: $e');
      debugPrint('Stacktrace: $stacktrace');
      return null;
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
      'token': '2e227fd8-3d5a-4fb7-b119-8a1c07830c96',
      'Content-Type': 'application/json',
    };
  }
}
