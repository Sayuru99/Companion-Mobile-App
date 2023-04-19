// ignore_for_file: library_private_types_in_public_api, unused_field

import 'package:companion_app/common/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../controller/posts_controller.dart';
import '../../routes/routes.dart';
import '../widgets/navigation_widget.dart';
import '../widgets/posts_widget.dart';
import '../../models/posts.dart';
import '../../models/user.dart';
import '../widgets/search_widget.dart';
import 'fullPost.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  late final User user;
  late final Post post;
  late User _currentUser;
  final PostController postController = PostController();
  final UserController userController = UserController();
  final TextEditingController searchController = TextEditingController();

  void updatePageIndex(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(88, 101, 242, 1.0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined),
            onPressed: () {},
          ),
        ],
        elevation: 0,
        backgroundColor: const Color.fromRGBO(88, 101, 242, 1.0),
        title: const Text(
          'COMPANION',
          style: TextStyle(fontFamily: 'Roboto'),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const SearchWidget(),
            Expanded(
              child: FutureBuilder<List<Post>>(
                future: postController.fetchPosts(),
                builder:
                    (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
                  if (snapshot.hasData) {
                    return FutureBuilder<List<User>>(
                      future:
                          userController.fetchUser(snapshot.data![0].userId),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<User>> userSnapshot) {
                        if (userSnapshot.hasData) {
                          return ListView(
                            children: snapshot.data!.map((post) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FullPost(
                                        post: post,
                                      ),
                                    ),
                                  );
                                },
                                child: PostWidget(
                                  post: post,
                                  user: userSnapshot.data![0],
                                ),
                              );
                            }).toList(),
                          );
                        } else if (userSnapshot.hasError) {
                          return Text('${userSnapshot.error}');
                        } else {
                          // Use Shimmer as a placeholder while loading
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.grey[300],
                                    radius: 30,
                                  ),
                                  title: Container(
                                    height: 10,
                                    color: Colors.grey[300],
                                  ),
                                  subtitle: Container(
                                    height: 10,
                                    color: Colors.grey[300],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  } else {
                    // Use Shimmer as a placeholder while loading
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              radius: 30,
                            ),
                            title: Container(
                              height: 10,
                              color: Colors.grey[300],
                            ),
                            subtitle: Container(
                              height: 10,
                              color: Colors.grey[300],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
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
