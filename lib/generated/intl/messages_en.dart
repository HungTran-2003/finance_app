// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(value) => "-\$${value}";

  static String m1(value) => "\$${value}";

  static String m2(percent) => "${percent} of your expenses, looks bad.";

  static String m3(percent) => "${percent} of your expenses, looks good.";

  static String m4(title) => "Hi, ${title}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "home_budget_expense": m0,
        "home_budget_income": m1,
        "home_getting_afternoon":
            MessageLookupByLibrary.simpleMessage("Good Afternoon"),
        "home_getting_evening":
            MessageLookupByLibrary.simpleMessage("Good Evening"),
        "home_getting_morning":
            MessageLookupByLibrary.simpleMessage("Good Morning"),
        "home_message_bad": m2,
        "home_message_goal":
            MessageLookupByLibrary.simpleMessage("Savings on goals"),
        "home_message_goal_add":
            MessageLookupByLibrary.simpleMessage("Add Goal"),
        "home_message_good": m3,
        "home_title_welcome": m4,
        "home_total_balance":
            MessageLookupByLibrary.simpleMessage("Total Balance"),
        "home_total_expense":
            MessageLookupByLibrary.simpleMessage("Total Expense"),
        "onboarding_title_01":
            MessageLookupByLibrary.simpleMessage("Welcome to Expense Manager"),
        "onboarding_title_02": MessageLookupByLibrary.simpleMessage(
            "¿Are you ready to take control of your finances?"),
        "sign_in_button": MessageLookupByLibrary.simpleMessage("Sign in"),
        "sign_in_button_register":
            MessageLookupByLibrary.simpleMessage("Sign Up"),
        "sign_in_email":
            MessageLookupByLibrary.simpleMessage("Username or email"),
        "sign_in_email_hint":
            MessageLookupByLibrary.simpleMessage("example@example.com"),
        "sign_in_forgot_password":
            MessageLookupByLibrary.simpleMessage("Forgot password?"),
        "sign_in_login_fingerprint":
            MessageLookupByLibrary.simpleMessage("Use <Fingerprint> To Access"),
        "sign_in_password": MessageLookupByLibrary.simpleMessage("Password"),
        "sign_in_password_hint":
            MessageLookupByLibrary.simpleMessage("********"),
        "sign_in_text_fingerprint":
            MessageLookupByLibrary.simpleMessage("Fingerprint"),
        "sign_in_text_other_login":
            MessageLookupByLibrary.simpleMessage("or sign up with"),
        "sign_up_button": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "sign_up_button_login": MessageLookupByLibrary.simpleMessage("Login"),
        "sign_up_confirm_password":
            MessageLookupByLibrary.simpleMessage("Confirm password"),
        "sign_up_date_of_birth":
            MessageLookupByLibrary.simpleMessage("Date of birth"),
        "sign_up_date_of_birth_hint":
            MessageLookupByLibrary.simpleMessage("DD/MM/YYYY"),
        "sign_up_email": MessageLookupByLibrary.simpleMessage("Email"),
        "sign_up_email_hint":
            MessageLookupByLibrary.simpleMessage("example@example.com"),
        "sign_up_have_account":
            MessageLookupByLibrary.simpleMessage("Already have an account?"),
        "sign_up_password": MessageLookupByLibrary.simpleMessage("Password"),
        "sign_up_password_hint":
            MessageLookupByLibrary.simpleMessage("********"),
        "sign_up_phone": MessageLookupByLibrary.simpleMessage("Phone number"),
        "sign_up_phone_hint":
            MessageLookupByLibrary.simpleMessage("+0123 456 789"),
        "sign_up_terms_and_conditions": MessageLookupByLibrary.simpleMessage(
            "By signing up, you agree to our Terms of Service and Privacy Policy."),
        "sign_up_title": MessageLookupByLibrary.simpleMessage("Create Account"),
        "sign_up_username": MessageLookupByLibrary.simpleMessage("Full name"),
        "sign_up_username_hint":
            MessageLookupByLibrary.simpleMessage("User name"),
        "title_logo": MessageLookupByLibrary.simpleMessage("FinWise"),
        "title_sign_in": MessageLookupByLibrary.simpleMessage("Welcome")
      };
}
