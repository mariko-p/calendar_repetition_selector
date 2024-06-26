// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IntervalStruct extends BaseStruct {
  IntervalStruct({
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

  void incrementValue(int amount) => value = value + amount;

  bool hasValue() => _value != null;

  static IntervalStruct fromMap(Map<String, dynamic> data) => IntervalStruct(
        text: data['text'] as String?,
        value: castToType<int>(data['value']),
      );

  static IntervalStruct? maybeFromMap(dynamic data) =>
      data is Map ? IntervalStruct.fromMap(data.cast<String, dynamic>()) : null;

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

  static IntervalStruct fromSerializableMap(Map<String, dynamic> data) =>
      IntervalStruct(
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
  String toString() => 'IntervalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IntervalStruct &&
        text == other.text &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([text, value]);
}

IntervalStruct createIntervalStruct({
  String? text,
  int? value,
}) =>
    IntervalStruct(
      text: text,
      value: value,
    );
