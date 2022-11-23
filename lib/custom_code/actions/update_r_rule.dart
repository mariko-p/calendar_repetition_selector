// Automatic FlutterFlow imports
import 'package:rrule/rrule.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code

//LOCAL_START
Future updateRRule(String? frequency, int? interval,
    {List<int>? byMonthDay, List<int>? bySetPos, List<String>? byDay, List<int>? byMonth}) async {
  // Code written in local flutter.
  final json = <String, dynamic>{
    'freq': frequency,
    'interval': interval,
    'bymonth': byMonth,
    'byday': byDay,
    'bymonthday': byMonthDay,
    'bysetpos': bySetPos
  };

  final rrule = RecurrenceRule.fromJson(json);
  FFAppState().vCurrentRRule = rrule.toString();
}
//LOCAL_END
