import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

List<FrequencyStruct> generateFrequency() {
  // Add your function code here!
  return [];
}

List<IntervalStruct> generateInterval(String? frequency) {
  return [];
}

List<IntervalStruct> generateDailyInterval() {
  return [];
}

List<IntervalStruct> generateWeeklyInterval() {
  return [];
}

List<IntervalStruct> generateMonthlyInterval() {
  return [];
}

List<IntervalStruct> generateYearlyInterval() {
  return [];
}

String mapFrequencyToRRuleFrequency(String? frequency) {
  // Code is written in flutter.
  return "";
}

String getRRuleAsText() {
  // Code is written in flutter.
  return "";
}

String getActivityRepetitionCustomAsText() {
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

String mapWeekDayToByDay(String? weekDay) {
  // Code written in flutter.
  return "";
}

List<BySetPositionStruct> getBySetPositionList() {
  // Code written in flutter.
  return [];
}

List<ByDayStruct> getByDayList() {
  // Code written in flutter.
  return [];
}

List<RepetitionStruct> getPredefinedRepetitionList() {
  // Code written in flutter.
  return [];
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
  return [];
}

String? mapByDayToWeekDay(String? byDay) {
  // Code written in local flutter.
  return "";
}

String? getActivityRepetitionAnyAsText(String? rrule) {
  // Add localy in flutter code.

  // rrule = removePossibleLastSemicolon(rrule);
  //
  // if ((rrule?.isEmpty == true) || rrule == repetitionNever()) {
  //  // No repetition.
  //  return "";
  // } else {
  //  if (rrule == repetitionEveryDay()) {
  //    return FFLocalizations.of(context).getText(
  //      'daxykqq2' /* The activity will repeat every day. */,
  //    );
  //  }
  //  if (rrule == repetitionEveryWeek()) {
  //    return FFLocalizations.of(context).getText(
  //      'mfg5rhah' /* The activity will repeat every week. */,
  //    );
  //  }
  //  if (rrule == repetitionEverySecondWeek()) {
  //    return FFLocalizations.of(context).getText(
  //      'vbn8qvxy' /* The activity will repeat every second week. */,
  //    );
  //  }
  //  if (rrule == repetitionEveryMonth()) {
  //    return FFLocalizations.of(context).getText(
  //      'zpky99wo' /* The activity will repeat every month. */,
  //    );
  //  }
  //  if (rrule == repetitionEveryYear()) {
  //    return FFLocalizations.of(context).getText(
  //      'vy44jrpj' /* The activity will repeat every year. */,
  //    );
  //  }

  // Custom repetition selection.
  //  if (rrule?.startsWith("RRULE:") == true) {
  //    return getActivityRepetitionCustomAsText();
  //  }
  //}

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
    rrule = rrule?.substring(0, rrule?.length ?? 1) - 1;
  }
  return rrule;
}
