import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:local_event_finder/models/event.dart';
import 'package:local_event_finder/utils/category_color.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final VoidCallback onTap;
  const EventCard({super.key, required this.event, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.parse(event.date);
    final String formattedDate = DateFormat('MMMM dd, yyyy').format(dateTime);

    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      clipBehavior: Clip.antiAlias,
      child: Column(
        spacing: 10,
        crossAxisAlignment: .start,
        children: [
          GestureDetector(
            onTap: () => onTap(),
            child: Hero(
              tag: 'event-image-${event.id}',
              child: Image.network(
                event.imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return SizedBox(
                    height: 200,
                    child: Center(
                      child: Icon(
                        Icons.image_not_supported,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: .start,
              children: [
                //Category
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: getCategoryColor(event.category),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    event.category,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                //Title
                Text(
                  event.title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                //Date and time
                Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                    Text(formattedDate, style: TextStyle(color: Colors.grey)),
                  ],
                ),

                //Location
                Row(
                  spacing: 10,
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    Expanded(
                      child: Text(
                        event.location,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
