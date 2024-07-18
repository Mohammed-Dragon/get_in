import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  String message = '';
  List<String> selectedFilters = [];
  List<Map<String, dynamic>> messages = [];
  double lat = 0.0; // Add latitude state variable
  double long = 0.0; // Add longitude state variable
  bool locationPermissionDenied =
      false; // Add location permission state variable

  void updateMessage(String newMessage) {
    message = newMessage;
    notifyListeners();
  }

  void updateFilters(List<String> newFilters) {
    selectedFilters = newFilters;
    notifyListeners();
  }

  void addMessage(String message, bool isUserMessage) {
    messages.add({'text': message, 'isUserMessage': isUserMessage});
    notifyListeners();
  }

  void updateLocation(double latitude, double longitude) {
    lat = latitude;
    long = longitude;
    notifyListeners();
  }

  void setLocationPermissionDenied(bool denied) {
    locationPermissionDenied = denied;
    notifyListeners();
  }
}
