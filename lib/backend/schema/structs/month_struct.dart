import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'month_struct.g.dart';

abstract class MonthStruct implements Built<MonthStruct, MonthStructBuilder> {
  static Serializer<MonthStruct> get serializer => _$monthStructSerializer;

  String? get text;

  bool? get isChecked;

  String? get shortText;

  int? get index;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(MonthStructBuilder builder) => builder
    ..text = ''
    ..isChecked = false
    ..shortText = ''
    ..index = 0
    ..firestoreUtilData = FirestoreUtilData();

  MonthStruct._();
  factory MonthStruct([void Function(MonthStructBuilder) updates]) =
      _$MonthStruct;
}

MonthStruct createMonthStruct({
  String? text,
  bool? isChecked,
  String? shortText,
  int? index,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MonthStruct(
      (m) => m
        ..text = text
        ..isChecked = isChecked
        ..shortText = shortText
        ..index = index
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

MonthStruct? updateMonthStruct(
  MonthStruct? month, {
  bool clearUnsetFields = true,
}) =>
    month != null
        ? (month.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addMonthStructData(
  Map<String, dynamic> firestoreData,
  MonthStruct? month,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (month == null) {
    return;
  }
  if (month.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && month.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final monthData = getMonthFirestoreData(month, forFieldValue);
  final nestedData = monthData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = month.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getMonthFirestoreData(
  MonthStruct? month, [
  bool forFieldValue = false,
]) {
  if (month == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(MonthStruct.serializer, month);

  // Add any Firestore field values
  month.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMonthListFirestoreData(
  List<MonthStruct>? months,
) =>
    months?.map((m) => getMonthFirestoreData(m, true)).toList() ?? [];
