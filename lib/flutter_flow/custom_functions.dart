import 'dart:convert';
import 'dart:math' as math;

import 'package:custom_recurring_selectors/custom_code/codecs/sv.dart';
import 'package:custom_recurring_selectors/flutter_flow/custom_icons.dart';
import 'package:custom_recurring_selectors/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rrule/rrule.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../app_state.dart';
import '../custom_code/constants/calendar_constants.dart';
import 'internationalization.dart';
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

List<FrequencyStruct> generateFrequency([BuildContext? context]) {
  //Used for initialising the frequency dropdown.
  if (context == null) {
    return [
      createFrequencyStruct(value: Constants.DAILY, text: Constants.DAILY),
      createFrequencyStruct(value: Constants.WEEKLY, text: Constants.WEEKLY),
      createFrequencyStruct(
          value: Constants.MONTHLY, text: Constants.EVERY_MONTH),
      createFrequencyStruct(value: Constants.YEARLY, text: Constants.YEARLY)
    ];
  }
  // Used for generating the frequency dropdown.
  return [
    createFrequencyStruct(value: Constants.DAILY, text: everyDay(context)),
    createFrequencyStruct(value: Constants.WEEKLY, text: everyWeek(context)),
    createFrequencyStruct(value: Constants.MONTHLY, text: everyMonth(context)),
    createFrequencyStruct(value: Constants.YEARLY, text: everyYear(context))
  ];
}

List<IntervalStruct> generateInterval(String? frequency) {
  if (Constants.DAILY == frequency) {
    return generateDailyInterval();
  } else if (Constants.WEEKLY == frequency) {
    return generateWeeklyInterval();
  } else if (Constants.MONTHLY == frequency) {
    return generateMonthlyInterval();
  } else if (Constants.YEARLY == frequency) {
    return generateYearlyInterval();
  }
  return [];
}

List<IntervalStruct> generateDailyInterval() {
  return List.generate(100, (index) {
    var value = index + 1;
    var dayLang = FFLocalizations(getLocale()).getText('gwyr9cx1');
    var daysLang = FFLocalizations(getLocale()).getText('2cpvzq7y');

    var textValue = (index == 0) ? "$value $dayLang" : "$value $daysLang";
    var interval = createIntervalStruct(text: textValue, value: value);
    return interval;
  });
}

List<IntervalStruct> generateWeeklyInterval() {
  return List.generate(100, (index) {
    var value = index + 1;
    var weekLang = FFLocalizations(getLocale()).getText('lsowp12l');
    var weeksLang = FFLocalizations(getLocale()).getText('3e5xfez2');

    var textValue = (index == 0) ? "$value $weekLang" : "$value $weeksLang";
    var interval = createIntervalStruct(text: textValue, value: value);
    return interval;
  });
}

List<IntervalStruct> generateMonthlyInterval() {
  return List.generate(100, (index) {
    var value = index + 1;
    var monthLang = FFLocalizations(getLocale()).getText('hptgspwe');
    var monthsLang = FFLocalizations(getLocale()).getText('ax9vtym8');

    var textValue = (index == 0) ? "$value $monthLang" : "$value $monthsLang";
    var interval = createIntervalStruct(text: textValue, value: value);
    return interval;
  });
}

List<IntervalStruct> generateYearlyInterval() {
  return List.generate(100, (index) {
    var value = index + 1;
    var yearLang = FFLocalizations(getLocale()).getText('rrpiidap');
    var yearsLang = FFLocalizations(getLocale()).getText('n4wmlxr5');

    var textValue = (index == 0) ? "$value $yearLang" : "$value $yearsLang";
    var interval = createIntervalStruct(text: textValue, value: value);
    return interval;
  });
}

Frequency mapFrequencyToRRuleFrequency(String? frequency) {
  // Code is written in flutter.
  if (frequency == Constants.DAILY) {
    return Frequency.daily;
  } else if (frequency == Constants.WEEKLY) {
    return Frequency.weekly;
  } else if (frequency == Constants.MONTHLY) {
    return Frequency.monthly;
  } else if (frequency == Constants.YEARLY) {
    return Frequency.yearly;
  }
  // Default is daily.
  return Frequency.daily;
}

Future<String> getRRuleAsText(BuildContext context) async {
  // Code is written in flutter.
  // First, load the localizations (currently, only English and Swedish is supported):
  // Rrule10n package take care of initializing only once.
  final l10n = await getRRuleCodec(context);

  // Get rrule from local state.
  var rrule = FFAppState().vCurrentRRule;

  // Return translation in human readable text.
  var translation = RecurrenceRule.fromString(rrule).toText(l10n: l10n);
  return translation;
}

/*L*/ Future<String> getActivityRepetitionCustomAsText(
    BuildContext context) async {
  /*L*/
  // Code is written in flutter.
  var rruleTranslation = await getRRuleAsText(context);

  //The activity will repeat
  return FFLocalizations.of(context).getText('oyc9uml8') +
      rruleTranslation.toLowerCase();
}

List<WeekDayStruct> getWeekDayList([BuildContext? context]) {
  // Code written in flutter.
  if (context == null) {
    return [
      createWeekDayStruct(text: Constants.MONDAY, value: Constants.MONDAY, isChecked: false),
      createWeekDayStruct(text: Constants.TUESDAY, value: Constants.TUESDAY, isChecked: false),
      createWeekDayStruct(text: Constants.WEDNESDAY, value: Constants.WEDNESDAY, isChecked: false),
      createWeekDayStruct(text: Constants.THURSDAY, value: Constants.THURSDAY, isChecked: false),
      createWeekDayStruct(text: Constants.FRIDAY, value: Constants.FRIDAY, isChecked: false),
      createWeekDayStruct(text: Constants.SATURDAY, value: Constants.SATURDAY, isChecked: false),
      createWeekDayStruct(text: Constants.SUNDAY, value: Constants.SUNDAY, isChecked: false),
    ];
  }
  return [
    createWeekDayStruct(text: monday(context), value: Constants.MONDAY, isChecked: false),
      createWeekDayStruct(text: tuesday(context), value: Constants.TUESDAY, isChecked: false),
      createWeekDayStruct(text: wednesday(context), value: Constants.WEDNESDAY, isChecked: false),
      createWeekDayStruct(text: thursday(context), value: Constants.THURSDAY, isChecked: false),
      createWeekDayStruct(text: friday(context), value: Constants.FRIDAY, isChecked: false),
      createWeekDayStruct(text: saturday(context), value: Constants.SATURDAY, isChecked: false),
      createWeekDayStruct(text: sunday(context), value: Constants.SUNDAY, isChecked: false),
  ];
}

List<MonthDayStruct> getMonthDayList() {
  // Code written in flutter.
  // Build dummy elements on the end to handle easier UI adjustments.
  return List.generate(35, (index) {
    var value = index + 1;
    var interval;
    if (value <= 31) {
      interval = createMonthDayStruct(
          text: value.toString(), isChecked: false, index: index);
    } else {
      interval = createMonthDayStruct(text: "", isChecked: false, index: index);
    }
    return interval;
  });
}

String mapWeekDayToByDay(String? weekDayLangValue) {
  // Code written in flutter.

  if (weekDayLangValue == Constants.MONDAY) {
    return Constants.MO;
  } else if (weekDayLangValue == Constants.TUESDAY) {
    return Constants.TU;
  } else if (weekDayLangValue == Constants.WEDNESDAY) {
    return Constants.WE;
  } else if (weekDayLangValue == Constants.THURSDAY) {
    return Constants.TH;
  } else if (weekDayLangValue == Constants.FRIDAY) {
    return Constants.FR;
  } else if (weekDayLangValue == Constants.SATURDAY) {
    return Constants.SA;
  } else if (weekDayLangValue == Constants.SUNDAY) {
    return Constants.SU;
  }
  return "";
}

List<BySetPositionStruct> getBySetPositionList([BuildContext? context]) {
  // Code written in flutter.
  if (context == null)
    return [
      createBySetPositionStruct(text: Constants.First, value: 1),
      createBySetPositionStruct(text: Constants.Second, value: 2),
      createBySetPositionStruct(text: Constants.Third, value: 3),
      createBySetPositionStruct(text: Constants.Fourth, value: 4),
      createBySetPositionStruct(text: Constants.Fifth, value: 5),
      createBySetPositionStruct(text: Constants.Last, value: -1),
    ];
  return [
    createBySetPositionStruct(text: first(context), value: 1),
    createBySetPositionStruct(text: second(context), value: 2),
    createBySetPositionStruct(text: third(context), value: 3),
    createBySetPositionStruct(text: fourth(context), value: 4),
    createBySetPositionStruct(text: fifth(context), value: 5),
    createBySetPositionStruct(text: last(context), value: -1),
  ];
}

List<ByDayStruct> getByDayList([BuildContext? context]) {
  var sundayLang;
  var mondayLang;
  var tuesdayLang;
  var wednesdayLang;
  var thursdayLang;
  var fridayLang;
  var saturdayLang;
  var weekendDayLang;
  var weekDayLang;
  var dayLang;

  if (context == null) {
    sundayLang = Constants.SUNDAY;
    mondayLang = Constants.MONDAY;
    tuesdayLang = Constants.TUESDAY;
    wednesdayLang = Constants.WEDNESDAY;
    thursdayLang = Constants.THURSDAY;
    fridayLang = Constants.FRIDAY;
    saturdayLang = Constants.SATURDAY;
    weekendDayLang = Constants.WeekendDay;
    weekDayLang = Constants.WeekDay;
    dayLang = Constants.Day;
  } else {
    sundayLang = sunday(context);
    mondayLang = monday(context);
    tuesdayLang = tuesday(context);
    wednesdayLang = wednesday(context);
    thursdayLang = thursday(context);
    fridayLang = friday(context);
    saturdayLang = saturday(context);
    weekendDayLang = weekendDay(context);
    weekDayLang = weekday(context);
    dayLang = day(context);
  }

  // Code written in flutter.
  ByDayStruct? sundayStruct = createByDayStruct(text: sundayLang)
      .rebuild(value: List.of([Constants.SU]));
  ByDayStruct? mondayStruct = createByDayStruct(text: mondayLang)
      .rebuild(value: List.of([Constants.MO]));
  ByDayStruct? tuesdayStruct = createByDayStruct(text: tuesdayLang)
      .rebuild(value: List.of([Constants.TU]));
  ByDayStruct? wednesdayStruct = createByDayStruct(text: wednesdayLang)
      .rebuild(value: List.of([Constants.WE]));
  ByDayStruct? thursdayStruct = createByDayStruct(text: thursdayLang)
      .rebuild(value: List.of([Constants.TH]));
  ByDayStruct? fridayStruct = createByDayStruct(text: fridayLang)
      .rebuild(value: List.of([Constants.FR]));
  ByDayStruct? saturdayStruct = createByDayStruct(text: saturdayLang)
      .rebuild(value: List.of([Constants.SA]));
  ByDayStruct? weekendDayStruct = createByDayStruct(text: weekendDayLang)
      .rebuild(value: List.of([Constants.SA, Constants.SU]));
  ByDayStruct? weekDayStruct = createByDayStruct(text: weekDayLang).rebuild(
    value: List.of([
            Constants.MO,
            Constants.TU,
            Constants.WE,
            Constants.TH,
            Constants.FR
          ]));
  ByDayStruct? dayStruct =
      createByDayStruct(text: dayLang).rebuild(value: List.of([
            Constants.MO,
            Constants.TU,
            Constants.WE,
            Constants.TH,
            Constants.FR,
            Constants.SA,
            Constants.SU
          ]));

  ByDayStruct emptyElement = createByDayStruct();

  return [
    sundayStruct ?? emptyElement,
    mondayStruct ?? emptyElement,
    tuesdayStruct ?? emptyElement,
    wednesdayStruct ?? emptyElement,
    thursdayStruct ?? emptyElement,
    fridayStruct ?? emptyElement,
    saturdayStruct ?? emptyElement,
    weekendDayStruct ?? emptyElement,
    weekDayStruct ?? emptyElement,
    dayStruct ?? emptyElement,
  ];
}

List<RepetitionStruct> getPredefinedRepetitionList([BuildContext? context]) {
  // Code written in flutter.
  var never;
  var everyDay;
  var everyWeek;
  var everySecondWeek;
  var everyMonth;
  var everyYear;
  if (context == null) {
    never = Constants.NEVER;
    everyDay = Constants.EVERY_DAY;
    everyWeek = Constants.EVERY_WEEK;
    everySecondWeek = Constants.EVERY_SECOND_WEEK;
    everyMonth = Constants.EVERY_MONTH;
    everyYear = Constants.EVERY_YEAR;
  } else {
    print ("context is not null ${FFLocalizations.of(context).languageCode}");

    never = FFLocalizations.of(context).getText('qh1jdrfs');
    everyDay = FFLocalizations.of(context).getText('j2qbaf0p');
    everyWeek = FFLocalizations.of(context).getText('6f13hwqg');
    everySecondWeek = FFLocalizations.of(context).getText('n5k10s1l');
    everyMonth = FFLocalizations.of(context).getText('ss0z0b17');
    everyYear = FFLocalizations.of(context).getText('4u8zezxi');
    print (never + everyDay + everyWeek + everySecondWeek + everyMonth + everyYear);
  }

  return [
    // createRepetitionStruct(text: never, isSelected: false, rrule: ""),
    createRepetitionStruct(
        text: everyDay,
        isSelected: false,
        rrule: repetitionEveryDay(),
        iconCodePoint: FFIcons.krepeatEveryDay.codePoint),
    createRepetitionStruct(
        text: everyWeek,
        isSelected: false,
        rrule: repetitionEveryWeek(),
        iconCodePoint: FFIcons.krepeatEveryWeek.codePoint),
    createRepetitionStruct(
        text: everySecondWeek,
        isSelected: false,
        rrule: repetitionEverySecondWeek(),
        iconCodePoint: FFIcons.krepeatEverySecondWeek.codePoint),
    createRepetitionStruct(
        text: everyMonth,
        isSelected: false,
        rrule: repetitionEveryMonth(),
        iconCodePoint: FFIcons.krepeatEveryMonth.codePoint),
    createRepetitionStruct(
        text: everyYear,
        isSelected: false,
        rrule: repetitionEveryYear(),
        iconCodePoint: FFIcons.krepeatEveryYear.codePoint),
  ];
}

String recurrenceNever() {
  return 'RRULE:NEVER';
}

String repetitionEveryDay() {
  return 'RRULE:FREQ=DAILY;INTERVAL=1';
}

String repetitionEveryWeek() {
  return 'RRULE:FREQ=WEEKLY;INTERVAL=1';
}

String repetitionEverySecondWeek() {
  return 'RRULE:FREQ=WEEKLY;INTERVAL=2';
}

String repetitionEveryMonth() {
  return 'RRULE:FREQ=MONTHLY;INTERVAL=1';
}

String repetitionEveryYear() {
  return 'RRULE:FREQ=YEARLY;INTERVAL=1';
}

List<MonthStruct> getMonthsList([BuildContext? context]) {
  // Code written in flutter.

  return [
    createMonthStruct(
        text: (context == null)
            ? Constants.JANUARY
            : month(context, Constants.JANUARY),
        shortText: (context == null)
            ? Constants.JANUARY_SHORT
            : monthShort(context, Constants.JANUARY),
        isChecked: false),
    createMonthStruct(
        text: (context == null)
            ? Constants.FEBRUARY
            : month(context, Constants.FEBRUARY),
        shortText: (context == null)
            ? Constants.FEBRUARY_SHORT
            : monthShort(context, Constants.FEBRUARY),
        isChecked: false),
    createMonthStruct(
        text: (context == null)
            ? Constants.MARCH
            : month(context, Constants.MARCH),
        shortText: (context == null)
            ? Constants.MARCH_SHORT
            : monthShort(context, Constants.MARCH),
        isChecked: false),
    createMonthStruct(
        text: (context == null)
            ? Constants.APRIL
            : month(context, Constants.APRIL),
        shortText: (context == null)
            ? Constants.APRIL_SHORT
            : monthShort(context, Constants.APRIL),
        isChecked: false),
    createMonthStruct(
        text: (context == null) ? Constants.MAY : month(context, Constants.MAY),
        shortText: (context == null)
            ? Constants.MAY_SHORT
            : monthShort(context, Constants.MAY),
        isChecked: false),
    createMonthStruct(
        text:
            (context == null) ? Constants.JUNE : month(context, Constants.JUNE),
        shortText: (context == null)
            ? Constants.JUNE_SHORT
            : monthShort(context, Constants.JUNE),
        isChecked: false),
    createMonthStruct(
        text:
            (context == null) ? Constants.JULY : month(context, Constants.JULY),
        shortText: (context == null)
            ? Constants.JULY_SHORT
            : monthShort(context, Constants.JULY),
        isChecked: false),
    createMonthStruct(
        text: (context == null)
            ? Constants.AUGUST
            : month(context, Constants.AUGUST),
        shortText: (context == null)
            ? Constants.AUGUST_SHORT
            : monthShort(context, Constants.AUGUST),
        isChecked: false),
    createMonthStruct(
        text: (context == null)
            ? Constants.SEPTEMBER
            : month(context, Constants.SEPTEMBER),
        shortText: Constants.SEPTEMBER_SHORT,
        isChecked: false),
    createMonthStruct(
        text: (context == null)
            ? Constants.OCTOBER
            : month(context, Constants.OCTOBER),
        shortText: (context == null)
            ? Constants.OCTOBER_SHORT
            : monthShort(context, Constants.OCTOBER),
        isChecked: false),
    createMonthStruct(
        text: (context == null)
            ? Constants.NOVEMBER
            : month(context, Constants.NOVEMBER),
        shortText: (context == null)
            ? Constants.NOVEMBER_SHORT
            : monthShort(context, Constants.NOVEMBER),
        isChecked: false),
    createMonthStruct(
        text: (context == null)
            ? Constants.DECEMBER
            : month(context, Constants.DECEMBER),
        shortText: (context == null)
            ? Constants.DECEMBER_SHORT
            : monthShort(context, Constants.DECEMBER),
        isChecked: false),
  ];
}

String? mapByDayToWeekDay(String? byDay) {
  // Code written in flutter.
  if (byDay == Constants.MO) {
    return Constants.MONDAY;
  } else if (byDay == Constants.TU) {
    return Constants.TUESDAY;
  } else if (byDay == Constants.WE) {
    return Constants.WEDNESDAY;
  } else if (byDay == Constants.TH) {
    return Constants.THURSDAY;
  } else if (byDay == Constants.FR) {
    return Constants.FRIDAY;
  } else if (byDay == Constants.SA) {
    return Constants.SATURDAY;
  } else if (byDay == Constants.SU) {
    return Constants.SUNDAY;
  }
  return "";
}

/*L*/ Future<String> /*L*/ getActivityRepetitionAnyAsText(
    /*L*/ BuildContext context /*L*/, String? rrule) async {
  // Add localy in flutter code.
  rrule = removePossibleLastSemicolon(rrule);

  if ((rrule?.isEmpty == true) || rrule == repetitionNever()) {
    // No repetition.
    return "";
  } else {
    if (rrule == repetitionEveryDay()) {
      return FFLocalizations.of(context).getText(
        'daxykqq2' /* The activity will repeat every day. */,
      );
    }
    if (rrule == repetitionEveryWeek()) {
      return FFLocalizations.of(context).getText(
        'mfg5rhah' /* The activity will repeat every week. */,
      );
    }
    if (rrule == repetitionEverySecondWeek()) {
      return FFLocalizations.of(context).getText(
        'vbn8qvxy' /* The activity will repeat every second week. */,
      );
    }
    if (rrule == repetitionEveryMonth()) {
      return FFLocalizations.of(context).getText(
        'zpky99wo' /* The activity will repeat every month. */,
      );
    }
    if (rrule == repetitionEveryYear()) {
      return FFLocalizations.of(context).getText(
        'vy44jrpj' /* The activity will repeat every year. */,
      );
    }

    // Custom repetition selection.
    if (rrule?.startsWith("RRULE:") == true) {
      return await getActivityRepetitionCustomAsText(context);
    }
  }
  // No repetition.
  return "";
}

String repetitionNever() {
  return 'RRULE:NEVER';
}

String? removePossibleLastSemicolon(String? rrule) {
  /// RRULE rules.
  /// RRULE:FREQ=DAILY and RRULE:FREQ=DAILY; have the same effect.
  /// Remove last possible ';' from rrule.
  if (rrule?.endsWith(";") == true) {
    var length = (rrule?.length == 0) ? 1 : rrule?.length ?? 1;
    rrule = rrule?.substring(0, length - 1);
  }
  return rrule;
}

Color combineColors(List<Color> colors) {
  if (colors.isEmpty) {
    return Colors.transparent;
  }
  if (colors.length == 1) {
    return colors.first;
  }

  // General example.
  Color result = colors[0];
  for (var i = 1; i < colors.length; i++) {
    // Parameter order is important.
    result = Color.alphaBlend(colors[i], result);
  }
  return result;
}

Future<RruleL10n> getRRuleCodec(BuildContext context) async {
  // Code written localy.
  var code = MyApp.of(context).getLocale().languageCode;

  //LOCAL_START
  if (code == 'en') {
    return await RruleL10nEn.create();
  }
  if (code == 'sv') {
    return await RruleL10nSv.create();
  }

  //FALLBACK to english.
  return await RruleL10nEn.create();
  //LOCAL_END
}

String? getShortMonthText(String? month) {
  var lowerCase = month?.toLowerCase();
  var threeLetters = ((lowerCase?.substring(0, 3) ?? "")) + ".";
  return threeLetters;
}

//LOCAL_START
Locale getLocale() {
  return MyApp().locale ?? Locale('en', 'US');
}

String monday(BuildContext context) {
  //Monday
  return FFLocalizations.of(context).getText('1g631ksb');
}

String tuesday(BuildContext context) {
  //Tuesday
  return FFLocalizations.of(context).getText('nzdgw5w6');
}

String wednesday(BuildContext context) {
  //Wednesday
  return FFLocalizations.of(context).getText('clmax87t');
}

String thursday(BuildContext context) {
  //Thursday
  return FFLocalizations.of(context).getText('n6lnn8xv');
}

String friday(BuildContext context) {
  //Friday
  return FFLocalizations.of(context).getText('qi8cotop');
}

String saturday(BuildContext context) {
  //Saturday
  return FFLocalizations.of(context).getText('3h99ug2f');
}

String sunday(BuildContext context) {
  //Sunday
  return FFLocalizations.of(context).getText('ax1lx5sz');
}

String everyDay(BuildContext context) {
  //Every day
  return FFLocalizations.of(context).getText('j2qbaf0p');
}

String everyWeek(BuildContext context) {
  //Every week
  return FFLocalizations.of(context).getText('6f13hwqg');
}

String everyMonth(BuildContext context) {
  //Every month
  return FFLocalizations.of(context).getText('ss0z0b17');
}

String everyYear(BuildContext context) {
  //Every year
  return FFLocalizations.of(context).getText('4u8zezxi');
}

String first(BuildContext context) {
  //First
  return FFLocalizations.of(context).getText('kqd4z9pz');
}

String second(BuildContext context) {
  //Second
  return FFLocalizations.of(context).getText('s7uatyuu');
}

String third(BuildContext context) {
  //Third
  return FFLocalizations.of(context).getText('jcfzzqjr');
}

String fourth(BuildContext context) {
  //Fourth
  return FFLocalizations.of(context).getText('1bpw60wp');
}

String fifth(BuildContext context) {
  //Fifth
  return FFLocalizations.of(context).getText('b9stiig0');
}

String last(BuildContext context) {
  //Last
  return FFLocalizations.of(context).getText('2o2mi8pi');
}

String weekendDay(BuildContext context) {
  //Weekend day
  return FFLocalizations.of(context).getText('nnq9e346');
}

String weekday(BuildContext context) {
  //Weekday
  return FFLocalizations.of(context).getText('yl4rh0ou');
}

String day(BuildContext context) {
  //Day
  return FFLocalizations.of(context).getText('ahnsj6ps');
}

String month(BuildContext context, String month) {
  //Month
  if (month == Constants.JANUARY) {
    return FFLocalizations.of(context).getText('d3l22vhu');
  }
  if (month == Constants.FEBRUARY) {
    return FFLocalizations.of(context).getText('9g3z94s7');
  }
  if (month == Constants.MARCH) {
    return FFLocalizations.of(context).getText('lnt22ld1');
  }
  if (month == Constants.APRIL) {
    return FFLocalizations.of(context).getText('034u8g9a');
  }
  if (month == Constants.MAY) {
    return FFLocalizations.of(context).getText('6hls65tt');
  }
  if (month == Constants.JUNE) {
    return FFLocalizations.of(context).getText('pej4ktvz');
  }
  if (month == Constants.JULY) {
    return FFLocalizations.of(context).getText('6betrjev');
  }
  if (month == Constants.AUGUST) {
    return FFLocalizations.of(context).getText('6qvjh0si');
  }
  if (month == Constants.SEPTEMBER) {
    return FFLocalizations.of(context).getText('sgku9oc9');
  }
  if (month == Constants.OCTOBER) {
    return FFLocalizations.of(context).getText('8sca82td');
  }
  if (month == Constants.NOVEMBER) {
    return FFLocalizations.of(context).getText('wqms1orj');
  }
  if (month == Constants.DECEMBER) {
    return FFLocalizations.of(context).getText('d09m6bre');
  }

  return Constants.JANUARY;
}

String monthShort(BuildContext context, String monthEn) {
  //Month
  var monthLang = month(context, monthEn);
  var shortMonth = getShortMonthText(monthLang);
  // print ("SHORT MONTH $monthLang -> $shortMonth");
  return getShortMonthText(monthLang) ?? "";
}
//LOCAL_END
