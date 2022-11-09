// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'month_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MonthStruct> _$monthStructSerializer = new _$MonthStructSerializer();

class _$MonthStructSerializer implements StructuredSerializer<MonthStruct> {
  @override
  final Iterable<Type> types = const [MonthStruct, _$MonthStruct];
  @override
  final String wireName = 'MonthStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, MonthStruct object,
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
    value = object.shortText;
    if (value != null) {
      result
        ..add('shortText')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  MonthStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MonthStructBuilder();

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
        case 'shortText':
          result.shortText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$MonthStruct extends MonthStruct {
  @override
  final String? text;
  @override
  final bool? isChecked;
  @override
  final String? shortText;
  @override
  final int? index;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$MonthStruct([void Function(MonthStructBuilder)? updates]) =>
      (new MonthStructBuilder()..update(updates))._build();

  _$MonthStruct._(
      {this.text,
      this.isChecked,
      this.shortText,
      this.index,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'MonthStruct', 'firestoreUtilData');
  }

  @override
  MonthStruct rebuild(void Function(MonthStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MonthStructBuilder toBuilder() => new MonthStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MonthStruct &&
        text == other.text &&
        isChecked == other.isChecked &&
        shortText == other.shortText &&
        index == other.index &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, text.hashCode), isChecked.hashCode),
                shortText.hashCode),
            index.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MonthStruct')
          ..add('text', text)
          ..add('isChecked', isChecked)
          ..add('shortText', shortText)
          ..add('index', index)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class MonthStructBuilder implements Builder<MonthStruct, MonthStructBuilder> {
  _$MonthStruct? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  bool? _isChecked;
  bool? get isChecked => _$this._isChecked;
  set isChecked(bool? isChecked) => _$this._isChecked = isChecked;

  String? _shortText;
  String? get shortText => _$this._shortText;
  set shortText(String? shortText) => _$this._shortText = shortText;

  int? _index;
  int? get index => _$this._index;
  set index(int? index) => _$this._index = index;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  MonthStructBuilder() {
    MonthStruct._initializeBuilder(this);
  }

  MonthStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _isChecked = $v.isChecked;
      _shortText = $v.shortText;
      _index = $v.index;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MonthStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MonthStruct;
  }

  @override
  void update(void Function(MonthStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MonthStruct build() => _build();

  _$MonthStruct _build() {
    final _$result = _$v ??
        new _$MonthStruct._(
            text: text,
            isChecked: isChecked,
            shortText: shortText,
            index: index,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'MonthStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
