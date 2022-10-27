import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'month_day_struct.g.dart';

abstract class MonthDayStruct
    implements Built<MonthDayStruct, MonthDayStructBuilder> {
  static Serializer<MonthDayStruct> get serializer =>
      _$monthDayStructSerializer;

  String? get text;

  bool? get isChecked;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(MonthDayStructBuilder builder) => builder
    ..text = ''
    ..isChecked = false
    ..firestoreUtilData = FirestoreUtilData();

  MonthDayStruct._();
  factory MonthDayStruct([void Function(MonthDayStructBuilder) updates]) =
      _$MonthDayStruct;
}

MonthDayStruct createMonthDayStruct({
  String? text,
  bool? isChecked,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MonthDayStruct(
      (m) => m
        ..text = text
        ..isChecked = isChecked
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

MonthDayStruct? updateMonthDayStruct(
  MonthDayStruct? monthDay, {
  bool clearUnsetFields = true,
}) =>
    monthDay != null
        ? (monthDay.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addMonthDayStructData(
  Map<String, dynamic> firestoreData,
  MonthDayStruct? monthDay,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (monthDay == null) {
    return;
  }
  if (monthDay.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && monthDay.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final monthDayData = getMonthDayFirestoreData(monthDay, forFieldValue);
  final nestedData = monthDayData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = monthDay.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getMonthDayFirestoreData(
  MonthDayStruct? monthDay, [
  bool forFieldValue = false,
]) {
  if (monthDay == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(MonthDayStruct.serializer, monthDay);

  // Add any Firestore field values
  monthDay.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMonthDayListFirestoreData(
  List<MonthDayStruct>? monthDays,
) =>
    monthDays?.map((m) => getMonthDayFirestoreData(m, true)).toList() ?? [];
