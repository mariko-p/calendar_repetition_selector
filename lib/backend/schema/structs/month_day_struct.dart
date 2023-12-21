// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MonthDayStruct extends BaseStruct {
  MonthDayStruct({
    String? text,
    bool? isChecked,
    int? index,
  })  : _text = text,
        _isChecked = isChecked,
        _index = index;

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

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;
  void incrementIndex(int amount) => _index = index + amount;
  bool hasIndex() => _index != null;

  static MonthDayStruct fromMap(Map<String, dynamic> data) => MonthDayStruct(
        text: data['text'] as String?,
        isChecked: data['isChecked'] as bool?,
        index: castToType<int>(data['index']),
      );

  static MonthDayStruct? maybeFromMap(dynamic data) =>
      data is Map ? MonthDayStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'isChecked': _isChecked,
        'index': _index,
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
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
      }.withoutNulls;

  static MonthDayStruct fromSerializableMap(Map<String, dynamic> data) =>
      MonthDayStruct(
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
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MonthDayStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MonthDayStruct &&
        text == other.text &&
        isChecked == other.isChecked &&
        index == other.index;
  }

  @override
  int get hashCode => const ListEquality().hash([text, isChecked, index]);
}

MonthDayStruct createMonthDayStruct({
  String? text,
  bool? isChecked,
  int? index,
}) =>
    MonthDayStruct(
      text: text,
      isChecked: isChecked,
      index: index,
    );
