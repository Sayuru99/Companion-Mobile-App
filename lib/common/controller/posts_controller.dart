import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/posts.dart';

class PostController {
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(
        'https://my-json-server.typicode.com/Sayuru99/json_server/posts'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
