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

String getActivityRepetitionAsText() {
  // Code is written in flutter.
  return "";
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
