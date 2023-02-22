// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_day_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WeekDayStruct> _$weekDayStructSerializer =
    new _$WeekDayStructSerializer();

class _$WeekDayStructSerializer implements StructuredSerializer<WeekDayStruct> {
  @override
  final Iterable<Type> types = const [WeekDayStruct, _$WeekDayStruct];
  @override
  final String wireName = 'WeekDayStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, WeekDayStruct object,
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
    value = object.isChecked;
    if (value != null) {
      result
        ..add('isChecked')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.value;
    if (value != null) {
      result
        ..add('value')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  WeekDayStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WeekDayStructBuilder();

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
        case 'isChecked':
          result.isChecked = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'value':
          result.value = serializers.deserialize(value,
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

class _$WeekDayStruct extends WeekDayStruct {
  @override
  final String? text;
  @override
  final bool? isChecked;
  @override
  final String? value;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$WeekDayStruct([void Function(WeekDayStructBuilder)? updates]) =>
      (new WeekDayStructBuilder()..update(updates))._build();

  _$WeekDayStruct._(
      {this.text, this.isChecked, this.value, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'WeekDayStruct', 'firestoreUtilData');
  }

  @override
  WeekDayStruct rebuild(void Function(WeekDayStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WeekDayStructBuilder toBuilder() => new WeekDayStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WeekDayStruct &&
        text == other.text &&
        isChecked == other.isChecked &&
        value == other.value &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, text.hashCode), isChecked.hashCode), value.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WeekDayStruct')
          ..add('text', text)
          ..add('isChecked', isChecked)
          ..add('value', value)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class WeekDayStructBuilder
    implements Builder<WeekDayStruct, WeekDayStructBuilder> {
  _$WeekDayStruct? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  bool? _isChecked;
  bool? get isChecked => _$this._isChecked;
  set isChecked(bool? isChecked) => _$this._isChecked = isChecked;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  WeekDayStructBuilder() {
    WeekDayStruct._initializeBuilder(this);
  }

  WeekDayStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _isChecked = $v.isChecked;
      _value = $v.value;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WeekDayStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WeekDayStruct;
  }

  @override
  void update(void Function(WeekDayStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WeekDayStruct build() => _build();

  _$WeekDayStruct _build() {
    final _$result = _$v ??
        new _$WeekDayStruct._(
            text: text,
            isChecked: isChecked,
            value: value,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'WeekDayStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
