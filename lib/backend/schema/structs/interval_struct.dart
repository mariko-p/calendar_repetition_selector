import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'interval_struct.g.dart';

abstract class IntervalStruct
    implements Built<IntervalStruct, IntervalStructBuilder> {
  static Serializer<IntervalStruct> get serializer =>
      _$intervalStructSerializer;

  String? get text;

  int? get value;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(IntervalStructBuilder builder) => builder
    ..text = ''
    ..value = 0
    ..firestoreUtilData = FirestoreUtilData();

  IntervalStruct._();
  factory IntervalStruct([void Function(IntervalStructBuilder) updates]) =
      _$IntervalStruct;
}

IntervalStruct createIntervalStruct({
  String? text,
  int? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IntervalStruct(
      (i) => i
        ..text = text
        ..value = value
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

IntervalStruct? updateIntervalStruct(
  IntervalStruct? interval, {
  bool clearUnsetFields = true,
}) =>
    interval != null
        ? (interval.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addIntervalStructData(
  Map<String, dynamic> firestoreData,
  IntervalStruct? interval,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (interval == null) {
    return;
  }
  if (interval.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && interval.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final intervalData = getIntervalFirestoreData(interval, forFieldValue);
  final nestedData = intervalData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = interval.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getIntervalFirestoreData(
  IntervalStruct? interval, [
  bool forFieldValue = false,
]) {
  if (interval == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(IntervalStruct.serializer, interval);

  // Add any Firestore field values
  interval.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIntervalListFirestoreData(
  List<IntervalStruct>? intervals,
) =>
    intervals?.map((i) => getIntervalFirestoreData(i, true)).toList() ?? [];
