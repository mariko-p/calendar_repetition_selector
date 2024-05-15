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
) async {
  // Add your function code here!
  // LOCAL_START
  try  {
    var rrule = RecurrenceRule.fromString(rruleString);

    if (!FFAppState().vSkipWeekends) {
      FFAppState().vCurrentRRule = rrule.toString();
      return;
    }

    if (rrule.hasByWeekDays) {
      final filteredWeekDays = rrule.byWeekDays
          .where((e) =>
      e != ByWeekDayEntry(DateTime.saturday) &&
          e != ByWeekDayEntry(DateTime.sunday))
          .toList();

      rrule = rrule.copyWith(
        byWeekDays: filteredWeekDays,
      );
    } else {
      rrule = rrule.copyWith(
        byWeekDays: [
          ByWeekDayEntry(DateTime.monday),
          ByWeekDayEntry(DateTime.tuesday),
          ByWeekDayEntry(DateTime.wednesday),
          ByWeekDayEntry(DateTime.thursday),
          ByWeekDayEntry(DateTime.friday),
        ],
      );
    }

    FFAppState().vCurrentRRule = rrule.toString();
  } catch(_) {}
  // LOCAL_END
}
