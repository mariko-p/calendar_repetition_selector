import 'dart:math' as math;

import 'package:custom_recurring_selectors/backend/backend.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rrule/rrule.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../app_state.dart';
import '../custom_code/constants/calendar_constants.dart';
import 'lat_lng.dart';
import 'place.dart';

List<FrequencyStruct> generateFrequency() {
  return [
    createFrequencyStruct(value: Constants.DAILY, text: Constants.EVERY_DAY),
    createFrequencyStruct(value: Constants.WEEKLY, text: Constants.EVERY_WEEK),
    createFrequencyStruct(value: Constants.MONTHLY, text: Constants.EVERY_MONTH),
    createFrequencyStruct(value: Constants.YEARLY, text: Constants.EVERY_YEAR)
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
    var textValue = (index == 0) ? "$value day" : "$value days";
    var interval = createIntervalStruct(text: textValue, value: value);
    return interval;
  });
}

List<IntervalStruct> generateWeeklyInterval() {
  return List.generate(100, (index) {
    var value = index + 1;
    var textValue = (index == 0) ? "$value week" : "$value weeks";
    var interval = createIntervalStruct(text: textValue, value: value);
    return interval;
});
}

List<IntervalStruct> generateMonthlyInterval() {
  return List.generate(100, (index) {
    var value = index + 1;
    var textValue = (index == 0) ? "$value month" : "$value months";
    var interval = createIntervalStruct(text: textValue, value: value);
    return interval;
  });
}

List<IntervalStruct> generateYearlyInterval() {
  return List.generate(100, (index) {
    var value = index + 1;
    var textValue = (index == 0) ? "$value year" : "$value years";
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

Future<String> getRRuleAsText() async {

  // Code is written in flutter.
  // First, load the localizations (currently, only English is supported):
  // Rrule10nEn package take care of initializing only once.
  final l10n = await RruleL10nEn.create();
  
  // Get rrule from local state.
  var rrule =  FFAppState().vCurrentRRule;

  // Return translation in human readable text.
  var translation = RecurrenceRule.fromString(rrule).toText(l10n: l10n);
  return translation;
}

Future<String> getActivityRepetitionAsText() async {
  // Code is written in flutter.
  var rruleTranslation = await getRRuleAsText();
  return "The activity will repeat " + rruleTranslation.toLowerCase();
}

List<WeekDayStruct> getWeekDayList() {
  // Code written in flutter.
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

List<MonthDayStruct> getMonthDayList() {
  // Code written in flutter.
  // Build dummy elements on the end to handle easier UI adjustments.
  return List.generate(35, (index) {
    var value = index + 1;
    var interval;
    if (value <= 31) {
      interval = createMonthDayStruct(text: value.toString(), isChecked: false, index: index);
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

List<BySetPositionStruct> getBySetPositionList() {
  // Code written in flutter.
  return [
    createBySetPositionStruct(text: Constants.First, value: 1),
    createBySetPositionStruct(text: Constants.Second, value: 2),
    createBySetPositionStruct(text: Constants.Third, value: 3),
    createBySetPositionStruct(text: Constants.Fourth, value: 4),
    createBySetPositionStruct(text: Constants.Fifth, value: 5),
    createBySetPositionStruct(text: Constants.Last, value: -1),
  ];
}

List<ByDayStruct> getByDayList() {
  // Code written in flutter.
  ByDayStruct? sunday = createByDayStruct(text: Constants.SUNDAY).rebuild((p0) => p0.value = ListBuilder([Constants.SU]));
  ByDayStruct? monday = createByDayStruct(text: Constants.MONDAY).rebuild((p0) => p0.value = ListBuilder([Constants.MO]));
  ByDayStruct? tuesday = createByDayStruct(text: Constants.TUESDAY).rebuild((p0) => p0.value = ListBuilder([Constants.TU]));
  ByDayStruct? wednesday = createByDayStruct(text: Constants.WEDNESDAY).rebuild((p0) => p0.value = ListBuilder([Constants.WE]));
  ByDayStruct? thursday = createByDayStruct(text: Constants.THURSDAY).rebuild((p0) => p0.value = ListBuilder([Constants.TH]));
  ByDayStruct? friday = createByDayStruct(text: Constants.FRIDAY).rebuild((p0) => p0.value = ListBuilder([Constants.FR]));
  ByDayStruct? saturday = createByDayStruct(text: Constants.SATURDAY).rebuild((p0) => p0.value = ListBuilder([Constants.SA]));
  ByDayStruct? weekendDay = createByDayStruct(text: Constants.WeekendDay).rebuild((p0) => p0.value = ListBuilder([Constants.SA, Constants.SU]));
  ByDayStruct? weekDay = createByDayStruct(text: Constants.WeekDay).rebuild((p0) => p0.value = ListBuilder([Constants.MO, Constants.TU, Constants.WE, Constants.TH, Constants.FR]));
  ByDayStruct? day = createByDayStruct(text: Constants.Day).rebuild((p0) => p0.value = ListBuilder([Constants.MO, Constants.TU, Constants.WE, Constants.TH, Constants.FR, Constants.SA, Constants.SU]));

  return [
    sunday,
    monday,
    tuesday,
    wednesday,
    thursday,
    friday,
    saturday,
    weekendDay,
    weekDay,
    day
  ];
}

List<RepetitionStruct> getPredefinedRepetitionList() {
  // Code written in flutter.
  return [
    createRepetitionStruct(text: Constants.NEVER, isSelected: false, rrule: ""),
    createRepetitionStruct(text: Constants.EVERY_DAY, isSelected: false, rrule: repetitionEveryDay()),
    createRepetitionStruct(text: Constants.EVERY_WEEK, isSelected: false, rrule: repetitionEveryWeek()),
    createRepetitionStruct(text: Constants.EVERY_SECOND_WEEK, isSelected: false, rrule: repetitionEverySecondWeek()),
    createRepetitionStruct(text: Constants.EVERY_MONTH, isSelected: false, rrule: repetitionEveryMonth()),
    createRepetitionStruct(text: Constants.EVERY_YEAR, isSelected: false, rrule: repetitionEveryYear()),
  ];
}

String repetitionEveryDay() {
  return 'RRULE:FREQ=DAILY';
}

String repetitionEveryWeek() {
  return 'RRULE:FREQ=WEEKLY';
}

String repetitionEverySecondWeek() {
  return 'RRULE:FREQ=WEEKLY;INTERVAL=2';
}

String repetitionEveryMonth() {
  return 'RRULE:FREQ=MONTHLY';
}

String repetitionEveryYear() {
  return 'RRULE:FREQ=YEARLY';
}

List<MonthStruct> getMonthsList() {
  // Code written in flutter.
  return [
    createMonthStruct(text: Constants.JANUARY, shortText: Constants.JANUARY_SHORT, isChecked: false),
    createMonthStruct(text: Constants.FEBRUARY, shortText: Constants.FEBRUARY_SHORT, isChecked: false),
    createMonthStruct(text: Constants.MARCH, shortText: Constants.MARCH_SHORT, isChecked: false),
    createMonthStruct(text: Constants.APRIL, shortText: Constants.APRIL_SHORT, isChecked: false),
    createMonthStruct(text: Constants.MAY, shortText: Constants.MAY_SHORT, isChecked: false),
    createMonthStruct(text: Constants.JUNE, shortText: Constants.JUNE_SHORT, isChecked: false),
    createMonthStruct(text: Constants.JULY, shortText: Constants.JULY_SHORT, isChecked: false),
    createMonthStruct(text: Constants.AUGUST, shortText: Constants.AUGUST_SHORT, isChecked: false),
    createMonthStruct(text: Constants.SEPTEMBER, shortText: Constants.SEPTEMBER_SHORT, isChecked: false),
    createMonthStruct(text: Constants.OCTOBER, shortText: Constants.OCTOBER_SHORT, isChecked: false),
    createMonthStruct(text: Constants.NOVEMBER, shortText: Constants.NOVEMBER_SHORT, isChecked: false),
    createMonthStruct(text: Constants.DECEMBER, shortText: Constants.DECEMBER_SHORT, isChecked: false),
  ];
}

String? mapByDayToWeekDay(String? byDay) {
  // Code written in local flutter.
  return "";
}
