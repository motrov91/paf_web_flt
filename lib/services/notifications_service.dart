import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError(String message) {
    final snackbar = SnackBar(
        backgroundColor: Color(0xffEE6D6E),
        content: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ));

    messengerKey.currentState!.showSnackBar(snackbar);
  }

  static showSnackbarSuccess(String message) {
    final snackbar = SnackBar(
        backgroundColor: Colors.green,
        content: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ));

    messengerKey.currentState!.showSnackBar(snackbar);
  }
}
