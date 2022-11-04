// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repetition_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RepetitionStruct> _$repetitionStructSerializer =
    new _$RepetitionStructSerializer();

class _$RepetitionStructSerializer
    implements StructuredSerializer<RepetitionStruct> {
  @override
  final Iterable<Type> types = const [RepetitionStruct, _$RepetitionStruct];
  @override
  final String wireName = 'RepetitionStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, RepetitionStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isSelected;
    if (value != null) {
      result
        ..add('isSelected')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.rrule;
    if (value != null) {
      result
        ..add('rrule')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  RepetitionStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RepetitionStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'isSelected':
          result.isSelected = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'rrule':
          result.rrule = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$RepetitionStruct extends RepetitionStruct {
  @override
  final String? text;
  @override
  final bool? isSelected;
  @override
  final String? rrule;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$RepetitionStruct(
          [void Function(RepetitionStructBuilder)? updates]) =>
      (new RepetitionStructBuilder()..update(updates))._build();

  _$RepetitionStruct._(
      {this.text, this.isSelected, this.rrule, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'RepetitionStruct', 'firestoreUtilData');
  }

  @override
  RepetitionStruct rebuild(void Function(RepetitionStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RepetitionStructBuilder toBuilder() =>
      new RepetitionStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RepetitionStruct &&
        text == other.text &&
        isSelected == other.isSelected &&
        rrule == other.rrule &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, text.hashCode), isSelected.hashCode), rrule.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RepetitionStruct')
          ..add('text', text)
          ..add('isSelected', isSelected)
          ..add('rrule', rrule)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class RepetitionStructBuilder
    implements Builder<RepetitionStruct, RepetitionStructBuilder> {
  _$RepetitionStruct? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  bool? _isSelected;
  bool? get isSelected => _$this._isSelected;
  set isSelected(bool? isSelected) => _$this._isSelected = isSelected;

  String? _rrule;
  String? get rrule => _$this._rrule;
  set rrule(String? rrule) => _$this._rrule = rrule;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  RepetitionStructBuilder() {
    RepetitionStruct._initializeBuilder(this);
  }

  RepetitionStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _isSelected = $v.isSelected;
      _rrule = $v.rrule;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RepetitionStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RepetitionStruct;
  }

  @override
  void update(void Function(RepetitionStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RepetitionStruct build() => _build();

  _$RepetitionStruct _build() {
    final _$result = _$v ??
        new _$RepetitionStruct._(
            text: text,
            isSelected: isSelected,
            rrule: rrule,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'RepetitionStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
