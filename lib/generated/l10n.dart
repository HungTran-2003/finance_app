// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `FinWise`
  String get title_logo {
    return Intl.message(
      'FinWise',
      name: 'title_logo',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Expense Manager`
  String get onboarding_title_01 {
    return Intl.message(
      'Welcome to Expense Manager',
      name: 'onboarding_title_01',
      desc: '',
      args: [],
    );
  }

  /// `¿Are you ready to take control of your finances?`
  String get onboarding_title_02 {
    return Intl.message(
      '¿Are you ready to take control of your finances?',
      name: 'onboarding_title_02',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get title_sign_in {
    return Intl.message(
      'Welcome',
      name: 'title_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Username or email`
  String get sign_in_email {
    return Intl.message(
      'Username or email',
      name: 'sign_in_email',
      desc: '',
      args: [],
    );
  }

  /// `example@example.com`
  String get sign_in_email_hint {
    return Intl.message(
      'example@example.com',
      name: 'sign_in_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get sign_in_password {
    return Intl.message(
      'Password',
      name: 'sign_in_password',
      desc: '',
      args: [],
    );
  }

  /// `********`
  String get sign_in_password_hint {
    return Intl.message(
      '********',
      name: 'sign_in_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get sign_in_button {
    return Intl.message(
      'Sign in',
      name: 'sign_in_button',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get sign_in_forgot_password {
    return Intl.message(
      'Forgot password?',
      name: 'sign_in_forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_in_button_register {
    return Intl.message(
      'Sign Up',
      name: 'sign_in_button_register',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
