import 'package:flutter/material.dart';

import '../../models/events.dart';

class EventsWidget extends StatelessWidget {
  const EventsWidget({
    Key? key,
    required this.events,
    required this.filteredLocation,
  }) : super(key: key);

  final List<Event> events;
  final String filteredLocation;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0),
          child: Text(
            'Events',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0),
          child: Text(
            'Filtered by Location',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(
          height: 150.0,
          child: Image.network(
            'https://i.pinimg.com/564x/f0/cb/1a/f0cb1ad77c347e5c4bc5f680772f0aae.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
