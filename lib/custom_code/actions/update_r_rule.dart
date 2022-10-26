// Automatic FlutterFlow imports
import 'package:rrule/rrule.dart';

import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
Future updateRRule(
  String? frequency,
  int? interval,
) async {
  final rrule = RecurrenceRule(
    frequency: mapFrequencyToRRuleFrequency(frequency),
    interval: interval,
  );
  FFAppState().vCurrentRRule = rrule.toString();
}

