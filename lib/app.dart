import 'package:finance_app/routers/app_router.dart';
import 'package:flutter/material.dart';

import 'configs/app_configs.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return _buildMaterialApp(locale: const Locale('en'));
  }

  Widget _buildMaterialApp({
    required Locale locale,
  }) {
    return MaterialApp.router(
      title: AppConfigs.appName,
      routerConfig: AppRouter.router,
    );
  }
}
