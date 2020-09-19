// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateResponse$Mutation$CreateQuestionnaireResponse$Score
    _$CreateResponse$Mutation$CreateQuestionnaireResponse$ScoreFromJson(Map<String, dynamic> json) {
  return CreateResponse$Mutation$CreateQuestionnaireResponse$Score()
    ..value = json['value'] as int
    ..color = _$enumDecodeNullable(_$QuestionnaireScoreRangeColorEnumMap, json['color'],
        unknownValue: QuestionnaireScoreRangeColor.artemisUnknown)
    ..title = json['title'] as String
    ..description = json['description'] as String;
}

Map<String, dynamic> _$CreateResponse$Mutation$CreateQuestionnaireResponse$ScoreToJson(
        CreateResponse$Mutation$CreateQuestionnaireResponse$Score instance) =>
    <String, dynamic>{
      'value': instance.value,
      'color': _$QuestionnaireScoreRangeColorEnumMap[instance.color],
      'title': instance.title,
      'description': instance.description,
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

  final value = enumValues.entries.singleWhere((e) => e.value == source, orElse: () => null)?.key;

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

const _$QuestionnaireScoreRangeColorEnumMap = {
  QuestionnaireScoreRangeColor.green: 'GREEN',
  QuestionnaireScoreRangeColor.greenYellow: 'GREEN_YELLOW',
  QuestionnaireScoreRangeColor.yellow: 'YELLOW',
  QuestionnaireScoreRangeColor.orange: 'ORANGE',
  QuestionnaireScoreRangeColor.red: 'RED',
  QuestionnaireScoreRangeColor.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

CreateResponse$Mutation$CreateQuestionnaireResponse
    _$CreateResponse$Mutation$CreateQuestionnaireResponseFromJson(Map<String, dynamic> json) {
  return CreateResponse$Mutation$CreateQuestionnaireResponse()
    ..id = json['id'] as String
    ..score = json['score'] == null
        ? null
        : CreateResponse$Mutation$CreateQuestionnaireResponse$Score.fromJson(
            json['score'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateResponse$Mutation$CreateQuestionnaireResponseToJson(
        CreateResponse$Mutation$CreateQuestionnaireResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'score': instance.score?.toJson(),
    };

CreateResponse$Mutation _$CreateResponse$MutationFromJson(Map<String, dynamic> json) {
  return CreateResponse$Mutation()
    ..createQuestionnaireResponse = json['createQuestionnaireResponse'] == null
        ? null
        : CreateResponse$Mutation$CreateQuestionnaireResponse.fromJson(
            json['createQuestionnaireResponse'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CreateResponse$MutationToJson(CreateResponse$Mutation instance) =>
    <String, dynamic>{
      'createQuestionnaireResponse': instance.createQuestionnaireResponse?.toJson(),
    };

QuestionnaireResponseAnswerInput _$QuestionnaireResponseAnswerInputFromJson(
    Map<String, dynamic> json) {
  return QuestionnaireResponseAnswerInput(
    questionId: json['questionId'] as String,
    choiceId: json['choiceId'] as String,
    writtenText: json['writtenText'] as String,
  );
}

Map<String, dynamic> _$QuestionnaireResponseAnswerInputToJson(
        QuestionnaireResponseAnswerInput instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'choiceId': instance.choiceId,
      'writtenText': instance.writtenText,
    };

QuestionnaireResponseInput _$QuestionnaireResponseInputFromJson(Map<String, dynamic> json) {
  return QuestionnaireResponseInput(
    responseDate: fromGraphQLDateTimeToDartDateTime(json['responseDate'] as String),
    userId: json['userId'] as String,
    questionnaireId: json['questionnaireId'] as String,
    questionnaireVersion: json['questionnaireVersion'] as int,
    questionAnswers: (json['questionAnswers'] as List)
        ?.map((e) =>
            e == null ? null : QuestionnaireResponseAnswerInput.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$QuestionnaireResponseInputToJson(QuestionnaireResponseInput instance) =>
    <String, dynamic>{
      'responseDate': fromDartDateTimeToGraphQLDateTime(instance.responseDate),
      'userId': instance.userId,
      'questionnaireId': instance.questionnaireId,
      'questionnaireVersion': instance.questionnaireVersion,
      'questionAnswers': instance.questionAnswers?.map((e) => e?.toJson())?.toList(),
    };

Login$Mutation$Login _$Login$Mutation$LoginFromJson(Map<String, dynamic> json) {
  return Login$Mutation$Login()
    ..authorization = json['authorization'] as String
    ..refresh = json['refresh'] as String;
}

Map<String, dynamic> _$Login$Mutation$LoginToJson(Login$Mutation$Login instance) =>
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

Map<String, dynamic> _$Login$MutationToJson(Login$Mutation instance) => <String, dynamic>{
      'login': instance.login?.toJson(),
    };

Questionnaire$Query$Questionnaire$Questions$PossibleChoices
    _$Questionnaire$Query$Questionnaire$Questions$PossibleChoicesFromJson(
        Map<String, dynamic> json) {
  return Questionnaire$Query$Questionnaire$Questions$PossibleChoices()
    ..id = json['id'] as String
    ..text = json['text'] as String
    ..value = json['value'] as int
    ..presentationOrder = json['presentationOrder'] as int;
}

Map<String, dynamic> _$Questionnaire$Query$Questionnaire$Questions$PossibleChoicesToJson(
        Questionnaire$Query$Questionnaire$Questions$PossibleChoices instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'value': instance.value,
      'presentationOrder': instance.presentationOrder,
    };

Questionnaire$Query$Questionnaire$Questions _$Questionnaire$Query$Questionnaire$QuestionsFromJson(
    Map<String, dynamic> json) {
  return Questionnaire$Query$Questionnaire$Questions()
    ..id = json['id'] as String
    ..text = json['text'] as String
    ..presentationOrder = json['presentationOrder'] as int
    ..kind = _$enumDecodeNullable(_$QuestionnaireQuestionKindEnumMap, json['kind'],
        unknownValue: QuestionnaireQuestionKind.artemisUnknown)
    ..possibleChoices = (json['possibleChoices'] as List)
        ?.map((e) => e == null
            ? null
            : Questionnaire$Query$Questionnaire$Questions$PossibleChoices.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Questionnaire$Query$Questionnaire$QuestionsToJson(
        Questionnaire$Query$Questionnaire$Questions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'presentationOrder': instance.presentationOrder,
      'kind': _$QuestionnaireQuestionKindEnumMap[instance.kind],
      'possibleChoices': instance.possibleChoices?.map((e) => e?.toJson())?.toList(),
    };

const _$QuestionnaireQuestionKindEnumMap = {
  QuestionnaireQuestionKind.multipleChoice: 'MULTIPLE_CHOICE',
  QuestionnaireQuestionKind.freeResponse: 'FREE_RESPONSE',
  QuestionnaireQuestionKind.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

Questionnaire$Query$Questionnaire$ScoreRanges
    _$Questionnaire$Query$Questionnaire$ScoreRangesFromJson(Map<String, dynamic> json) {
  return Questionnaire$Query$Questionnaire$ScoreRanges()
    ..id = json['id'] as String
    ..title = json['title'] as String
    ..description = json['description'] as String
    ..color = _$enumDecodeNullable(_$QuestionnaireScoreRangeColorEnumMap, json['color'],
        unknownValue: QuestionnaireScoreRangeColor.artemisUnknown)
    ..minScore = json['minScore'] as int
    ..maxScore = json['maxScore'] as int;
}

Map<String, dynamic> _$Questionnaire$Query$Questionnaire$ScoreRangesToJson(
        Questionnaire$Query$Questionnaire$ScoreRanges instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'color': _$QuestionnaireScoreRangeColorEnumMap[instance.color],
      'minScore': instance.minScore,
      'maxScore': instance.maxScore,
    };

Questionnaire$Query$Questionnaire _$Questionnaire$Query$QuestionnaireFromJson(
    Map<String, dynamic> json) {
  return Questionnaire$Query$Questionnaire()
    ..id = json['id'] as String
    ..version = json['version'] as int
    ..nameForPresentation = json['nameForPresentation'] as String
    ..questions = (json['questions'] as List)
        ?.map((e) => e == null
            ? null
            : Questionnaire$Query$Questionnaire$Questions.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..scoreRanges = (json['scoreRanges'] as List)
        ?.map((e) => e == null
            ? null
            : Questionnaire$Query$Questionnaire$ScoreRanges.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Questionnaire$Query$QuestionnaireToJson(
        Questionnaire$Query$Questionnaire instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'nameForPresentation': instance.nameForPresentation,
      'questions': instance.questions?.map((e) => e?.toJson())?.toList(),
      'scoreRanges': instance.scoreRanges?.map((e) => e?.toJson())?.toList(),
    };

Questionnaire$Query _$Questionnaire$QueryFromJson(Map<String, dynamic> json) {
  return Questionnaire$Query()
    ..questionnaire = json['questionnaire'] == null
        ? null
        : Questionnaire$Query$Questionnaire.fromJson(json['questionnaire'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Questionnaire$QueryToJson(Questionnaire$Query instance) => <String, dynamic>{
      'questionnaire': instance.questionnaire?.toJson(),
    };

Questionnaires$Query$Questionnaires$Results$Questions$PossibleChoices
    _$Questionnaires$Query$Questionnaires$Results$Questions$PossibleChoicesFromJson(
        Map<String, dynamic> json) {
  return Questionnaires$Query$Questionnaires$Results$Questions$PossibleChoices()
    ..id = json['id'] as String
    ..text = json['text'] as String
    ..value = json['value'] as int
    ..presentationOrder = json['presentationOrder'] as int;
}

Map<String, dynamic> _$Questionnaires$Query$Questionnaires$Results$Questions$PossibleChoicesToJson(
        Questionnaires$Query$Questionnaires$Results$Questions$PossibleChoices instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'value': instance.value,
      'presentationOrder': instance.presentationOrder,
    };

Questionnaires$Query$Questionnaires$Results$Questions
    _$Questionnaires$Query$Questionnaires$Results$QuestionsFromJson(Map<String, dynamic> json) {
  return Questionnaires$Query$Questionnaires$Results$Questions()
    ..id = json['id'] as String
    ..text = json['text'] as String
    ..kind = _$enumDecodeNullable(_$QuestionnaireQuestionKindEnumMap, json['kind'],
        unknownValue: QuestionnaireQuestionKind.artemisUnknown)
    ..presentationOrder = json['presentationOrder'] as int
    ..possibleChoices = (json['possibleChoices'] as List)
        ?.map((e) => e == null
            ? null
            : Questionnaires$Query$Questionnaires$Results$Questions$PossibleChoices.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Questionnaires$Query$Questionnaires$Results$QuestionsToJson(
        Questionnaires$Query$Questionnaires$Results$Questions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'kind': _$QuestionnaireQuestionKindEnumMap[instance.kind],
      'presentationOrder': instance.presentationOrder,
      'possibleChoices': instance.possibleChoices?.map((e) => e?.toJson())?.toList(),
    };

Questionnaires$Query$Questionnaires$Results _$Questionnaires$Query$Questionnaires$ResultsFromJson(
    Map<String, dynamic> json) {
  return Questionnaires$Query$Questionnaires$Results()
    ..id = json['id'] as String
    ..nameForPresentation = json['nameForPresentation'] as String
    ..questions = (json['questions'] as List)
        ?.map((e) => e == null
            ? null
            : Questionnaires$Query$Questionnaires$Results$Questions.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Questionnaires$Query$Questionnaires$ResultsToJson(
        Questionnaires$Query$Questionnaires$Results instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameForPresentation': instance.nameForPresentation,
      'questions': instance.questions?.map((e) => e?.toJson())?.toList(),
    };

Questionnaires$Query$Questionnaires _$Questionnaires$Query$QuestionnairesFromJson(
    Map<String, dynamic> json) {
  return Questionnaires$Query$Questionnaires()
    ..totalResultsCount = json['totalResultsCount'] as int
    ..hasMorePages = json['hasMorePages'] as bool
    ..results = (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : Questionnaires$Query$Questionnaires$Results.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Questionnaires$Query$QuestionnairesToJson(
        Questionnaires$Query$Questionnaires instance) =>
    <String, dynamic>{
      'totalResultsCount': instance.totalResultsCount,
      'hasMorePages': instance.hasMorePages,
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
    };

Questionnaires$Query _$Questionnaires$QueryFromJson(Map<String, dynamic> json) {
  return Questionnaires$Query()
    ..questionnaires = json['questionnaires'] == null
        ? null
        : Questionnaires$Query$Questionnaires.fromJson(
            json['questionnaires'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Questionnaires$QueryToJson(Questionnaires$Query instance) =>
    <String, dynamic>{
      'questionnaires': instance.questionnaires?.toJson(),
    };

CurrentUser$Query$CurrentUser _$CurrentUser$Query$CurrentUserFromJson(Map<String, dynamic> json) {
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
        : CurrentUser$Query$CurrentUser.fromJson(json['currentUser'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CurrentUser$QueryToJson(CurrentUser$Query instance) => <String, dynamic>{
      'currentUser': instance.currentUser?.toJson(),
    };

Responses$Query$QuestionnaireResponses$Results$Questionnaire
    _$Responses$Query$QuestionnaireResponses$Results$QuestionnaireFromJson(
        Map<String, dynamic> json) {
  return Responses$Query$QuestionnaireResponses$Results$Questionnaire()
    ..id = json['id'] as String
    ..nameForPresentation = json['nameForPresentation'] as String;
}

Map<String, dynamic> _$Responses$Query$QuestionnaireResponses$Results$QuestionnaireToJson(
        Responses$Query$QuestionnaireResponses$Results$Questionnaire instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameForPresentation': instance.nameForPresentation,
    };

Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$Question
    _$Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$QuestionFromJson(
        Map<String, dynamic> json) {
  return Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$Question()
    ..id = json['id'] as String
    ..text = json['text'] as String;
}

Map<String, dynamic>
    _$Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$QuestionToJson(
            Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$Question instance) =>
        <String, dynamic>{
          'id': instance.id,
          'text': instance.text,
        };

Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$SelectedChoice
    _$Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$SelectedChoiceFromJson(
        Map<String, dynamic> json) {
  return Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$SelectedChoice()
    ..id = json['id'] as String
    ..text = json['text'] as String;
}

Map<String,
    dynamic> _$Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$SelectedChoiceToJson(
        Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$SelectedChoice instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
    };

Responses$Query$QuestionnaireResponses$Results$QuestionAnswers
    _$Responses$Query$QuestionnaireResponses$Results$QuestionAnswersFromJson(
        Map<String, dynamic> json) {
  return Responses$Query$QuestionnaireResponses$Results$QuestionAnswers()
    ..question = json['question'] == null
        ? null
        : Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$Question.fromJson(
            json['question'] as Map<String, dynamic>)
    ..selectedChoice = json['selectedChoice'] == null
        ? null
        : Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$SelectedChoice.fromJson(
            json['selectedChoice'] as Map<String, dynamic>)
    ..writtenText = json['writtenText'] as String;
}

Map<String, dynamic> _$Responses$Query$QuestionnaireResponses$Results$QuestionAnswersToJson(
        Responses$Query$QuestionnaireResponses$Results$QuestionAnswers instance) =>
    <String, dynamic>{
      'question': instance.question?.toJson(),
      'selectedChoice': instance.selectedChoice?.toJson(),
      'writtenText': instance.writtenText,
    };

Responses$Query$QuestionnaireResponses$Results$Score
    _$Responses$Query$QuestionnaireResponses$Results$ScoreFromJson(Map<String, dynamic> json) {
  return Responses$Query$QuestionnaireResponses$Results$Score()
    ..value = json['value'] as int
    ..color = _$enumDecodeNullable(_$QuestionnaireScoreRangeColorEnumMap, json['color'],
        unknownValue: QuestionnaireScoreRangeColor.artemisUnknown)
    ..title = json['title'] as String;
}

Map<String, dynamic> _$Responses$Query$QuestionnaireResponses$Results$ScoreToJson(
        Responses$Query$QuestionnaireResponses$Results$Score instance) =>
    <String, dynamic>{
      'value': instance.value,
      'color': _$QuestionnaireScoreRangeColorEnumMap[instance.color],
      'title': instance.title,
    };

Responses$Query$QuestionnaireResponses$Results
    _$Responses$Query$QuestionnaireResponses$ResultsFromJson(Map<String, dynamic> json) {
  return Responses$Query$QuestionnaireResponses$Results()
    ..id = json['id'] as String
    ..responseDate = fromGraphQLDateTimeToDartDateTime(json['responseDate'] as String)
    ..questionnaire = json['questionnaire'] == null
        ? null
        : Responses$Query$QuestionnaireResponses$Results$Questionnaire.fromJson(
            json['questionnaire'] as Map<String, dynamic>)
    ..questionAnswers = (json['questionAnswers'] as List)
        ?.map((e) => e == null
            ? null
            : Responses$Query$QuestionnaireResponses$Results$QuestionAnswers.fromJson(
                e as Map<String, dynamic>))
        ?.toList()
    ..score = json['score'] == null
        ? null
        : Responses$Query$QuestionnaireResponses$Results$Score.fromJson(
            json['score'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Responses$Query$QuestionnaireResponses$ResultsToJson(
        Responses$Query$QuestionnaireResponses$Results instance) =>
    <String, dynamic>{
      'id': instance.id,
      'responseDate': fromDartDateTimeToGraphQLDateTime(instance.responseDate),
      'questionnaire': instance.questionnaire?.toJson(),
      'questionAnswers': instance.questionAnswers?.map((e) => e?.toJson())?.toList(),
      'score': instance.score?.toJson(),
    };

Responses$Query$QuestionnaireResponses _$Responses$Query$QuestionnaireResponsesFromJson(
    Map<String, dynamic> json) {
  return Responses$Query$QuestionnaireResponses()
    ..results = (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : Responses$Query$QuestionnaireResponses$Results.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Responses$Query$QuestionnaireResponsesToJson(
        Responses$Query$QuestionnaireResponses instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
    };

Responses$Query _$Responses$QueryFromJson(Map<String, dynamic> json) {
  return Responses$Query()
    ..questionnaireResponses = json['questionnaireResponses'] == null
        ? null
        : Responses$Query$QuestionnaireResponses.fromJson(
            json['questionnaireResponses'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Responses$QueryToJson(Responses$Query instance) => <String, dynamic>{
      'questionnaireResponses': instance.questionnaireResponses?.toJson(),
    };

CreateResponseArguments _$CreateResponseArgumentsFromJson(Map<String, dynamic> json) {
  return CreateResponseArguments(
    response: json['response'] == null
        ? null
        : QuestionnaireResponseInput.fromJson(json['response'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateResponseArgumentsToJson(CreateResponseArguments instance) =>
    <String, dynamic>{
      'response': instance.response?.toJson(),
    };

LoginArguments _$LoginArgumentsFromJson(Map<String, dynamic> json) {
  return LoginArguments(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$LoginArgumentsToJson(LoginArguments instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

QuestionnaireArguments _$QuestionnaireArgumentsFromJson(Map<String, dynamic> json) {
  return QuestionnaireArguments(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$QuestionnaireArgumentsToJson(QuestionnaireArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

ResponsesArguments _$ResponsesArgumentsFromJson(Map<String, dynamic> json) {
  return ResponsesArguments(
    id: json['id'] as String,
    responseDateAfter: fromGraphQLDateTimeToDartDateTime(json['responseDateAfter'] as String),
    responseDateBefore: fromGraphQLDateTimeToDartDateTime(json['responseDateBefore'] as String),
  );
}

Map<String, dynamic> _$ResponsesArgumentsToJson(ResponsesArguments instance) => <String, dynamic>{
      'id': instance.id,
      'responseDateAfter': fromDartDateTimeToGraphQLDateTime(instance.responseDateAfter),
      'responseDateBefore': fromDartDateTimeToGraphQLDateTime(instance.responseDateBefore),
    };
