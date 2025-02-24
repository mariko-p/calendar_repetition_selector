import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _vCurrentRRule = '';
  String get vCurrentRRule => _vCurrentRRule;
  set vCurrentRRule(String value) {
    _vCurrentRRule = value;
  }

  String _cInitialCustomRRule = 'RRULE:FREQ=DAILY;INTERVAL=1;';
  String get cInitialCustomRRule => _cInitialCustomRRule;
  set cInitialCustomRRule(String value) {
    _cInitialCustomRRule = value;
  }

  String _cInitialCustomRRuleText = 'The activity will repeat every day';
  String get cInitialCustomRRuleText => _cInitialCustomRRuleText;
  set cInitialCustomRRuleText(String value) {
    _cInitialCustomRRuleText = value;
  }

  bool _vTmp = false;
  bool get vTmp => _vTmp;
  set vTmp(bool value) {
    _vTmp = value;
  }

  List<Color> _cMonthDayCheckedColors = [Color(4280908287), Color(3566178191)];
  List<Color> get cMonthDayCheckedColors => _cMonthDayCheckedColors;
  set cMonthDayCheckedColors(List<Color> value) {
    _cMonthDayCheckedColors = value;
  }

  void addToCMonthDayCheckedColors(Color value) {
    cMonthDayCheckedColors.add(value);
  }

  void removeFromCMonthDayCheckedColors(Color value) {
    cMonthDayCheckedColors.remove(value);
  }

  void removeAtIndexFromCMonthDayCheckedColors(int index) {
    cMonthDayCheckedColors.removeAt(index);
  }

  void updateCMonthDayCheckedColorsAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    cMonthDayCheckedColors[index] = updateFn(_cMonthDayCheckedColors[index]);
  }

  void insertAtIndexInCMonthDayCheckedColors(int index, Color value) {
    cMonthDayCheckedColors.insert(index, value);
  }

  bool _vRepeatOnDone = false;
  bool get vRepeatOnDone => _vRepeatOnDone;
  set vRepeatOnDone(bool value) {
    _vRepeatOnDone = value;
  }

  bool _vDoNotShowInOverdue = false;
  bool get vDoNotShowInOverdue => _vDoNotShowInOverdue;
  set vDoNotShowInOverdue(bool value) {
    _vDoNotShowInOverdue = value;
  }

  bool _vSkipWeekends = false;
  bool get vSkipWeekends => _vSkipWeekends;
  set vSkipWeekends(bool value) {
    _vSkipWeekends = value;
  }

  //LOCAL_START
  List<Color> _cDisabledButtonColors = [
    Color(4280908287),
    Color(3549400975),
    Color(2097151999),
  ];
  List<Color> get cDisabledButtonColors => _cDisabledButtonColors;
  set cDisabledButtonColors(List<Color> value) {
    _cDisabledButtonColors = value;
  }
  //LOCAL_END
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
