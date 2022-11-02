// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'by_day_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ByDayStruct> _$byDayStructSerializer = new _$ByDayStructSerializer();

class _$ByDayStructSerializer implements StructuredSerializer<ByDayStruct> {
  @override
  final Iterable<Type> types = const [ByDayStruct, _$ByDayStruct];
  @override
  final String wireName = 'ByDayStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, ByDayStruct object,
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
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    return result;
  }

  @override
  ByDayStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ByDayStructBuilder();

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
          result.value.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
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

class _$ByDayStruct extends ByDayStruct {
  @override
  final String? text;
  @override
  final BuiltList<String>? value;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$ByDayStruct([void Function(ByDayStructBuilder)? updates]) =>
      (new ByDayStructBuilder()..update(updates))._build();

  _$ByDayStruct._({this.text, this.value, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'ByDayStruct', 'firestoreUtilData');
  }

  @override
  ByDayStruct rebuild(void Function(ByDayStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ByDayStructBuilder toBuilder() => new ByDayStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ByDayStruct &&
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
    return (newBuiltValueToStringHelper(r'ByDayStruct')
          ..add('text', text)
          ..add('value', value)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class ByDayStructBuilder implements Builder<ByDayStruct, ByDayStructBuilder> {
  _$ByDayStruct? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  ListBuilder<String>? _value;
  ListBuilder<String> get value => _$this._value ??= new ListBuilder<String>();
  set value(ListBuilder<String>? value) => _$this._value = value;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  ByDayStructBuilder() {
    ByDayStruct._initializeBuilder(this);
  }

  ByDayStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _value = $v.value?.toBuilder();
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ByDayStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ByDayStruct;
  }

  @override
  void update(void Function(ByDayStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ByDayStruct build() => _build();

  _$ByDayStruct _build() {
    _$ByDayStruct _$result;
    try {
      _$result = _$v ??
          new _$ByDayStruct._(
              text: text,
              value: _value?.build(),
              firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                  firestoreUtilData, r'ByDayStruct', 'firestoreUtilData'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'value';
        _value?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ByDayStruct', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
