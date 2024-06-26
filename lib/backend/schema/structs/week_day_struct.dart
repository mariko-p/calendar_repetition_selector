// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';
//LOCAL_START
import '../local_rebuilder.dart';
//LOCAL_END

//LOCAL_START
class WeekDayStruct extends BaseStruct implements LocalRebuilder<WeekDayStruct>{
//LOCAL_END
  
  WeekDayStruct({
    String? text,
    bool? isChecked,
    String? value,
  })  : _text = text,
        _isChecked = isChecked,
        _value = value;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "isChecked" field.
  bool? _isChecked;
  bool get isChecked => _isChecked ?? false;
  set isChecked(bool? val) => _isChecked = val;

  bool hasIsChecked() => _isChecked != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  static WeekDayStruct fromMap(Map<String, dynamic> data) => WeekDayStruct(
        text: data['text'] as String?,
        isChecked: data['isChecked'] as bool?,
        value: data['value'] as String?,
      );

  static WeekDayStruct? maybeFromMap(dynamic data) =>
      data is Map ? WeekDayStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'isChecked': _isChecked,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'isChecked': serializeParam(
          _isChecked,
          ParamType.bool,
        ),
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
      }.withoutNulls;

  static WeekDayStruct fromSerializableMap(Map<String, dynamic> data) =>
      WeekDayStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        isChecked: deserializeParam(
          data['isChecked'],
          ParamType.bool,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WeekDayStruct(${toMap()})';
  
  
  @override
  //LOCAL_START
  WeekDayStruct? rebuild<WeekDayStruct>({String? text, bool? isChecked, String? value}) {
    _text = text ?? _text;
    _isChecked = isChecked ?? _isChecked;
    _value = value ?? _value;
    
    var instance = this;
    if (this is WeekDayStruct) {
      return instance as WeekDayStruct;
    }
    return null;
  }
  //LOCAL_END

  @override
  bool operator ==(Object other) {
    return other is WeekDayStruct &&
        text == other.text &&
        isChecked == other.isChecked &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([text, isChecked, value]);
}

WeekDayStruct createWeekDayStruct({
  String? text,
  bool? isChecked,
  String? value,
}) =>
    WeekDayStruct(
      text: text,
      isChecked: isChecked,
      value: value,
    );
