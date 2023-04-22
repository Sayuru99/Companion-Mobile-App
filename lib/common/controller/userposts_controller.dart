import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/userposts.dart';

class UserPostsController {
  final String _baseUrl =
      "https://my-json-server.typicode.com/Sayuru99/json_server/userposts";

  Future<List<Userposts>> fetchUserPosts() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List<dynamic>;

      return data.map((posts) {
        final List<dynamic> contributors = posts['contributors'];
        final List<Contributor> parsedContributors = contributors
            .map((contributor) => Contributor(
                  name: contributor['name'],
                  avatar: contributor['avatar'],
                ))
            .toList();

        return Userposts(
          title: posts['title'],
          body: posts['body'],
          image: posts['image'],
          raisedAmount: posts['raisedAmount'],
          totalAmount: posts['totalAmount'],
          contributors: parsedContributors,
          id: posts['id'],
        );
      }).toList();
    } else {
      throw Exception("Failed to fetch user posts");
    }
  }
}
