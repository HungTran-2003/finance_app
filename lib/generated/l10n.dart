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

  /// `Use <Fingerprint> To Access`
  String get sign_in_login_fingerprint {
    return Intl.message(
      'Use <Fingerprint> To Access',
      name: 'sign_in_login_fingerprint',
      desc: '',
      args: [],
    );
  }

  /// `Fingerprint`
  String get sign_in_text_fingerprint {
    return Intl.message(
      'Fingerprint',
      name: 'sign_in_text_fingerprint',
      desc: '',
      args: [],
    );
  }

  /// `or sign up with`
  String get sign_in_text_other_login {
    return Intl.message(
      'or sign up with',
      name: 'sign_in_text_other_login',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get sign_up_title {
    return Intl.message(
      'Create Account',
      name: 'sign_up_title',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get sign_up_username {
    return Intl.message(
      'Full name',
      name: 'sign_up_username',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get sign_up_username_hint {
    return Intl.message(
      'User name',
      name: 'sign_up_username_hint',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get sign_up_email {
    return Intl.message(
      'Email',
      name: 'sign_up_email',
      desc: '',
      args: [],
    );
  }

  /// `example@example.com`
  String get sign_up_email_hint {
    return Intl.message(
      'example@example.com',
      name: 'sign_up_email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get sign_up_phone {
    return Intl.message(
      'Phone number',
      name: 'sign_up_phone',
      desc: '',
      args: [],
    );
  }

  /// `+0123 456 789`
  String get sign_up_phone_hint {
    return Intl.message(
      '+0123 456 789',
      name: 'sign_up_phone_hint',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get sign_up_date_of_birth {
    return Intl.message(
      'Date of birth',
      name: 'sign_up_date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `DD/MM/YYYY`
  String get sign_up_date_of_birth_hint {
    return Intl.message(
      'DD/MM/YYYY',
      name: 'sign_up_date_of_birth_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get sign_up_password {
    return Intl.message(
      'Password',
      name: 'sign_up_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get sign_up_confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'sign_up_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `********`
  String get sign_up_password_hint {
    return Intl.message(
      '********',
      name: 'sign_up_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `By signing up, you agree to our Terms of Service and Privacy Policy.`
  String get sign_up_terms_and_conditions {
    return Intl.message(
      'By signing up, you agree to our Terms of Service and Privacy Policy.',
      name: 'sign_up_terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up_button {
    return Intl.message(
      'Sign Up',
      name: 'sign_up_button',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get sign_up_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'sign_up_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get sign_up_button_login {
    return Intl.message(
      'Login',
      name: 'sign_up_button_login',
      desc: '',
      args: [],
    );
  }

  /// `Hi, {title}`
  String home_title_welcome(Object title) {
    return Intl.message(
      'Hi, $title',
      name: 'home_title_welcome',
      desc: '',
      args: [title],
    );
  }

  /// `Good Morning`
  String get home_getting_morning {
    return Intl.message(
      'Good Morning',
      name: 'home_getting_morning',
      desc: '',
      args: [],
    );
  }

  /// `Good Afternoon`
  String get home_getting_afternoon {
    return Intl.message(
      'Good Afternoon',
      name: 'home_getting_afternoon',
      desc: '',
      args: [],
    );
  }

  /// `Good Evening`
  String get home_getting_evening {
    return Intl.message(
      'Good Evening',
      name: 'home_getting_evening',
      desc: '',
      args: [],
    );
  }

  /// `Total Balance`
  String get home_total_balance {
    return Intl.message(
      'Total Balance',
      name: 'home_total_balance',
      desc: '',
      args: [],
    );
  }

  /// `Total Expense`
  String get home_total_expense {
    return Intl.message(
      'Total Expense',
      name: 'home_total_expense',
      desc: '',
      args: [],
    );
  }

  /// `${value}`
  String home_budget_income(Object value) {
    return Intl.message(
      '\$$value',
      name: 'home_budget_income',
      desc: '',
      args: [value],
    );
  }

  /// `-${value}`
  String home_budget_expense(Object value) {
    return Intl.message(
      '-\$$value',
      name: 'home_budget_expense',
      desc: '',
      args: [value],
    );
  }

  /// `{percent} of your expenses, looks good.`
  String home_message_good(Object percent) {
    return Intl.message(
      '$percent of your expenses, looks good.',
      name: 'home_message_good',
      desc: '',
      args: [percent],
    );
  }

  /// `{percent} of your expenses, looks bad.`
  String home_message_bad(Object percent) {
    return Intl.message(
      '$percent of your expenses, looks bad.',
      name: 'home_message_bad',
      desc: '',
      args: [percent],
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
