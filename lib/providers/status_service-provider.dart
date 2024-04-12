import 'package:flutter/material.dart';

enum status {
  local,
  test,
  production
}

class StatusServiceProvider with ChangeNotifier {
  
  final _developStatus = status.local;

  get getDevelopStatus => _developStatus;
}
