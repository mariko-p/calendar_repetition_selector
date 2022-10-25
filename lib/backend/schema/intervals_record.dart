import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'intervals_record.g.dart';

abstract class IntervalsRecord
    implements Built<IntervalsRecord, IntervalsRecordBuilder> {
  static Serializer<IntervalsRecord> get serializer =>
      _$intervalsRecordSerializer;

  String? get text;

  int? get value;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(IntervalsRecordBuilder builder) => builder
    ..text = ''
    ..value = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('intervals');

  static Stream<IntervalsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<IntervalsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  IntervalsRecord._();
  factory IntervalsRecord([void Function(IntervalsRecordBuilder) updates]) =
      _$IntervalsRecord;

  static IntervalsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createIntervalsRecordData({
  String? text,
  int? value,
}) {
  final firestoreData = serializers.toFirestore(
    IntervalsRecord.serializer,
    IntervalsRecord(
      (i) => i
        ..text = text
        ..value = value,
    ),
  );

  return firestoreData;
}
