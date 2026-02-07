import 'package:flutter/material.dart';
import 'package:local_event_finder/models/event.dart';
import 'package:local_event_finder/service/event_service.dart';

class EventProvider extends ChangeNotifier {
  EventProvider(this._eventService);

  final EventService _eventService;

  List<Event> _events = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Event> get events => _events;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  bool get hasError => _errorMessage != null;

  Future<void> loadEvent() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _events = await _eventService.getAllEvents();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to load Events ${e.toString()}';
      _isLoading = false;
      notifyListeners();
    }
  }

  Event getEventById(String id) {
    return _events.firstWhere((event) => event.id == id);
  }

  Future<void> refreshEvents() async {
    await loadEvent();
  }
}
