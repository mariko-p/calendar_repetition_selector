// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'month_day_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MonthDayStruct> _$monthDayStructSerializer =
    new _$MonthDayStructSerializer();

class _$MonthDayStructSerializer
    implements StructuredSerializer<MonthDayStruct> {
  @override
  final Iterable<Type> types = const [MonthDayStruct, _$MonthDayStruct];
  @override
  final String wireName = 'MonthDayStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, MonthDayStruct object,
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
    value = object.index;
    if (value != null) {
      result
        ..add('index')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  MonthDayStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MonthDayStructBuilder();

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
        case 'index':
          result.index = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$MonthDayStruct extends MonthDayStruct {
  @override
  final String? text;
  @override
  final bool? isChecked;
  @override
  final int? index;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$MonthDayStruct([void Function(MonthDayStructBuilder)? updates]) =>
      (new MonthDayStructBuilder()..update(updates))._build();

  _$MonthDayStruct._(
      {this.text, this.isChecked, this.index, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'MonthDayStruct', 'firestoreUtilData');
  }

  @override
  MonthDayStruct rebuild(void Function(MonthDayStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MonthDayStructBuilder toBuilder() =>
      new MonthDayStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MonthDayStruct &&
        text == other.text &&
        isChecked == other.isChecked &&
        index == other.index &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, text.hashCode), isChecked.hashCode), index.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MonthDayStruct')
          ..add('text', text)
          ..add('isChecked', isChecked)
          ..add('index', index)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class MonthDayStructBuilder
    implements Builder<MonthDayStruct, MonthDayStructBuilder> {
  _$MonthDayStruct? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  bool? _isChecked;
  bool? get isChecked => _$this._isChecked;
  set isChecked(bool? isChecked) => _$this._isChecked = isChecked;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  MonthDayStructBuilder() {
    MonthDayStruct._initializeBuilder(this);
  }

  MonthDayStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _isChecked = $v.isChecked;
      _index = $v.index;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MonthDayStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MonthDayStruct;
  }

  @override
  void update(void Function(MonthDayStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MonthDayStruct build() => _build();

  _$MonthDayStruct _build() {
    final _$result = _$v ??
        new _$MonthDayStruct._(
            text: text,
            isChecked: isChecked,
            index: index,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'MonthDayStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
