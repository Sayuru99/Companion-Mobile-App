// ignore_for_file: library_private_types_in_public_api

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/events.dart';
import '../../routes/routes.dart';
import '../widgets/event_card.dart';
import '../widgets/navigation_widget.dart';
import '../widgets/search_widget.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int _pageIndex = 1;

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
            icon: const Icon(
              Icons.notifications_none_outlined,
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
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: [
              const SearchWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Events',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Filtered by',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            //location filtering logic
                          },
                          child: Text(
                            'Location',
                            style: GoogleFonts.roboto(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://hipmaps.com/wp-content/uploads/2022/08/Google_Austin_Slider_MapV2.png',
                  height: MediaQuery.of(context).size.width / 2,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  imageBuilder: (context, imageProvider) => ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'View Events',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const EventsCard(),
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
