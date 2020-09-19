// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:luftcare_flutter_app/coercers.dart';
part 'api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateResponse$Mutation$CreateQuestionnaireResponse$Score with EquatableMixin {
  CreateResponse$Mutation$CreateQuestionnaireResponse$Score();

  factory CreateResponse$Mutation$CreateQuestionnaireResponse$Score.fromJson(
          Map<String, dynamic> json) =>
      _$CreateResponse$Mutation$CreateQuestionnaireResponse$ScoreFromJson(json);

  int value;

  @JsonKey(unknownEnumValue: QuestionnaireScoreRangeColor.artemisUnknown)
  QuestionnaireScoreRangeColor color;

  String title;

  String description;

  @override
  List<Object> get props => [value, color, title, description];
  Map<String, dynamic> toJson() =>
      _$CreateResponse$Mutation$CreateQuestionnaireResponse$ScoreToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateResponse$Mutation$CreateQuestionnaireResponse with EquatableMixin {
  CreateResponse$Mutation$CreateQuestionnaireResponse();

  factory CreateResponse$Mutation$CreateQuestionnaireResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateResponse$Mutation$CreateQuestionnaireResponseFromJson(json);

  String id;

  CreateResponse$Mutation$CreateQuestionnaireResponse$Score score;

  @override
  List<Object> get props => [id, score];
  Map<String, dynamic> toJson() =>
      _$CreateResponse$Mutation$CreateQuestionnaireResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateResponse$Mutation with EquatableMixin {
  CreateResponse$Mutation();

  factory CreateResponse$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateResponse$MutationFromJson(json);

  CreateResponse$Mutation$CreateQuestionnaireResponse createQuestionnaireResponse;

  @override
  List<Object> get props => [createQuestionnaireResponse];
  Map<String, dynamic> toJson() => _$CreateResponse$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class QuestionnaireResponseAnswerInput with EquatableMixin {
  QuestionnaireResponseAnswerInput(
      {@required this.questionId, @required this.choiceId, this.writtenText});

  factory QuestionnaireResponseAnswerInput.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireResponseAnswerInputFromJson(json);

  String questionId;

  String choiceId;

  String writtenText;

  @override
  List<Object> get props => [questionId, choiceId, writtenText];
  Map<String, dynamic> toJson() => _$QuestionnaireResponseAnswerInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class QuestionnaireResponseInput with EquatableMixin {
  QuestionnaireResponseInput(
      {@required this.responseDate,
      @required this.userId,
      @required this.questionnaireId,
      @required this.questionnaireVersion,
      @required this.questionAnswers});

  factory QuestionnaireResponseInput.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireResponseInputFromJson(json);

  @JsonKey(
    fromJson: fromGraphQLDateTimeToDartDateTime,
    toJson: fromDartDateTimeToGraphQLDateTime,
  )
  DateTime responseDate;

  String userId;

  String questionnaireId;

  int questionnaireVersion;

  List<QuestionnaireResponseAnswerInput> questionAnswers;

  @override
  List<Object> get props =>
      [responseDate, userId, questionnaireId, questionnaireVersion, questionAnswers];
  Map<String, dynamic> toJson() => _$QuestionnaireResponseInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Login$Mutation$Login with EquatableMixin {
  Login$Mutation$Login();

  factory Login$Mutation$Login.fromJson(Map<String, dynamic> json) =>
      _$Login$Mutation$LoginFromJson(json);

  String authorization;

  String refresh;

  @override
  List<Object> get props => [authorization, refresh];
  Map<String, dynamic> toJson() => _$Login$Mutation$LoginToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Login$Mutation with EquatableMixin {
  Login$Mutation();

  factory Login$Mutation.fromJson(Map<String, dynamic> json) => _$Login$MutationFromJson(json);

  Login$Mutation$Login login;

  @override
  List<Object> get props => [login];
  Map<String, dynamic> toJson() => _$Login$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Questionnaire$Query$Questionnaire$Questions$PossibleChoices with EquatableMixin {
  Questionnaire$Query$Questionnaire$Questions$PossibleChoices();

  factory Questionnaire$Query$Questionnaire$Questions$PossibleChoices.fromJson(
          Map<String, dynamic> json) =>
      _$Questionnaire$Query$Questionnaire$Questions$PossibleChoicesFromJson(json);

  String id;

  String text;

  int value;

  int presentationOrder;

  @override
  List<Object> get props => [id, text, value, presentationOrder];
  Map<String, dynamic> toJson() =>
      _$Questionnaire$Query$Questionnaire$Questions$PossibleChoicesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Questionnaire$Query$Questionnaire$Questions with EquatableMixin {
  Questionnaire$Query$Questionnaire$Questions();

  factory Questionnaire$Query$Questionnaire$Questions.fromJson(Map<String, dynamic> json) =>
      _$Questionnaire$Query$Questionnaire$QuestionsFromJson(json);

  String id;

  String text;

  int presentationOrder;

  @JsonKey(unknownEnumValue: QuestionnaireQuestionKind.artemisUnknown)
  QuestionnaireQuestionKind kind;

  List<Questionnaire$Query$Questionnaire$Questions$PossibleChoices> possibleChoices;

  @override
  List<Object> get props => [id, text, presentationOrder, kind, possibleChoices];
  Map<String, dynamic> toJson() => _$Questionnaire$Query$Questionnaire$QuestionsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Questionnaire$Query$Questionnaire$ScoreRanges with EquatableMixin {
  Questionnaire$Query$Questionnaire$ScoreRanges();

  factory Questionnaire$Query$Questionnaire$ScoreRanges.fromJson(Map<String, dynamic> json) =>
      _$Questionnaire$Query$Questionnaire$ScoreRangesFromJson(json);

  String id;

  String title;

  String description;

  @JsonKey(unknownEnumValue: QuestionnaireScoreRangeColor.artemisUnknown)
  QuestionnaireScoreRangeColor color;

  int minScore;

  int maxScore;

  @override
  List<Object> get props => [id, title, description, color, minScore, maxScore];
  Map<String, dynamic> toJson() => _$Questionnaire$Query$Questionnaire$ScoreRangesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Questionnaire$Query$Questionnaire with EquatableMixin {
  Questionnaire$Query$Questionnaire();

  factory Questionnaire$Query$Questionnaire.fromJson(Map<String, dynamic> json) =>
      _$Questionnaire$Query$QuestionnaireFromJson(json);

  String id;

  int version;

  String nameForPresentation;

  List<Questionnaire$Query$Questionnaire$Questions> questions;

  List<Questionnaire$Query$Questionnaire$ScoreRanges> scoreRanges;

  @override
  List<Object> get props => [id, version, nameForPresentation, questions, scoreRanges];
  Map<String, dynamic> toJson() => _$Questionnaire$Query$QuestionnaireToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Questionnaire$Query with EquatableMixin {
  Questionnaire$Query();

  factory Questionnaire$Query.fromJson(Map<String, dynamic> json) =>
      _$Questionnaire$QueryFromJson(json);

  Questionnaire$Query$Questionnaire questionnaire;

  @override
  List<Object> get props => [questionnaire];
  Map<String, dynamic> toJson() => _$Questionnaire$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Questionnaires$Query$Questionnaires$Results$Questions$PossibleChoices with EquatableMixin {
  Questionnaires$Query$Questionnaires$Results$Questions$PossibleChoices();

  factory Questionnaires$Query$Questionnaires$Results$Questions$PossibleChoices.fromJson(
          Map<String, dynamic> json) =>
      _$Questionnaires$Query$Questionnaires$Results$Questions$PossibleChoicesFromJson(json);

  String id;

  String text;

  int value;

  int presentationOrder;

  @override
  List<Object> get props => [id, text, value, presentationOrder];
  Map<String, dynamic> toJson() =>
      _$Questionnaires$Query$Questionnaires$Results$Questions$PossibleChoicesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Questionnaires$Query$Questionnaires$Results$Questions with EquatableMixin {
  Questionnaires$Query$Questionnaires$Results$Questions();

  factory Questionnaires$Query$Questionnaires$Results$Questions.fromJson(
          Map<String, dynamic> json) =>
      _$Questionnaires$Query$Questionnaires$Results$QuestionsFromJson(json);

  String id;

  String text;

  @JsonKey(unknownEnumValue: QuestionnaireQuestionKind.artemisUnknown)
  QuestionnaireQuestionKind kind;

  int presentationOrder;

  List<Questionnaires$Query$Questionnaires$Results$Questions$PossibleChoices> possibleChoices;

  @override
  List<Object> get props => [id, text, kind, presentationOrder, possibleChoices];
  Map<String, dynamic> toJson() =>
      _$Questionnaires$Query$Questionnaires$Results$QuestionsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Questionnaires$Query$Questionnaires$Results with EquatableMixin {
  Questionnaires$Query$Questionnaires$Results();

  factory Questionnaires$Query$Questionnaires$Results.fromJson(Map<String, dynamic> json) =>
      _$Questionnaires$Query$Questionnaires$ResultsFromJson(json);

  String id;

  String nameForPresentation;

  List<Questionnaires$Query$Questionnaires$Results$Questions> questions;

  @override
  List<Object> get props => [id, nameForPresentation, questions];
  Map<String, dynamic> toJson() => _$Questionnaires$Query$Questionnaires$ResultsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Questionnaires$Query$Questionnaires with EquatableMixin {
  Questionnaires$Query$Questionnaires();

  factory Questionnaires$Query$Questionnaires.fromJson(Map<String, dynamic> json) =>
      _$Questionnaires$Query$QuestionnairesFromJson(json);

  int totalResultsCount;

  bool hasMorePages;

  List<Questionnaires$Query$Questionnaires$Results> results;

  @override
  List<Object> get props => [totalResultsCount, hasMorePages, results];
  Map<String, dynamic> toJson() => _$Questionnaires$Query$QuestionnairesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Questionnaires$Query with EquatableMixin {
  Questionnaires$Query();

  factory Questionnaires$Query.fromJson(Map<String, dynamic> json) =>
      _$Questionnaires$QueryFromJson(json);

  Questionnaires$Query$Questionnaires questionnaires;

  @override
  List<Object> get props => [questionnaires];
  Map<String, dynamic> toJson() => _$Questionnaires$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentUser$Query$CurrentUser with EquatableMixin {
  CurrentUser$Query$CurrentUser();

  factory CurrentUser$Query$CurrentUser.fromJson(Map<String, dynamic> json) =>
      _$CurrentUser$Query$CurrentUserFromJson(json);

  String id;

  String name;

  String email;

  String phoneNumber;

  @JsonKey(unknownEnumValue: UserRole.artemisUnknown)
  UserRole role;

  @override
  List<Object> get props => [id, name, email, phoneNumber, role];
  Map<String, dynamic> toJson() => _$CurrentUser$Query$CurrentUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentUser$Query with EquatableMixin {
  CurrentUser$Query();

  factory CurrentUser$Query.fromJson(Map<String, dynamic> json) =>
      _$CurrentUser$QueryFromJson(json);

  CurrentUser$Query$CurrentUser currentUser;

  @override
  List<Object> get props => [currentUser];
  Map<String, dynamic> toJson() => _$CurrentUser$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Responses$Query$QuestionnaireResponses$Results$Questionnaire with EquatableMixin {
  Responses$Query$QuestionnaireResponses$Results$Questionnaire();

  factory Responses$Query$QuestionnaireResponses$Results$Questionnaire.fromJson(
          Map<String, dynamic> json) =>
      _$Responses$Query$QuestionnaireResponses$Results$QuestionnaireFromJson(json);

  String id;

  String nameForPresentation;

  @override
  List<Object> get props => [id, nameForPresentation];
  Map<String, dynamic> toJson() =>
      _$Responses$Query$QuestionnaireResponses$Results$QuestionnaireToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$Question with EquatableMixin {
  Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$Question();

  factory Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$Question.fromJson(
          Map<String, dynamic> json) =>
      _$Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$QuestionFromJson(json);

  String id;

  String text;

  @override
  List<Object> get props => [id, text];
  Map<String, dynamic> toJson() =>
      _$Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$QuestionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$SelectedChoice
    with EquatableMixin {
  Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$SelectedChoice();

  factory Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$SelectedChoice.fromJson(
          Map<String, dynamic> json) =>
      _$Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$SelectedChoiceFromJson(json);

  String id;

  String text;

  @override
  List<Object> get props => [id, text];
  Map<String, dynamic> toJson() =>
      _$Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$SelectedChoiceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Responses$Query$QuestionnaireResponses$Results$QuestionAnswers with EquatableMixin {
  Responses$Query$QuestionnaireResponses$Results$QuestionAnswers();

  factory Responses$Query$QuestionnaireResponses$Results$QuestionAnswers.fromJson(
          Map<String, dynamic> json) =>
      _$Responses$Query$QuestionnaireResponses$Results$QuestionAnswersFromJson(json);

  Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$Question question;

  Responses$Query$QuestionnaireResponses$Results$QuestionAnswers$SelectedChoice selectedChoice;

  String writtenText;

  @override
  List<Object> get props => [question, selectedChoice, writtenText];
  Map<String, dynamic> toJson() =>
      _$Responses$Query$QuestionnaireResponses$Results$QuestionAnswersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Responses$Query$QuestionnaireResponses$Results$Score with EquatableMixin {
  Responses$Query$QuestionnaireResponses$Results$Score();

  factory Responses$Query$QuestionnaireResponses$Results$Score.fromJson(
          Map<String, dynamic> json) =>
      _$Responses$Query$QuestionnaireResponses$Results$ScoreFromJson(json);

  int value;

  @JsonKey(unknownEnumValue: QuestionnaireScoreRangeColor.artemisUnknown)
  QuestionnaireScoreRangeColor color;

  String title;

  @override
  List<Object> get props => [value, color, title];
  Map<String, dynamic> toJson() =>
      _$Responses$Query$QuestionnaireResponses$Results$ScoreToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Responses$Query$QuestionnaireResponses$Results with EquatableMixin {
  Responses$Query$QuestionnaireResponses$Results();

  factory Responses$Query$QuestionnaireResponses$Results.fromJson(Map<String, dynamic> json) =>
      _$Responses$Query$QuestionnaireResponses$ResultsFromJson(json);

  String id;

  @JsonKey(
    fromJson: fromGraphQLDateTimeToDartDateTime,
    toJson: fromDartDateTimeToGraphQLDateTime,
  )
  DateTime responseDate;

  Responses$Query$QuestionnaireResponses$Results$Questionnaire questionnaire;

  List<Responses$Query$QuestionnaireResponses$Results$QuestionAnswers> questionAnswers;

  Responses$Query$QuestionnaireResponses$Results$Score score;

  @override
  List<Object> get props => [id, responseDate, questionnaire, questionAnswers, score];
  Map<String, dynamic> toJson() => _$Responses$Query$QuestionnaireResponses$ResultsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Responses$Query$QuestionnaireResponses with EquatableMixin {
  Responses$Query$QuestionnaireResponses();

  factory Responses$Query$QuestionnaireResponses.fromJson(Map<String, dynamic> json) =>
      _$Responses$Query$QuestionnaireResponsesFromJson(json);

  List<Responses$Query$QuestionnaireResponses$Results> results;

  @override
  List<Object> get props => [results];
  Map<String, dynamic> toJson() => _$Responses$Query$QuestionnaireResponsesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Responses$Query with EquatableMixin {
  Responses$Query();

  factory Responses$Query.fromJson(Map<String, dynamic> json) => _$Responses$QueryFromJson(json);

  Responses$Query$QuestionnaireResponses questionnaireResponses;

  @override
  List<Object> get props => [questionnaireResponses];
  Map<String, dynamic> toJson() => _$Responses$QueryToJson(this);
}

enum QuestionnaireScoreRangeColor {
  @JsonValue("GREEN")
  green,
  @JsonValue("GREEN_YELLOW")
  greenYellow,
  @JsonValue("YELLOW")
  yellow,
  @JsonValue("ORANGE")
  orange,
  @JsonValue("RED")
  red,
  @JsonValue("ARTEMIS_UNKNOWN")
  artemisUnknown,
}
enum QuestionnaireQuestionKind {
  @JsonValue("MULTIPLE_CHOICE")
  multipleChoice,
  @JsonValue("FREE_RESPONSE")
  freeResponse,
  @JsonValue("ARTEMIS_UNKNOWN")
  artemisUnknown,
}
enum UserRole {
  @JsonValue("ADMIN")
  admin,
  @JsonValue("NON_ADMIN")
  nonAdmin,
  @JsonValue("ARTEMIS_UNKNOWN")
  artemisUnknown,
}

@JsonSerializable(explicitToJson: true)
class CreateResponseArguments extends JsonSerializable with EquatableMixin {
  CreateResponseArguments({@required this.response});

  factory CreateResponseArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateResponseArgumentsFromJson(json);

  final QuestionnaireResponseInput response;

  @override
  List<Object> get props => [response];
  Map<String, dynamic> toJson() => _$CreateResponseArgumentsToJson(this);
}

class CreateResponseMutation
    extends GraphQLQuery<CreateResponse$Mutation, CreateResponseArguments> {
  CreateResponseMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'createResponse'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'response')),
              type: NamedTypeNode(
                  name: NameNode(value: 'QuestionnaireResponseInput'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'createQuestionnaireResponse'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'response'),
                    value: VariableNode(name: NameNode(value: 'response')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'score'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'value'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'color'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'title'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'description'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'createResponse';

  @override
  final CreateResponseArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  CreateResponse$Mutation parse(Map<String, dynamic> json) =>
      CreateResponse$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class LoginArguments extends JsonSerializable with EquatableMixin {
  LoginArguments({@required this.email, @required this.password});

  factory LoginArguments.fromJson(Map<String, dynamic> json) => _$LoginArgumentsFromJson(json);

  final String email;

  final String password;

  @override
  List<Object> get props => [email, password];
  Map<String, dynamic> toJson() => _$LoginArgumentsToJson(this);
}

class LoginMutation extends GraphQLQuery<Login$Mutation, LoginArguments> {
  LoginMutation({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.mutation,
        name: NameNode(value: 'login'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'email')),
              type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'password')),
              type: NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'login'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'email'),
                    value: VariableNode(name: NameNode(value: 'email'))),
                ArgumentNode(
                    name: NameNode(value: 'password'),
                    value: VariableNode(name: NameNode(value: 'password')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'authorization'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'refresh'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'login';

  @override
  final LoginArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  Login$Mutation parse(Map<String, dynamic> json) => Login$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class QuestionnaireArguments extends JsonSerializable with EquatableMixin {
  QuestionnaireArguments({@required this.id});

  factory QuestionnaireArguments.fromJson(Map<String, dynamic> json) =>
      _$QuestionnaireArgumentsFromJson(json);

  final String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() => _$QuestionnaireArgumentsToJson(this);
}

class QuestionnaireQuery extends GraphQLQuery<Questionnaire$Query, QuestionnaireArguments> {
  QuestionnaireQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'questionnaire'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'id')),
              type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'questionnaire'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'id'), value: VariableNode(name: NameNode(value: 'id')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'version'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'nameForPresentation'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'questions'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'text'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'presentationOrder'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'kind'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'possibleChoices'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'text'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'value'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'presentationOrder'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ]))
                    ])),
                FieldNode(
                    name: NameNode(value: 'scoreRanges'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'title'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'description'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'color'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'minScore'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'maxScore'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null)
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'questionnaire';

  @override
  final QuestionnaireArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  Questionnaire$Query parse(Map<String, dynamic> json) => Questionnaire$Query.fromJson(json);
}

class QuestionnairesQuery extends GraphQLQuery<Questionnaires$Query, JsonSerializable> {
  QuestionnairesQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'questionnaires'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'questionnaires'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'isPublished'), value: BooleanValueNode(value: true)),
                ArgumentNode(
                    name: NameNode(value: 'currentVersionsOnly'),
                    value: BooleanValueNode(value: true)),
                ArgumentNode(
                    name: NameNode(value: 'orderBy'),
                    value: ListValueNode(values: [
                      ObjectValueNode(fields: [
                        ObjectFieldNode(
                            name: NameNode(value: 'columnName'),
                            value: StringValueNode(value: 'createdAt', isBlock: false)),
                        ObjectFieldNode(
                            name: NameNode(value: 'direction'),
                            value: EnumValueNode(name: NameNode(value: 'DESC')))
                      ])
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'totalResultsCount'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'hasMorePages'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'results'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'nameForPresentation'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'questions'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'text'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'kind'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'presentationOrder'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'possibleChoices'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'id'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'text'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'value'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'presentationOrder'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null)
                                ]))
                          ]))
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'questionnaires';

  @override
  List<Object> get props => [document, operationName];
  @override
  Questionnaires$Query parse(Map<String, dynamic> json) => Questionnaires$Query.fromJson(json);
}

class CurrentUserQuery extends GraphQLQuery<CurrentUser$Query, JsonSerializable> {
  CurrentUserQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'currentUser'),
        variableDefinitions: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'currentUser'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'email'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'phoneNumber'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'role'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ]))
        ]))
  ]);

  @override
  final String operationName = 'currentUser';

  @override
  List<Object> get props => [document, operationName];
  @override
  CurrentUser$Query parse(Map<String, dynamic> json) => CurrentUser$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ResponsesArguments extends JsonSerializable with EquatableMixin {
  ResponsesArguments({@required this.id, this.responseDateAfter, this.responseDateBefore});

  factory ResponsesArguments.fromJson(Map<String, dynamic> json) =>
      _$ResponsesArgumentsFromJson(json);

  final String id;

  @JsonKey(
    fromJson: fromGraphQLDateTimeToDartDateTime,
    toJson: fromDartDateTimeToGraphQLDateTime,
  )
  final DateTime responseDateAfter;

  @JsonKey(
    fromJson: fromGraphQLDateTimeToDartDateTime,
    toJson: fromDartDateTimeToGraphQLDateTime,
  )
  final DateTime responseDateBefore;

  @override
  List<Object> get props => [id, responseDateAfter, responseDateBefore];
  Map<String, dynamic> toJson() => _$ResponsesArgumentsToJson(this);
}

class ResponsesQuery extends GraphQLQuery<Responses$Query, ResponsesArguments> {
  ResponsesQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'responses'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'id')),
              type: NamedTypeNode(name: NameNode(value: 'ID'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'responseDateAfter')),
              type: NamedTypeNode(name: NameNode(value: 'DateTime'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'responseDateBefore')),
              type: NamedTypeNode(name: NameNode(value: 'DateTime'), isNonNull: false),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'questionnaireResponses'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'userId'),
                    value: VariableNode(name: NameNode(value: 'id'))),
                ArgumentNode(name: NameNode(value: 'pageNumber'), value: IntValueNode(value: '1')),
                ArgumentNode(
                    name: NameNode(value: 'resultsPerPage'), value: IntValueNode(value: '100')),
                ArgumentNode(
                    name: NameNode(value: 'responseDateAfter'),
                    value: VariableNode(name: NameNode(value: 'responseDateAfter'))),
                ArgumentNode(
                    name: NameNode(value: 'responseDateBefore'),
                    value: VariableNode(name: NameNode(value: 'responseDateBefore'))),
                ArgumentNode(
                    name: NameNode(value: 'orderBy'),
                    value: ListValueNode(values: [
                      ObjectValueNode(fields: [
                        ObjectFieldNode(
                            name: NameNode(value: 'columnName'),
                            value: StringValueNode(value: 'responseDate', isBlock: false)),
                        ObjectFieldNode(
                            name: NameNode(value: 'direction'),
                            value: EnumValueNode(name: NameNode(value: 'DESC')))
                      ])
                    ]))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'results'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'id'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'responseDate'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'questionnaire'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'id'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'nameForPresentation'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'questionAnswers'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'question'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'id'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'text'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null)
                                ])),
                            FieldNode(
                                name: NameNode(value: 'selectedChoice'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                      name: NameNode(value: 'id'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null),
                                  FieldNode(
                                      name: NameNode(value: 'text'),
                                      alias: null,
                                      arguments: [],
                                      directives: [],
                                      selectionSet: null)
                                ])),
                            FieldNode(
                                name: NameNode(value: 'writtenText'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ])),
                      FieldNode(
                          name: NameNode(value: 'score'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FieldNode(
                                name: NameNode(value: 'value'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'color'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null),
                            FieldNode(
                                name: NameNode(value: 'title'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null)
                          ]))
                    ]))
              ]))
        ]))
  ]);

  @override
  final String operationName = 'responses';

  @override
  final ResponsesArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  Responses$Query parse(Map<String, dynamic> json) => Responses$Query.fromJson(json);
}
