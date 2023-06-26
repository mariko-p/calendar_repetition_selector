// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

//LOCAL_START
import '../local_rebuilder.dart';
//LOCAL_END

//LOCAL_START
class MonthStruct extends BaseStruct implements LocalRebuilder<MonthStruct>{
//LOCAL_END  
  MonthStruct({
    String? text,
    bool? isChecked,
    String? shortText,
  })  : _text = text,
        _isChecked = isChecked,
        _shortText = shortText;

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

  // "shortText" field.
  String? _shortText;
  String get shortText => _shortText ?? '';
  set shortText(String? val) => _shortText = val;
  bool hasShortText() => _shortText != null;

  static MonthStruct fromMap(Map<String, dynamic> data) => MonthStruct(
        text: data['text'] as String?,
        isChecked: data['isChecked'] as bool?,
        shortText: data['shortText'] as String?,
      );

  static MonthStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MonthStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'isChecked': _isChecked,
        'shortText': _shortText,
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
        'shortText': serializeParam(
          _shortText,
          ParamType.String,
        ),
      }.withoutNulls;

  static MonthStruct fromSerializableMap(Map<String, dynamic> data) =>
      MonthStruct(
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
        shortText: deserializeParam(
          data['shortText'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MonthStruct(${toMap()})';
  
  @override
  //LOCAL_START
  MonthStruct? rebuild<MonthStruct>({String? text, bool? isChecked, String? shortText}) {
    _text = text ?? _text;
    _isChecked = isChecked ?? _isChecked;
    _shortText = shortText ?? _shortText;

    var instance = this;
    if (this is MonthStruct) {
      return instance as MonthStruct;
    }
    return null;
  }
  //LOCAL_END

  @override
  bool operator ==(Object other) {
    return other is MonthStruct &&
        text == other.text &&
        isChecked == other.isChecked &&
        shortText == other.shortText;
  }

  @override
  int get hashCode => const ListEquality().hash([text, isChecked, shortText]);
}

MonthStruct createMonthStruct({
  String? text,
  bool? isChecked,
  String? shortText,
}) =>
    MonthStruct(
      text: text,
      isChecked: isChecked,
      shortText: shortText,
    );
