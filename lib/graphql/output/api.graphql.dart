// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionChoice
    with EquatableMixin {
  GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionChoice();

  factory GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionChoice.fromJson(
          Map<String, dynamic> json) =>
      _$GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionChoiceFromJson(
          json);

  String id;

  String nameForManagement;

  String text;

  int presentationOrder;

  int value;

  @override
  List<Object> get props =>
      [id, nameForManagement, text, presentationOrder, value];
  Map<String, dynamic> toJson() =>
      _$GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionChoiceToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion
    with EquatableMixin {
  GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion();

  factory GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion.fromJson(
          Map<String, dynamic> json) =>
      _$GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestionFromJson(
          json);

  String id;

  @JsonKey(
      unknownEnumValue:
          GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionKind
              .ARTEMIS_UNKNOWN)
  GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionKind
      kind;

  String nameForManagement;

  int presentationOrder;

  String text;

  List<GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionChoice>
      possibleChoices;

  @override
  List<Object> get props =>
      [id, kind, nameForManagement, presentationOrder, text, possibleChoices];
  Map<String, dynamic> toJson() =>
      _$GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestionToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetQuestionnaire$Query$SymptomQuestionnaire with EquatableMixin {
  GetQuestionnaire$Query$SymptomQuestionnaire();

  factory GetQuestionnaire$Query$SymptomQuestionnaire.fromJson(
          Map<String, dynamic> json) =>
      _$GetQuestionnaire$Query$SymptomQuestionnaireFromJson(json);

  String id;

  bool isPublished;

  String nameForManagement;

  String nameForPresentation;

  List<GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion>
      questions;

  @override
  List<Object> get props =>
      [id, isPublished, nameForManagement, nameForPresentation, questions];
  Map<String, dynamic> toJson() =>
      _$GetQuestionnaire$Query$SymptomQuestionnaireToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetQuestionnaire$Query with EquatableMixin {
  GetQuestionnaire$Query();

  factory GetQuestionnaire$Query.fromJson(Map<String, dynamic> json) =>
      _$GetQuestionnaire$QueryFromJson(json);

  GetQuestionnaire$Query$SymptomQuestionnaire symptomQuestionnaire;

  @override
  List<Object> get props => [symptomQuestionnaire];
  Map<String, dynamic> toJson() => _$GetQuestionnaire$QueryToJson(this);
}

enum GetQuestionnaire$Query$SymptomQuestionnaire$SymptomQuestionnaireQuestion$SymptomQuestionnaireQuestionKind {
  MULTIPLE_CHOICE,
  FREE_RESPONSE,
  ARTEMIS_UNKNOWN,
}

@JsonSerializable(explicitToJson: true)
class GetQuestionnaireArguments extends JsonSerializable with EquatableMixin {
  GetQuestionnaireArguments({@required this.id});

  factory GetQuestionnaireArguments.fromJson(Map<String, dynamic> json) =>
      _$GetQuestionnaireArgumentsFromJson(json);

  final String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() => _$GetQuestionnaireArgumentsToJson(this);
}

class GetQuestionnaireQuery
    extends GraphQLQuery<GetQuestionnaire$Query, GetQuestionnaireArguments> {
  GetQuestionnaireQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'getQuestionnaire'),
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
                    name: NameNode(value: 'isPublished'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null),
                FieldNode(
                    name: NameNode(value: 'nameForManagement'),
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
                          name: NameNode(value: 'kind'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null),
                      FieldNode(
                          name: NameNode(value: 'nameForManagement'),
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
                          name: NameNode(value: 'text'),
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
                                name: NameNode(value: 'nameForManagement'),
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
                                name: NameNode(value: 'value'),
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
  final String operationName = 'getQuestionnaire';

  @override
  final GetQuestionnaireArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  GetQuestionnaire$Query parse(Map<String, dynamic> json) =>
      GetQuestionnaire$Query.fromJson(json);
}
