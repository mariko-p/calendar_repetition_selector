// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BySetPositionStruct extends BaseStruct {
  BySetPositionStruct({
    String? text,
    int? value,
  })  : _text = text,
        _value = value;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  // "value" field.
  int? _value;
  int get value => _value ?? 0;
  set value(int? val) => _value = val;
  void incrementValue(int amount) => _value = value + amount;
  bool hasValue() => _value != null;

  static BySetPositionStruct fromMap(Map<String, dynamic> data) =>
      BySetPositionStruct(
        text: data['text'] as String?,
        value: castToType<int>(data['value']),
      );

  static BySetPositionStruct? maybeFromMap(dynamic data) => data is Map
      ? BySetPositionStruct.fromMap(data.cast<String, dynamic>())
      : null;

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
          ParamType.int,
        ),
      }.withoutNulls;

  static BySetPositionStruct fromSerializableMap(Map<String, dynamic> data) =>
      BySetPositionStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'BySetPositionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BySetPositionStruct &&
        text == other.text &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([text, value]);
}

BySetPositionStruct createBySetPositionStruct({
  String? text,
  int? value,
}) =>
    BySetPositionStruct(
      text: text,
      value: value,
    );
