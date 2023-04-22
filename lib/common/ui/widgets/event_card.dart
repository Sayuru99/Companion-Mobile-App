import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/events.dart';

class EventsCard extends StatelessWidget {
  const EventsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.network(
              'https://placehold.co/100x100.png',
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Apeksha Hospital',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Kohuwala, Sri Lanka',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sunt cupidatat nulla ex dolore anim deserunt esse eu Lorem ex aliqua.',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
