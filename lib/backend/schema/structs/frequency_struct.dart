import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'frequency_struct.g.dart';

abstract class FrequencyStruct
    implements Built<FrequencyStruct, FrequencyStructBuilder> {
  static Serializer<FrequencyStruct> get serializer =>
      _$frequencyStructSerializer;

  String? get text;

  String? get value;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(FrequencyStructBuilder builder) => builder
    ..text = ''
    ..value = ''
    ..firestoreUtilData = FirestoreUtilData();

  FrequencyStruct._();
  factory FrequencyStruct([void Function(FrequencyStructBuilder) updates]) =
      _$FrequencyStruct;
}

FrequencyStruct createFrequencyStruct({
  String? text,
  String? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FrequencyStruct(
      (f) => f
        ..text = text
        ..value = value
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

FrequencyStruct? updateFrequencyStruct(
  FrequencyStruct? frequency, {
  bool clearUnsetFields = true,
}) =>
    frequency != null
        ? (frequency.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addFrequencyStructData(
  Map<String, dynamic> firestoreData,
  FrequencyStruct? frequency,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (frequency == null) {
    return;
  }
  if (frequency.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && frequency.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final frequencyData = getFrequencyFirestoreData(frequency, forFieldValue);
  final nestedData = frequencyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = frequency.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getFrequencyFirestoreData(
  FrequencyStruct? frequency, [
  bool forFieldValue = false,
]) {
  if (frequency == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(FrequencyStruct.serializer, frequency);

  // Add any Firestore field values
  frequency.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFrequencyListFirestoreData(
  List<FrequencyStruct>? frequencys,
) =>
    frequencys?.map((f) => getFrequencyFirestoreData(f, true)).toList() ?? [];
