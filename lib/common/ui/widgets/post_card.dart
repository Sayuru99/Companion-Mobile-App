// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Post {
  final String imgUrl;
  final String description;
  final int likes;
  final int raisedAmount;
  final int totalAmount;
  final List<Contributor> contributors;

  const Post({
    required this.imgUrl,
    required this.description,
    required this.likes,
    required this.raisedAmount,
    required this.totalAmount,
    required this.contributors,
  });
}

class Contributor {
  final String avatar;

  const Contributor({required this.avatar});
}

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 230,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              'https://picsum.photos/seed/1/600',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: LinearProgressIndicator(
              value: 0.7,
              color: Colors.blue,
              backgroundColor: Colors.grey[200],
              minHeight: 4,
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/seed/2/100',
                  ),
                  radius: 12,
                ),
                const SizedBox(width: 4),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/seed/3/100',
                  ),
                  radius: 12,
                ),
                const SizedBox(width: 4),
                Text(
                  'Liked by 200 people',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'This is a sample post description. This is a sample post description.',
              style: const TextStyle(fontSize: 12),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            child: TwoPostsRow(post1: post, post2: post),
          ),
        ],
      ),
    );
  }
}

class TwoPostsRow extends StatelessWidget {
  final Post post1;
  final Post post2;

  const TwoPostsRow({
    Key? key,
    required this.post1,
    required this.post2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PostCard(post: post1),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: PostCard(post: post2),
          ),
        ),
      ],
    );
  }
}
