import 'package:flutter/material.dart';
import 'package:local_event_finder/models/event.dart';
import 'package:local_event_finder/proiders/event_provider.dart';
import 'package:local_event_finder/screens/widget/event_map_widget.dart';
import 'package:provider/provider.dart';

class EventDetailsScreen extends StatelessWidget {
  final String eventId;
  const EventDetailsScreen({super.key, required this.eventId});

  @override
  Widget build(BuildContext context) {
    final eventProvider = context.watch<EventProvider>();
    final Event event = eventProvider.getEventById(eventId);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 20,
            children: [
              Image.network(
                event.imageUrl,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
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
              EventMapWidget(
                latitude: event.latitude,
                longitude: event.longitude,
                location: event.location,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
