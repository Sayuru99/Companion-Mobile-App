import 'package:flutter/material.dart';

import '../../models/posts.dart';

class FundRaising extends StatelessWidget {
  const FundRaising({
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
          const Text('Fund Raisings', style: TextStyle(fontSize: 20)),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: post.contributors.length,
            itemBuilder: (context, index) {
              NetworkImage(post.contributors[index].avatar);
              return Column(
                children: [
                  ListTile(
                    title: Text(post.description),
                    subtitle: Text(post.location),
                    leading: Image.network(post.imgUrl, width: 80),
                    trailing: Text('${post.raisedAmount}/${post.totalAmount}'),
                  ),
                  LinearProgressIndicator(
                    value: post.raisedAmount / post.totalAmount,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      for (final contributor in post.contributors)
                        CircleAvatar(
                          backgroundImage: NetworkImage(contributor.avatar),
                          radius: 12,
                        ),
                      const SizedBox(width: 8),
                      const Text('150 contributors'),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
