// // ignore_for_file: library_private_types_in_public_api, unused_field

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../models/events.dart';
// import '../../routes/routes.dart';
// import '../widgets/navigation_widget.dart';
// import '../widgets/event_card.dart';
// import '../../controller/events_controller.dart';

// class ExplorePage extends StatefulWidget {
//   const ExplorePage({Key? key}) : super(key: key);

//   @override
//   _ExplorePageState createState() => _ExplorePageState();
// }

// class _ExplorePageState extends State<ExplorePage> {
//   int _pageIndex = 1;

//   void updatePageIndex(int index) {
//     setState(() {
//       _pageIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications_none_outlined),
//             onPressed: () {},
//           ),
//         ],
//         elevation: 0,
//         backgroundColor: const Color.fromRGBO(88, 101, 242, 1.0),
//         title: Text(
//           'COMPANION',
//           style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Events',
//                 style: Theme.of(context).textTheme.headlineSmall,
//               ),
//               Expanded(
//                 child: FutureBuilder(
//                   future: EventsController().fetchEvents(),
//                   builder: (ctx, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return const Center(child: CircularProgressIndicator());
//                     }
//                     if (snapshot.hasError) {
//                       return Center(
//                         child: Text('An error occurred: ${snapshot.error}'),
//                       );
//                     }
//                     final events = snapshot.data as List<Event>?;
//                     if (events == null || events.isEmpty) {
//                       return const Center(
//                         child: Text(
//                           'No events found.',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       );
//                     }
//                     return ListView.builder(
//                       itemCount: events.length,
//                       itemBuilder: (ctx, index) {
//                         final event = events[index];
//                         return Padding(
//                           padding: const EdgeInsets.only(bottom: 16.0),
//                           child: EventCard(event: event),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: MyCurvedNavigationBar(
//         onTabSelected: (index) {
//           updatePageIndex(index);
//           switch (index) {
//             case 0:
//               // Navigate to the home page
//               Navigator.pushNamed(context, Routes.home);
//               break;
//             case 1:
//               // Navigate to the explore page
//               Navigator.pushNamed(context, Routes.explore);
//               break;
//             case 2:
//               Navigator.pushNamed(context, Routes.add);
//               break;
//             case 3:
//               // Navigate to the messages page
//               Navigator.pushNamed(context, Routes.chat);
//               break;
//             case 4:
//               // Navigate to the profile page
//               Navigator.pushNamed(context, Routes.profile);
//               break;
//           }
//         },
//       ),
//     );
//   }
// }

// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../models/events.dart';
import '../../routes/routes.dart';
import '../widgets/event_card.dart';
import '../widgets/navigation_widget.dart';

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

  final List<Event> _events = [
    Event(
      name: 'Event 1',
      location: 'Location 1',
      imageUrl: 'https://via.placeholder.com/300',
      description: 'Description of event 1',
      startTime: '9:00 AM',
      endTime: '12:00 PM',
      id: 002,
      lat: 22.25,
      lng: 22.32,
    ),
    Event(
      name: 'Event 2',
      location: 'Location 2',
      imageUrl: 'https://via.placeholder.com/300',
      description: 'Description of event 2',
      startTime: '1:00 PM',
      endTime: '4:00 PM',
      id: 002,
      lat: 22.25,
      lng: 22.32,
    ),
    Event(
      name: 'Event 3',
      location: 'Location 3',
      imageUrl: 'https://via.placeholder.com/300',
      description: 'Description of event 3',
      startTime: '6:00 PM',
      endTime: '9:00 PM',
      id: 002,
      lat: 22.25,
      lng: 22.32,
    ),
    Event(
      name: 'Event 4',
      location: 'Location 4',
      imageUrl: 'https://via.placeholder.com/300',
      description: 'Description of event 4',
      startTime: '10:00 AM',
      endTime: '2:00 PM',
      id: 002,
      lat: 22.25,
      lng: 22.32,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: _events.length,
        itemBuilder: (context, index) {
          final event = _events[index];
          return EventCard(event: event);
        },
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
