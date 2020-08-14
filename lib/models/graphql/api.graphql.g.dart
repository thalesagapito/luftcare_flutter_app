// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login$Mutation$Login _$Login$Mutation$LoginFromJson(Map<String, dynamic> json) {
  return Login$Mutation$Login()
    ..authorization = json['authorization'] as String
    ..refresh = json['refresh'] as String;
}

Map<String, dynamic> _$Login$Mutation$LoginToJson(
        Login$Mutation$Login instance) =>
    <String, dynamic>{
      'authorization': instance.authorization,
      'refresh': instance.refresh,
    };

Login$Mutation _$Login$MutationFromJson(Map<String, dynamic> json) {
  return Login$Mutation()
    ..login = json['login'] == null
        ? null
        : Login$Mutation$Login.fromJson(json['login'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Login$MutationToJson(Login$Mutation instance) =>
    <String, dynamic>{
      'login': instance.login?.toJson(),
    };

SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoices
    _$SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoicesFromJson(
        Map<String, dynamic> json) {
  return SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoices()
    ..id = json['id'] as String
    ..text = json['text'] as String
    ..value = json['value'] as int
    ..presentationOrder = json['presentationOrder'] as int;
}

Map<String, dynamic>
    _$SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoicesToJson(
            SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoices
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'text': instance.text,
          'value': instance.value,
          'presentationOrder': instance.presentationOrder,
        };

SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$Questions
    _$SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$QuestionsFromJson(
        Map<String, dynamic> json) {
  return SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$Questions()
    ..id = json['id'] as String
    ..text = json['text'] as String
    ..kind = _$enumDecodeNullable(
        _$SymptomQuestionnaireQuestionKindEnumMap, json['kind'],
        unknownValue: SymptomQuestionnaireQuestionKind.artemisUnknown)
    ..presentationOrder = json['presentationOrder'] as int
    ..possibleChoices = (json['possibleChoices'] as List)
        ?.map((e) => e == null
            ? null
            : SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoices
                .fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic>
    _$SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$QuestionsToJson(
            SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$Questions
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'text': instance.text,
          'kind': _$SymptomQuestionnaireQuestionKindEnumMap[instance.kind],
          'presentationOrder': instance.presentationOrder,
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

const _$SymptomQuestionnaireQuestionKindEnumMap = {
  SymptomQuestionnaireQuestionKind.multipleChoice: 'MULTIPLE_CHOICE',
  SymptomQuestionnaireQuestionKind.freeResponse: 'FREE_RESPONSE',
  SymptomQuestionnaireQuestionKind.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

SymptomQuestionnaires$Query$SymptomQuestionnaires$Results
    _$SymptomQuestionnaires$Query$SymptomQuestionnaires$ResultsFromJson(
        Map<String, dynamic> json) {
  return SymptomQuestionnaires$Query$SymptomQuestionnaires$Results()
    ..id = json['id'] as String
    ..nameForPresentation = json['nameForPresentation'] as String
    ..questions = (json['questions'] as List)
        ?.map((e) => e == null
            ? null
            : SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$Questions
                .fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String,
    dynamic> _$SymptomQuestionnaires$Query$SymptomQuestionnaires$ResultsToJson(
        SymptomQuestionnaires$Query$SymptomQuestionnaires$Results instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameForPresentation': instance.nameForPresentation,
      'questions': instance.questions?.map((e) => e?.toJson())?.toList(),
    };

SymptomQuestionnaires$Query$SymptomQuestionnaires
    _$SymptomQuestionnaires$Query$SymptomQuestionnairesFromJson(
        Map<String, dynamic> json) {
  return SymptomQuestionnaires$Query$SymptomQuestionnaires()
    ..totalResultsCount = json['totalResultsCount'] as int
    ..hasMorePages = json['hasMorePages'] as bool
    ..results = (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : SymptomQuestionnaires$Query$SymptomQuestionnaires$Results
                .fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SymptomQuestionnaires$Query$SymptomQuestionnairesToJson(
        SymptomQuestionnaires$Query$SymptomQuestionnaires instance) =>
    <String, dynamic>{
      'totalResultsCount': instance.totalResultsCount,
      'hasMorePages': instance.hasMorePages,
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
    };

SymptomQuestionnaires$Query _$SymptomQuestionnaires$QueryFromJson(
    Map<String, dynamic> json) {
  return SymptomQuestionnaires$Query()
    ..symptomQuestionnaires = json['symptomQuestionnaires'] == null
        ? null
        : SymptomQuestionnaires$Query$SymptomQuestionnaires.fromJson(
            json['symptomQuestionnaires'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SymptomQuestionnaires$QueryToJson(
        SymptomQuestionnaires$Query instance) =>
    <String, dynamic>{
      'symptomQuestionnaires': instance.symptomQuestionnaires?.toJson(),
    };

CurrentUser$Query$CurrentUser _$CurrentUser$Query$CurrentUserFromJson(
    Map<String, dynamic> json) {
  return CurrentUser$Query$CurrentUser()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..email = json['email'] as String
    ..phoneNumber = json['phoneNumber'] as String
    ..role = _$enumDecodeNullable(_$UserRoleEnumMap, json['role'],
        unknownValue: UserRole.artemisUnknown);
}

Map<String, dynamic> _$CurrentUser$Query$CurrentUserToJson(
        CurrentUser$Query$CurrentUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'role': _$UserRoleEnumMap[instance.role],
    };

const _$UserRoleEnumMap = {
  UserRole.admin: 'ADMIN',
  UserRole.nonAdmin: 'NON_ADMIN',
  UserRole.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

CurrentUser$Query _$CurrentUser$QueryFromJson(Map<String, dynamic> json) {
  return CurrentUser$Query()
    ..currentUser = json['currentUser'] == null
        ? null
        : CurrentUser$Query$CurrentUser.fromJson(
            json['currentUser'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CurrentUser$QueryToJson(CurrentUser$Query instance) =>
    <String, dynamic>{
      'currentUser': instance.currentUser?.toJson(),
    };

LoginArguments _$LoginArgumentsFromJson(Map<String, dynamic> json) {
  return LoginArguments(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$LoginArgumentsToJson(LoginArguments instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
