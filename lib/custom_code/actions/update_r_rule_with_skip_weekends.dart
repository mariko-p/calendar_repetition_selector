// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// LOCAL_START
import 'package:rrule/rrule.dart';
// LOCAL_END

Future updateRRuleWithSkipWeekends(
  String rruleString,
  bool skipWeekends,
) async {
  // Add your function code here!
  // LOCAL_START
  var rrule = RecurrenceRule.fromString(rruleString);
  if (skipWeekends) {
    rrule = rrule.copyWith(
      byWeekDays: {
        ByWeekDayEntry(DateTime.monday),
        ByWeekDayEntry(DateTime.tuesday),
        ByWeekDayEntry(DateTime.wednesday),
        ByWeekDayEntry(DateTime.thursday),
        ByWeekDayEntry(DateTime.friday),
      },
    );
  } else {
    rrule = rrule.copyWith(
      byWeekDays: {},
    );
  }

  FFAppState().vCurrentRRule = rrule.toString();
  // LOCAL_END
}
