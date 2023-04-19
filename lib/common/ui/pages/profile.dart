// ignore_for_file: sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../models/posts.dart';
import '../../controller/posts_controller.dart';
import '../../models/user.dart';
import '../../routes/routes.dart';
import '../../ui/widgets/post_card.dart';
import '../widgets/navigation_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<List<Post>> _postsFuture;
  late User _currentUser = User(
    name: 'John Doe',
    location: 'New York, NY',
    avatar: 'https://randomuser.me/api/portraits/men/1.jpg',
    followers: 5632,
    events: 15,
    email: 'sayurudealwis99@gmail.com',
    id: 001,
    username: 'sayuru99',
  );
  int _pageIndex = 4;

  void updatePageIndex(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _postsFuture = PostController().fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
        elevation: 0,
        backgroundColor: const Color.fromRGBO(88, 101, 242, 1.0),
        title: const Text(
          'Companion',
          style: TextStyle(fontFamily: 'Roboto'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: _currentUser.avatar,
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                      radius: 30,
                      backgroundImage: imageProvider,
                    ),
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _currentUser.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(_currentUser.location),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.people, size: 16),
                            const SizedBox(width: 4),
                            Text('${_currentUser.followers} followers'),
                            const SizedBox(width: 16),
                            const Icon(Icons.event, size: 16),
                            const SizedBox(width: 4),
                            Text('${_currentUser.events} events'),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            //
                          },
                          child: const Text('Edit Profile'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.grey[300],
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Color.fromARGB(255, 209, 206, 206)),
                            ),
                            elevation: 0,
                            minimumSize: const Size(200, 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            // FutureBuilder(
            //   future: _postsFuture,
            //   builder: (ctx, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return const Center(child: CircularProgressIndicator());
            //     }
            //     if (snapshot.hasError) {
            //       return Center(
            //         child: Text('An error occurred: ${snapshot.error}'),
            //       );
            //     }
            //     final posts = snapshot.data as List<Post>?;
            //     if (posts == null || posts.isEmpty) {
            //       return const Center(
            //         child: Text(
            //           'No posts found.',
            //           style: TextStyle(
            //             fontSize: 18,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //       );
            //     }

            //     return ListView.builder(
            //       shrinkWrap: true,
            //       physics: const NeverScrollableScrollPhysics(),
            //       itemCount: posts.length,
            //       itemBuilder: (ctx, index) {
            //         final post = posts[index];
            //         return PostCard(
            //           post: post,
            //         );
            //       },
            //     );
            //   },
            // ),
          ],
        ),
      ),
      bottomNavigationBar: MyCurvedNavigationBar(
        onTabSelected: (index) {
          updatePageIndex(index);

          switch (index) {
            case 0:
              // Navigate to the home page
              Navigator.pushNamed(context, Routes.home);
              break;
            case 1:
              // Navigate to the explore page
              Navigator.pushNamed(context, Routes.explore);
              break;
            case 2:
              Navigator.pushNamed(context, Routes.add);
              break;
            case 3:
              // Navigate to the messages page
              Navigator.pushNamed(context, Routes.chat);
              break;
            case 4:
              // Navigate to the profile page
              Navigator.pushNamed(context, Routes.profile);
              break;
          }
        },
      ),
    );
  }
}
