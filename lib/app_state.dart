import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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
