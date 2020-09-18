// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateResponse$Mutation$CreateSymptomQuestionnaireResponse$Score
    _$CreateResponse$Mutation$CreateSymptomQuestionnaireResponse$ScoreFromJson(
        Map<String, dynamic> json) {
  return CreateResponse$Mutation$CreateSymptomQuestionnaireResponse$Score()
    ..value = json['value'] as int
    ..color = _$enumDecodeNullable(
        _$SymptomQuestionnaireScoreRangeColorEnumMap, json['color'],
        unknownValue: SymptomQuestionnaireScoreRangeColor.artemisUnknown)
    ..title = json['title'] as String
    ..description = json['description'] as String;
}

Map<String, dynamic>
    _$CreateResponse$Mutation$CreateSymptomQuestionnaireResponse$ScoreToJson(
            CreateResponse$Mutation$CreateSymptomQuestionnaireResponse$Score
                instance) =>
        <String, dynamic>{
          'value': instance.value,
          'color': _$SymptomQuestionnaireScoreRangeColorEnumMap[instance.color],
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

const _$SymptomQuestionnaireScoreRangeColorEnumMap = {
  SymptomQuestionnaireScoreRangeColor.green: 'GREEN',
  SymptomQuestionnaireScoreRangeColor.greenYellow: 'GREEN_YELLOW',
  SymptomQuestionnaireScoreRangeColor.yellow: 'YELLOW',
  SymptomQuestionnaireScoreRangeColor.orange: 'ORANGE',
  SymptomQuestionnaireScoreRangeColor.red: 'RED',
  SymptomQuestionnaireScoreRangeColor.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

CreateResponse$Mutation$CreateSymptomQuestionnaireResponse
    _$CreateResponse$Mutation$CreateSymptomQuestionnaireResponseFromJson(
        Map<String, dynamic> json) {
  return CreateResponse$Mutation$CreateSymptomQuestionnaireResponse()
    ..id = json['id'] as String
    ..score = json['score'] == null
        ? null
        : CreateResponse$Mutation$CreateSymptomQuestionnaireResponse$Score
            .fromJson(json['score'] as Map<String, dynamic>);
}

Map<String,
    dynamic> _$CreateResponse$Mutation$CreateSymptomQuestionnaireResponseToJson(
        CreateResponse$Mutation$CreateSymptomQuestionnaireResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'score': instance.score?.toJson(),
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

const _$SymptomQuestionnaireQuestionKindEnumMap = {
  SymptomQuestionnaireQuestionKind.multipleChoice: 'MULTIPLE_CHOICE',
  SymptomQuestionnaireQuestionKind.freeResponse: 'FREE_RESPONSE',
  SymptomQuestionnaireQuestionKind.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

Questionnaire$Query$SymptomQuestionnaire$ScoreRanges
    _$Questionnaire$Query$SymptomQuestionnaire$ScoreRangesFromJson(
        Map<String, dynamic> json) {
  return Questionnaire$Query$SymptomQuestionnaire$ScoreRanges()
    ..id = json['id'] as String
    ..title = json['title'] as String
    ..description = json['description'] as String
    ..color = _$enumDecodeNullable(
        _$SymptomQuestionnaireScoreRangeColorEnumMap, json['color'],
        unknownValue: SymptomQuestionnaireScoreRangeColor.artemisUnknown)
    ..minScore = json['minScore'] as int
    ..maxScore = json['maxScore'] as int;
}

Map<String, dynamic>
    _$Questionnaire$Query$SymptomQuestionnaire$ScoreRangesToJson(
            Questionnaire$Query$SymptomQuestionnaire$ScoreRanges instance) =>
        <String, dynamic>{
          'id': instance.id,
          'title': instance.title,
          'description': instance.description,
          'color': _$SymptomQuestionnaireScoreRangeColorEnumMap[instance.color],
          'minScore': instance.minScore,
          'maxScore': instance.maxScore,
        };

Questionnaire$Query$SymptomQuestionnaire
    _$Questionnaire$Query$SymptomQuestionnaireFromJson(
        Map<String, dynamic> json) {
  return Questionnaire$Query$SymptomQuestionnaire()
    ..id = json['id'] as String
    ..version = json['version'] as int
    ..nameForPresentation = json['nameForPresentation'] as String
    ..questions = (json['questions'] as List)
        ?.map((e) => e == null
            ? null
            : Questionnaire$Query$SymptomQuestionnaire$Questions.fromJson(
                e as Map<String, dynamic>))
        ?.toList()
    ..scoreRanges = (json['scoreRanges'] as List)
        ?.map((e) => e == null
            ? null
            : Questionnaire$Query$SymptomQuestionnaire$ScoreRanges.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Questionnaire$Query$SymptomQuestionnaireToJson(
        Questionnaire$Query$SymptomQuestionnaire instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'nameForPresentation': instance.nameForPresentation,
      'questions': instance.questions?.map((e) => e?.toJson())?.toList(),
      'scoreRanges': instance.scoreRanges?.map((e) => e?.toJson())?.toList(),
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

Responses$Query$SymptomQuestionnaireResponses$Results$Questionnaire
    _$Responses$Query$SymptomQuestionnaireResponses$Results$QuestionnaireFromJson(
        Map<String, dynamic> json) {
  return Responses$Query$SymptomQuestionnaireResponses$Results$Questionnaire()
    ..id = json['id'] as String
    ..nameForPresentation = json['nameForPresentation'] as String;
}

Map<String, dynamic>
    _$Responses$Query$SymptomQuestionnaireResponses$Results$QuestionnaireToJson(
            Responses$Query$SymptomQuestionnaireResponses$Results$Questionnaire
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'nameForPresentation': instance.nameForPresentation,
        };

Responses$Query$SymptomQuestionnaireResponses$Results$QuestionAnswers$Question
    _$Responses$Query$SymptomQuestionnaireResponses$Results$QuestionAnswers$QuestionFromJson(
        Map<String, dynamic> json) {
  return Responses$Query$SymptomQuestionnaireResponses$Results$QuestionAnswers$Question()
    ..id = json['id'] as String
    ..text = json['text'] as String;
}

Map<String, dynamic>
    _$Responses$Query$SymptomQuestionnaireResponses$Results$QuestionAnswers$QuestionToJson(
            Responses$Query$SymptomQuestionnaireResponses$Results$QuestionAnswers$Question
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'text': instance.text,
        };

Responses$Query$SymptomQuestionnaireResponses$Results$QuestionAnswers$SelectedChoice
    _$Responses$Query$SymptomQuestionnaireResponses$Results$QuestionAnswers$SelectedChoiceFromJson(
        Map<String, dynamic> json) {
  return Responses$Query$SymptomQuestionnaireResponses$Results$QuestionAnswers$SelectedChoice()
    ..id = json['id'] as String
    ..text = json['text'] as String;
}

Map<String, dynamic>
    _$Responses$Query$SymptomQuestionnaireResponses$Results$QuestionAnswers$SelectedChoiceToJson(
            Responses$Query$SymptomQuestionnaireResponses$Results$QuestionAnswers$SelectedChoice
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'text': instance.text,
        };

Responses$Query$SymptomQuestionnaireResponses$Results$QuestionAnswers
    _$Responses$Query$SymptomQuestionnaireResponses$Results$QuestionAnswersFromJson(
        Map<String, dynamic> json) {
  return Responses$Query$SymptomQuestionnaireResponses$Results$QuestionAnswers()
    ..question = json['question'] == null
        ? null
        : Responses$Query$SymptomQuestionnaireResponses$Results$QuestionAnswers$Question
            .fromJson(json['question'] as Map<String, dynamic>)
    ..selectedChoice = json['selectedChoice'] == null
        ? null
        : Responses$Query$SymptomQuestionnaireResponses$Results$QuestionAnswers$SelectedChoice
            .fromJson(json['selectedChoice'] as Map<String, dynamic>)
    ..writtenText = json['writtenText'] as String;
}

Map<String, dynamic>
    _$Responses$Query$SymptomQuestionnaireResponses$Results$QuestionAnswersToJson(
            Responses$Query$SymptomQuestionnaireResponses$Results$QuestionAnswers
                instance) =>
        <String, dynamic>{
          'question': instance.question?.toJson(),
          'selectedChoice': instance.selectedChoice?.toJson(),
          'writtenText': instance.writtenText,
        };

Responses$Query$SymptomQuestionnaireResponses$Results$Score
    _$Responses$Query$SymptomQuestionnaireResponses$Results$ScoreFromJson(
        Map<String, dynamic> json) {
  return Responses$Query$SymptomQuestionnaireResponses$Results$Score()
    ..value = json['value'] as int
    ..color = _$enumDecodeNullable(
        _$SymptomQuestionnaireScoreRangeColorEnumMap, json['color'],
        unknownValue: SymptomQuestionnaireScoreRangeColor.artemisUnknown)
    ..title = json['title'] as String;
}

Map<String, dynamic>
    _$Responses$Query$SymptomQuestionnaireResponses$Results$ScoreToJson(
            Responses$Query$SymptomQuestionnaireResponses$Results$Score
                instance) =>
        <String, dynamic>{
          'value': instance.value,
          'color': _$SymptomQuestionnaireScoreRangeColorEnumMap[instance.color],
          'title': instance.title,
        };

Responses$Query$SymptomQuestionnaireResponses$Results
    _$Responses$Query$SymptomQuestionnaireResponses$ResultsFromJson(
        Map<String, dynamic> json) {
  return Responses$Query$SymptomQuestionnaireResponses$Results()
    ..id = json['id'] as String
    ..responseDate =
        fromGraphQLDateTimeToDartDateTime(json['responseDate'] as String)
    ..questionnaire = json['questionnaire'] == null
        ? null
        : Responses$Query$SymptomQuestionnaireResponses$Results$Questionnaire
            .fromJson(json['questionnaire'] as Map<String, dynamic>)
    ..questionAnswers = (json['questionAnswers'] as List)
        ?.map((e) => e == null
            ? null
            : Responses$Query$SymptomQuestionnaireResponses$Results$QuestionAnswers
                .fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..score = json['score'] == null
        ? null
        : Responses$Query$SymptomQuestionnaireResponses$Results$Score.fromJson(
            json['score'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$Responses$Query$SymptomQuestionnaireResponses$ResultsToJson(
            Responses$Query$SymptomQuestionnaireResponses$Results instance) =>
        <String, dynamic>{
          'id': instance.id,
          'responseDate':
              fromDartDateTimeToGraphQLDateTime(instance.responseDate),
          'questionnaire': instance.questionnaire?.toJson(),
          'questionAnswers':
              instance.questionAnswers?.map((e) => e?.toJson())?.toList(),
          'score': instance.score?.toJson(),
        };

Responses$Query$SymptomQuestionnaireResponses
    _$Responses$Query$SymptomQuestionnaireResponsesFromJson(
        Map<String, dynamic> json) {
  return Responses$Query$SymptomQuestionnaireResponses()
    ..results = (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : Responses$Query$SymptomQuestionnaireResponses$Results.fromJson(
                e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$Responses$Query$SymptomQuestionnaireResponsesToJson(
        Responses$Query$SymptomQuestionnaireResponses instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
    };

Responses$Query _$Responses$QueryFromJson(Map<String, dynamic> json) {
  return Responses$Query()
    ..symptomQuestionnaireResponses =
        json['symptomQuestionnaireResponses'] == null
            ? null
            : Responses$Query$SymptomQuestionnaireResponses.fromJson(
                json['symptomQuestionnaireResponses'] as Map<String, dynamic>);
}

Map<String, dynamic> _$Responses$QueryToJson(Responses$Query instance) =>
    <String, dynamic>{
      'symptomQuestionnaireResponses':
          instance.symptomQuestionnaireResponses?.toJson(),
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

ResponsesArguments _$ResponsesArgumentsFromJson(Map<String, dynamic> json) {
  return ResponsesArguments(
    id: json['id'] as String,
    responseDateAfter:
        fromGraphQLDateTimeToDartDateTime(json['responseDateAfter'] as String),
    responseDateBefore:
        fromGraphQLDateTimeToDartDateTime(json['responseDateBefore'] as String),
  );
}

Map<String, dynamic> _$ResponsesArgumentsToJson(ResponsesArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'responseDateAfter':
          fromDartDateTimeToGraphQLDateTime(instance.responseDateAfter),
      'responseDateBefore':
          fromDartDateTimeToGraphQLDateTime(instance.responseDateBefore),
    };
