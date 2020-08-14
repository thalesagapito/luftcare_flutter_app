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
class SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoices
    with EquatableMixin {
  SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoices();

  factory SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoices.fromJson(
          Map<String, dynamic> json) =>
      _$SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoicesFromJson(
          json);

  String id;

  String text;

  int value;

  int presentationOrder;

  @override
  List<Object> get props => [id, text, value, presentationOrder];
  Map<String, dynamic> toJson() =>
      _$SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoicesToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$Questions
    with EquatableMixin {
  SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$Questions();

  factory SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$Questions.fromJson(
          Map<String, dynamic> json) =>
      _$SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$QuestionsFromJson(
          json);

  String id;

  String text;

  @JsonKey(unknownEnumValue: SymptomQuestionnaireQuestionKind.artemisUnknown)
  SymptomQuestionnaireQuestionKind kind;

  int presentationOrder;

  List<SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$Questions$PossibleChoices>
      possibleChoices;

  @override
  List<Object> get props =>
      [id, text, kind, presentationOrder, possibleChoices];
  Map<String, dynamic> toJson() =>
      _$SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$QuestionsToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class SymptomQuestionnaires$Query$SymptomQuestionnaires$Results
    with EquatableMixin {
  SymptomQuestionnaires$Query$SymptomQuestionnaires$Results();

  factory SymptomQuestionnaires$Query$SymptomQuestionnaires$Results.fromJson(
          Map<String, dynamic> json) =>
      _$SymptomQuestionnaires$Query$SymptomQuestionnaires$ResultsFromJson(json);

  String id;

  String nameForPresentation;

  List<SymptomQuestionnaires$Query$SymptomQuestionnaires$Results$Questions>
      questions;

  @override
  List<Object> get props => [id, nameForPresentation, questions];
  Map<String, dynamic> toJson() =>
      _$SymptomQuestionnaires$Query$SymptomQuestionnaires$ResultsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SymptomQuestionnaires$Query$SymptomQuestionnaires with EquatableMixin {
  SymptomQuestionnaires$Query$SymptomQuestionnaires();

  factory SymptomQuestionnaires$Query$SymptomQuestionnaires.fromJson(
          Map<String, dynamic> json) =>
      _$SymptomQuestionnaires$Query$SymptomQuestionnairesFromJson(json);

  int totalResultsCount;

  bool hasMorePages;

  List<SymptomQuestionnaires$Query$SymptomQuestionnaires$Results> results;

  @override
  List<Object> get props => [totalResultsCount, hasMorePages, results];
  Map<String, dynamic> toJson() =>
      _$SymptomQuestionnaires$Query$SymptomQuestionnairesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SymptomQuestionnaires$Query with EquatableMixin {
  SymptomQuestionnaires$Query();

  factory SymptomQuestionnaires$Query.fromJson(Map<String, dynamic> json) =>
      _$SymptomQuestionnaires$QueryFromJson(json);

  SymptomQuestionnaires$Query$SymptomQuestionnaires symptomQuestionnaires;

  @override
  List<Object> get props => [symptomQuestionnaires];
  Map<String, dynamic> toJson() => _$SymptomQuestionnaires$QueryToJson(this);
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

class SymptomQuestionnairesQuery
    extends GraphQLQuery<SymptomQuestionnaires$Query, JsonSerializable> {
  SymptomQuestionnairesQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'symptomQuestionnaires'),
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
  final String operationName = 'symptomQuestionnaires';

  @override
  List<Object> get props => [document, operationName];
  @override
  SymptomQuestionnaires$Query parse(Map<String, dynamic> json) =>
      SymptomQuestionnaires$Query.fromJson(json);
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
