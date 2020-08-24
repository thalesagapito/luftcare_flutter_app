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

Questionnaire$Query$SymptomQuestionnaire$Questions$PossibleChoices
    _$Questionnaire$Query$SymptomQuestionnaire$Questions$PossibleChoicesFromJson(
        Map<String, dynamic> json) {
  return Questionnaire$Query$SymptomQuestionnaire$Questions$PossibleChoices()
    ..id = json['id'] as String
    ..text = json['text'] as String
    ..value = json['value'] as int
    ..presentationOrder = json['presentationOrder'] as int;
}

Map<String, dynamic>
    _$Questionnaire$Query$SymptomQuestionnaire$Questions$PossibleChoicesToJson(
            Questionnaire$Query$SymptomQuestionnaire$Questions$PossibleChoices
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'text': instance.text,
          'value': instance.value,
          'presentationOrder': instance.presentationOrder,
        };

Questionnaire$Query$SymptomQuestionnaire$Questions
    _$Questionnaire$Query$SymptomQuestionnaire$QuestionsFromJson(
        Map<String, dynamic> json) {
  return Questionnaire$Query$SymptomQuestionnaire$Questions()
    ..id = json['id'] as String
    ..text = json['text'] as String
    ..presentationOrder = json['presentationOrder'] as int
    ..kind = _$enumDecodeNullable(
        _$SymptomQuestionnaireQuestionKindEnumMap, json['kind'],
        unknownValue: SymptomQuestionnaireQuestionKind.artemisUnknown)
    ..possibleChoices = (json['possibleChoices'] as List)
        ?.map((e) => e == null
            ? null
            : Questionnaire$Query$SymptomQuestionnaire$Questions$PossibleChoices
                .fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Questionnaire$Query$SymptomQuestionnaire$QuestionsToJson(
        Questionnaire$Query$SymptomQuestionnaire$Questions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'presentationOrder': instance.presentationOrder,
      'kind': _$SymptomQuestionnaireQuestionKindEnumMap[instance.kind],
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

Questionnaire$Query$SymptomQuestionnaire
    _$Questionnaire$Query$SymptomQuestionnaireFromJson(
        Map<String, dynamic> json) {
  return Questionnaire$Query$SymptomQuestionnaire()
    ..id = json['id'] as String
    ..nameForPresentation = json['nameForPresentation'] as String
    ..questions = (json['questions'] as List)
        ?.map((e) => e == null
            ? null
            : Questionnaire$Query$SymptomQuestionnaire$Questions.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Questionnaire$Query$SymptomQuestionnaireToJson(
        Questionnaire$Query$SymptomQuestionnaire instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameForPresentation': instance.nameForPresentation,
      'questions': instance.questions?.map((e) => e?.toJson())?.toList(),
    };

Questionnaire$Query _$Questionnaire$QueryFromJson(Map<String, dynamic> json) {
  return Questionnaire$Query()
    ..symptomQuestionnaire = json['symptomQuestionnaire'] == null
        ? null
        : Questionnaire$Query$SymptomQuestionnaire.fromJson(
            json['symptomQuestionnaire'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Questionnaire$QueryToJson(
        Questionnaire$Query instance) =>
    <String, dynamic>{
      'symptomQuestionnaire': instance.symptomQuestionnaire?.toJson(),
    };

Questionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoices
    _$Questionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoicesFromJson(
        Map<String, dynamic> json) {
  return Questionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoices()
    ..id = json['id'] as String
    ..text = json['text'] as String
    ..value = json['value'] as int
    ..presentationOrder = json['presentationOrder'] as int;
}

Map<String, dynamic>
    _$Questionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoicesToJson(
            Questionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoices
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'text': instance.text,
          'value': instance.value,
          'presentationOrder': instance.presentationOrder,
        };

Questionnaires$Query$SymptomQuestionnaires$Results$Questions
    _$Questionnaires$Query$SymptomQuestionnaires$Results$QuestionsFromJson(
        Map<String, dynamic> json) {
  return Questionnaires$Query$SymptomQuestionnaires$Results$Questions()
    ..id = json['id'] as String
    ..text = json['text'] as String
    ..kind = _$enumDecodeNullable(
        _$SymptomQuestionnaireQuestionKindEnumMap, json['kind'],
        unknownValue: SymptomQuestionnaireQuestionKind.artemisUnknown)
    ..presentationOrder = json['presentationOrder'] as int
    ..possibleChoices = (json['possibleChoices'] as List)
        ?.map((e) => e == null
            ? null
            : Questionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoices
                .fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic>
    _$Questionnaires$Query$SymptomQuestionnaires$Results$QuestionsToJson(
            Questionnaires$Query$SymptomQuestionnaires$Results$Questions
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'text': instance.text,
          'kind': _$SymptomQuestionnaireQuestionKindEnumMap[instance.kind],
          'presentationOrder': instance.presentationOrder,
          'possibleChoices':
              instance.possibleChoices?.map((e) => e?.toJson())?.toList(),
        };

Questionnaires$Query$SymptomQuestionnaires$Results
    _$Questionnaires$Query$SymptomQuestionnaires$ResultsFromJson(
        Map<String, dynamic> json) {
  return Questionnaires$Query$SymptomQuestionnaires$Results()
    ..id = json['id'] as String
    ..nameForPresentation = json['nameForPresentation'] as String
    ..questions = (json['questions'] as List)
        ?.map((e) => e == null
            ? null
            : Questionnaires$Query$SymptomQuestionnaires$Results$Questions
                .fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Questionnaires$Query$SymptomQuestionnaires$ResultsToJson(
        Questionnaires$Query$SymptomQuestionnaires$Results instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameForPresentation': instance.nameForPresentation,
      'questions': instance.questions?.map((e) => e?.toJson())?.toList(),
    };

Questionnaires$Query$SymptomQuestionnaires
    _$Questionnaires$Query$SymptomQuestionnairesFromJson(
        Map<String, dynamic> json) {
  return Questionnaires$Query$SymptomQuestionnaires()
    ..totalResultsCount = json['totalResultsCount'] as int
    ..hasMorePages = json['hasMorePages'] as bool
    ..results = (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : Questionnaires$Query$SymptomQuestionnaires$Results.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Questionnaires$Query$SymptomQuestionnairesToJson(
        Questionnaires$Query$SymptomQuestionnaires instance) =>
    <String, dynamic>{
      'totalResultsCount': instance.totalResultsCount,
      'hasMorePages': instance.hasMorePages,
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
    };

Questionnaires$Query _$Questionnaires$QueryFromJson(Map<String, dynamic> json) {
  return Questionnaires$Query()
    ..symptomQuestionnaires = json['symptomQuestionnaires'] == null
        ? null
        : Questionnaires$Query$SymptomQuestionnaires.fromJson(
            json['symptomQuestionnaires'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Questionnaires$QueryToJson(
        Questionnaires$Query instance) =>
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

CreateResponse$Mutation$CreateSymptomQuestionnaireResponse
    _$CreateResponse$Mutation$CreateSymptomQuestionnaireResponseFromJson(
        Map<String, dynamic> json) {
  return CreateResponse$Mutation$CreateSymptomQuestionnaireResponse()
    ..userFriendlyMessage = json['userFriendlyMessage'] as String;
}

Map<String,
    dynamic> _$CreateResponse$Mutation$CreateSymptomQuestionnaireResponseToJson(
        CreateResponse$Mutation$CreateSymptomQuestionnaireResponse instance) =>
    <String, dynamic>{
      'userFriendlyMessage': instance.userFriendlyMessage,
    };

CreateResponse$Mutation _$CreateResponse$MutationFromJson(
    Map<String, dynamic> json) {
  return CreateResponse$Mutation()
    ..createSymptomQuestionnaireResponse = json[
                'createSymptomQuestionnaireResponse'] ==
            null
        ? null
        : CreateResponse$Mutation$CreateSymptomQuestionnaireResponse.fromJson(
            json['createSymptomQuestionnaireResponse'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateResponse$MutationToJson(
        CreateResponse$Mutation instance) =>
    <String, dynamic>{
      'createSymptomQuestionnaireResponse':
          instance.createSymptomQuestionnaireResponse?.toJson(),
    };

SymptomQuestionnaireResponseAnswerInput
    _$SymptomQuestionnaireResponseAnswerInputFromJson(
        Map<String, dynamic> json) {
  return SymptomQuestionnaireResponseAnswerInput(
    questionId: json['questionId'] as String,
    choiceId: json['choiceId'] as String,
    writtenText: json['writtenText'] as String,
  );
}

Map<String, dynamic> _$SymptomQuestionnaireResponseAnswerInputToJson(
        SymptomQuestionnaireResponseAnswerInput instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'choiceId': instance.choiceId,
      'writtenText': instance.writtenText,
    };

SymptomQuestionnaireResponseInput _$SymptomQuestionnaireResponseInputFromJson(
    Map<String, dynamic> json) {
  return SymptomQuestionnaireResponseInput(
    responseDate:
        fromGraphQLDateTimeToDartDateTime(json['responseDate'] as String),
    userId: json['userId'] as String,
    questionnaireId: json['questionnaireId'] as String,
    questionnaireVersion: json['questionnaireVersion'] as int,
    questionAnswers: (json['questionAnswers'] as List)
        ?.map((e) => e == null
            ? null
            : SymptomQuestionnaireResponseAnswerInput.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SymptomQuestionnaireResponseInputToJson(
        SymptomQuestionnaireResponseInput instance) =>
    <String, dynamic>{
      'responseDate': fromDartDateTimeToGraphQLDateTime(instance.responseDate),
      'userId': instance.userId,
      'questionnaireId': instance.questionnaireId,
      'questionnaireVersion': instance.questionnaireVersion,
      'questionAnswers':
          instance.questionAnswers?.map((e) => e?.toJson())?.toList(),
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

QuestionnaireArguments _$QuestionnaireArgumentsFromJson(
    Map<String, dynamic> json) {
  return QuestionnaireArguments(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$QuestionnaireArgumentsToJson(
        QuestionnaireArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

CreateResponseArguments _$CreateResponseArgumentsFromJson(
    Map<String, dynamic> json) {
  return CreateResponseArguments(
    response: json['response'] == null
        ? null
        : SymptomQuestionnaireResponseInput.fromJson(
            json['response'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateResponseArgumentsToJson(
        CreateResponseArguments instance) =>
    <String, dynamic>{
      'response': instance.response?.toJson(),
    };
