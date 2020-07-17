// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionChoice
    _$GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionChoiceFromJson(
        Map<String, dynamic> json) {
  return GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionChoice()
    ..id = json['id'] as String
    ..nameForManagement = json['nameForManagement'] as String
    ..text = json['text'] as String
    ..presentationOrder = json['presentationOrder'] as int
    ..value = json['value'] as int;
}

Map<String, dynamic>
    _$GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionChoiceToJson(
            GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionChoice
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'nameForManagement': instance.nameForManagement,
          'text': instance.text,
          'presentationOrder': instance.presentationOrder,
          'value': instance.value,
        };

GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion
    _$GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestionFromJson(
        Map<String, dynamic> json) {
  return GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion()
    ..id = json['id'] as String
    ..kind = _$enumDecodeNullable(
        _$GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionKindEnumMap,
        json['kind'],
        unknownValue:
            GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionKind
                .ARTEMIS_UNKNOWN)
    ..nameForManagement = json['nameForManagement'] as String
    ..presentationOrder = json['presentationOrder'] as int
    ..text = json['text'] as String
    ..possibleChoices = (json['possibleChoices'] as List)
        ?.map((e) => e == null
            ? null
            : GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionChoice
                .fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic>
    _$GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestionToJson(
            GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'kind':
              _$GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionKindEnumMap[
                  instance.kind],
          'nameForManagement': instance.nameForManagement,
          'presentationOrder': instance.presentationOrder,
          'text': instance.text,
          'possibleChoices':
              instance.possibleChoices?.map((e) => e?.toJson())?.toList(),
        };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionKindEnumMap =
    {
  GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionKind
      .MULTIPLE_CHOICE: 'MULTIPLE_CHOICE',
  GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionKind
      .FREE_RESPONSE: 'FREE_RESPONSE',
  GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionKind
      .ARTEMIS_UNKNOWN: 'ARTEMIS_UNKNOWN',
};

GetQuestionnaire$Query$SymptomQuestionnaire
    _$GetQuestionnaire$Query$SymptomQuestionnaireFromJson(
        Map<String, dynamic> json) {
  return GetQuestionnaire$Query$SymptomQuestionnaire()
    ..id = json['id'] as String
    ..isPublished = json['isPublished'] as bool
    ..nameForManagement = json['nameForManagement'] as String
    ..nameForPresentation = json['nameForPresentation'] as String
    ..questions = (json['questions'] as List)
        ?.map((e) => e == null
            ? null
            : GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion
                .fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$GetQuestionnaire$Query$SymptomQuestionnaireToJson(
        GetQuestionnaire$Query$SymptomQuestionnaire instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isPublished': instance.isPublished,
      'nameForManagement': instance.nameForManagement,
      'nameForPresentation': instance.nameForPresentation,
      'questions': instance.questions?.map((e) => e?.toJson())?.toList(),
    };

GetQuestionnaire$Query _$GetQuestionnaire$QueryFromJson(
    Map<String, dynamic> json) {
  return GetQuestionnaire$Query()
    ..symptomQuestionnaire = json['symptomQuestionnaire'] == null
        ? null
        : GetQuestionnaire$Query$SymptomQuestionnaire.fromJson(
            json['symptomQuestionnaire'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetQuestionnaire$QueryToJson(
        GetQuestionnaire$Query instance) =>
    <String, dynamic>{
      'symptomQuestionnaire': instance.symptomQuestionnaire?.toJson(),
    };

GetQuestionnaireArguments _$GetQuestionnaireArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetQuestionnaireArguments(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$GetQuestionnaireArgumentsToJson(
        GetQuestionnaireArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
