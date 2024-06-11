import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:validators/sanitizers.dart';

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Uri url(String path, [Map<String, dynamic> params = const {}]) {
    var queryString = '';
    if (params.isNotEmpty) {
      queryString = '?';
      params.forEach((key, value) {
        queryString += '$key=${value.toString()}&';
      });
      path = rtrim(path, '/');
      path = ltrim(path, '/');
      queryString = rtrim(queryString, '&');
    }

    final url = Uri.parse('$baseUrl/$path/$queryString');
    return url;
  }

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic> params = const {},
  }) async {
    final uri = url(path, params);

    final response = await http.get(uri);
    if (response.bodyBytes.isEmpty) {
      return {};
    }

    return jsonDecode(utf8.decode(response.bodyBytes));
  }
}
