import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'sv'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? svText = '',
  }) =>
      [enText, svText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'xwyxwy9n': {
      'en': 'Open',
      'sv': 'Öppet',
    },
    'lfkwkzb1': {
      'en': 'Home',
      'sv': 'Hem',
    },
  },
  // AddRepetitionPage
  {
    'cz0zhzb4': {
      'en': 'Home',
      'sv': 'Hem',
    },
  },
  // CustomRepetitionPage
  {
    '55lx4rjh': {
      'en': 'Home',
      'sv': 'Hem',
    },
  },
  // FrequencyExpander
  {
    'xmgwzs7h': {
      'en': 'Frequency',
      'sv': 'Frekvens',
    },
    'r3anp0or': {
      'en': 'every day',
      'sv': 'varje dag',
    },
  },
  // IntervalExpander
  {
    '2952w46f': {
      'en': 'With the interval',
      'sv': 'Med intervallet',
    },
    'e15u4phe': {
      'en': '1 week',
      'sv': '1 vecka',
    },
  },
  // MonthDayCheckerCombined
  {
    'sphagbrb': {
      'en': 'Every',
      'sv': 'Varje',
    },
    'tiwqbpnm': {
      'en': 'of the month...',
      'sv': 'av månaden...',
    },
  },
  // AddRepetitionComponent
  {
    'pwpi343g': {
      'en': 'Custom',
      'sv': 'Beställnings',
    },
  },
  // YearBySetChecker
  {
    'cl0eiplq': {
      'en': 'Weekdays',
      'sv': 'Vardagar',
    },
  },
  // HeaderCenteredNavBar
  {
    'usujndrb': {
      'en': 'Cancel',
      'sv': 'Annullera',
    },
    't7ggjw9g': {
      'en': 'Save',
      'sv': 'Spara',
    },
  },
  // CustomFunctionsTranslationsMap
  {
    'daxykqq2': {
      'en': 'The activity will repeat every day',
      'sv': 'Aktiviteten kommer att upprepas varje dag',
    },
    'mfg5rhah': {
      'en': 'The activity will repeat every week',
      'sv': 'Aktiviteten kommer att upprepas varje vecka',
    },
    'vbn8qvxy': {
      'en': 'The activity will repeat every second week',
      'sv': 'Aktiviteten kommer att upprepas varannan vecka',
    },
    'zpky99wo': {
      'en': 'The activity will repeat every month',
      'sv': 'Aktiviteten kommer att upprepas varje månad',
    },
    'vy44jrpj': {
      'en': 'The activity will repeat every year',
      'sv': 'Aktiviteten kommer att upprepas varje år',
    },
    'oyc9uml8': {
      'en': 'The activity will repeat ',
      'sv': 'Aktiviteten kommer att upprepas',
    },
    'gwyr9cx1': {
      'en': 'day',
      'sv': 'dag',
    },
    '2cpvzq7y': {
      'en': 'days',
      'sv': 'dagar',
    },
    'lsowp12l': {
      'en': 'week',
      'sv': 'vecka',
    },
    '3e5xfez2': {
      'en': 'weeks',
      'sv': 'Veckor',
    },
    'hptgspwe': {
      'en': 'month',
      'sv': 'månad',
    },
    'ax9vtym8': {
      'en': 'months',
      'sv': 'månader',
    },
    'rrpiidap': {
      'en': 'year',
      'sv': 'år',
    },
    'n4wmlxr5': {
      'en': 'years',
      'sv': 'år',
    },
    '1g631ksb': {
      'en': 'Monday',
      'sv': 'måndag',
    },
    'nzdgw5w6': {
      'en': 'Tuesday',
      'sv': 'tisdag',
    },
    'clmax87t': {
      'en': 'Wednesday',
      'sv': 'onsdag',
    },
    'n6lnn8xv': {
      'en': 'Thursday',
      'sv': 'torsdag',
    },
    'qi8cotop': {
      'en': 'Friday',
      'sv': 'fredag',
    },
    '3h99ug2f': {
      'en': 'Saturday',
      'sv': 'lördag',
    },
    'ax1lx5sz': {
      'en': 'Sunday',
      'sv': 'söndag',
    },
    'd3l22vhu': {
      'en': 'January',
      'sv': 'januari',
    },
    '9g3z94s7': {
      'en': 'February',
      'sv': 'februari',
    },
    'lnt22ld1': {
      'en': 'March',
      'sv': 'Mars',
    },
    '034u8g9a': {
      'en': 'April',
      'sv': 'april',
    },
    '6hls65tt': {
      'en': 'May',
      'sv': 'Maj',
    },
    'pej4ktvz': {
      'en': 'June',
      'sv': 'juni',
    },
    '6betrjev': {
      'en': 'July',
      'sv': 'juli',
    },
    '6qvjh0si': {
      'en': 'August',
      'sv': 'augusti',
    },
    'sgku9oc9': {
      'en': 'September',
      'sv': 'september',
    },
    '8sca82td': {
      'en': 'October',
      'sv': 'oktober',
    },
    'wqms1orj': {
      'en': 'November',
      'sv': 'november',
    },
    'd09m6bre': {
      'en': 'December',
      'sv': 'december',
    },
    'qh1jdrfs': {
      'en': 'Never',
      'sv': 'Aldrig',
    },
    'j2qbaf0p': {
      'en': 'Every day',
      'sv': 'Varje dag',
    },
    '6f13hwqg': {
      'en': 'Every week',
      'sv': 'Varje vecka',
    },
    'n5k10s1l': {
      'en': 'Every second week',
      'sv': 'Varannan vecka',
    },
    'ss0z0b17': {
      'en': 'Every month',
      'sv': 'Varje månad',
    },
    '4u8zezxi': {
      'en': 'Every year',
      'sv': 'Varje år',
    },
    '33iznp6j': {
      'en': 'Custom',
      'sv': 'Beställnings',
    },
    'kqd4z9pz': {
      'en': 'First',
      'sv': 'Först',
    },
    's7uatyuu': {
      'en': 'Second',
      'sv': 'Andra',
    },
    'jcfzzqjr': {
      'en': 'Third',
      'sv': 'Tredje',
    },
    '1bpw60wp': {
      'en': 'Fourth',
      'sv': 'Fjärde',
    },
    'b9stiig0': {
      'en': 'Fifth',
      'sv': 'Femte',
    },
    '2o2mi8pi': {
      'en': 'Last',
      'sv': 'Sista',
    },
    'nnq9e346': {
      'en': 'Weekend day',
      'sv': 'Helgdag',
    },
    'yl4rh0ou': {
      'en': 'WeekDay',
      'sv': 'Veckodag',
    },
    'ahnsj6ps': {
      'en': 'Day',
      'sv': 'Dag',
    },
  },
].reduce((a, b) => a..addAll(b));
