import 'package:flutter/material.dart';

import '../../models/posts.dart';

class UserPosts extends StatelessWidget {
  const UserPosts({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Posts', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: post.contributors.length,
            itemBuilder: (context, index) {
              NetworkImage(post.contributors[index].avatar);
              return Image.network(post.imgUrl, fit: BoxFit.cover);
            },
          ),
        ],
      ),
    );
  }
}
