import 'dart:convert';
import 'dart:math' as math;

import 'package:custom_recurring_selectors/backend/backend.dart';
import 'package:custom_recurring_selectors/custom_code/codecs/sv.dart';
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
      createWeekDayStruct(text: Constants.MONDAY, isChecked: false),
      createWeekDayStruct(text: Constants.TUESDAY, isChecked: false),
      createWeekDayStruct(text: Constants.WEDNESDAY, isChecked: false),
      createWeekDayStruct(text: Constants.THURSDAY, isChecked: false),
      createWeekDayStruct(text: Constants.FRIDAY, isChecked: false),
      createWeekDayStruct(text: Constants.SATURDAY, isChecked: false),
      createWeekDayStruct(text: Constants.SUNDAY, isChecked: false),
    ];
  }
  return [
    createWeekDayStruct(text: monday(context), isChecked: false),
    createWeekDayStruct(text: tuesday(context), isChecked: false),
    createWeekDayStruct(text: wednesday(context), isChecked: false),
    createWeekDayStruct(text: thursday(context), isChecked: false),
    createWeekDayStruct(text: friday(context), isChecked: false),
    createWeekDayStruct(text: saturday(context), isChecked: false),
    createWeekDayStruct(text: sunday(context), isChecked: false),
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

String mapWeekDayToByDay(String? weekDay) {
  // Code written in flutter.
  if (weekDay == Constants.MONDAY) {
    return Constants.MO;
  } else if (weekDay == Constants.TUESDAY) {
    return Constants.TU;
  } else if (weekDay == Constants.WEDNESDAY) {
    return Constants.WE;
  } else if (weekDay == Constants.THURSDAY) {
    return Constants.TH;
  } else if (weekDay == Constants.FRIDAY) {
    return Constants.FR;
  } else if (weekDay == Constants.SATURDAY) {
    return Constants.SA;
  } else if (weekDay == Constants.SUNDAY) {
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
      .rebuild((p0) => p0.value = ListBuilder([Constants.SU]));
  ByDayStruct? mondayStruct = createByDayStruct(text: mondayLang)
      .rebuild((p0) => p0.value = ListBuilder([Constants.MO]));
  ByDayStruct? tuesdayStruct = createByDayStruct(text: tuesdayLang)
      .rebuild((p0) => p0.value = ListBuilder([Constants.TU]));
  ByDayStruct? wednesdayStruct = createByDayStruct(text: wednesdayLang)
      .rebuild((p0) => p0.value = ListBuilder([Constants.WE]));
  ByDayStruct? thursdayStruct = createByDayStruct(text: thursdayLang)
      .rebuild((p0) => p0.value = ListBuilder([Constants.TH]));
  ByDayStruct? fridayStruct = createByDayStruct(text: fridayLang)
      .rebuild((p0) => p0.value = ListBuilder([Constants.FR]));
  ByDayStruct? saturdayStruct = createByDayStruct(text: saturdayLang)
      .rebuild((p0) => p0.value = ListBuilder([Constants.SA]));
  ByDayStruct? weekendDayStruct = createByDayStruct(text: weekendDayLang)
      .rebuild((p0) => p0.value = ListBuilder([Constants.SA, Constants.SU]));
  ByDayStruct? weekDayStruct = createByDayStruct(text: weekDayLang).rebuild(
      (p0) => p0.value = ListBuilder([
            Constants.MO,
            Constants.TU,
            Constants.WE,
            Constants.TH,
            Constants.FR
          ]));
  ByDayStruct? dayStruct = createByDayStruct(text: dayLang)
      .rebuild((p0) => p0.value = ListBuilder([
            Constants.MO,
            Constants.TU,
            Constants.WE,
            Constants.TH,
            Constants.FR,
            Constants.SA,
            Constants.SU
          ]));

  return [
    sundayStruct,
    mondayStruct,
    tuesdayStruct,
    wednesdayStruct,
    thursdayStruct,
    fridayStruct,
    saturdayStruct,
    weekendDayStruct,
    weekDayStruct,
    dayStruct,
  ];
}

List<RepetitionStruct> getPredefinedRepetitionList(BuildContext context) {
  // Code written in flutter.
  var never = FFLocalizations.of(context).getText('qh1jdrfs');
  var everyDay = FFLocalizations.of(context).getText('j2qbaf0p');
  var everyWeek = FFLocalizations.of(context).getText('6f13hwqg');
  var everySecondWeek = FFLocalizations.of(context).getText('n5k10s1l');
  var everyMonth = FFLocalizations.of(context).getText('ss0z0b17');
  var everyYear = FFLocalizations.of(context).getText('4u8zezxi');

  return [
    createRepetitionStruct(text: never, isSelected: false, rrule: ""),
    createRepetitionStruct(
        text: everyDay, isSelected: false, rrule: repetitionEveryDay()),
    createRepetitionStruct(
        text: everyWeek, isSelected: false, rrule: repetitionEveryWeek()),
    createRepetitionStruct(
        text: everySecondWeek,
        isSelected: false,
        rrule: repetitionEverySecondWeek()),
    createRepetitionStruct(
        text: everyMonth, isSelected: false, rrule: repetitionEveryMonth()),
    createRepetitionStruct(
        text: everyYear, isSelected: false, rrule: repetitionEveryYear()),
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

List<MonthStruct> getMonthsList() {
  // Code written in flutter.
  return [
    createMonthStruct(
        text: Constants.JANUARY,
        shortText: Constants.JANUARY_SHORT,
        isChecked: false),
    createMonthStruct(
        text: Constants.FEBRUARY,
        shortText: Constants.FEBRUARY_SHORT,
        isChecked: false),
    createMonthStruct(
        text: Constants.MARCH,
        shortText: Constants.MARCH_SHORT,
        isChecked: false),
    createMonthStruct(
        text: Constants.APRIL,
        shortText: Constants.APRIL_SHORT,
        isChecked: false),
    createMonthStruct(
        text: Constants.MAY, shortText: Constants.MAY_SHORT, isChecked: false),
    createMonthStruct(
        text: Constants.JUNE,
        shortText: Constants.JUNE_SHORT,
        isChecked: false),
    createMonthStruct(
        text: Constants.JULY,
        shortText: Constants.JULY_SHORT,
        isChecked: false),
    createMonthStruct(
        text: Constants.AUGUST,
        shortText: Constants.AUGUST_SHORT,
        isChecked: false),
    createMonthStruct(
        text: Constants.SEPTEMBER,
        shortText: Constants.SEPTEMBER_SHORT,
        isChecked: false),
    createMonthStruct(
        text: Constants.OCTOBER,
        shortText: Constants.OCTOBER_SHORT,
        isChecked: false),
    createMonthStruct(
        text: Constants.NOVEMBER,
        shortText: Constants.NOVEMBER_SHORT,
        isChecked: false),
    createMonthStruct(
        text: Constants.DECEMBER,
        shortText: Constants.DECEMBER_SHORT,
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
    rrule = rrule?.substring(0, (rrule?.length ?? 1) - 1);
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
  print ("LOCALE: $code");

  //LOCAL_START
  if (code == 'en') {
    print ("RRULE: ENGLISH");
    return await RruleL10nEn.create();
  }
  if (code == 'sv') {
    print ("RRULE: SWEDISH");
    return await RruleL10nSv.create();
  }

  //FALLBACK to english.
  print ("RRULE: FALLBACK TO ENGLISH");
  return await RruleL10nEn.create();
  //LOCAL_END
}

String? getShortMonthText(String? month) {
  var lowerCase = month?.toLowerCase();
  var threeLetters = ((lowerCase?.substring(0, 4) ?? "")) + ".";
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
//LOCAL_END
