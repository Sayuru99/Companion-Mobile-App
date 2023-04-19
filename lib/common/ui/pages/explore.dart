// ignore_for_file: library_private_types_in_public_api, unused_field

import 'package:flutter/material.dart';
import '../../models/events.dart';
import '../../routes/routes.dart';
import '../widgets/navigation_widget.dart';
import '../widgets/event_card.dart';
import '../../controller/events_controller.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int _pageIndex = 0;

  void updatePageIndex(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Events',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Expanded(
                child: FutureBuilder(
                  future: EventsController().fetchEvents(),
                  builder: (ctx, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('An error occurred: ${snapshot.error}'),
                      );
                    }
                    final events = snapshot.data as List<Event>?;
                    if (events == null || events.isEmpty) {
                      return const Center(
                        child: Text(
                          'No events found.',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (ctx, index) {
                        final event = events[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: EventCard(event: event),
                        );
                      },
                    );
                  },
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
