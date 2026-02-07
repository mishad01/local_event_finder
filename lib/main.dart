import 'package:flutter/material.dart';
import 'package:local_event_finder/proiders/event_provider.dart';
import 'package:local_event_finder/screens/event_list_screen.dart';
import 'package:local_event_finder/service/event_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventProvider(EventService())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const EventListScreen(),
      ),
    );
  }
}
