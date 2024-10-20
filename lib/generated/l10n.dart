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

  /// `Compass and Time`
  String get title {
    return Intl.message(
      'Compass and Time',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `english`
  String get lungEn {
    return Intl.message(
      'english',
      name: 'lungEn',
      desc: '',
      args: [],
    );
  }

  /// `franche`
  String get lungFr {
    return Intl.message(
      'franche',
      name: 'lungFr',
      desc: '',
      args: [],
    );
  }

  /// `arabic`
  String get lungAr {
    return Intl.message(
      'arabic',
      name: 'lungAr',
      desc: '',
      args: [],
    );
  }

  /// `compass`
  String get compass {
    return Intl.message(
      'compass',
      name: 'compass',
      desc: '',
      args: [],
    );
  }

  /// `Determine the Qibla`
  String get detQ {
    return Intl.message(
      'Determine the Qibla',
      name: 'detQ',
      desc: '',
      args: [],
    );
  }

  /// `Current Time`
  String get timeNow {
    return Intl.message(
      'Current Time',
      name: 'timeNow',
      desc: '',
      args: [],
    );
  }

  /// `Time in Mecca`
  String get timeM {
    return Intl.message(
      'Time in Mecca',
      name: 'timeM',
      desc: '',
      args: [],
    );
  }

  /// `gps`
  String get gps {
    return Intl.message(
      'gps',
      name: 'gps',
      desc: '',
      args: [],
    );
  }

  /// `Hijri`
  String get Hijri {
    return Intl.message(
      'Hijri',
      name: 'Hijri',
      desc: '',
      args: [],
    );
  }

  /// `Gregorian`
  String get Gregorian {
    return Intl.message(
      'Gregorian',
      name: 'Gregorian',
      desc: '',
      args: [],
    );
  }

  /// `home`
  String get home {
    return Intl.message(
      'home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `time conversion`
  String get conTime {
    return Intl.message(
      'time conversion',
      name: 'conTime',
      desc: '',
      args: [],
    );
  }

  /// `Gregorian <--> Hijri`
  String get gregorianHijri {
    return Intl.message(
      'Gregorian <--> Hijri',
      name: 'gregorianHijri',
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
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fr'),
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
