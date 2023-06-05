// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FrequencyStruct extends BaseStruct {
  FrequencyStruct({
    String? text,
    String? value,
  })  : _text = text,
        _value = value;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;
  bool hasValue() => _value != null;

  static FrequencyStruct fromMap(Map<String, dynamic> data) => FrequencyStruct(
        text: data['text'] as String?,
        value: data['value'] as String?,
      );

  static FrequencyStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? FrequencyStruct.fromMap(data) : null;

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
        ),
      }.withoutNulls;

  static FrequencyStruct fromSerializableMap(Map<String, dynamic> data) =>
      FrequencyStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FrequencyStruct(${toMap()})';
}

FrequencyStruct createFrequencyStruct({
  String? text,
  String? value,
}) =>
    FrequencyStruct(
      text: text,
      value: value,
    );
