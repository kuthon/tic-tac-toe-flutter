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
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Tic-Tac-Toe`
  String get tic_tac_toe {
    return Intl.message(
      'Tic-Tac-Toe',
      name: 'tic_tac_toe',
      desc: '',
      args: [],
    );
  }

  /// `Your turn`
  String get your_turn {
    return Intl.message(
      'Your turn',
      name: 'your_turn',
      desc: '',
      args: [],
    );
  }

  /// `Opponent's turn...`
  String get opponents_turn {
    return Intl.message(
      'Opponent\'s turn...',
      name: 'opponents_turn',
      desc: '',
      args: [],
    );
  }

  /// `Game Over!`
  String get game_over {
    return Intl.message(
      'Game Over!',
      name: 'game_over',
      desc: '',
      args: [],
    );
  }

  /// `For two`
  String get for_two {
    return Intl.message(
      'For two',
      name: 'for_two',
      desc: '',
      args: [],
    );
  }

  /// `By size`
  String get by_size {
    return Intl.message(
      'By size',
      name: 'by_size',
      desc: '',
      args: [],
    );
  }

  /// `Without borders`
  String get without_borders {
    return Intl.message(
      'Without borders',
      name: 'without_borders',
      desc: '',
      args: [],
    );
  }

  /// `Field Size`
  String get field_size {
    return Intl.message(
      'Field Size',
      name: 'field_size',
      desc: '',
      args: [],
    );
  }

  /// `Размер`
  String get size {
    return Intl.message(
      'Размер',
      name: 'size',
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
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}