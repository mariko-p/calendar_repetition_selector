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
  set vCurrentRRule(String _value) {
    _vCurrentRRule = _value;
  }

  String _cInitialCustomRRule = 'RRULE:FREQ=DAILY;INTERVAL=1;';
  String get cInitialCustomRRule => _cInitialCustomRRule;
  set cInitialCustomRRule(String _value) {
    _cInitialCustomRRule = _value;
  }

  String _cInitialCustomRRuleText = 'The activity will repeat every day';
  String get cInitialCustomRRuleText => _cInitialCustomRRuleText;
  set cInitialCustomRRuleText(String _value) {
    _cInitialCustomRRuleText = _value;
  }

  bool _vTmp = false;
  bool get vTmp => _vTmp;
  set vTmp(bool _value) {
    _vTmp = _value;
  }

  List<Color> _cMonthDayCheckedColors = [Color(4280908287), Color(3566178191)];
  List<Color> get cMonthDayCheckedColors => _cMonthDayCheckedColors;
  set cMonthDayCheckedColors(List<Color> _value) {
    _cMonthDayCheckedColors = _value;
  }

  void addToCMonthDayCheckedColors(Color _value) {
    _cMonthDayCheckedColors.add(_value);
  }

  void removeFromCMonthDayCheckedColors(Color _value) {
    _cMonthDayCheckedColors.remove(_value);
  }

  void removeAtIndexFromCMonthDayCheckedColors(int _index) {
    _cMonthDayCheckedColors.removeAt(_index);
  }

  void updateCMonthDayCheckedColorsAtIndex(
    int _index,
    Color Function(Color) updateFn,
  ) {
    _cMonthDayCheckedColors[_index] = updateFn(_cMonthDayCheckedColors[_index]);
  }

  void insertAtIndexInCMonthDayCheckedColors(int _index, Color _value) {
    _cMonthDayCheckedColors.insert(_index, _value);
  }

  bool _vRepeatOnDone = false;
  bool get vRepeatOnDone => _vRepeatOnDone;
  set vRepeatOnDone(bool _value) {
    _vRepeatOnDone = _value;
  }

  bool _vDoNotShowInOverdue = false;
  bool get vDoNotShowInOverdue => _vDoNotShowInOverdue;
  set vDoNotShowInOverdue(bool _value) {
    _vDoNotShowInOverdue = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
