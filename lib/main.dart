import 'package:flutter/material.dart';

import 'app.dart';
import 'database/app_share_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharePreferences.init();
  runApp(const MyApp());
}
