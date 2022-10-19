import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

List<String> generateFrequency() {
  return [
    "Every day",
    "Every week",
    "Every month",
    "Every yeary"
  ];
}

List<String> generateInterval(String? frequency) {
  if ("DAILY" == frequency) {
    
  } else if ("WEEKLY" == frequency) {

  } else if ("MONTHLY" == frequency) {
    
  } else if ("YEARLY" == frequency) {

  }
  return [];
}

List<String> generateDailyInterval() {
  return List.generate(100, (index) => {
    index.toString()
    });
}

List<String> generateMonthlyInterval() {
  return [];
}

List<String> generateWeeklyInterval() {
  return [];
}
