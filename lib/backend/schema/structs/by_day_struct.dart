import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'by_day_struct.g.dart';

abstract class ByDayStruct implements Built<ByDayStruct, ByDayStructBuilder> {
  static Serializer<ByDayStruct> get serializer => _$byDayStructSerializer;

  String? get text;

  BuiltList<String>? get value;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(ByDayStructBuilder builder) => builder
    ..text = ''
    ..value = ListBuilder()
    ..firestoreUtilData = FirestoreUtilData();

  ByDayStruct._();
  factory ByDayStruct([void Function(ByDayStructBuilder) updates]) =
      _$ByDayStruct;
}

ByDayStruct createByDayStruct({
  String? text,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ByDayStruct(
      (b) => b
        ..text = text
        ..value = null
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

ByDayStruct? updateByDayStruct(
  ByDayStruct? byDay, {
  bool clearUnsetFields = true,
}) =>
    byDay != null
        ? (byDay.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addByDayStructData(
  Map<String, dynamic> firestoreData,
  ByDayStruct? byDay,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (byDay == null) {
    return;
  }
  if (byDay.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && byDay.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final byDayData = getByDayFirestoreData(byDay, forFieldValue);
  final nestedData = byDayData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = byDay.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getByDayFirestoreData(
  ByDayStruct? byDay, [
  bool forFieldValue = false,
]) {
  if (byDay == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(ByDayStruct.serializer, byDay);

  // Add any Firestore field values
  byDay.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getByDayListFirestoreData(
  List<ByDayStruct>? byDays,
) =>
    byDays?.map((b) => getByDayFirestoreData(b, true)).toList() ?? [];
