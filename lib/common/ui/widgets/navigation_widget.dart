// ignore_for_file: library_private_types_in_public_api, sort_child_properties_last, deprecated_member_use, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../routes/routes.dart';
import '../forms/donation.dart';

class MyCurvedNavigationBar extends StatefulWidget {
  final ValueChanged<int> onTabSelected;

  const MyCurvedNavigationBar({Key? key, required this.onTabSelected})
      : super(key: key);

  @override
  _MyCurvedNavigationBarState createState() => _MyCurvedNavigationBarState();
}

class _MyCurvedNavigationBarState extends State<MyCurvedNavigationBar> {
  final List<bool> _isSelectedList = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 40,
      backgroundColor: Colors.white,
      color: Colors.white,
      buttonBackgroundColor: Colors.white,
      animationDuration: const Duration(milliseconds: 300),
      items: <Widget>[
        iconBuild(_isSelectedList, 'assets/icons/home.svg', 0),
        Icon(
          Icons.explore_outlined,
          color: _isSelectedList == 1 ? Colors.blue : Colors.black54,
          size: 20,
        ),
        Transform.translate(
          offset: const Offset(0, -30),
          child: SizedBox(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const CreatePostPage(companion: 'Companion'),
                    ),
                  );
                },
                child: const Icon(Icons.add, size: 25, color: Colors.white),
                backgroundColor: const Color.fromRGBO(88, 101, 242, 1.0),
              ),
            ),
          ),
        ),
        iconBuild(_isSelectedList, 'assets/icons/messages.svg', 3),
        iconBuild(_isSelectedList, 'assets/icons/proifle.svg', 4),
      ],
      onTap: (index) {
        setState(() {
          // Update the selection state of all the icons
          for (int i = 0; i < _isSelectedList.length; i++) {
            _isSelectedList[i] = (i == index);
          }
        });

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

        widget.onTabSelected(index);
      },
    );
  }

  Widget iconBuild(List<bool> isSelectedList, String imagePath, int index) {
    return Stack(
      children: [
        SvgPicture.asset(
          imagePath,
          color: isSelectedList[index]
              ? const Color.fromRGBO(88, 101, 242, 1.0)
              : Colors.black,
          height: 15,
          width: 20,
        ),
      ],
    );
  }
}
