// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "Gregorian": MessageLookupByLibrary.simpleMessage("Grégorien"),
        "Hijri": MessageLookupByLibrary.simpleMessage("Hijri"),
        "compass": MessageLookupByLibrary.simpleMessage("boussole"),
        "conTime": MessageLookupByLibrary.simpleMessage("conversion de temps"),
        "detQ": MessageLookupByLibrary.simpleMessage("Déterminer la Qibla"),
        "gps": MessageLookupByLibrary.simpleMessage("gps"),
        "gregorianHijri":
            MessageLookupByLibrary.simpleMessage("Grégorien <--> Hijri"),
        "home": MessageLookupByLibrary.simpleMessage("Accueil"),
        "lungAr": MessageLookupByLibrary.simpleMessage("arabe"),
        "lungEn": MessageLookupByLibrary.simpleMessage("Anglais"),
        "lungFr": MessageLookupByLibrary.simpleMessage("français"),
        "permision": MessageLookupByLibrary.simpleMessage(
            "Une autorisation de localisation (GPS) doit être accordée pour utiliser l\'application."),
        "timeM": MessageLookupByLibrary.simpleMessage("L\'heure à la Mecque"),
        "timeNow": MessageLookupByLibrary.simpleMessage("Heure actuelle"),
        "title": MessageLookupByLibrary.simpleMessage("Boussole et heure")
      };
}
