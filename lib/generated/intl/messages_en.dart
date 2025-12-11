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

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
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
        "sign_in_password": MessageLookupByLibrary.simpleMessage("Password"),
        "sign_in_password_hint":
            MessageLookupByLibrary.simpleMessage("********"),
        "title_logo": MessageLookupByLibrary.simpleMessage("FinWise"),
        "title_sign_in": MessageLookupByLibrary.simpleMessage("Welcome")
      };
}
