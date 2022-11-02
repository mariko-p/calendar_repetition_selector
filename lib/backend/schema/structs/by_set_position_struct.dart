import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'by_set_position_struct.g.dart';

abstract class BySetPositionStruct
    implements Built<BySetPositionStruct, BySetPositionStructBuilder> {
  static Serializer<BySetPositionStruct> get serializer =>
      _$bySetPositionStructSerializer;

  String? get text;

  int? get value;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(BySetPositionStructBuilder builder) => builder
    ..text = ''
    ..value = 0
    ..firestoreUtilData = FirestoreUtilData();

  BySetPositionStruct._();
  factory BySetPositionStruct(
          [void Function(BySetPositionStructBuilder) updates]) =
      _$BySetPositionStruct;
}

BySetPositionStruct createBySetPositionStruct({
  String? text,
  int? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BySetPositionStruct(
      (b) => b
        ..text = text
        ..value = value
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

BySetPositionStruct? updateBySetPositionStruct(
  BySetPositionStruct? bySetPosition, {
  bool clearUnsetFields = true,
}) =>
    bySetPosition != null
        ? (bySetPosition.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addBySetPositionStructData(
  Map<String, dynamic> firestoreData,
  BySetPositionStruct? bySetPosition,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bySetPosition == null) {
    return;
  }
  if (bySetPosition.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && bySetPosition.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bySetPositionData =
      getBySetPositionFirestoreData(bySetPosition, forFieldValue);
  final nestedData =
      bySetPositionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = bySetPosition.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getBySetPositionFirestoreData(
  BySetPositionStruct? bySetPosition, [
  bool forFieldValue = false,
]) {
  if (bySetPosition == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(BySetPositionStruct.serializer, bySetPosition);

  // Add any Firestore field values
  bySetPosition.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBySetPositionListFirestoreData(
  List<BySetPositionStruct>? bySetPositions,
) =>
    bySetPositions
        ?.map((b) => getBySetPositionFirestoreData(b, true))
        .toList() ??
    [];
