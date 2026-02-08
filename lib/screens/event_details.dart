import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:local_event_finder/models/event.dart';
import 'package:local_event_finder/proiders/event_provider.dart';
import 'package:local_event_finder/screens/widget/event_map_widget.dart';
import 'package:local_event_finder/screens/widget/info_card.dart';
import 'package:local_event_finder/utils/category_color.dart';
import 'package:provider/provider.dart';

class EventDetailsScreen extends StatelessWidget {
  final String eventId;
  const EventDetailsScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    final eventProvider = context.watch<EventProvider>();
    final Event event = eventProvider.getEventById(eventId);
    final DateTime dateTime = DateTime.parse(event.date);
    // Format as "Day, Month Date, Year" (e.g., "Monday, April 14, 2026")
    //     Pattern breakdown:
    // EEEE = Full day name (e.g., Monday)
    // MMMM = Full month name (e.g., April)
    // dd = Day of month (e.g., 14)
    // yyyy = 4-digit year (e.g., 2026)

    final String formattedDate = DateFormat(
      'EEEE, MMMM dd, yyyy',
    ).format(dateTime);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            spacing: 20,
            children: [
              // Event Image
              Hero(
                tag: 'event-image-${event.id}',
                child: Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    event.imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 250,
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.image_not_supported,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Event Details
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: getCategoryColor(event.category),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        event.category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Event Title
                    Text(
                      event.title,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    // Date and Time Card
                    InfoCard(
                      icon: Icons.calendar_today,
                      title: 'Date & Time',
                      content: '$formattedDate\n${event.time}',
                    ),
                    const SizedBox(height: 16),
                    // Location Card
                    InfoCard(
                      icon: Icons.location_on,
                      title: 'Location',
                      content: event.location,
                    ),
                    const SizedBox(height: 24),
                    // Description Section
                    Text(
                      'About This Event',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      event.description,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        height: 1.6,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 32),
                    // Map Section
                    Text(
                      'Event Location',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    EventMapWidget(
                      latitude: event.latitude,
                      longitude: event.longitude,
                      location: event.location,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
