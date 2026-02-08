# API Key Setup Guide

This guide explains how to configure your Google Maps API key securely without exposing it in version control.

## 🔐 Security Notice

**IMPORTANT**: Never commit API keys to version control! This project uses separate configuration files that are excluded from Git.

## Setup Instructions

### 1. Get Your Google Maps API Key

1. Go to [Google Cloud Console](https://console.cloud.google.com/)
2. Create a new project or select an existing one
3. Enable the following APIs:
   - Maps SDK for Android
   - Maps SDK for iOS
4. Go to **Credentials** and create an API key
5. Restrict your API key (recommended):
   - For Android: Add your app's package name and SHA-1 fingerprint
   - For iOS: Add your app's bundle identifier

### 2. Configure for Android

1. Navigate to `android/app/src/main/res/values/`
2. Copy `secrets.xml.example` to `secrets.xml`:
   ```bash
   cp android/app/src/main/res/values/secrets.xml.example android/app/src/main/res/values/secrets.xml
   ```
3. Open `secrets.xml` and replace `YOUR_GOOGLE_MAPS_API_KEY_HERE` with your actual API key:
   ```xml
   <string name="google_maps_api_key">YOUR_ACTUAL_API_KEY</string>
   ```

### 3. Configure for iOS

1. Navigate to `ios/Runner/`
2. Copy `Secrets.swift.example` to `Secrets.swift`:
   ```bash
   cp ios/Runner/Secrets.swift.example ios/Runner/Secrets.swift
   ```
3. Open `Secrets.swift` and replace `YOUR_GOOGLE_MAPS_API_KEY_HERE` with your actual API key:
   ```swift
   static let googleMapsAPIKey = "YOUR_ACTUAL_API_KEY"
   ```

### 4. Verify Configuration

The following files should be in your `.gitignore`:
- ✅ `.env`
- ✅ `ios/Runner/Secrets.swift`
- ✅ `android/app/src/main/res/values/secrets.xml`

The following example files should be committed:
- ✅ `.env.example`
- ✅ `ios/Runner/Secrets.swift.example`
- ✅ `android/app/src/main/res/values/secrets.xml.example`

## 🧪 Testing

After configuration, run the app to verify the maps are working:

```bash
# For Android
flutter run -d android

# For iOS
flutter run -d ios
```

## 🔄 For Team Members

When cloning this repository:

1. Copy all `.example` files to their actual versions
2. Add your own Google Maps API key to each configuration file
3. Never commit the actual secret files

## 📝 Files Overview

| File | Purpose | Committed to Git? |
|------|---------|-------------------|
| `.env.example` | Template for environment variables | ✅ Yes |
| `.env` | Actual environment variables | ❌ No |
| `secrets.xml.example` | Android API key template | ✅ Yes |
| `secrets.xml` | Android API key (actual) | ❌ No |
| `Secrets.swift.example` | iOS API key template | ✅ Yes |
| `Secrets.swift` | iOS API key (actual) | ❌ No |

## ⚠️ Troubleshooting

### Maps not showing on Android
- Verify the API key in `secrets.xml`
- Check that Maps SDK for Android is enabled in Google Cloud Console
- Ensure your app's package name and SHA-1 are registered

### Maps not showing on iOS
- Verify the API key in `Secrets.swift`
- Check that Maps SDK for iOS is enabled in Google Cloud Console
- Ensure your app's bundle identifier is registered

### "API key not found" error
- Make sure you copied the example files to actual configuration files
- Verify the file names are correct (no `.example` extension)
- Clean and rebuild: `flutter clean && flutter pub get`
