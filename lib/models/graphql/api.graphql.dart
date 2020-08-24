// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:luftcare_flutter_app/coercers.dart';
part 'api.graphql.g.dart';

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

  factory Login$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Login$MutationFromJson(json);

  Login$Mutation$Login login;

  @override
  List<Object> get props => [login];
  Map<String, dynamic> toJson() => _$Login$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Questionnaire$Query$SymptomQuestionnaire$Questions$PossibleChoices
    with EquatableMixin {
  Questionnaire$Query$SymptomQuestionnaire$Questions$PossibleChoices();

  factory Questionnaire$Query$SymptomQuestionnaire$Questions$PossibleChoices.fromJson(
          Map<String, dynamic> json) =>
      _$Questionnaire$Query$SymptomQuestionnaire$Questions$PossibleChoicesFromJson(
          json);

  String id;

  String text;

  int value;

  int presentationOrder;

  @override
  List<Object> get props => [id, text, value, presentationOrder];
  Map<String, dynamic> toJson() =>
      _$Questionnaire$Query$SymptomQuestionnaire$Questions$PossibleChoicesToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class Questionnaire$Query$SymptomQuestionnaire$Questions with EquatableMixin {
  Questionnaire$Query$SymptomQuestionnaire$Questions();

  factory Questionnaire$Query$SymptomQuestionnaire$Questions.fromJson(
          Map<String, dynamic> json) =>
      _$Questionnaire$Query$SymptomQuestionnaire$QuestionsFromJson(json);

  String id;

  String text;

  int presentationOrder;

  @JsonKey(unknownEnumValue: SymptomQuestionnaireQuestionKind.artemisUnknown)
  SymptomQuestionnaireQuestionKind kind;

  List<Questionnaire$Query$SymptomQuestionnaire$Questions$PossibleChoices>
      possibleChoices;

  @override
  List<Object> get props =>
      [id, text, presentationOrder, kind, possibleChoices];
  Map<String, dynamic> toJson() =>
      _$Questionnaire$Query$SymptomQuestionnaire$QuestionsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Questionnaire$Query$SymptomQuestionnaire with EquatableMixin {
  Questionnaire$Query$SymptomQuestionnaire();

  factory Questionnaire$Query$SymptomQuestionnaire.fromJson(
          Map<String, dynamic> json) =>
      _$Questionnaire$Query$SymptomQuestionnaireFromJson(json);

  String id;

  String nameForPresentation;

  List<Questionnaire$Query$SymptomQuestionnaire$Questions> questions;

  @override
  List<Object> get props => [id, nameForPresentation, questions];
  Map<String, dynamic> toJson() =>
      _$Questionnaire$Query$SymptomQuestionnaireToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Questionnaire$Query with EquatableMixin {
  Questionnaire$Query();

  factory Questionnaire$Query.fromJson(Map<String, dynamic> json) =>
      _$Questionnaire$QueryFromJson(json);

  Questionnaire$Query$SymptomQuestionnaire symptomQuestionnaire;

  @override
  List<Object> get props => [symptomQuestionnaire];
  Map<String, dynamic> toJson() => _$Questionnaire$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Questionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoices
    with EquatableMixin {
  Questionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoices();

  factory Questionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoices.fromJson(
          Map<String, dynamic> json) =>
      _$Questionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoicesFromJson(
          json);

  String id;

  String text;

  int value;

  int presentationOrder;

  @override
  List<Object> get props => [id, text, value, presentationOrder];
  Map<String, dynamic> toJson() =>
      _$Questionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoicesToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class Questionnaires$Query$SymptomQuestionnaires$Results$Questions
    with EquatableMixin {
  Questionnaires$Query$SymptomQuestionnaires$Results$Questions();

  factory Questionnaires$Query$SymptomQuestionnaires$Results$Questions.fromJson(
          Map<String, dynamic> json) =>
      _$Questionnaires$Query$SymptomQuestionnaires$Results$QuestionsFromJson(
          json);

  String id;

  String text;

  @JsonKey(unknownEnumValue: SymptomQuestionnaireQuestionKind.artemisUnknown)
  SymptomQuestionnaireQuestionKind kind;

  int presentationOrder;

  List<Questionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoices>
      possibleChoices;

  @override
  List<Object> get props =>
      [id, text, kind, presentationOrder, possibleChoices];
  Map<String, dynamic> toJson() =>
      _$Questionnaires$Query$SymptomQuestionnaires$Results$QuestionsToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class Questionnaires$Query$SymptomQuestionnaires$Results with EquatableMixin {
  Questionnaires$Query$SymptomQuestionnaires$Results();

  factory Questionnaires$Query$SymptomQuestionnaires$Results.fromJson(
          Map<String, dynamic> json) =>
      _$Questionnaires$Query$SymptomQuestionnaires$ResultsFromJson(json);

  String id;

  String nameForPresentation;

  List<Questionnaires$Query$SymptomQuestionnaires$Results$Questions> questions;

  @override
  List<Object> get props => [id, nameForPresentation, questions];
  Map<String, dynamic> toJson() =>
      _$Questionnaires$Query$SymptomQuestionnaires$ResultsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Questionnaires$Query$SymptomQuestionnaires with EquatableMixin {
  Questionnaires$Query$SymptomQuestionnaires();

  factory Questionnaires$Query$SymptomQuestionnaires.fromJson(
          Map<String, dynamic> json) =>
      _$Questionnaires$Query$SymptomQuestionnairesFromJson(json);

  int totalResultsCount;

  bool hasMorePages;

  List<Questionnaires$Query$SymptomQuestionnaires$Results> results;

  @override
  List<Object> get props => [totalResultsCount, hasMorePages, results];
  Map<String, dynamic> toJson() =>
      _$Questionnaires$Query$SymptomQuestionnairesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Questionnaires$Query with EquatableMixin {
  Questionnaires$Query();

  factory Questionnaires$Query.fromJson(Map<String, dynamic> json) =>
      _$Questionnaires$QueryFromJson(json);

  Questionnaires$Query$SymptomQuestionnaires symptomQuestionnaires;

  @override
  List<Object> get props => [symptomQuestionnaires];
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
class CreateResponse$Mutation$CreateSymptomQuestionnaireResponse
    with EquatableMixin {
  CreateResponse$Mutation$CreateSymptomQuestionnaireResponse();

  factory CreateResponse$Mutation$CreateSymptomQuestionnaireResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateResponse$Mutation$CreateSymptomQuestionnaireResponseFromJson(
          json);

  String userFriendlyMessage;

  @override
  List<Object> get props => [userFriendlyMessage];
  Map<String, dynamic> toJson() =>
      _$CreateResponse$Mutation$CreateSymptomQuestionnaireResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateResponse$Mutation with EquatableMixin {
  CreateResponse$Mutation();

  factory CreateResponse$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateResponse$MutationFromJson(json);

  CreateResponse$Mutation$CreateSymptomQuestionnaireResponse
      createSymptomQuestionnaireResponse;

  @override
  List<Object> get props => [createSymptomQuestionnaireResponse];
  Map<String, dynamic> toJson() => _$CreateResponse$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SymptomQuestionnaireResponseAnswerInput with EquatableMixin {
  SymptomQuestionnaireResponseAnswerInput(
      {@required this.questionId, @required this.choiceId, this.writtenText});

  factory SymptomQuestionnaireResponseAnswerInput.fromJson(
          Map<String, dynamic> json) =>
      _$SymptomQuestionnaireResponseAnswerInputFromJson(json);

  String questionId;

  String choiceId;

  String writtenText;

  @override
  List<Object> get props => [questionId, choiceId, writtenText];
  Map<String, dynamic> toJson() =>
      _$SymptomQuestionnaireResponseAnswerInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SymptomQuestionnaireResponseInput with EquatableMixin {
  SymptomQuestionnaireResponseInput(
      {@required this.responseDate,
      @required this.userId,
      @required this.questionnaireId,
      @required this.questionnaireVersion,
      @required this.questionAnswers});

  factory SymptomQuestionnaireResponseInput.fromJson(
          Map<String, dynamic> json) =>
      _$SymptomQuestionnaireResponseInputFromJson(json);

  @JsonKey(
    fromJson: fromGraphQLDateTimeToDartDateTime,
    toJson: fromDartDateTimeToGraphQLDateTime,
  )
  DateTime responseDate;

  String userId;

  String questionnaireId;

  int questionnaireVersion;

  List<SymptomQuestionnaireResponseAnswerInput> questionAnswers;

  @override
  List<Object> get props => [
        responseDate,
        userId,
        questionnaireId,
        questionnaireVersion,
        questionAnswers
      ];
  Map<String, dynamic> toJson() =>
      _$SymptomQuestionnaireResponseInputToJson(this);
}

enum SymptomQuestionnaireQuestionKind {
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
class LoginArguments extends JsonSerializable with EquatableMixin {
  LoginArguments({@required this.email, @required this.password});

  factory LoginArguments.fromJson(Map<String, dynamic> json) =>
      _$LoginArgumentsFromJson(json);

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
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: []),
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'password')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
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
  Login$Mutation parse(Map<String, dynamic> json) =>
      Login$Mutation.fromJson(json);
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

class QuestionnaireQuery
    extends GraphQLQuery<Questionnaire$Query, QuestionnaireArguments> {
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
              name: NameNode(value: 'symptomQuestionnaire'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'id'),
                    value: VariableNode(name: NameNode(value: 'id')))
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
  Questionnaire$Query parse(Map<String, dynamic> json) =>
      Questionnaire$Query.fromJson(json);
}

class QuestionnairesQuery
    extends GraphQLQuery<Questionnaires$Query, JsonSerializable> {
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
              name: NameNode(value: 'symptomQuestionnaires'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'isPublished'),
                    value: BooleanValueNode(value: true)),
                ArgumentNode(
                    name: NameNode(value: 'currentVersionsOnly'),
                    value: BooleanValueNode(value: true)),
                ArgumentNode(
                    name: NameNode(value: 'orderBy'),
                    value: ListValueNode(values: [
                      ObjectValueNode(fields: [
                        ObjectFieldNode(
                            name: NameNode(value: 'columnName'),
                            value: StringValueNode(
                                value: 'createdAt', isBlock: false)),
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
                                      name:
                                          NameNode(value: 'presentationOrder'),
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
  Questionnaires$Query parse(Map<String, dynamic> json) =>
      Questionnaires$Query.fromJson(json);
}

class CurrentUserQuery
    extends GraphQLQuery<CurrentUser$Query, JsonSerializable> {
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
  CurrentUser$Query parse(Map<String, dynamic> json) =>
      CurrentUser$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateResponseArguments extends JsonSerializable with EquatableMixin {
  CreateResponseArguments({@required this.response});

  factory CreateResponseArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateResponseArgumentsFromJson(json);

  final SymptomQuestionnaireResponseInput response;

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
                  name: NameNode(value: 'SymptomQuestionnaireResponseInput'),
                  isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'createSymptomQuestionnaireResponse'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'response'),
                    value: VariableNode(name: NameNode(value: 'response')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'userFriendlyMessage'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
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
