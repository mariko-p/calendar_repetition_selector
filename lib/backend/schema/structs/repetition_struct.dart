// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '../local_rebuilder.dart';

//LOCAL_START
class RepetitionStruct extends BaseStruct implements LocalRebuilder<RepetitionStruct> {
//LOCAL_END
  RepetitionStruct({
    String? text,
    bool? isSelected,
    String? rrule,
  })  : _text = text,
        _isSelected = isSelected,
        _rrule = rrule;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  // "isSelected" field.
  bool? _isSelected;
  bool get isSelected => _isSelected ?? false;
  set isSelected(bool? val) => _isSelected = val;
  bool hasIsSelected() => _isSelected != null;

  // "rrule" field.
  String? _rrule;
  String get rrule => _rrule ?? '';
  set rrule(String? val) => _rrule = val;
  bool hasRrule() => _rrule != null;

  static RepetitionStruct fromMap(Map<String, dynamic> data) =>
      RepetitionStruct(
        text: data['text'] as String?,
        isSelected: data['isSelected'] as bool?,
        rrule: data['rrule'] as String?,
      );

  static RepetitionStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? RepetitionStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'isSelected': _isSelected,
        'rrule': _rrule,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'isSelected': serializeParam(
          _isSelected,
          ParamType.bool,
        ),
        'rrule': serializeParam(
          _rrule,
          ParamType.String,
        ),
      }.withoutNulls;

  static RepetitionStruct fromSerializableMap(Map<String, dynamic> data) =>
      RepetitionStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        isSelected: deserializeParam(
          data['isSelected'],
          ParamType.bool,
          false,
        ),
        rrule: deserializeParam(
          data['rrule'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RepetitionStruct(${toMap()})';
  
  //LOCAL_START
  @override
  RepetitionStruct? rebuild<RepetitionStruct>({
    String? text,
    bool? isSelected,
    String? rrule,
  }) {
    _text =  text ?? _text;
    _isSelected =  isSelected ?? _isSelected;
    _rrule =  rrule ?? _rrule;

    var instance = this;
    if (this is RepetitionStruct) {
      return instance as RepetitionStruct;
    }
    return null;
  }
  //LOCAL_END

  @override
  bool operator ==(Object other) {
    return other is RepetitionStruct &&
        text == other.text &&
        isSelected == other.isSelected &&
        rrule == other.rrule;
  }

  @override
  int get hashCode => const ListEquality().hash([text, isSelected, rrule]);
}

RepetitionStruct createRepetitionStruct({
  String? text,
  bool? isSelected,
  String? rrule,
}) =>
    RepetitionStruct(
      text: text,
      isSelected: isSelected,
      rrule: rrule,
    );
