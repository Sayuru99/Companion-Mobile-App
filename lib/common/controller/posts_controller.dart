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

  Future<Post> createPost(Post post) async {
    final response = await http.post(
      Uri.parse(
          'https://my-json-server.typicode.com/Sayuru99/json_server/posts'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(post.toJson()),
    );

    if (response.statusCode == 201) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create post');
    }
  }
}
