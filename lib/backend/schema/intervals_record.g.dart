// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intervals_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<IntervalsRecord> _$intervalsRecordSerializer =
    new _$IntervalsRecordSerializer();

class _$IntervalsRecordSerializer
    implements StructuredSerializer<IntervalsRecord> {
  @override
  final Iterable<Type> types = const [IntervalsRecord, _$IntervalsRecord];
  @override
  final String wireName = 'IntervalsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, IntervalsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
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
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  IntervalsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IntervalsRecordBuilder();

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
              specifiedType: const FullType(int)) as int?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$IntervalsRecord extends IntervalsRecord {
  @override
  final String? text;
  @override
  final int? value;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$IntervalsRecord([void Function(IntervalsRecordBuilder)? updates]) =>
      (new IntervalsRecordBuilder()..update(updates))._build();

  _$IntervalsRecord._({this.text, this.value, this.ffRef}) : super._();

  @override
  IntervalsRecord rebuild(void Function(IntervalsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IntervalsRecordBuilder toBuilder() =>
      new IntervalsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IntervalsRecord &&
        text == other.text &&
        value == other.value &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, text.hashCode), value.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IntervalsRecord')
          ..add('text', text)
          ..add('value', value)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class IntervalsRecordBuilder
    implements Builder<IntervalsRecord, IntervalsRecordBuilder> {
  _$IntervalsRecord? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  IntervalsRecordBuilder() {
    IntervalsRecord._initializeBuilder(this);
  }

  IntervalsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _value = $v.value;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IntervalsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IntervalsRecord;
  }

  @override
  void update(void Function(IntervalsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IntervalsRecord build() => _build();

  _$IntervalsRecord _build() {
    final _$result =
        _$v ?? new _$IntervalsRecord._(text: text, value: value, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
