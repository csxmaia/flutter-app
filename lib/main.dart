import 'package:appidea/app/injection.dart';
import 'package:flutter/material.dart';

import 'app/my_app.dart';

void main() async {
  setupInjection();
  runApp(MyApp());
}
