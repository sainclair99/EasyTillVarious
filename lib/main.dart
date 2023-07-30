import 'package:app_based_on_bloc/application.dart';
import 'package:flutter/material.dart';

import 'service_locator.dart';

void main() {
  setupLocator();
  runApp(Application());
}
