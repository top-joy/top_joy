import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  // Singleton pattern to ensure a single instance
  static final ToastService _instance = ToastService._internal();

  factory ToastService() {
    return _instance;
  }

  ToastService._internal();

  // Method to show toast message
  void showToast({
    required String message,
    required Color backgroundColor,
    required IconData icon,
  }) {
    try {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: backgroundColor,
        textColor: Colors.white,
        fontSize: 16.0,
        // You can add more customization here if needed
      );
    } catch (e) {
      print("Error showing toast: $e");
    }
  }
}
