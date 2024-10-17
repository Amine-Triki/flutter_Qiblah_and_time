import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Language code to store selected language
  String lung = "en";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale(lung),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Compass and Time',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green[800],
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.green[300],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: HomeView(
        onLanguageChanged: (String newLang) {
          setState(() {
            lung = newLang;
          });
        },
        currentLanguage: lung,
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  final Function(String) onLanguageChanged;
  final String currentLanguage;

  const HomeView({
    super.key,
    required this.onLanguageChanged,
    required this.currentLanguage,
  });

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).title),
        actions: [
          DropdownButton<String>(
            value: widget.currentLanguage, // The current language
            icon: const Icon(Icons.language, color: Colors.white),
            underline: Container(),
            onChanged: (String? newLanguage) {
              if (newLanguage != null) {
                widget.onLanguageChanged(newLanguage);
              }
            },
            items: [
              DropdownMenuItem(
                value: 'en',
                child: Text(S.of(context).lungEn),
              ),
              DropdownMenuItem(
                value: 'ar',
                child: Text(S.of(context).lungAr),
              ),
              DropdownMenuItem(
                value: 'fr',
                child: Text(S.of(context).lungFr),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).title,
                  style: const TextStyle(fontFamily: 'ElMessir', fontSize: 30),
                ),
                const Text(' 12:54 pm'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${S.of(context).Gregorian} 10/16/2024'),
                const SizedBox(width: 10),
                Text('${S.of(context).Hijri} Hijri 04-12-1446'),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                left: isArabic() ? 0 : 10,
                right: isArabic() ? 10 : 0,
              ),
              child: Text(S.of(context).detQ),
            ),
          ],
        ),
      ),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
