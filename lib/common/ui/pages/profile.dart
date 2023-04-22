// ignore_for_file: sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:companion_app/common/models/userPosts.dart';
import 'package:flutter/material.dart';
import '../../controller/userposts_controller.dart';
import '../../models/posts.dart';
import '../../controller/posts_controller.dart';
import '../../models/user.dart';
import '../../routes/routes.dart';
import '../../ui/widgets/post_card.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/navigation_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final Userposts userposts;
  List<Userposts> _userPosts = [];

  final _userPostsController = UserPostsController();

  int _pageIndex = 4;
  late final User _currentUser = User(
    name: 'Tharun NSBM',
    location: 'New York, NY',
    avatar: 'https://randomuser.me/api/portraits/men/3.jpg',
    followers: 5632,
    events: 15,
    email: 'sayurudealwis99@gmail.com',
    id: 001,
    username: 'sayuru99',
  );

  int get currentPageIndex => _pageIndex;

  void updatePageIndex(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  void initState() {
    super.initState();
    _fetchUserPosts();
  }

  Future<void> _fetchUserPosts() async {
    final userPosts = await _userPostsController.fetchUserPosts();
    setState(() {
      _userPosts = userPosts.cast<Userposts>();
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
            icon: const Icon(
              Icons.menu,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
        elevation: 0,
        backgroundColor: const Color.fromRGBO(88, 101, 242, 1.0),
        title: Text(
          'COMPANION',
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.bold,
            fontSize: 22.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white,
          ),
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
                        radius: 50,
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
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                _currentUser.location,
                                style: const TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.people, size: 10),
                              const SizedBox(width: 4),
                              Text(
                                '${_currentUser.followers} followers',
                                style: const TextStyle(fontSize: 11),
                              ),
                              const SizedBox(width: 10),
                              const Icon(Icons.event, size: 10),
                              const SizedBox(width: 4),
                              Text(
                                '${_currentUser.events} events',
                                style: const TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              //
                            },
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 201, 201, 201),
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 209, 206, 206)),
                                  borderRadius: BorderRadius.circular(7)),
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                                NetworkImage('https://picsum.photos/800/400'),
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
                          SizedBox(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
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
