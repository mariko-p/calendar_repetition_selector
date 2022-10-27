import 'dart:math' as math;

import 'package:custom_recurring_selectors/backend/backend.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rrule/rrule.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../app_state.dart';
import '../backend/schema/structs/interval_struct.dart';
import 'lat_lng.dart';
import 'place.dart';

List<FrequencyStruct> generateFrequency() {
  return [
    createFrequencyStruct(value: "DAILY", text: "Every day"),
    createFrequencyStruct(value: "WEEKLY", text: "Every week"),
    createFrequencyStruct(value: "MONTHLY", text: "Every month"),
    createFrequencyStruct(value: "YEARLY", text: "Every year")
  ];
}

List<IntervalStruct> generateInterval(String? frequency) {
  if ("DAILY" == frequency) {
    return generateDailyInterval();
  } else if ("WEEKLY" == frequency) {
    return generateWeeklyInterval();
  } else if ("MONTHLY" == frequency) {
    return generateMonthlyInterval();
  } else if ("YEARLY" == frequency) {
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
  if (frequency == "DAILY") {
    return Frequency.daily;
  } else if (frequency == "WEEKLY") {
    return Frequency.weekly;
  } else if (frequency == "MONTHLY") {
    return Frequency.monthly;
  } else if (frequency == "YEARLY") {
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
  return [];
}

List<MonthDayStruct> getMonthDayList() {
  // Code written in flutter.
  return [];
}
