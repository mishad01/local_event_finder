# Local Event Finder

A Flutter application for discovering and exploring local events in Bangladesh, featuring interactive maps and detailed event information.

## Features

- 📍 **Location-based Events** - Browse events from Dhaka, Chittagong, and other cities
- 🗺️ **Interactive Maps** - View event locations on Google Maps with custom markers
- 📅 **Event Details** - Comprehensive information including date, time, location, and category
- 🎨 **Category-based Organization** - Events organized by categories (Music, Sports, Technology, Food, Art, etc.)
- 🎯 **Clean Architecture** - Simplified clean architecture with Provider state management

## Tech Stack

- **Framework**: Flutter 3.10.8
- **State Management**: Provider (^6.1.5)
- **Maps**: Google Maps Flutter (^2.5.0)
- **Date Formatting**: intl (^0.20.2)

## Project Structure

```
lib/
├── main.dart                    # App entry point with Provider setup
├── models/
│   └── event.dart              # Event data model with JSON serialization
├── proiders/
│   └── event_provider.dart     # State management for events
├── screens/
│   ├── event_list_screen.dart  # Main screen showing all events
│   ├── event_details.dart      # Detailed event view
│   └── widget/
│       ├── event_card.dart     # Reusable event card widget
│       ├── event_map_widget.dart # Google Maps integration
│       └── info_card.dart      # Info display card component
├── service/
│   └── event_service.dart      # Event data service with dummy data
└── utils/
    └── category_color.dart     # Category color utilities
```

## Getting Started

### Prerequisites

- Flutter SDK 3.10.8 or higher
- FVM (Flutter Version Manager) - optional but recommended
- Android Studio / Xcode for platform-specific builds
- Google Maps API key (for maps functionality)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd local_event_finder
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Google Maps API**
   
   > **🔐 Security Note**: API keys are stored in separate configuration files that are excluded from version control.
   
   - Get an API key from [Google Cloud Console](https://console.cloud.google.com/)
   - Follow the detailed setup guide in [API_KEY_SETUP.md](API_KEY_SETUP.md)
   - Quick setup:
     ```bash
     # Android
     cp android/app/src/main/res/values/secrets.xml.example android/app/src/main/res/values/secrets.xml
     # Edit secrets.xml and add your API key
     
     # iOS
     cp ios/Runner/Secrets.swift.example ios/Runner/Secrets.swift
     # Edit Secrets.swift and add your API key
     ```

4. **Run the app**
   ```bash
   flutter run
   ```

## Key Implementation Details

### State Management
- Uses Provider package for reactive state management
- `EventProvider` manages event loading and state updates
- Prevents build-time exceptions by properly handling `notifyListeners()`

### Architecture Pattern
- **Models**: Data classes with JSON serialization
- **Services**: Business logic and data fetching
- **Providers**: State management layer
- **Screens**: UI components and widgets
- **Utils**: Shared utilities and helpers

### Widget Extraction
- Modular widget design for reusability
- Extracted components: `EventCard`, `InfoCard`, `EventMapWidget`
- Utility functions separated into dedicated files

## Development Timeline

This project was developed as part of Ostad Batch 11 coursework with the following milestones:

1. **Initial Setup** - Flutter project initialization with FVM
2. **Core Architecture** - Models, services, and Provider setup
3. **UI Implementation** - Event list and detail screens
4. **Maps Integration** - Google Maps with custom markers
5. **Widget Refactoring** - Component extraction for better code organization
6. **Bug Fixes** - Resolved Provider build exceptions and state management issues

## Known Issues & Solutions

- **Provider Build Exception**: Fixed by moving `loadEvent()` call from `initState()` to avoid calling `setState()` during build
- **Autocomplete Issues**: VS Code Flutter autocomplete can be resolved by restarting the Dart Analysis Server

## Future Enhancements

- [ ] Real API integration for live event data
- [ ] User authentication and favorites
- [ ] Event filtering and search functionality
- [ ] Push notifications for upcoming events
- [ ] Event booking/registration system

## Contributing

This is an educational project. Feel free to fork and experiment!

## License

This project is created for educational purposes as part of Ostad Batch 11.
