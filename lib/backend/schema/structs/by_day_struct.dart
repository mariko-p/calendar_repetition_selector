// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ByDayStruct extends BaseStruct {
  ByDayStruct({
    String? text,
    List<String>? value,
  })  : _text = text,
        _value = value;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  // "value" field.
  List<String>? _value;
  List<String> get value => _value ?? const [];
  set value(List<String>? val) => _value = val;
  void updateValue(Function(List<String>) updateFn) => updateFn(_value ??= []);
  bool hasValue() => _value != null;

  static ByDayStruct fromMap(Map<String, dynamic> data) => ByDayStruct(
        text: data['text'] as String?,
        value: getDataList(data['value']),
      );

  static ByDayStruct? maybeFromMap(dynamic data) =>
      data is Map ? ByDayStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static ByDayStruct fromSerializableMap(Map<String, dynamic> data) =>
      ByDayStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        value: deserializeParam<String>(
          data['value'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ByDayStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ByDayStruct &&
        text == other.text &&
        listEquality.equals(value, other.value);
  }

  @override
  int get hashCode => const ListEquality().hash([text, value]);
}

ByDayStruct createByDayStruct({
  String? text,
}) =>
    ByDayStruct(
      text: text,
    );
