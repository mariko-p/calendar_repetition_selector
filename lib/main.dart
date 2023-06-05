import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
  // Used for testing in local flutter.
  // runApp(ChangeNotifierProvider(
  //   create: (context) => appState,
  //   child: MyApp(locale: Locale('sv')),
  // ));
}

class MyApp extends StatefulWidget {
  //LOCAL_START
  MyApp({
    Key? key,
    this.locale,
  }) : super(key: key);
  //LOCAL_END

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
  //LOCAL_START - see AddRepetitionComponent for detailed explanation.
  Locale? locale;
  static Future<dynamic> Function(String? rrule)? onRRuleChanged;
  static Future<dynamic> Function(String? rrule)? onSaveTapFromAddPage;
  static Future<dynamic> Function()? onCancelTapFromAddPage;
  static Future<dynamic> Function(String? rrule)? onSaveTapFromCustomPage;
  static bool isExitAppOnBackON = false;
  //LOCAL_END

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = ThemeMode.system;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    //LOCAL_START
    _locale = widget.locale;
    //LOCAL_END
    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  //LOCAL_START
  getLocale() => _locale;
  //LOCAL_END

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'custom-recurring-selectors',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      //LOCAL_START - Android default ripple behavior is InkRipple.splashFactory.
      theme: ThemeData(
          brightness: Brightness.light, splashFactory: InkRipple.splashFactory),
      darkTheme: ThemeData(
          brightness: Brightness.dark, splashFactory: InkRipple.splashFactory),
      //LOCAL_END
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('sv'),
      ],
      themeMode: _themeMode,
      // routeInformationParser: _router.routeInformationParser,
      // routerDelegate: _router.routerDelegate,
      routerConfig: _router,
    );
  }
}
