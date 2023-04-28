// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import '../../controller/userposts_controller.dart';
import '../../models/posts.dart';

class ProfilePosts extends StatelessWidget {
  const ProfilePosts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 221, 218, 218),
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage('https://picsum.photos/800/400'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // LinearProgressIndicator
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: 20 / 200, // Raised amount / Total amount
                backgroundColor: Colors.grey[200],
                valueColor: const AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(88, 101, 242, 1.0)),
                minHeight: 10,
              ),
            ),
            const SizedBox(height: 8),
            // "Liked by Huge and 200 others" Text
            const Text(
              'Liked by Huge and 200 others',
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
            ),
            const SizedBox(height: 8),
            // Contributors avatars and "150 contributors" Text
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // List of contributors' avatars
                Expanded(
                  child: Row(
                    children: const [
                      CircleAvatar(
                        radius: 8,
                        backgroundImage: NetworkImage(
                            'https://randomuser.me/api/portraits/men/3.jpg'),
                      ),
                      CircleAvatar(
                        radius: 8,
                        backgroundImage: NetworkImage(
                            'https://randomuser.me/api/portraits/men/1.jpg'),
                      ),
                      CircleAvatar(
                        radius: 8,
                        backgroundImage: NetworkImage(
                            'https://randomuser.me/api/portraits/men/2.jpg'),
                      ),
                      // Add more contributors' avatars here
                    ],
                  ),
                ),
                // "150 contributors" Text
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: SizedBox(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 221, 218, 218),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    '150 contributors',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
