import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../backend/schema/structs/interval_struct.dart';
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<String> generateFrequency() {
  return [
    "Every day",
    "Every week",
    "Every month",
    "Every yeary"
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
    var textValue = (index == 0) ? "$value year" : "$value years";
    var interval = createIntervalStruct(text: textValue, value: value);
    return interval;
  });
}

List<IntervalStruct> generateYearlyInterval() {
  return [];
}
