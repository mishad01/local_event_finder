import UIKit
import Flutter
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Load API key from environment or configuration
    // TODO: Replace with your actual API key or load from secure storage
    // For now, using a placeholder - configure in Secrets.swift
    if let apiKey = getGoogleMapsAPIKey() {
      GMSServices.provideAPIKey(apiKey)
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
  private func getGoogleMapsAPIKey() -> String? {
    // Try to load from Secrets.swift if it exists
    // Otherwise return nil and you'll need to configure it
    #if DEBUG
    // In debug mode, you can hardcode for testing
    // But make sure Secrets.swift is in .gitignore
    return Secrets.googleMapsAPIKey
    #else
    return Secrets.googleMapsAPIKey
    #endif
  }
}
