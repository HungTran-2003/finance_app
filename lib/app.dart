import 'package:finance_app/common/app_themes.dart';
import 'package:finance_app/generated/l10n.dart';
import 'package:finance_app/global_blocs/settings/app_setting_cubit.dart';
import 'package:finance_app/networking/api_client.dart';
import 'package:finance_app/networking/api_utlis.dart';
import 'package:finance_app/repositories/auth_repository.dart';
import 'package:finance_app/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'configs/app_configs.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ApiClient _apiClient;

  @override
  void initState() {
    _apiClient = ApiUtil.apiClient;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) {
            return AuthRepositoryImpl(_apiClient);
          },
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppSettingCubit>(
            create: (context) {
              return AppSettingCubit();
            },
          ),
        ],
        child: _buildMaterialApp(locale: const Locale('en')),
      ),
    );
  }

  Widget _buildMaterialApp({required Locale locale}) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: MaterialApp.router(
        title: AppConfigs.appName,
        routerConfig: AppRouter.router,
        theme: AppThemes().theme,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
