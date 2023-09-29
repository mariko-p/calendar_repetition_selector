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

Future updateRRuleWithUntil(
  String rruleString,
  DateTime? until,
) async {
  // Add your function code here!

  // LOCAL_START
  try {
    var rrule = RecurrenceRule.fromString(rruleString);
    rrule =
        rrule.copyWith(until: until?.copyWith(isUtc: true), clearCount: true);
    FFAppState().vCurrentRRule = rrule.toString();
  } catch (_) {}
  // LOCAL_END
}
