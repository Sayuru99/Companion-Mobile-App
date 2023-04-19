import 'package:companion_app/common/ui/pages/auth/login.dart';

import '../ui/forms/donation.dart';
import '../ui/pages/home.dart';
import '../ui/pages/profile.dart';
import '../ui/pages/explore.dart';
import '../ui/pages/chat.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String home = '/';
  static const String profile = '/profile';
  static const String add = '/createpost';
  static const String explore = '/explore';
  static const String chat = '/chat';
  static const String login = '/login';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    profile: (context) => const ProfilePage(),
    add: (context) => const CreatePostPage(
          companion: 'Companion',
        ),
    explore: (context) => const ExplorePage(),
    chat: (context) => const Chat(),
    login: (context) => LoginWidget(),
  };
}
