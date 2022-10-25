// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'frequency_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<FrequencyStruct> _$frequencyStructSerializer =
    new _$FrequencyStructSerializer();

class _$FrequencyStructSerializer
    implements StructuredSerializer<FrequencyStruct> {
  @override
  final Iterable<Type> types = const [FrequencyStruct, _$FrequencyStruct];
  @override
  final String wireName = 'FrequencyStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, FrequencyStruct object,
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
  FrequencyStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FrequencyStructBuilder();

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

class _$FrequencyStruct extends FrequencyStruct {
  @override
  final String? text;
  @override
  final String? value;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$FrequencyStruct([void Function(FrequencyStructBuilder)? updates]) =>
      (new FrequencyStructBuilder()..update(updates))._build();

  _$FrequencyStruct._({this.text, this.value, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'FrequencyStruct', 'firestoreUtilData');
  }

  @override
  FrequencyStruct rebuild(void Function(FrequencyStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FrequencyStructBuilder toBuilder() =>
      new FrequencyStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FrequencyStruct &&
        text == other.text &&
        value == other.value &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, text.hashCode), value.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FrequencyStruct')
          ..add('text', text)
          ..add('value', value)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class FrequencyStructBuilder
    implements Builder<FrequencyStruct, FrequencyStructBuilder> {
  _$FrequencyStruct? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  FrequencyStructBuilder() {
    FrequencyStruct._initializeBuilder(this);
  }

  FrequencyStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _value = $v.value;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FrequencyStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FrequencyStruct;
  }

  @override
  void update(void Function(FrequencyStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FrequencyStruct build() => _build();

  _$FrequencyStruct _build() {
    final _$result = _$v ??
        new _$FrequencyStruct._(
            text: text,
            value: value,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'FrequencyStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
