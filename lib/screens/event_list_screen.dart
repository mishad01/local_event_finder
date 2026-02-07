import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:local_event_finder/models/event.dart';
import 'package:local_event_finder/proiders/event_provider.dart';
import 'package:local_event_finder/screens/event_details.dart';
import 'package:local_event_finder/screens/widget/event_card.dart';
import 'package:provider/provider.dart';

class EventListScreen extends StatefulWidget {
  const EventListScreen({super.key});

  @override
  State<EventListScreen> createState() => _State();
}

class _State extends State<EventListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<EventProvider>().loadEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Local Events'),
        foregroundColor: Colors.white,
      ),
      body: Consumer<EventProvider>(
        builder: (context, eventProvider, child) {
          //Loading state
          if (eventProvider.isLoading && eventProvider.events.isEmpty) {
            return CircularProgressIndicator();
          }

          //Error State
          if (eventProvider.hasError) {
            return Text(eventProvider.errorMessage ?? 'An error Occured');
          }

          return RefreshIndicator(
            onRefresh: eventProvider.refreshEvents,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 16),
              itemCount: eventProvider.events.length,
              itemBuilder: (context, index) {
                final event = eventProvider.events[index];
                return EventCard(
                  event: event,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EventDetailsScreen(eventId: event.id),
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
