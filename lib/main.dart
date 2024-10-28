import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';
import 'package:intl/intl.dart';

import 'screens/home scrren/compass.dart';
import 'screens/home scrren/time.dart';
import 'dart:async';

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
      debugShowCheckedModeBanner: false,
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
  late Timer _timer;
  String _currentTime = '';
  String _meccaTime = '';

  @override
  void initState() {
    super.initState();
    _updateTime(); // تحديث الوقت أول مرة
    startTimer(); // بدء المؤقت
  }

  @override
  void dispose() {
    _timer.cancel(); // إلغاء المؤقت عند التخلص من الواجهة
    super.dispose();
  }

  void startTimer() {
    DateTime now = DateTime.now();
    int secondsUntilNextMinute = 60 - now.second;

    Timer(Duration(seconds: secondsUntilNextMinute), () {
      _updateTime();

      _timer = Timer.periodic(const Duration(minutes: 1), (Timer t) {
        _updateTime();
      });
    });
  }

  void _updateTime() {
    setState(() {
      _currentTime = TimeInfo.getCurrentTime();
      _meccaTime = TimeInfo.getMeccaTime();
    });
  }

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).timeNow,
                    style: TextStyle(
                        fontFamily: 'ElMessir',
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    '   $_currentTime',
                    style: const TextStyle(fontFamily: 'ElMessir', fontSize: 18),
                  ),
                ],
              ),
              Wrap(
                runAlignment: WrapAlignment.center,
                children: [
                  Text(
                    '${S.of(context).Gregorian} ${TimeInfo.getNowGregorianDate()}',
                    style: const TextStyle(fontFamily: 'ElMessir', fontSize: 18),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${S.of(context).Hijri} ${TimeInfo.getNowHijriDate()}',
                    style: const TextStyle(fontFamily: 'ElMessir', fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).timeM,
                    style:  TextStyle(fontFamily: 'ElMessir', fontSize: 18,color: Theme.of(context).colorScheme.secondary),
                  ),
                  Text(
                    '   $_meccaTime',
                    style: const TextStyle(fontFamily: 'ElMessir', fontSize: 18),
                  ),
                ],
              ),
              Wrap(
                runAlignment: WrapAlignment.center,
                children: [
                  Text(
                    '${S.of(context).Gregorian} ${TimeInfo.getMeccaGregorianDate()}',
                    style: const TextStyle(fontFamily: 'ElMessir', fontSize: 18),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${S.of(context).Hijri} ${TimeInfo.getMeccaHijriDate()}',
                    style: const TextStyle(fontFamily: 'ElMessir', fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(
                  left: isArabic() ? 0 : 1,
                  right: isArabic() ? 1 : 0,
                ),
                child: Text(
                  S.of(context).detQ,
                  style: const TextStyle(
                      fontFamily: 'ElMessir',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height:20),
              QiblahScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
