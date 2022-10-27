import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'week_day_struct.g.dart';

abstract class WeekDayStruct
    implements Built<WeekDayStruct, WeekDayStructBuilder> {
  static Serializer<WeekDayStruct> get serializer => _$weekDayStructSerializer;

  String? get text;

  bool? get isChecked;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(WeekDayStructBuilder builder) => builder
    ..text = ''
    ..isChecked = false
    ..firestoreUtilData = FirestoreUtilData();

  WeekDayStruct._();
  factory WeekDayStruct([void Function(WeekDayStructBuilder) updates]) =
      _$WeekDayStruct;
}

WeekDayStruct createWeekDayStruct({
  String? text,
  bool? isChecked,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WeekDayStruct(
      (w) => w
        ..text = text
        ..isChecked = isChecked
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

WeekDayStruct? updateWeekDayStruct(
  WeekDayStruct? weekDay, {
  bool clearUnsetFields = true,
}) =>
    weekDay != null
        ? (weekDay.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addWeekDayStructData(
  Map<String, dynamic> firestoreData,
  WeekDayStruct? weekDay,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (weekDay == null) {
    return;
  }
  if (weekDay.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && weekDay.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final weekDayData = getWeekDayFirestoreData(weekDay, forFieldValue);
  final nestedData = weekDayData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = weekDay.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getWeekDayFirestoreData(
  WeekDayStruct? weekDay, [
  bool forFieldValue = false,
]) {
  if (weekDay == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(WeekDayStruct.serializer, weekDay);

  // Add any Firestore field values
  weekDay.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWeekDayListFirestoreData(
  List<WeekDayStruct>? weekDays,
) =>
    weekDays?.map((w) => getWeekDayFirestoreData(w, true)).toList() ?? [];
