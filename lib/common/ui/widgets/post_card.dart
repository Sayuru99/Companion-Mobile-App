// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import '../../controller/userposts_controller.dart';
import '../../models/posts.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final UserPostsController _userPostsController = UserPostsController();

  PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            post.imgUrl,
            fit: BoxFit.cover,
            height: 300,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: post.raisedAmount / post.totalAmount,
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(88, 101, 242, 1.0)),
                minHeight: 10,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Liked by Huge and 200 others',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              SizedBox(
                height: 20,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: post.contributors.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8,
                        backgroundImage:
                            NetworkImage(post.contributors[index].avatar),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 221, 218, 218),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${post.contributors.length} contributors',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
