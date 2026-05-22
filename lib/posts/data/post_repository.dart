import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/models.dart';

class PostRepository {
  PostRepository({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'jsonplaceholder.typicode.com';
  static const _postsPerPage = 20;
  final http.Client _httpClient;

  Future<List<Post>> fetchPosts({int startIndex = 0}) async {
    final response = await _httpClient.get(
      Uri.https(_baseUrl, '/posts', {
        '_start': '$startIndex',
        '_limit': '$_postsPerPage',
      }),
    );

    if (response.statusCode != 200) throw Exception('posts 불러오기 실패');

    final body = json.decode(response.body) as List<dynamic>;
    return body.map((dynamic item) {
      final map = item as Map<String, dynamic>;
      return Post(
        id: map['id'] as int,
        title: map['title'] as String,
        body: map['body'] as String,
      );
    }).toList();
  }
}
