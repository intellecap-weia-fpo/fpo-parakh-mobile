import '../../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$GetSubmission {
  factory Variables$Query$GetSubmission({
    required String financialYear,
    required String fpoId,
  }) =>
      Variables$Query$GetSubmission._({
        r'financialYear': financialYear,
        r'fpoId': fpoId,
      });

  Variables$Query$GetSubmission._(this._$data);

  factory Variables$Query$GetSubmission.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$financialYear = data['financialYear'];
    result$data['financialYear'] = (l$financialYear as String);
    final l$fpoId = data['fpoId'];
    result$data['fpoId'] = (l$fpoId as String);
    return Variables$Query$GetSubmission._(result$data);
  }

  Map<String, dynamic> _$data;

  String get financialYear => (_$data['financialYear'] as String);

  String get fpoId => (_$data['fpoId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$financialYear = financialYear;
    result$data['financialYear'] = l$financialYear;
    final l$fpoId = fpoId;
    result$data['fpoId'] = l$fpoId;
    return result$data;
  }

  CopyWith$Variables$Query$GetSubmission<Variables$Query$GetSubmission>
      get copyWith => CopyWith$Variables$Query$GetSubmission(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetSubmission) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$financialYear = financialYear;
    final lOther$financialYear = other.financialYear;
    if (l$financialYear != lOther$financialYear) {
      return false;
    }
    final l$fpoId = fpoId;
    final lOther$fpoId = other.fpoId;
    if (l$fpoId != lOther$fpoId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$financialYear = financialYear;
    final l$fpoId = fpoId;
    return Object.hashAll([
      l$financialYear,
      l$fpoId,
    ]);
  }
}

abstract class CopyWith$Variables$Query$GetSubmission<TRes> {
  factory CopyWith$Variables$Query$GetSubmission(
    Variables$Query$GetSubmission instance,
    TRes Function(Variables$Query$GetSubmission) then,
  ) = _CopyWithImpl$Variables$Query$GetSubmission;

  factory CopyWith$Variables$Query$GetSubmission.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetSubmission;

  TRes call({
    String? financialYear,
    String? fpoId,
  });
}

class _CopyWithImpl$Variables$Query$GetSubmission<TRes>
    implements CopyWith$Variables$Query$GetSubmission<TRes> {
  _CopyWithImpl$Variables$Query$GetSubmission(
    this._instance,
    this._then,
  );

  final Variables$Query$GetSubmission _instance;

  final TRes Function(Variables$Query$GetSubmission) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? financialYear = _undefined,
    Object? fpoId = _undefined,
  }) =>
      _then(Variables$Query$GetSubmission._({
        ..._instance._$data,
        if (financialYear != _undefined && financialYear != null)
          'financialYear': (financialYear as String),
        if (fpoId != _undefined && fpoId != null) 'fpoId': (fpoId as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetSubmission<TRes>
    implements CopyWith$Variables$Query$GetSubmission<TRes> {
  _CopyWithStubImpl$Variables$Query$GetSubmission(this._res);

  TRes _res;

  call({
    String? financialYear,
    String? fpoId,
  }) =>
      _res;
}

class Query$GetSubmission {
  Query$GetSubmission({
    this.getSubmission,
    this.$__typename = 'Query',
  });

  factory Query$GetSubmission.fromJson(Map<String, dynamic> json) {
    final l$getSubmission = json['getSubmission'];
    final l$$__typename = json['__typename'];
    return Query$GetSubmission(
      getSubmission: l$getSubmission == null
          ? null
          : Query$GetSubmission$getSubmission.fromJson(
              (l$getSubmission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetSubmission$getSubmission? getSubmission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$getSubmission = getSubmission;
    _resultData['getSubmission'] = l$getSubmission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$getSubmission = getSubmission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$getSubmission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSubmission) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$getSubmission = getSubmission;
    final lOther$getSubmission = other.getSubmission;
    if (l$getSubmission != lOther$getSubmission) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSubmission on Query$GetSubmission {
  CopyWith$Query$GetSubmission<Query$GetSubmission> get copyWith =>
      CopyWith$Query$GetSubmission(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetSubmission<TRes> {
  factory CopyWith$Query$GetSubmission(
    Query$GetSubmission instance,
    TRes Function(Query$GetSubmission) then,
  ) = _CopyWithImpl$Query$GetSubmission;

  factory CopyWith$Query$GetSubmission.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSubmission;

  TRes call({
    Query$GetSubmission$getSubmission? getSubmission,
    String? $__typename,
  });
  CopyWith$Query$GetSubmission$getSubmission<TRes> get getSubmission;
}

class _CopyWithImpl$Query$GetSubmission<TRes>
    implements CopyWith$Query$GetSubmission<TRes> {
  _CopyWithImpl$Query$GetSubmission(
    this._instance,
    this._then,
  );

  final Query$GetSubmission _instance;

  final TRes Function(Query$GetSubmission) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? getSubmission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSubmission(
        getSubmission: getSubmission == _undefined
            ? _instance.getSubmission
            : (getSubmission as Query$GetSubmission$getSubmission?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetSubmission$getSubmission<TRes> get getSubmission {
    final local$getSubmission = _instance.getSubmission;
    return local$getSubmission == null
        ? CopyWith$Query$GetSubmission$getSubmission.stub(_then(_instance))
        : CopyWith$Query$GetSubmission$getSubmission(
            local$getSubmission, (e) => call(getSubmission: e));
  }
}

class _CopyWithStubImpl$Query$GetSubmission<TRes>
    implements CopyWith$Query$GetSubmission<TRes> {
  _CopyWithStubImpl$Query$GetSubmission(this._res);

  TRes _res;

  call({
    Query$GetSubmission$getSubmission? getSubmission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetSubmission$getSubmission<TRes> get getSubmission =>
      CopyWith$Query$GetSubmission$getSubmission.stub(_res);
}

const documentNodeQueryGetSubmission = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetSubmission'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'financialYear')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'fpoId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getSubmission'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'financialYear'),
            value: VariableNode(name: NameNode(value: 'financialYear')),
          ),
          ArgumentNode(
            name: NameNode(value: 'fpoId'),
            value: VariableNode(name: NameNode(value: 'fpoId')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'financialYear'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'submittedAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'calculatedScore'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'governanceScore'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'businessScore'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'processScore'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'financialScore'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'fpoDetails'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'nameOfProducerOrganization'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'registeredAddress'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'district'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'state'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'typeOfProducerOrganization'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'dateOfIncorporation'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'dateOfCommencement'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'ageOfFpoYears'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'typeOfFpo'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'sizeOfFpoFy2324'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'sizeOfFpoFy2223'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'sizeOfFpoFy2122'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'farmersTransacted'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'womenMembers'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'targetSizeOfFpo'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'dealsThroughPgsFigs'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'numPgsFigs'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'promotingAgencyName'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'typeOfPromotingAgency'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'otherPromotingAgencyType'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'receivedGrants'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'grantMakingOrganization'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'supportedByPromotingAgency'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'governance'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'annualGeneralBodyMeetings'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'bodMeetingsLastFinancialYear'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'numBods'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'numWomenBods'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'minutesMaintenance'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'secondLineManagement'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'ceoProfile'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'qualification'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'totalYearsOfExperience'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'typeOfExperience'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'numberOfYearsAssociated'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'boardDirectors'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'edges'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'node'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'id'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'educationalQualification'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'totalYearsOfExperience'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'typeOfExperience'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: '__typename'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'businessOperations'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'priceVolatilityOfProducts'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'accessibilityPercentage'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'availabilityOfInputsTimeliness'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'availabilityOfInputsPriceAffordability'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'availabilityOfInputsPlace'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'distanceOfOutputCollectionCentres'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'electronicWeighingMachines'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'transportationFacility'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'storage'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'cleaning'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'gradingAndSorting'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'chilling'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'packaging'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'labelling'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'processing'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'qualityCheck'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'soilTestingFacility'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'customHiringCenters'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'contractFarming'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'advisoryServices'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'creditFacilities'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'complianceDetails'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'actUnderRegistered'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'dateOfRegistration'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'permanentAccountNumber'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'placeOfRegistration'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'registrationNo'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'taxAccountNumber'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'incorporationDate'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'incorporationPlace'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'incorporationRegNo'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'commencementDate'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'commencementPlace'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'commencementRegNo'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'gstDate'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'gstPlace'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'gstRegNo'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'processesSystems'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'accountsAndMis'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'booksAndRecordsUpToDate'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'creditRecordOfFpo'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'insuranceOfStock'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'penaltiesLeviedBoardMeeting'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'reconciliationOfStocks'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'statutoryFillings'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'financialDetailsV2'),
            alias: NameNode(value: 'financialDetails'),
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'cashChequePercentage'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'createdAt'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'creditDefaultAmount'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'creditDefaultLender'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'creditDefaultYear'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearAccountsPayable'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearAccountsReceivable'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearAssets'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'loanDetails'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearClosingInventory'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearCogs'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearCurrentAssets'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearCurrentLiabilities'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearGrossProfit'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearInstitutionalProducts'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearInstitutionalRevenue'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearLenderName'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearLiabilities'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearLoanAmount'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearMatchingGrant'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearNetProfit'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearOpeningInventory'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearProducts'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearProjectGrant'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearQuantityProcured'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearQuantityProducts'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearRetailProducts'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearRetailRevenue'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearRevenue'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearShareCapital'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearShareholders'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearWholesaleProducts'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'currentYearWholesaleRevenue'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'daysPayableReceivableDifference'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'grossNetProfitMarginDifference'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'institutionalLendingHistory'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'operatingMarginCurrentYear'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearAccountsPayable'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearAccountsReceivable'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearAssets'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearClosingInventory'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearCogs'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearCurrentAssets'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearCurrentLiabilities'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearGrossProfit'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearInstitutionalProducts'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearInstitutionalRevenue'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearLenderName'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearLiabilities'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearLoanAmount'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearMatchingGrant'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearNetProfit'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearOpeningInventory'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearProducts'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearProjectGrant'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearQuantityProcured'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearQuantityProducts'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearRetailProducts'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearRetailRevenue'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearRevenue'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearShareCapital'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearShareholders'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearWholesaleProducts'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'previousYearWholesaleRevenue'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'targetRevenue'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'totalDebtToday'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackAccountsPayable'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackAccountsReceivable'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackAssets'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackClosingInventory'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackCogs'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackCurrentAssets'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackCurrentLiabilities'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackGrossProfit'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackInstitutionalProducts'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackInstitutionalRevenue'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackLenderName'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackLiabilities'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackLoanAmount'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackMatchingGrant'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackNetProfit'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackOpeningInventory'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackProducts'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackProjectGrant'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackQuantityProcured'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackQuantityProducts'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackRetailProducts'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackRetailRevenue'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackRevenue'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackShareCapital'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackShareholders'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackWholesaleProducts'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'twoYearsBackWholesaleRevenue'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'updatedAt'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'sustainableActivities'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'climateResilientSeedsToFarmers'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'compostingUnitsAtFpoLevel'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'dripSprinklerIrrigationToFarmers'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(
                    value: 'establishmentOfRainwaterHarvestingAtFpoLevel'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'organicBioManureFertilizersToFarmers'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'pestDiseaseAlertsToFarmers'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'solarPanelsAtFpoLevel'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(
                    value: 'supplyingAgriculturalResidueToBioCngGasPlants'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'trainingOnOrganicFarmingToFarmers'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'weatherAdvisoriesToFarmers'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$GetSubmission _parserFn$Query$GetSubmission(Map<String, dynamic> data) =>
    Query$GetSubmission.fromJson(data);
typedef OnQueryComplete$Query$GetSubmission = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetSubmission?,
);

class Options$Query$GetSubmission
    extends graphql.QueryOptions<Query$GetSubmission> {
  Options$Query$GetSubmission({
    String? operationName,
    required Variables$Query$GetSubmission variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetSubmission? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetSubmission? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$GetSubmission(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetSubmission,
          parserFn: _parserFn$Query$GetSubmission,
        );

  final OnQueryComplete$Query$GetSubmission? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetSubmission
    extends graphql.WatchQueryOptions<Query$GetSubmission> {
  WatchOptions$Query$GetSubmission({
    String? operationName,
    required Variables$Query$GetSubmission variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetSubmission? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetSubmission,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetSubmission,
        );
}

class FetchMoreOptions$Query$GetSubmission extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetSubmission({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetSubmission variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetSubmission,
        );
}

extension ClientExtension$Query$GetSubmission on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetSubmission>> query$GetSubmission(
          Options$Query$GetSubmission options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetSubmission> watchQuery$GetSubmission(
          WatchOptions$Query$GetSubmission options) =>
      this.watchQuery(options);
  void writeQuery$GetSubmission({
    required Query$GetSubmission data,
    required Variables$Query$GetSubmission variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetSubmission),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetSubmission? readQuery$GetSubmission({
    required Variables$Query$GetSubmission variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryGetSubmission),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetSubmission.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetSubmission> useQuery$GetSubmission(
        Options$Query$GetSubmission options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetSubmission> useWatchQuery$GetSubmission(
        WatchOptions$Query$GetSubmission options) =>
    graphql_flutter.useWatchQuery(options);

class Query$GetSubmission$Widget
    extends graphql_flutter.Query<Query$GetSubmission> {
  Query$GetSubmission$Widget({
    widgets.Key? key,
    required Options$Query$GetSubmission options,
    required graphql_flutter.QueryBuilder<Query$GetSubmission> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetSubmission$getSubmission {
  Query$GetSubmission$getSubmission({
    required this.id,
    required this.financialYear,
    required this.status,
    this.submittedAt,
    this.calculatedScore,
    this.governanceScore,
    this.businessScore,
    this.processScore,
    this.financialScore,
    this.fpoDetails,
    this.governance,
    this.ceoProfile,
    required this.boardDirectors,
    this.businessOperations,
    this.complianceDetails,
    this.processesSystems,
    this.financialDetails,
    this.sustainableActivities,
    this.$__typename = 'YearlySubmissionNode',
  });

  factory Query$GetSubmission$getSubmission.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$financialYear = json['financialYear'];
    final l$status = json['status'];
    final l$submittedAt = json['submittedAt'];
    final l$calculatedScore = json['calculatedScore'];
    final l$governanceScore = json['governanceScore'];
    final l$businessScore = json['businessScore'];
    final l$processScore = json['processScore'];
    final l$financialScore = json['financialScore'];
    final l$fpoDetails = json['fpoDetails'];
    final l$governance = json['governance'];
    final l$ceoProfile = json['ceoProfile'];
    final l$boardDirectors = json['boardDirectors'];
    final l$businessOperations = json['businessOperations'];
    final l$complianceDetails = json['complianceDetails'];
    final l$processesSystems = json['processesSystems'];
    final l$financialDetails = json['financialDetails'];
    final l$sustainableActivities = json['sustainableActivities'];
    final l$$__typename = json['__typename'];
    return Query$GetSubmission$getSubmission(
      id: (l$id as String),
      financialYear: (l$financialYear as String),
      status:
          fromJson$Enum$FpoYearlySubmissionStatusChoices((l$status as String)),
      submittedAt: (l$submittedAt as String?),
      calculatedScore: (l$calculatedScore as num?)?.toDouble(),
      governanceScore: (l$governanceScore as String?),
      businessScore: (l$businessScore as String?),
      processScore: (l$processScore as String?),
      financialScore: (l$financialScore as String?),
      fpoDetails: l$fpoDetails == null
          ? null
          : Query$GetSubmission$getSubmission$fpoDetails.fromJson(
              (l$fpoDetails as Map<String, dynamic>)),
      governance: l$governance == null
          ? null
          : Query$GetSubmission$getSubmission$governance.fromJson(
              (l$governance as Map<String, dynamic>)),
      ceoProfile: l$ceoProfile == null
          ? null
          : Query$GetSubmission$getSubmission$ceoProfile.fromJson(
              (l$ceoProfile as Map<String, dynamic>)),
      boardDirectors: Query$GetSubmission$getSubmission$boardDirectors.fromJson(
          (l$boardDirectors as Map<String, dynamic>)),
      businessOperations: l$businessOperations == null
          ? null
          : Query$GetSubmission$getSubmission$businessOperations.fromJson(
              (l$businessOperations as Map<String, dynamic>)),
      complianceDetails: l$complianceDetails == null
          ? null
          : Query$GetSubmission$getSubmission$complianceDetails.fromJson(
              (l$complianceDetails as Map<String, dynamic>)),
      processesSystems: l$processesSystems == null
          ? null
          : Query$GetSubmission$getSubmission$processesSystems.fromJson(
              (l$processesSystems as Map<String, dynamic>)),
      financialDetails: l$financialDetails == null
          ? null
          : Query$GetSubmission$getSubmission$financialDetails.fromJson(
              (l$financialDetails as Map<String, dynamic>)),
      sustainableActivities: l$sustainableActivities == null
          ? null
          : Query$GetSubmission$getSubmission$sustainableActivities.fromJson(
              (l$sustainableActivities as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String financialYear;

  final Enum$FpoYearlySubmissionStatusChoices status;

  final String? submittedAt;

  final double? calculatedScore;

  final String? governanceScore;

  final String? businessScore;

  final String? processScore;

  final String? financialScore;

  final Query$GetSubmission$getSubmission$fpoDetails? fpoDetails;

  final Query$GetSubmission$getSubmission$governance? governance;

  final Query$GetSubmission$getSubmission$ceoProfile? ceoProfile;

  final Query$GetSubmission$getSubmission$boardDirectors boardDirectors;

  final Query$GetSubmission$getSubmission$businessOperations?
      businessOperations;

  final Query$GetSubmission$getSubmission$complianceDetails? complianceDetails;

  final Query$GetSubmission$getSubmission$processesSystems? processesSystems;

  final Query$GetSubmission$getSubmission$financialDetails? financialDetails;

  final Query$GetSubmission$getSubmission$sustainableActivities?
      sustainableActivities;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$financialYear = financialYear;
    _resultData['financialYear'] = l$financialYear;
    final l$status = status;
    _resultData['status'] =
        toJson$Enum$FpoYearlySubmissionStatusChoices(l$status);
    final l$submittedAt = submittedAt;
    _resultData['submittedAt'] = l$submittedAt;
    final l$calculatedScore = calculatedScore;
    _resultData['calculatedScore'] = l$calculatedScore;
    final l$governanceScore = governanceScore;
    _resultData['governanceScore'] = l$governanceScore;
    final l$businessScore = businessScore;
    _resultData['businessScore'] = l$businessScore;
    final l$processScore = processScore;
    _resultData['processScore'] = l$processScore;
    final l$financialScore = financialScore;
    _resultData['financialScore'] = l$financialScore;
    final l$fpoDetails = fpoDetails;
    _resultData['fpoDetails'] = l$fpoDetails?.toJson();
    final l$governance = governance;
    _resultData['governance'] = l$governance?.toJson();
    final l$ceoProfile = ceoProfile;
    _resultData['ceoProfile'] = l$ceoProfile?.toJson();
    final l$boardDirectors = boardDirectors;
    _resultData['boardDirectors'] = l$boardDirectors.toJson();
    final l$businessOperations = businessOperations;
    _resultData['businessOperations'] = l$businessOperations?.toJson();
    final l$complianceDetails = complianceDetails;
    _resultData['complianceDetails'] = l$complianceDetails?.toJson();
    final l$processesSystems = processesSystems;
    _resultData['processesSystems'] = l$processesSystems?.toJson();
    final l$financialDetails = financialDetails;
    _resultData['financialDetails'] = l$financialDetails?.toJson();
    final l$sustainableActivities = sustainableActivities;
    _resultData['sustainableActivities'] = l$sustainableActivities?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$financialYear = financialYear;
    final l$status = status;
    final l$submittedAt = submittedAt;
    final l$calculatedScore = calculatedScore;
    final l$governanceScore = governanceScore;
    final l$businessScore = businessScore;
    final l$processScore = processScore;
    final l$financialScore = financialScore;
    final l$fpoDetails = fpoDetails;
    final l$governance = governance;
    final l$ceoProfile = ceoProfile;
    final l$boardDirectors = boardDirectors;
    final l$businessOperations = businessOperations;
    final l$complianceDetails = complianceDetails;
    final l$processesSystems = processesSystems;
    final l$financialDetails = financialDetails;
    final l$sustainableActivities = sustainableActivities;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$financialYear,
      l$status,
      l$submittedAt,
      l$calculatedScore,
      l$governanceScore,
      l$businessScore,
      l$processScore,
      l$financialScore,
      l$fpoDetails,
      l$governance,
      l$ceoProfile,
      l$boardDirectors,
      l$businessOperations,
      l$complianceDetails,
      l$processesSystems,
      l$financialDetails,
      l$sustainableActivities,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSubmission$getSubmission) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$financialYear = financialYear;
    final lOther$financialYear = other.financialYear;
    if (l$financialYear != lOther$financialYear) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$submittedAt = submittedAt;
    final lOther$submittedAt = other.submittedAt;
    if (l$submittedAt != lOther$submittedAt) {
      return false;
    }
    final l$calculatedScore = calculatedScore;
    final lOther$calculatedScore = other.calculatedScore;
    if (l$calculatedScore != lOther$calculatedScore) {
      return false;
    }
    final l$governanceScore = governanceScore;
    final lOther$governanceScore = other.governanceScore;
    if (l$governanceScore != lOther$governanceScore) {
      return false;
    }
    final l$businessScore = businessScore;
    final lOther$businessScore = other.businessScore;
    if (l$businessScore != lOther$businessScore) {
      return false;
    }
    final l$processScore = processScore;
    final lOther$processScore = other.processScore;
    if (l$processScore != lOther$processScore) {
      return false;
    }
    final l$financialScore = financialScore;
    final lOther$financialScore = other.financialScore;
    if (l$financialScore != lOther$financialScore) {
      return false;
    }
    final l$fpoDetails = fpoDetails;
    final lOther$fpoDetails = other.fpoDetails;
    if (l$fpoDetails != lOther$fpoDetails) {
      return false;
    }
    final l$governance = governance;
    final lOther$governance = other.governance;
    if (l$governance != lOther$governance) {
      return false;
    }
    final l$ceoProfile = ceoProfile;
    final lOther$ceoProfile = other.ceoProfile;
    if (l$ceoProfile != lOther$ceoProfile) {
      return false;
    }
    final l$boardDirectors = boardDirectors;
    final lOther$boardDirectors = other.boardDirectors;
    if (l$boardDirectors != lOther$boardDirectors) {
      return false;
    }
    final l$businessOperations = businessOperations;
    final lOther$businessOperations = other.businessOperations;
    if (l$businessOperations != lOther$businessOperations) {
      return false;
    }
    final l$complianceDetails = complianceDetails;
    final lOther$complianceDetails = other.complianceDetails;
    if (l$complianceDetails != lOther$complianceDetails) {
      return false;
    }
    final l$processesSystems = processesSystems;
    final lOther$processesSystems = other.processesSystems;
    if (l$processesSystems != lOther$processesSystems) {
      return false;
    }
    final l$financialDetails = financialDetails;
    final lOther$financialDetails = other.financialDetails;
    if (l$financialDetails != lOther$financialDetails) {
      return false;
    }
    final l$sustainableActivities = sustainableActivities;
    final lOther$sustainableActivities = other.sustainableActivities;
    if (l$sustainableActivities != lOther$sustainableActivities) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSubmission$getSubmission
    on Query$GetSubmission$getSubmission {
  CopyWith$Query$GetSubmission$getSubmission<Query$GetSubmission$getSubmission>
      get copyWith => CopyWith$Query$GetSubmission$getSubmission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSubmission$getSubmission<TRes> {
  factory CopyWith$Query$GetSubmission$getSubmission(
    Query$GetSubmission$getSubmission instance,
    TRes Function(Query$GetSubmission$getSubmission) then,
  ) = _CopyWithImpl$Query$GetSubmission$getSubmission;

  factory CopyWith$Query$GetSubmission$getSubmission.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSubmission$getSubmission;

  TRes call({
    String? id,
    String? financialYear,
    Enum$FpoYearlySubmissionStatusChoices? status,
    String? submittedAt,
    double? calculatedScore,
    String? governanceScore,
    String? businessScore,
    String? processScore,
    String? financialScore,
    Query$GetSubmission$getSubmission$fpoDetails? fpoDetails,
    Query$GetSubmission$getSubmission$governance? governance,
    Query$GetSubmission$getSubmission$ceoProfile? ceoProfile,
    Query$GetSubmission$getSubmission$boardDirectors? boardDirectors,
    Query$GetSubmission$getSubmission$businessOperations? businessOperations,
    Query$GetSubmission$getSubmission$complianceDetails? complianceDetails,
    Query$GetSubmission$getSubmission$processesSystems? processesSystems,
    Query$GetSubmission$getSubmission$financialDetails? financialDetails,
    Query$GetSubmission$getSubmission$sustainableActivities?
        sustainableActivities,
    String? $__typename,
  });
  CopyWith$Query$GetSubmission$getSubmission$fpoDetails<TRes> get fpoDetails;
  CopyWith$Query$GetSubmission$getSubmission$governance<TRes> get governance;
  CopyWith$Query$GetSubmission$getSubmission$ceoProfile<TRes> get ceoProfile;
  CopyWith$Query$GetSubmission$getSubmission$boardDirectors<TRes>
      get boardDirectors;
  CopyWith$Query$GetSubmission$getSubmission$businessOperations<TRes>
      get businessOperations;
  CopyWith$Query$GetSubmission$getSubmission$complianceDetails<TRes>
      get complianceDetails;
  CopyWith$Query$GetSubmission$getSubmission$processesSystems<TRes>
      get processesSystems;
  CopyWith$Query$GetSubmission$getSubmission$financialDetails<TRes>
      get financialDetails;
  CopyWith$Query$GetSubmission$getSubmission$sustainableActivities<TRes>
      get sustainableActivities;
}

class _CopyWithImpl$Query$GetSubmission$getSubmission<TRes>
    implements CopyWith$Query$GetSubmission$getSubmission<TRes> {
  _CopyWithImpl$Query$GetSubmission$getSubmission(
    this._instance,
    this._then,
  );

  final Query$GetSubmission$getSubmission _instance;

  final TRes Function(Query$GetSubmission$getSubmission) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? financialYear = _undefined,
    Object? status = _undefined,
    Object? submittedAt = _undefined,
    Object? calculatedScore = _undefined,
    Object? governanceScore = _undefined,
    Object? businessScore = _undefined,
    Object? processScore = _undefined,
    Object? financialScore = _undefined,
    Object? fpoDetails = _undefined,
    Object? governance = _undefined,
    Object? ceoProfile = _undefined,
    Object? boardDirectors = _undefined,
    Object? businessOperations = _undefined,
    Object? complianceDetails = _undefined,
    Object? processesSystems = _undefined,
    Object? financialDetails = _undefined,
    Object? sustainableActivities = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSubmission$getSubmission(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        financialYear: financialYear == _undefined || financialYear == null
            ? _instance.financialYear
            : (financialYear as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$FpoYearlySubmissionStatusChoices),
        submittedAt: submittedAt == _undefined
            ? _instance.submittedAt
            : (submittedAt as String?),
        calculatedScore: calculatedScore == _undefined
            ? _instance.calculatedScore
            : (calculatedScore as double?),
        governanceScore: governanceScore == _undefined
            ? _instance.governanceScore
            : (governanceScore as String?),
        businessScore: businessScore == _undefined
            ? _instance.businessScore
            : (businessScore as String?),
        processScore: processScore == _undefined
            ? _instance.processScore
            : (processScore as String?),
        financialScore: financialScore == _undefined
            ? _instance.financialScore
            : (financialScore as String?),
        fpoDetails: fpoDetails == _undefined
            ? _instance.fpoDetails
            : (fpoDetails as Query$GetSubmission$getSubmission$fpoDetails?),
        governance: governance == _undefined
            ? _instance.governance
            : (governance as Query$GetSubmission$getSubmission$governance?),
        ceoProfile: ceoProfile == _undefined
            ? _instance.ceoProfile
            : (ceoProfile as Query$GetSubmission$getSubmission$ceoProfile?),
        boardDirectors: boardDirectors == _undefined || boardDirectors == null
            ? _instance.boardDirectors
            : (boardDirectors
                as Query$GetSubmission$getSubmission$boardDirectors),
        businessOperations: businessOperations == _undefined
            ? _instance.businessOperations
            : (businessOperations
                as Query$GetSubmission$getSubmission$businessOperations?),
        complianceDetails: complianceDetails == _undefined
            ? _instance.complianceDetails
            : (complianceDetails
                as Query$GetSubmission$getSubmission$complianceDetails?),
        processesSystems: processesSystems == _undefined
            ? _instance.processesSystems
            : (processesSystems
                as Query$GetSubmission$getSubmission$processesSystems?),
        financialDetails: financialDetails == _undefined
            ? _instance.financialDetails
            : (financialDetails
                as Query$GetSubmission$getSubmission$financialDetails?),
        sustainableActivities: sustainableActivities == _undefined
            ? _instance.sustainableActivities
            : (sustainableActivities
                as Query$GetSubmission$getSubmission$sustainableActivities?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetSubmission$getSubmission$fpoDetails<TRes> get fpoDetails {
    final local$fpoDetails = _instance.fpoDetails;
    return local$fpoDetails == null
        ? CopyWith$Query$GetSubmission$getSubmission$fpoDetails.stub(
            _then(_instance))
        : CopyWith$Query$GetSubmission$getSubmission$fpoDetails(
            local$fpoDetails, (e) => call(fpoDetails: e));
  }

  CopyWith$Query$GetSubmission$getSubmission$governance<TRes> get governance {
    final local$governance = _instance.governance;
    return local$governance == null
        ? CopyWith$Query$GetSubmission$getSubmission$governance.stub(
            _then(_instance))
        : CopyWith$Query$GetSubmission$getSubmission$governance(
            local$governance, (e) => call(governance: e));
  }

  CopyWith$Query$GetSubmission$getSubmission$ceoProfile<TRes> get ceoProfile {
    final local$ceoProfile = _instance.ceoProfile;
    return local$ceoProfile == null
        ? CopyWith$Query$GetSubmission$getSubmission$ceoProfile.stub(
            _then(_instance))
        : CopyWith$Query$GetSubmission$getSubmission$ceoProfile(
            local$ceoProfile, (e) => call(ceoProfile: e));
  }

  CopyWith$Query$GetSubmission$getSubmission$boardDirectors<TRes>
      get boardDirectors {
    final local$boardDirectors = _instance.boardDirectors;
    return CopyWith$Query$GetSubmission$getSubmission$boardDirectors(
        local$boardDirectors, (e) => call(boardDirectors: e));
  }

  CopyWith$Query$GetSubmission$getSubmission$businessOperations<TRes>
      get businessOperations {
    final local$businessOperations = _instance.businessOperations;
    return local$businessOperations == null
        ? CopyWith$Query$GetSubmission$getSubmission$businessOperations.stub(
            _then(_instance))
        : CopyWith$Query$GetSubmission$getSubmission$businessOperations(
            local$businessOperations, (e) => call(businessOperations: e));
  }

  CopyWith$Query$GetSubmission$getSubmission$complianceDetails<TRes>
      get complianceDetails {
    final local$complianceDetails = _instance.complianceDetails;
    return local$complianceDetails == null
        ? CopyWith$Query$GetSubmission$getSubmission$complianceDetails.stub(
            _then(_instance))
        : CopyWith$Query$GetSubmission$getSubmission$complianceDetails(
            local$complianceDetails, (e) => call(complianceDetails: e));
  }

  CopyWith$Query$GetSubmission$getSubmission$processesSystems<TRes>
      get processesSystems {
    final local$processesSystems = _instance.processesSystems;
    return local$processesSystems == null
        ? CopyWith$Query$GetSubmission$getSubmission$processesSystems.stub(
            _then(_instance))
        : CopyWith$Query$GetSubmission$getSubmission$processesSystems(
            local$processesSystems, (e) => call(processesSystems: e));
  }

  CopyWith$Query$GetSubmission$getSubmission$financialDetails<TRes>
      get financialDetails {
    final local$financialDetails = _instance.financialDetails;
    return local$financialDetails == null
        ? CopyWith$Query$GetSubmission$getSubmission$financialDetails.stub(
            _then(_instance))
        : CopyWith$Query$GetSubmission$getSubmission$financialDetails(
            local$financialDetails, (e) => call(financialDetails: e));
  }

  CopyWith$Query$GetSubmission$getSubmission$sustainableActivities<TRes>
      get sustainableActivities {
    final local$sustainableActivities = _instance.sustainableActivities;
    return local$sustainableActivities == null
        ? CopyWith$Query$GetSubmission$getSubmission$sustainableActivities.stub(
            _then(_instance))
        : CopyWith$Query$GetSubmission$getSubmission$sustainableActivities(
            local$sustainableActivities, (e) => call(sustainableActivities: e));
  }
}

class _CopyWithStubImpl$Query$GetSubmission$getSubmission<TRes>
    implements CopyWith$Query$GetSubmission$getSubmission<TRes> {
  _CopyWithStubImpl$Query$GetSubmission$getSubmission(this._res);

  TRes _res;

  call({
    String? id,
    String? financialYear,
    Enum$FpoYearlySubmissionStatusChoices? status,
    String? submittedAt,
    double? calculatedScore,
    String? governanceScore,
    String? businessScore,
    String? processScore,
    String? financialScore,
    Query$GetSubmission$getSubmission$fpoDetails? fpoDetails,
    Query$GetSubmission$getSubmission$governance? governance,
    Query$GetSubmission$getSubmission$ceoProfile? ceoProfile,
    Query$GetSubmission$getSubmission$boardDirectors? boardDirectors,
    Query$GetSubmission$getSubmission$businessOperations? businessOperations,
    Query$GetSubmission$getSubmission$complianceDetails? complianceDetails,
    Query$GetSubmission$getSubmission$processesSystems? processesSystems,
    Query$GetSubmission$getSubmission$financialDetails? financialDetails,
    Query$GetSubmission$getSubmission$sustainableActivities?
        sustainableActivities,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetSubmission$getSubmission$fpoDetails<TRes> get fpoDetails =>
      CopyWith$Query$GetSubmission$getSubmission$fpoDetails.stub(_res);

  CopyWith$Query$GetSubmission$getSubmission$governance<TRes> get governance =>
      CopyWith$Query$GetSubmission$getSubmission$governance.stub(_res);

  CopyWith$Query$GetSubmission$getSubmission$ceoProfile<TRes> get ceoProfile =>
      CopyWith$Query$GetSubmission$getSubmission$ceoProfile.stub(_res);

  CopyWith$Query$GetSubmission$getSubmission$boardDirectors<TRes>
      get boardDirectors =>
          CopyWith$Query$GetSubmission$getSubmission$boardDirectors.stub(_res);

  CopyWith$Query$GetSubmission$getSubmission$businessOperations<TRes>
      get businessOperations =>
          CopyWith$Query$GetSubmission$getSubmission$businessOperations.stub(
              _res);

  CopyWith$Query$GetSubmission$getSubmission$complianceDetails<TRes>
      get complianceDetails =>
          CopyWith$Query$GetSubmission$getSubmission$complianceDetails.stub(
              _res);

  CopyWith$Query$GetSubmission$getSubmission$processesSystems<TRes>
      get processesSystems =>
          CopyWith$Query$GetSubmission$getSubmission$processesSystems.stub(
              _res);

  CopyWith$Query$GetSubmission$getSubmission$financialDetails<TRes>
      get financialDetails =>
          CopyWith$Query$GetSubmission$getSubmission$financialDetails.stub(
              _res);

  CopyWith$Query$GetSubmission$getSubmission$sustainableActivities<TRes>
      get sustainableActivities =>
          CopyWith$Query$GetSubmission$getSubmission$sustainableActivities.stub(
              _res);
}

class Query$GetSubmission$getSubmission$fpoDetails {
  Query$GetSubmission$getSubmission$fpoDetails({
    required this.id,
    required this.nameOfProducerOrganization,
    required this.registeredAddress,
    required this.district,
    required this.state,
    required this.typeOfProducerOrganization,
    required this.dateOfIncorporation,
    required this.dateOfCommencement,
    required this.ageOfFpoYears,
    required this.typeOfFpo,
    this.sizeOfFpoFy2324,
    this.sizeOfFpoFy2223,
    this.sizeOfFpoFy2122,
    this.farmersTransacted,
    this.womenMembers,
    this.targetSizeOfFpo,
    this.dealsThroughPgsFigs,
    this.numPgsFigs,
    required this.promotingAgencyName,
    this.typeOfPromotingAgency,
    required this.otherPromotingAgencyType,
    this.receivedGrants,
    required this.grantMakingOrganization,
    this.supportedByPromotingAgency,
    this.$__typename = 'FPODetailsSubmissionNode',
  });

  factory Query$GetSubmission$getSubmission$fpoDetails.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$nameOfProducerOrganization = json['nameOfProducerOrganization'];
    final l$registeredAddress = json['registeredAddress'];
    final l$district = json['district'];
    final l$state = json['state'];
    final l$typeOfProducerOrganization = json['typeOfProducerOrganization'];
    final l$dateOfIncorporation = json['dateOfIncorporation'];
    final l$dateOfCommencement = json['dateOfCommencement'];
    final l$ageOfFpoYears = json['ageOfFpoYears'];
    final l$typeOfFpo = json['typeOfFpo'];
    final l$sizeOfFpoFy2324 = json['sizeOfFpoFy2324'];
    final l$sizeOfFpoFy2223 = json['sizeOfFpoFy2223'];
    final l$sizeOfFpoFy2122 = json['sizeOfFpoFy2122'];
    final l$farmersTransacted = json['farmersTransacted'];
    final l$womenMembers = json['womenMembers'];
    final l$targetSizeOfFpo = json['targetSizeOfFpo'];
    final l$dealsThroughPgsFigs = json['dealsThroughPgsFigs'];
    final l$numPgsFigs = json['numPgsFigs'];
    final l$promotingAgencyName = json['promotingAgencyName'];
    final l$typeOfPromotingAgency = json['typeOfPromotingAgency'];
    final l$otherPromotingAgencyType = json['otherPromotingAgencyType'];
    final l$receivedGrants = json['receivedGrants'];
    final l$grantMakingOrganization = json['grantMakingOrganization'];
    final l$supportedByPromotingAgency = json['supportedByPromotingAgency'];
    final l$$__typename = json['__typename'];
    return Query$GetSubmission$getSubmission$fpoDetails(
      id: (l$id as String),
      nameOfProducerOrganization: (l$nameOfProducerOrganization as String),
      registeredAddress: (l$registeredAddress as String),
      district: (l$district as String),
      state: (l$state as String),
      typeOfProducerOrganization:
          fromJson$Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices(
              (l$typeOfProducerOrganization as String)),
      dateOfIncorporation: (l$dateOfIncorporation as String),
      dateOfCommencement: (l$dateOfCommencement as String),
      ageOfFpoYears: (l$ageOfFpoYears as num).toDouble(),
      typeOfFpo: fromJson$Enum$FpoFPODetailsSubmissionTypeOfFpoChoices(
          (l$typeOfFpo as String)),
      sizeOfFpoFy2324: (l$sizeOfFpoFy2324 as int?),
      sizeOfFpoFy2223: (l$sizeOfFpoFy2223 as int?),
      sizeOfFpoFy2122: (l$sizeOfFpoFy2122 as int?),
      farmersTransacted: (l$farmersTransacted as int?),
      womenMembers: (l$womenMembers as int?),
      targetSizeOfFpo: (l$targetSizeOfFpo as int?),
      dealsThroughPgsFigs: (l$dealsThroughPgsFigs as bool?),
      numPgsFigs: (l$numPgsFigs as int?),
      promotingAgencyName: (l$promotingAgencyName as String),
      typeOfPromotingAgency: l$typeOfPromotingAgency == null
          ? null
          : fromJson$Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices(
              (l$typeOfPromotingAgency as String)),
      otherPromotingAgencyType: (l$otherPromotingAgencyType as String),
      receivedGrants: (l$receivedGrants as bool?),
      grantMakingOrganization: (l$grantMakingOrganization as String),
      supportedByPromotingAgency: (l$supportedByPromotingAgency as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String nameOfProducerOrganization;

  final String registeredAddress;

  final String district;

  final String state;

  final Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices
      typeOfProducerOrganization;

  final String dateOfIncorporation;

  final String dateOfCommencement;

  final double ageOfFpoYears;

  final Enum$FpoFPODetailsSubmissionTypeOfFpoChoices typeOfFpo;

  final int? sizeOfFpoFy2324;

  final int? sizeOfFpoFy2223;

  final int? sizeOfFpoFy2122;

  final int? farmersTransacted;

  final int? womenMembers;

  final int? targetSizeOfFpo;

  final bool? dealsThroughPgsFigs;

  final int? numPgsFigs;

  final String promotingAgencyName;

  final Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices?
      typeOfPromotingAgency;

  final String otherPromotingAgencyType;

  final bool? receivedGrants;

  final String grantMakingOrganization;

  final bool? supportedByPromotingAgency;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$nameOfProducerOrganization = nameOfProducerOrganization;
    _resultData['nameOfProducerOrganization'] = l$nameOfProducerOrganization;
    final l$registeredAddress = registeredAddress;
    _resultData['registeredAddress'] = l$registeredAddress;
    final l$district = district;
    _resultData['district'] = l$district;
    final l$state = state;
    _resultData['state'] = l$state;
    final l$typeOfProducerOrganization = typeOfProducerOrganization;
    _resultData['typeOfProducerOrganization'] =
        toJson$Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices(
            l$typeOfProducerOrganization);
    final l$dateOfIncorporation = dateOfIncorporation;
    _resultData['dateOfIncorporation'] = l$dateOfIncorporation;
    final l$dateOfCommencement = dateOfCommencement;
    _resultData['dateOfCommencement'] = l$dateOfCommencement;
    final l$ageOfFpoYears = ageOfFpoYears;
    _resultData['ageOfFpoYears'] = l$ageOfFpoYears;
    final l$typeOfFpo = typeOfFpo;
    _resultData['typeOfFpo'] =
        toJson$Enum$FpoFPODetailsSubmissionTypeOfFpoChoices(l$typeOfFpo);
    final l$sizeOfFpoFy2324 = sizeOfFpoFy2324;
    _resultData['sizeOfFpoFy2324'] = l$sizeOfFpoFy2324;
    final l$sizeOfFpoFy2223 = sizeOfFpoFy2223;
    _resultData['sizeOfFpoFy2223'] = l$sizeOfFpoFy2223;
    final l$sizeOfFpoFy2122 = sizeOfFpoFy2122;
    _resultData['sizeOfFpoFy2122'] = l$sizeOfFpoFy2122;
    final l$farmersTransacted = farmersTransacted;
    _resultData['farmersTransacted'] = l$farmersTransacted;
    final l$womenMembers = womenMembers;
    _resultData['womenMembers'] = l$womenMembers;
    final l$targetSizeOfFpo = targetSizeOfFpo;
    _resultData['targetSizeOfFpo'] = l$targetSizeOfFpo;
    final l$dealsThroughPgsFigs = dealsThroughPgsFigs;
    _resultData['dealsThroughPgsFigs'] = l$dealsThroughPgsFigs;
    final l$numPgsFigs = numPgsFigs;
    _resultData['numPgsFigs'] = l$numPgsFigs;
    final l$promotingAgencyName = promotingAgencyName;
    _resultData['promotingAgencyName'] = l$promotingAgencyName;
    final l$typeOfPromotingAgency = typeOfPromotingAgency;
    _resultData['typeOfPromotingAgency'] = l$typeOfPromotingAgency == null
        ? null
        : toJson$Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices(
            l$typeOfPromotingAgency);
    final l$otherPromotingAgencyType = otherPromotingAgencyType;
    _resultData['otherPromotingAgencyType'] = l$otherPromotingAgencyType;
    final l$receivedGrants = receivedGrants;
    _resultData['receivedGrants'] = l$receivedGrants;
    final l$grantMakingOrganization = grantMakingOrganization;
    _resultData['grantMakingOrganization'] = l$grantMakingOrganization;
    final l$supportedByPromotingAgency = supportedByPromotingAgency;
    _resultData['supportedByPromotingAgency'] = l$supportedByPromotingAgency;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$nameOfProducerOrganization = nameOfProducerOrganization;
    final l$registeredAddress = registeredAddress;
    final l$district = district;
    final l$state = state;
    final l$typeOfProducerOrganization = typeOfProducerOrganization;
    final l$dateOfIncorporation = dateOfIncorporation;
    final l$dateOfCommencement = dateOfCommencement;
    final l$ageOfFpoYears = ageOfFpoYears;
    final l$typeOfFpo = typeOfFpo;
    final l$sizeOfFpoFy2324 = sizeOfFpoFy2324;
    final l$sizeOfFpoFy2223 = sizeOfFpoFy2223;
    final l$sizeOfFpoFy2122 = sizeOfFpoFy2122;
    final l$farmersTransacted = farmersTransacted;
    final l$womenMembers = womenMembers;
    final l$targetSizeOfFpo = targetSizeOfFpo;
    final l$dealsThroughPgsFigs = dealsThroughPgsFigs;
    final l$numPgsFigs = numPgsFigs;
    final l$promotingAgencyName = promotingAgencyName;
    final l$typeOfPromotingAgency = typeOfPromotingAgency;
    final l$otherPromotingAgencyType = otherPromotingAgencyType;
    final l$receivedGrants = receivedGrants;
    final l$grantMakingOrganization = grantMakingOrganization;
    final l$supportedByPromotingAgency = supportedByPromotingAgency;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$nameOfProducerOrganization,
      l$registeredAddress,
      l$district,
      l$state,
      l$typeOfProducerOrganization,
      l$dateOfIncorporation,
      l$dateOfCommencement,
      l$ageOfFpoYears,
      l$typeOfFpo,
      l$sizeOfFpoFy2324,
      l$sizeOfFpoFy2223,
      l$sizeOfFpoFy2122,
      l$farmersTransacted,
      l$womenMembers,
      l$targetSizeOfFpo,
      l$dealsThroughPgsFigs,
      l$numPgsFigs,
      l$promotingAgencyName,
      l$typeOfPromotingAgency,
      l$otherPromotingAgencyType,
      l$receivedGrants,
      l$grantMakingOrganization,
      l$supportedByPromotingAgency,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSubmission$getSubmission$fpoDetails) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$nameOfProducerOrganization = nameOfProducerOrganization;
    final lOther$nameOfProducerOrganization = other.nameOfProducerOrganization;
    if (l$nameOfProducerOrganization != lOther$nameOfProducerOrganization) {
      return false;
    }
    final l$registeredAddress = registeredAddress;
    final lOther$registeredAddress = other.registeredAddress;
    if (l$registeredAddress != lOther$registeredAddress) {
      return false;
    }
    final l$district = district;
    final lOther$district = other.district;
    if (l$district != lOther$district) {
      return false;
    }
    final l$state = state;
    final lOther$state = other.state;
    if (l$state != lOther$state) {
      return false;
    }
    final l$typeOfProducerOrganization = typeOfProducerOrganization;
    final lOther$typeOfProducerOrganization = other.typeOfProducerOrganization;
    if (l$typeOfProducerOrganization != lOther$typeOfProducerOrganization) {
      return false;
    }
    final l$dateOfIncorporation = dateOfIncorporation;
    final lOther$dateOfIncorporation = other.dateOfIncorporation;
    if (l$dateOfIncorporation != lOther$dateOfIncorporation) {
      return false;
    }
    final l$dateOfCommencement = dateOfCommencement;
    final lOther$dateOfCommencement = other.dateOfCommencement;
    if (l$dateOfCommencement != lOther$dateOfCommencement) {
      return false;
    }
    final l$ageOfFpoYears = ageOfFpoYears;
    final lOther$ageOfFpoYears = other.ageOfFpoYears;
    if (l$ageOfFpoYears != lOther$ageOfFpoYears) {
      return false;
    }
    final l$typeOfFpo = typeOfFpo;
    final lOther$typeOfFpo = other.typeOfFpo;
    if (l$typeOfFpo != lOther$typeOfFpo) {
      return false;
    }
    final l$sizeOfFpoFy2324 = sizeOfFpoFy2324;
    final lOther$sizeOfFpoFy2324 = other.sizeOfFpoFy2324;
    if (l$sizeOfFpoFy2324 != lOther$sizeOfFpoFy2324) {
      return false;
    }
    final l$sizeOfFpoFy2223 = sizeOfFpoFy2223;
    final lOther$sizeOfFpoFy2223 = other.sizeOfFpoFy2223;
    if (l$sizeOfFpoFy2223 != lOther$sizeOfFpoFy2223) {
      return false;
    }
    final l$sizeOfFpoFy2122 = sizeOfFpoFy2122;
    final lOther$sizeOfFpoFy2122 = other.sizeOfFpoFy2122;
    if (l$sizeOfFpoFy2122 != lOther$sizeOfFpoFy2122) {
      return false;
    }
    final l$farmersTransacted = farmersTransacted;
    final lOther$farmersTransacted = other.farmersTransacted;
    if (l$farmersTransacted != lOther$farmersTransacted) {
      return false;
    }
    final l$womenMembers = womenMembers;
    final lOther$womenMembers = other.womenMembers;
    if (l$womenMembers != lOther$womenMembers) {
      return false;
    }
    final l$targetSizeOfFpo = targetSizeOfFpo;
    final lOther$targetSizeOfFpo = other.targetSizeOfFpo;
    if (l$targetSizeOfFpo != lOther$targetSizeOfFpo) {
      return false;
    }
    final l$dealsThroughPgsFigs = dealsThroughPgsFigs;
    final lOther$dealsThroughPgsFigs = other.dealsThroughPgsFigs;
    if (l$dealsThroughPgsFigs != lOther$dealsThroughPgsFigs) {
      return false;
    }
    final l$numPgsFigs = numPgsFigs;
    final lOther$numPgsFigs = other.numPgsFigs;
    if (l$numPgsFigs != lOther$numPgsFigs) {
      return false;
    }
    final l$promotingAgencyName = promotingAgencyName;
    final lOther$promotingAgencyName = other.promotingAgencyName;
    if (l$promotingAgencyName != lOther$promotingAgencyName) {
      return false;
    }
    final l$typeOfPromotingAgency = typeOfPromotingAgency;
    final lOther$typeOfPromotingAgency = other.typeOfPromotingAgency;
    if (l$typeOfPromotingAgency != lOther$typeOfPromotingAgency) {
      return false;
    }
    final l$otherPromotingAgencyType = otherPromotingAgencyType;
    final lOther$otherPromotingAgencyType = other.otherPromotingAgencyType;
    if (l$otherPromotingAgencyType != lOther$otherPromotingAgencyType) {
      return false;
    }
    final l$receivedGrants = receivedGrants;
    final lOther$receivedGrants = other.receivedGrants;
    if (l$receivedGrants != lOther$receivedGrants) {
      return false;
    }
    final l$grantMakingOrganization = grantMakingOrganization;
    final lOther$grantMakingOrganization = other.grantMakingOrganization;
    if (l$grantMakingOrganization != lOther$grantMakingOrganization) {
      return false;
    }
    final l$supportedByPromotingAgency = supportedByPromotingAgency;
    final lOther$supportedByPromotingAgency = other.supportedByPromotingAgency;
    if (l$supportedByPromotingAgency != lOther$supportedByPromotingAgency) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSubmission$getSubmission$fpoDetails
    on Query$GetSubmission$getSubmission$fpoDetails {
  CopyWith$Query$GetSubmission$getSubmission$fpoDetails<
          Query$GetSubmission$getSubmission$fpoDetails>
      get copyWith => CopyWith$Query$GetSubmission$getSubmission$fpoDetails(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSubmission$getSubmission$fpoDetails<TRes> {
  factory CopyWith$Query$GetSubmission$getSubmission$fpoDetails(
    Query$GetSubmission$getSubmission$fpoDetails instance,
    TRes Function(Query$GetSubmission$getSubmission$fpoDetails) then,
  ) = _CopyWithImpl$Query$GetSubmission$getSubmission$fpoDetails;

  factory CopyWith$Query$GetSubmission$getSubmission$fpoDetails.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSubmission$getSubmission$fpoDetails;

  TRes call({
    String? id,
    String? nameOfProducerOrganization,
    String? registeredAddress,
    String? district,
    String? state,
    Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices?
        typeOfProducerOrganization,
    String? dateOfIncorporation,
    String? dateOfCommencement,
    double? ageOfFpoYears,
    Enum$FpoFPODetailsSubmissionTypeOfFpoChoices? typeOfFpo,
    int? sizeOfFpoFy2324,
    int? sizeOfFpoFy2223,
    int? sizeOfFpoFy2122,
    int? farmersTransacted,
    int? womenMembers,
    int? targetSizeOfFpo,
    bool? dealsThroughPgsFigs,
    int? numPgsFigs,
    String? promotingAgencyName,
    Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices?
        typeOfPromotingAgency,
    String? otherPromotingAgencyType,
    bool? receivedGrants,
    String? grantMakingOrganization,
    bool? supportedByPromotingAgency,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetSubmission$getSubmission$fpoDetails<TRes>
    implements CopyWith$Query$GetSubmission$getSubmission$fpoDetails<TRes> {
  _CopyWithImpl$Query$GetSubmission$getSubmission$fpoDetails(
    this._instance,
    this._then,
  );

  final Query$GetSubmission$getSubmission$fpoDetails _instance;

  final TRes Function(Query$GetSubmission$getSubmission$fpoDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? nameOfProducerOrganization = _undefined,
    Object? registeredAddress = _undefined,
    Object? district = _undefined,
    Object? state = _undefined,
    Object? typeOfProducerOrganization = _undefined,
    Object? dateOfIncorporation = _undefined,
    Object? dateOfCommencement = _undefined,
    Object? ageOfFpoYears = _undefined,
    Object? typeOfFpo = _undefined,
    Object? sizeOfFpoFy2324 = _undefined,
    Object? sizeOfFpoFy2223 = _undefined,
    Object? sizeOfFpoFy2122 = _undefined,
    Object? farmersTransacted = _undefined,
    Object? womenMembers = _undefined,
    Object? targetSizeOfFpo = _undefined,
    Object? dealsThroughPgsFigs = _undefined,
    Object? numPgsFigs = _undefined,
    Object? promotingAgencyName = _undefined,
    Object? typeOfPromotingAgency = _undefined,
    Object? otherPromotingAgencyType = _undefined,
    Object? receivedGrants = _undefined,
    Object? grantMakingOrganization = _undefined,
    Object? supportedByPromotingAgency = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSubmission$getSubmission$fpoDetails(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        nameOfProducerOrganization: nameOfProducerOrganization == _undefined ||
                nameOfProducerOrganization == null
            ? _instance.nameOfProducerOrganization
            : (nameOfProducerOrganization as String),
        registeredAddress:
            registeredAddress == _undefined || registeredAddress == null
                ? _instance.registeredAddress
                : (registeredAddress as String),
        district: district == _undefined || district == null
            ? _instance.district
            : (district as String),
        state: state == _undefined || state == null
            ? _instance.state
            : (state as String),
        typeOfProducerOrganization: typeOfProducerOrganization == _undefined ||
                typeOfProducerOrganization == null
            ? _instance.typeOfProducerOrganization
            : (typeOfProducerOrganization
                as Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices),
        dateOfIncorporation:
            dateOfIncorporation == _undefined || dateOfIncorporation == null
                ? _instance.dateOfIncorporation
                : (dateOfIncorporation as String),
        dateOfCommencement:
            dateOfCommencement == _undefined || dateOfCommencement == null
                ? _instance.dateOfCommencement
                : (dateOfCommencement as String),
        ageOfFpoYears: ageOfFpoYears == _undefined || ageOfFpoYears == null
            ? _instance.ageOfFpoYears
            : (ageOfFpoYears as double),
        typeOfFpo: typeOfFpo == _undefined || typeOfFpo == null
            ? _instance.typeOfFpo
            : (typeOfFpo as Enum$FpoFPODetailsSubmissionTypeOfFpoChoices),
        sizeOfFpoFy2324: sizeOfFpoFy2324 == _undefined
            ? _instance.sizeOfFpoFy2324
            : (sizeOfFpoFy2324 as int?),
        sizeOfFpoFy2223: sizeOfFpoFy2223 == _undefined
            ? _instance.sizeOfFpoFy2223
            : (sizeOfFpoFy2223 as int?),
        sizeOfFpoFy2122: sizeOfFpoFy2122 == _undefined
            ? _instance.sizeOfFpoFy2122
            : (sizeOfFpoFy2122 as int?),
        farmersTransacted: farmersTransacted == _undefined
            ? _instance.farmersTransacted
            : (farmersTransacted as int?),
        womenMembers: womenMembers == _undefined
            ? _instance.womenMembers
            : (womenMembers as int?),
        targetSizeOfFpo: targetSizeOfFpo == _undefined
            ? _instance.targetSizeOfFpo
            : (targetSizeOfFpo as int?),
        dealsThroughPgsFigs: dealsThroughPgsFigs == _undefined
            ? _instance.dealsThroughPgsFigs
            : (dealsThroughPgsFigs as bool?),
        numPgsFigs: numPgsFigs == _undefined
            ? _instance.numPgsFigs
            : (numPgsFigs as int?),
        promotingAgencyName:
            promotingAgencyName == _undefined || promotingAgencyName == null
                ? _instance.promotingAgencyName
                : (promotingAgencyName as String),
        typeOfPromotingAgency: typeOfPromotingAgency == _undefined
            ? _instance.typeOfPromotingAgency
            : (typeOfPromotingAgency
                as Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices?),
        otherPromotingAgencyType: otherPromotingAgencyType == _undefined ||
                otherPromotingAgencyType == null
            ? _instance.otherPromotingAgencyType
            : (otherPromotingAgencyType as String),
        receivedGrants: receivedGrants == _undefined
            ? _instance.receivedGrants
            : (receivedGrants as bool?),
        grantMakingOrganization: grantMakingOrganization == _undefined ||
                grantMakingOrganization == null
            ? _instance.grantMakingOrganization
            : (grantMakingOrganization as String),
        supportedByPromotingAgency: supportedByPromotingAgency == _undefined
            ? _instance.supportedByPromotingAgency
            : (supportedByPromotingAgency as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetSubmission$getSubmission$fpoDetails<TRes>
    implements CopyWith$Query$GetSubmission$getSubmission$fpoDetails<TRes> {
  _CopyWithStubImpl$Query$GetSubmission$getSubmission$fpoDetails(this._res);

  TRes _res;

  call({
    String? id,
    String? nameOfProducerOrganization,
    String? registeredAddress,
    String? district,
    String? state,
    Enum$FpoFPODetailsSubmissionTypeOfProducerOrganizationChoices?
        typeOfProducerOrganization,
    String? dateOfIncorporation,
    String? dateOfCommencement,
    double? ageOfFpoYears,
    Enum$FpoFPODetailsSubmissionTypeOfFpoChoices? typeOfFpo,
    int? sizeOfFpoFy2324,
    int? sizeOfFpoFy2223,
    int? sizeOfFpoFy2122,
    int? farmersTransacted,
    int? womenMembers,
    int? targetSizeOfFpo,
    bool? dealsThroughPgsFigs,
    int? numPgsFigs,
    String? promotingAgencyName,
    Enum$FpoFPODetailsSubmissionTypeOfPromotingAgencyChoices?
        typeOfPromotingAgency,
    String? otherPromotingAgencyType,
    bool? receivedGrants,
    String? grantMakingOrganization,
    bool? supportedByPromotingAgency,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetSubmission$getSubmission$governance {
  Query$GetSubmission$getSubmission$governance({
    required this.id,
    required this.annualGeneralBodyMeetings,
    required this.bodMeetingsLastFinancialYear,
    required this.numBods,
    required this.numWomenBods,
    required this.minutesMaintenance,
    this.secondLineManagement,
    this.$__typename = 'GovernanceSubmissionNode',
  });

  factory Query$GetSubmission$getSubmission$governance.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$annualGeneralBodyMeetings = json['annualGeneralBodyMeetings'];
    final l$bodMeetingsLastFinancialYear = json['bodMeetingsLastFinancialYear'];
    final l$numBods = json['numBods'];
    final l$numWomenBods = json['numWomenBods'];
    final l$minutesMaintenance = json['minutesMaintenance'];
    final l$secondLineManagement = json['secondLineManagement'];
    final l$$__typename = json['__typename'];
    return Query$GetSubmission$getSubmission$governance(
      id: (l$id as String),
      annualGeneralBodyMeetings: (l$annualGeneralBodyMeetings as int),
      bodMeetingsLastFinancialYear: (l$bodMeetingsLastFinancialYear as int),
      numBods: (l$numBods as int),
      numWomenBods: (l$numWomenBods as int),
      minutesMaintenance:
          fromJson$Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices(
              (l$minutesMaintenance as String)),
      secondLineManagement: l$secondLineManagement == null
          ? null
          : fromJson$Enum$FpoGovernanceSubmissionSecondLineManagementChoices(
              (l$secondLineManagement as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final int annualGeneralBodyMeetings;

  final int bodMeetingsLastFinancialYear;

  final int numBods;

  final int numWomenBods;

  final Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices
      minutesMaintenance;

  final Enum$FpoGovernanceSubmissionSecondLineManagementChoices?
      secondLineManagement;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$annualGeneralBodyMeetings = annualGeneralBodyMeetings;
    _resultData['annualGeneralBodyMeetings'] = l$annualGeneralBodyMeetings;
    final l$bodMeetingsLastFinancialYear = bodMeetingsLastFinancialYear;
    _resultData['bodMeetingsLastFinancialYear'] =
        l$bodMeetingsLastFinancialYear;
    final l$numBods = numBods;
    _resultData['numBods'] = l$numBods;
    final l$numWomenBods = numWomenBods;
    _resultData['numWomenBods'] = l$numWomenBods;
    final l$minutesMaintenance = minutesMaintenance;
    _resultData['minutesMaintenance'] =
        toJson$Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices(
            l$minutesMaintenance);
    final l$secondLineManagement = secondLineManagement;
    _resultData['secondLineManagement'] = l$secondLineManagement == null
        ? null
        : toJson$Enum$FpoGovernanceSubmissionSecondLineManagementChoices(
            l$secondLineManagement);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$annualGeneralBodyMeetings = annualGeneralBodyMeetings;
    final l$bodMeetingsLastFinancialYear = bodMeetingsLastFinancialYear;
    final l$numBods = numBods;
    final l$numWomenBods = numWomenBods;
    final l$minutesMaintenance = minutesMaintenance;
    final l$secondLineManagement = secondLineManagement;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$annualGeneralBodyMeetings,
      l$bodMeetingsLastFinancialYear,
      l$numBods,
      l$numWomenBods,
      l$minutesMaintenance,
      l$secondLineManagement,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSubmission$getSubmission$governance) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$annualGeneralBodyMeetings = annualGeneralBodyMeetings;
    final lOther$annualGeneralBodyMeetings = other.annualGeneralBodyMeetings;
    if (l$annualGeneralBodyMeetings != lOther$annualGeneralBodyMeetings) {
      return false;
    }
    final l$bodMeetingsLastFinancialYear = bodMeetingsLastFinancialYear;
    final lOther$bodMeetingsLastFinancialYear =
        other.bodMeetingsLastFinancialYear;
    if (l$bodMeetingsLastFinancialYear != lOther$bodMeetingsLastFinancialYear) {
      return false;
    }
    final l$numBods = numBods;
    final lOther$numBods = other.numBods;
    if (l$numBods != lOther$numBods) {
      return false;
    }
    final l$numWomenBods = numWomenBods;
    final lOther$numWomenBods = other.numWomenBods;
    if (l$numWomenBods != lOther$numWomenBods) {
      return false;
    }
    final l$minutesMaintenance = minutesMaintenance;
    final lOther$minutesMaintenance = other.minutesMaintenance;
    if (l$minutesMaintenance != lOther$minutesMaintenance) {
      return false;
    }
    final l$secondLineManagement = secondLineManagement;
    final lOther$secondLineManagement = other.secondLineManagement;
    if (l$secondLineManagement != lOther$secondLineManagement) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSubmission$getSubmission$governance
    on Query$GetSubmission$getSubmission$governance {
  CopyWith$Query$GetSubmission$getSubmission$governance<
          Query$GetSubmission$getSubmission$governance>
      get copyWith => CopyWith$Query$GetSubmission$getSubmission$governance(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSubmission$getSubmission$governance<TRes> {
  factory CopyWith$Query$GetSubmission$getSubmission$governance(
    Query$GetSubmission$getSubmission$governance instance,
    TRes Function(Query$GetSubmission$getSubmission$governance) then,
  ) = _CopyWithImpl$Query$GetSubmission$getSubmission$governance;

  factory CopyWith$Query$GetSubmission$getSubmission$governance.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSubmission$getSubmission$governance;

  TRes call({
    String? id,
    int? annualGeneralBodyMeetings,
    int? bodMeetingsLastFinancialYear,
    int? numBods,
    int? numWomenBods,
    Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices? minutesMaintenance,
    Enum$FpoGovernanceSubmissionSecondLineManagementChoices?
        secondLineManagement,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetSubmission$getSubmission$governance<TRes>
    implements CopyWith$Query$GetSubmission$getSubmission$governance<TRes> {
  _CopyWithImpl$Query$GetSubmission$getSubmission$governance(
    this._instance,
    this._then,
  );

  final Query$GetSubmission$getSubmission$governance _instance;

  final TRes Function(Query$GetSubmission$getSubmission$governance) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? annualGeneralBodyMeetings = _undefined,
    Object? bodMeetingsLastFinancialYear = _undefined,
    Object? numBods = _undefined,
    Object? numWomenBods = _undefined,
    Object? minutesMaintenance = _undefined,
    Object? secondLineManagement = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSubmission$getSubmission$governance(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        annualGeneralBodyMeetings: annualGeneralBodyMeetings == _undefined ||
                annualGeneralBodyMeetings == null
            ? _instance.annualGeneralBodyMeetings
            : (annualGeneralBodyMeetings as int),
        bodMeetingsLastFinancialYear:
            bodMeetingsLastFinancialYear == _undefined ||
                    bodMeetingsLastFinancialYear == null
                ? _instance.bodMeetingsLastFinancialYear
                : (bodMeetingsLastFinancialYear as int),
        numBods: numBods == _undefined || numBods == null
            ? _instance.numBods
            : (numBods as int),
        numWomenBods: numWomenBods == _undefined || numWomenBods == null
            ? _instance.numWomenBods
            : (numWomenBods as int),
        minutesMaintenance:
            minutesMaintenance == _undefined || minutesMaintenance == null
                ? _instance.minutesMaintenance
                : (minutesMaintenance
                    as Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices),
        secondLineManagement: secondLineManagement == _undefined
            ? _instance.secondLineManagement
            : (secondLineManagement
                as Enum$FpoGovernanceSubmissionSecondLineManagementChoices?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetSubmission$getSubmission$governance<TRes>
    implements CopyWith$Query$GetSubmission$getSubmission$governance<TRes> {
  _CopyWithStubImpl$Query$GetSubmission$getSubmission$governance(this._res);

  TRes _res;

  call({
    String? id,
    int? annualGeneralBodyMeetings,
    int? bodMeetingsLastFinancialYear,
    int? numBods,
    int? numWomenBods,
    Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices? minutesMaintenance,
    Enum$FpoGovernanceSubmissionSecondLineManagementChoices?
        secondLineManagement,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetSubmission$getSubmission$ceoProfile {
  Query$GetSubmission$getSubmission$ceoProfile({
    required this.id,
    required this.name,
    required this.qualification,
    required this.totalYearsOfExperience,
    required this.typeOfExperience,
    required this.numberOfYearsAssociated,
    this.$__typename = 'CEOProfileSubmissionNode',
  });

  factory Query$GetSubmission$getSubmission$ceoProfile.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$qualification = json['qualification'];
    final l$totalYearsOfExperience = json['totalYearsOfExperience'];
    final l$typeOfExperience = json['typeOfExperience'];
    final l$numberOfYearsAssociated = json['numberOfYearsAssociated'];
    final l$$__typename = json['__typename'];
    return Query$GetSubmission$getSubmission$ceoProfile(
      id: (l$id as String),
      name: (l$name as String),
      qualification: (l$qualification as String),
      totalYearsOfExperience: (l$totalYearsOfExperience as int),
      typeOfExperience:
          fromJson$Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices(
              (l$typeOfExperience as String)),
      numberOfYearsAssociated: (l$numberOfYearsAssociated as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String qualification;

  final int totalYearsOfExperience;

  final Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices typeOfExperience;

  final int numberOfYearsAssociated;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$qualification = qualification;
    _resultData['qualification'] = l$qualification;
    final l$totalYearsOfExperience = totalYearsOfExperience;
    _resultData['totalYearsOfExperience'] = l$totalYearsOfExperience;
    final l$typeOfExperience = typeOfExperience;
    _resultData['typeOfExperience'] =
        toJson$Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices(
            l$typeOfExperience);
    final l$numberOfYearsAssociated = numberOfYearsAssociated;
    _resultData['numberOfYearsAssociated'] = l$numberOfYearsAssociated;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$qualification = qualification;
    final l$totalYearsOfExperience = totalYearsOfExperience;
    final l$typeOfExperience = typeOfExperience;
    final l$numberOfYearsAssociated = numberOfYearsAssociated;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$qualification,
      l$totalYearsOfExperience,
      l$typeOfExperience,
      l$numberOfYearsAssociated,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSubmission$getSubmission$ceoProfile) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$qualification = qualification;
    final lOther$qualification = other.qualification;
    if (l$qualification != lOther$qualification) {
      return false;
    }
    final l$totalYearsOfExperience = totalYearsOfExperience;
    final lOther$totalYearsOfExperience = other.totalYearsOfExperience;
    if (l$totalYearsOfExperience != lOther$totalYearsOfExperience) {
      return false;
    }
    final l$typeOfExperience = typeOfExperience;
    final lOther$typeOfExperience = other.typeOfExperience;
    if (l$typeOfExperience != lOther$typeOfExperience) {
      return false;
    }
    final l$numberOfYearsAssociated = numberOfYearsAssociated;
    final lOther$numberOfYearsAssociated = other.numberOfYearsAssociated;
    if (l$numberOfYearsAssociated != lOther$numberOfYearsAssociated) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSubmission$getSubmission$ceoProfile
    on Query$GetSubmission$getSubmission$ceoProfile {
  CopyWith$Query$GetSubmission$getSubmission$ceoProfile<
          Query$GetSubmission$getSubmission$ceoProfile>
      get copyWith => CopyWith$Query$GetSubmission$getSubmission$ceoProfile(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSubmission$getSubmission$ceoProfile<TRes> {
  factory CopyWith$Query$GetSubmission$getSubmission$ceoProfile(
    Query$GetSubmission$getSubmission$ceoProfile instance,
    TRes Function(Query$GetSubmission$getSubmission$ceoProfile) then,
  ) = _CopyWithImpl$Query$GetSubmission$getSubmission$ceoProfile;

  factory CopyWith$Query$GetSubmission$getSubmission$ceoProfile.stub(TRes res) =
      _CopyWithStubImpl$Query$GetSubmission$getSubmission$ceoProfile;

  TRes call({
    String? id,
    String? name,
    String? qualification,
    int? totalYearsOfExperience,
    Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices? typeOfExperience,
    int? numberOfYearsAssociated,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetSubmission$getSubmission$ceoProfile<TRes>
    implements CopyWith$Query$GetSubmission$getSubmission$ceoProfile<TRes> {
  _CopyWithImpl$Query$GetSubmission$getSubmission$ceoProfile(
    this._instance,
    this._then,
  );

  final Query$GetSubmission$getSubmission$ceoProfile _instance;

  final TRes Function(Query$GetSubmission$getSubmission$ceoProfile) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? qualification = _undefined,
    Object? totalYearsOfExperience = _undefined,
    Object? typeOfExperience = _undefined,
    Object? numberOfYearsAssociated = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSubmission$getSubmission$ceoProfile(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        qualification: qualification == _undefined || qualification == null
            ? _instance.qualification
            : (qualification as String),
        totalYearsOfExperience: totalYearsOfExperience == _undefined ||
                totalYearsOfExperience == null
            ? _instance.totalYearsOfExperience
            : (totalYearsOfExperience as int),
        typeOfExperience:
            typeOfExperience == _undefined || typeOfExperience == null
                ? _instance.typeOfExperience
                : (typeOfExperience
                    as Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices),
        numberOfYearsAssociated: numberOfYearsAssociated == _undefined ||
                numberOfYearsAssociated == null
            ? _instance.numberOfYearsAssociated
            : (numberOfYearsAssociated as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetSubmission$getSubmission$ceoProfile<TRes>
    implements CopyWith$Query$GetSubmission$getSubmission$ceoProfile<TRes> {
  _CopyWithStubImpl$Query$GetSubmission$getSubmission$ceoProfile(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? qualification,
    int? totalYearsOfExperience,
    Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices? typeOfExperience,
    int? numberOfYearsAssociated,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetSubmission$getSubmission$boardDirectors {
  Query$GetSubmission$getSubmission$boardDirectors({
    required this.edges,
    this.$__typename = 'BoardDirectorProfileNodeConnection',
  });

  factory Query$GetSubmission$getSubmission$boardDirectors.fromJson(
      Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$GetSubmission$getSubmission$boardDirectors(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$GetSubmission$getSubmission$boardDirectors$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetSubmission$getSubmission$boardDirectors$edges?> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSubmission$getSubmission$boardDirectors) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSubmission$getSubmission$boardDirectors
    on Query$GetSubmission$getSubmission$boardDirectors {
  CopyWith$Query$GetSubmission$getSubmission$boardDirectors<
          Query$GetSubmission$getSubmission$boardDirectors>
      get copyWith => CopyWith$Query$GetSubmission$getSubmission$boardDirectors(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSubmission$getSubmission$boardDirectors<TRes> {
  factory CopyWith$Query$GetSubmission$getSubmission$boardDirectors(
    Query$GetSubmission$getSubmission$boardDirectors instance,
    TRes Function(Query$GetSubmission$getSubmission$boardDirectors) then,
  ) = _CopyWithImpl$Query$GetSubmission$getSubmission$boardDirectors;

  factory CopyWith$Query$GetSubmission$getSubmission$boardDirectors.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetSubmission$getSubmission$boardDirectors;

  TRes call({
    List<Query$GetSubmission$getSubmission$boardDirectors$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$GetSubmission$getSubmission$boardDirectors$edges?> Function(
              Iterable<
                  CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges<
                      Query$GetSubmission$getSubmission$boardDirectors$edges>?>)
          _fn);
}

class _CopyWithImpl$Query$GetSubmission$getSubmission$boardDirectors<TRes>
    implements CopyWith$Query$GetSubmission$getSubmission$boardDirectors<TRes> {
  _CopyWithImpl$Query$GetSubmission$getSubmission$boardDirectors(
    this._instance,
    this._then,
  );

  final Query$GetSubmission$getSubmission$boardDirectors _instance;

  final TRes Function(Query$GetSubmission$getSubmission$boardDirectors) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSubmission$getSubmission$boardDirectors(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<
                Query$GetSubmission$getSubmission$boardDirectors$edges?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$GetSubmission$getSubmission$boardDirectors$edges?> Function(
                  Iterable<
                      CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges<
                          Query$GetSubmission$getSubmission$boardDirectors$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Query$GetSubmission$getSubmission$boardDirectors<TRes>
    implements CopyWith$Query$GetSubmission$getSubmission$boardDirectors<TRes> {
  _CopyWithStubImpl$Query$GetSubmission$getSubmission$boardDirectors(this._res);

  TRes _res;

  call({
    List<Query$GetSubmission$getSubmission$boardDirectors$edges?>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$GetSubmission$getSubmission$boardDirectors$edges {
  Query$GetSubmission$getSubmission$boardDirectors$edges({
    this.node,
    this.$__typename = 'BoardDirectorProfileNodeEdge',
  });

  factory Query$GetSubmission$getSubmission$boardDirectors$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetSubmission$getSubmission$boardDirectors$edges(
      node: l$node == null
          ? null
          : Query$GetSubmission$getSubmission$boardDirectors$edges$node
              .fromJson((l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetSubmission$getSubmission$boardDirectors$edges$node? node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSubmission$getSubmission$boardDirectors$edges) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSubmission$getSubmission$boardDirectors$edges
    on Query$GetSubmission$getSubmission$boardDirectors$edges {
  CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges<
          Query$GetSubmission$getSubmission$boardDirectors$edges>
      get copyWith =>
          CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges<
    TRes> {
  factory CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges(
    Query$GetSubmission$getSubmission$boardDirectors$edges instance,
    TRes Function(Query$GetSubmission$getSubmission$boardDirectors$edges) then,
  ) = _CopyWithImpl$Query$GetSubmission$getSubmission$boardDirectors$edges;

  factory CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetSubmission$getSubmission$boardDirectors$edges;

  TRes call({
    Query$GetSubmission$getSubmission$boardDirectors$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges$node<TRes>
      get node;
}

class _CopyWithImpl$Query$GetSubmission$getSubmission$boardDirectors$edges<TRes>
    implements
        CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges<TRes> {
  _CopyWithImpl$Query$GetSubmission$getSubmission$boardDirectors$edges(
    this._instance,
    this._then,
  );

  final Query$GetSubmission$getSubmission$boardDirectors$edges _instance;

  final TRes Function(Query$GetSubmission$getSubmission$boardDirectors$edges)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSubmission$getSubmission$boardDirectors$edges(
        node: node == _undefined
            ? _instance.node
            : (node
                as Query$GetSubmission$getSubmission$boardDirectors$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges$node<TRes>
      get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges$node
            .stub(_then(_instance))
        : CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$GetSubmission$getSubmission$boardDirectors$edges<
        TRes>
    implements
        CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges<TRes> {
  _CopyWithStubImpl$Query$GetSubmission$getSubmission$boardDirectors$edges(
      this._res);

  TRes _res;

  call({
    Query$GetSubmission$getSubmission$boardDirectors$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges$node<TRes>
      get node =>
          CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges$node
              .stub(_res);
}

class Query$GetSubmission$getSubmission$boardDirectors$edges$node {
  Query$GetSubmission$getSubmission$boardDirectors$edges$node({
    required this.id,
    required this.name,
    required this.educationalQualification,
    required this.totalYearsOfExperience,
    required this.typeOfExperience,
    this.$__typename = 'BoardDirectorProfileNode',
  });

  factory Query$GetSubmission$getSubmission$boardDirectors$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$educationalQualification = json['educationalQualification'];
    final l$totalYearsOfExperience = json['totalYearsOfExperience'];
    final l$typeOfExperience = json['typeOfExperience'];
    final l$$__typename = json['__typename'];
    return Query$GetSubmission$getSubmission$boardDirectors$edges$node(
      id: (l$id as String),
      name: (l$name as String),
      educationalQualification: (l$educationalQualification as String),
      totalYearsOfExperience: (l$totalYearsOfExperience as int),
      typeOfExperience:
          fromJson$Enum$FpoBoardDirectorProfileTypeOfExperienceChoices(
              (l$typeOfExperience as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String educationalQualification;

  final int totalYearsOfExperience;

  final Enum$FpoBoardDirectorProfileTypeOfExperienceChoices typeOfExperience;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$educationalQualification = educationalQualification;
    _resultData['educationalQualification'] = l$educationalQualification;
    final l$totalYearsOfExperience = totalYearsOfExperience;
    _resultData['totalYearsOfExperience'] = l$totalYearsOfExperience;
    final l$typeOfExperience = typeOfExperience;
    _resultData['typeOfExperience'] =
        toJson$Enum$FpoBoardDirectorProfileTypeOfExperienceChoices(
            l$typeOfExperience);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$educationalQualification = educationalQualification;
    final l$totalYearsOfExperience = totalYearsOfExperience;
    final l$typeOfExperience = typeOfExperience;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$educationalQualification,
      l$totalYearsOfExperience,
      l$typeOfExperience,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Query$GetSubmission$getSubmission$boardDirectors$edges$node) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$educationalQualification = educationalQualification;
    final lOther$educationalQualification = other.educationalQualification;
    if (l$educationalQualification != lOther$educationalQualification) {
      return false;
    }
    final l$totalYearsOfExperience = totalYearsOfExperience;
    final lOther$totalYearsOfExperience = other.totalYearsOfExperience;
    if (l$totalYearsOfExperience != lOther$totalYearsOfExperience) {
      return false;
    }
    final l$typeOfExperience = typeOfExperience;
    final lOther$typeOfExperience = other.typeOfExperience;
    if (l$typeOfExperience != lOther$typeOfExperience) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSubmission$getSubmission$boardDirectors$edges$node
    on Query$GetSubmission$getSubmission$boardDirectors$edges$node {
  CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges$node<
          Query$GetSubmission$getSubmission$boardDirectors$edges$node>
      get copyWith =>
          CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges$node<
    TRes> {
  factory CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges$node(
    Query$GetSubmission$getSubmission$boardDirectors$edges$node instance,
    TRes Function(Query$GetSubmission$getSubmission$boardDirectors$edges$node)
        then,
  ) = _CopyWithImpl$Query$GetSubmission$getSubmission$boardDirectors$edges$node;

  factory CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges$node.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetSubmission$getSubmission$boardDirectors$edges$node;

  TRes call({
    String? id,
    String? name,
    String? educationalQualification,
    int? totalYearsOfExperience,
    Enum$FpoBoardDirectorProfileTypeOfExperienceChoices? typeOfExperience,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetSubmission$getSubmission$boardDirectors$edges$node<
        TRes>
    implements
        CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges$node<
            TRes> {
  _CopyWithImpl$Query$GetSubmission$getSubmission$boardDirectors$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetSubmission$getSubmission$boardDirectors$edges$node _instance;

  final TRes Function(
      Query$GetSubmission$getSubmission$boardDirectors$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? educationalQualification = _undefined,
    Object? totalYearsOfExperience = _undefined,
    Object? typeOfExperience = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSubmission$getSubmission$boardDirectors$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        educationalQualification: educationalQualification == _undefined ||
                educationalQualification == null
            ? _instance.educationalQualification
            : (educationalQualification as String),
        totalYearsOfExperience: totalYearsOfExperience == _undefined ||
                totalYearsOfExperience == null
            ? _instance.totalYearsOfExperience
            : (totalYearsOfExperience as int),
        typeOfExperience:
            typeOfExperience == _undefined || typeOfExperience == null
                ? _instance.typeOfExperience
                : (typeOfExperience
                    as Enum$FpoBoardDirectorProfileTypeOfExperienceChoices),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetSubmission$getSubmission$boardDirectors$edges$node<
        TRes>
    implements
        CopyWith$Query$GetSubmission$getSubmission$boardDirectors$edges$node<
            TRes> {
  _CopyWithStubImpl$Query$GetSubmission$getSubmission$boardDirectors$edges$node(
      this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? educationalQualification,
    int? totalYearsOfExperience,
    Enum$FpoBoardDirectorProfileTypeOfExperienceChoices? typeOfExperience,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetSubmission$getSubmission$businessOperations {
  Query$GetSubmission$getSubmission$businessOperations({
    required this.id,
    required this.priceVolatilityOfProducts,
    this.accessibilityPercentage,
    this.availabilityOfInputsTimeliness,
    this.availabilityOfInputsPriceAffordability,
    this.availabilityOfInputsPlace,
    required this.distanceOfOutputCollectionCentres,
    this.electronicWeighingMachines,
    this.transportationFacility,
    this.storage,
    this.cleaning,
    this.gradingAndSorting,
    this.chilling,
    this.packaging,
    this.labelling,
    this.processing,
    this.qualityCheck,
    this.soilTestingFacility,
    this.customHiringCenters,
    this.contractFarming,
    this.advisoryServices,
    this.creditFacilities,
    this.$__typename = 'BusinessOperationsSubmissionNode',
  });

  factory Query$GetSubmission$getSubmission$businessOperations.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$priceVolatilityOfProducts = json['priceVolatilityOfProducts'];
    final l$accessibilityPercentage = json['accessibilityPercentage'];
    final l$availabilityOfInputsTimeliness =
        json['availabilityOfInputsTimeliness'];
    final l$availabilityOfInputsPriceAffordability =
        json['availabilityOfInputsPriceAffordability'];
    final l$availabilityOfInputsPlace = json['availabilityOfInputsPlace'];
    final l$distanceOfOutputCollectionCentres =
        json['distanceOfOutputCollectionCentres'];
    final l$electronicWeighingMachines = json['electronicWeighingMachines'];
    final l$transportationFacility = json['transportationFacility'];
    final l$storage = json['storage'];
    final l$cleaning = json['cleaning'];
    final l$gradingAndSorting = json['gradingAndSorting'];
    final l$chilling = json['chilling'];
    final l$packaging = json['packaging'];
    final l$labelling = json['labelling'];
    final l$processing = json['processing'];
    final l$qualityCheck = json['qualityCheck'];
    final l$soilTestingFacility = json['soilTestingFacility'];
    final l$customHiringCenters = json['customHiringCenters'];
    final l$contractFarming = json['contractFarming'];
    final l$advisoryServices = json['advisoryServices'];
    final l$creditFacilities = json['creditFacilities'];
    final l$$__typename = json['__typename'];
    return Query$GetSubmission$getSubmission$businessOperations(
      id: (l$id as String),
      priceVolatilityOfProducts:
          fromJson$Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices(
              (l$priceVolatilityOfProducts as String)),
      accessibilityPercentage: (l$accessibilityPercentage as String?),
      availabilityOfInputsTimeliness: l$availabilityOfInputsTimeliness == null
          ? null
          : fromJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices(
              (l$availabilityOfInputsTimeliness as String)),
      availabilityOfInputsPriceAffordability:
          l$availabilityOfInputsPriceAffordability == null
              ? null
              : fromJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices(
                  (l$availabilityOfInputsPriceAffordability as String)),
      availabilityOfInputsPlace: l$availabilityOfInputsPlace == null
          ? null
          : fromJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices(
              (l$availabilityOfInputsPlace as String)),
      distanceOfOutputCollectionCentres:
          (l$distanceOfOutputCollectionCentres as String),
      electronicWeighingMachines: (l$electronicWeighingMachines as bool?),
      transportationFacility: (l$transportationFacility as bool?),
      storage: (l$storage as bool?),
      cleaning: (l$cleaning as bool?),
      gradingAndSorting: (l$gradingAndSorting as bool?),
      chilling: (l$chilling as bool?),
      packaging: (l$packaging as bool?),
      labelling: (l$labelling as bool?),
      processing: (l$processing as bool?),
      qualityCheck: (l$qualityCheck as bool?),
      soilTestingFacility: (l$soilTestingFacility as bool?),
      customHiringCenters: (l$customHiringCenters as bool?),
      contractFarming: (l$contractFarming as bool?),
      advisoryServices: (l$advisoryServices as bool?),
      creditFacilities: (l$creditFacilities as bool?),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
      priceVolatilityOfProducts;

  final String? accessibilityPercentage;

  final Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices?
      availabilityOfInputsTimeliness;

  final Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices?
      availabilityOfInputsPriceAffordability;

  final Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices?
      availabilityOfInputsPlace;

  final String distanceOfOutputCollectionCentres;

  final bool? electronicWeighingMachines;

  final bool? transportationFacility;

  final bool? storage;

  final bool? cleaning;

  final bool? gradingAndSorting;

  final bool? chilling;

  final bool? packaging;

  final bool? labelling;

  final bool? processing;

  final bool? qualityCheck;

  final bool? soilTestingFacility;

  final bool? customHiringCenters;

  final bool? contractFarming;

  final bool? advisoryServices;

  final bool? creditFacilities;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$priceVolatilityOfProducts = priceVolatilityOfProducts;
    _resultData['priceVolatilityOfProducts'] =
        toJson$Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices(
            l$priceVolatilityOfProducts);
    final l$accessibilityPercentage = accessibilityPercentage;
    _resultData['accessibilityPercentage'] = l$accessibilityPercentage;
    final l$availabilityOfInputsTimeliness = availabilityOfInputsTimeliness;
    _resultData[
        'availabilityOfInputsTimeliness'] = l$availabilityOfInputsTimeliness ==
            null
        ? null
        : toJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices(
            l$availabilityOfInputsTimeliness);
    final l$availabilityOfInputsPriceAffordability =
        availabilityOfInputsPriceAffordability;
    _resultData['availabilityOfInputsPriceAffordability'] =
        l$availabilityOfInputsPriceAffordability == null
            ? null
            : toJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices(
                l$availabilityOfInputsPriceAffordability);
    final l$availabilityOfInputsPlace = availabilityOfInputsPlace;
    _resultData['availabilityOfInputsPlace'] = l$availabilityOfInputsPlace ==
            null
        ? null
        : toJson$Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices(
            l$availabilityOfInputsPlace);
    final l$distanceOfOutputCollectionCentres =
        distanceOfOutputCollectionCentres;
    _resultData['distanceOfOutputCollectionCentres'] =
        l$distanceOfOutputCollectionCentres;
    final l$electronicWeighingMachines = electronicWeighingMachines;
    _resultData['electronicWeighingMachines'] = l$electronicWeighingMachines;
    final l$transportationFacility = transportationFacility;
    _resultData['transportationFacility'] = l$transportationFacility;
    final l$storage = storage;
    _resultData['storage'] = l$storage;
    final l$cleaning = cleaning;
    _resultData['cleaning'] = l$cleaning;
    final l$gradingAndSorting = gradingAndSorting;
    _resultData['gradingAndSorting'] = l$gradingAndSorting;
    final l$chilling = chilling;
    _resultData['chilling'] = l$chilling;
    final l$packaging = packaging;
    _resultData['packaging'] = l$packaging;
    final l$labelling = labelling;
    _resultData['labelling'] = l$labelling;
    final l$processing = processing;
    _resultData['processing'] = l$processing;
    final l$qualityCheck = qualityCheck;
    _resultData['qualityCheck'] = l$qualityCheck;
    final l$soilTestingFacility = soilTestingFacility;
    _resultData['soilTestingFacility'] = l$soilTestingFacility;
    final l$customHiringCenters = customHiringCenters;
    _resultData['customHiringCenters'] = l$customHiringCenters;
    final l$contractFarming = contractFarming;
    _resultData['contractFarming'] = l$contractFarming;
    final l$advisoryServices = advisoryServices;
    _resultData['advisoryServices'] = l$advisoryServices;
    final l$creditFacilities = creditFacilities;
    _resultData['creditFacilities'] = l$creditFacilities;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$priceVolatilityOfProducts = priceVolatilityOfProducts;
    final l$accessibilityPercentage = accessibilityPercentage;
    final l$availabilityOfInputsTimeliness = availabilityOfInputsTimeliness;
    final l$availabilityOfInputsPriceAffordability =
        availabilityOfInputsPriceAffordability;
    final l$availabilityOfInputsPlace = availabilityOfInputsPlace;
    final l$distanceOfOutputCollectionCentres =
        distanceOfOutputCollectionCentres;
    final l$electronicWeighingMachines = electronicWeighingMachines;
    final l$transportationFacility = transportationFacility;
    final l$storage = storage;
    final l$cleaning = cleaning;
    final l$gradingAndSorting = gradingAndSorting;
    final l$chilling = chilling;
    final l$packaging = packaging;
    final l$labelling = labelling;
    final l$processing = processing;
    final l$qualityCheck = qualityCheck;
    final l$soilTestingFacility = soilTestingFacility;
    final l$customHiringCenters = customHiringCenters;
    final l$contractFarming = contractFarming;
    final l$advisoryServices = advisoryServices;
    final l$creditFacilities = creditFacilities;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$priceVolatilityOfProducts,
      l$accessibilityPercentage,
      l$availabilityOfInputsTimeliness,
      l$availabilityOfInputsPriceAffordability,
      l$availabilityOfInputsPlace,
      l$distanceOfOutputCollectionCentres,
      l$electronicWeighingMachines,
      l$transportationFacility,
      l$storage,
      l$cleaning,
      l$gradingAndSorting,
      l$chilling,
      l$packaging,
      l$labelling,
      l$processing,
      l$qualityCheck,
      l$soilTestingFacility,
      l$customHiringCenters,
      l$contractFarming,
      l$advisoryServices,
      l$creditFacilities,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSubmission$getSubmission$businessOperations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$priceVolatilityOfProducts = priceVolatilityOfProducts;
    final lOther$priceVolatilityOfProducts = other.priceVolatilityOfProducts;
    if (l$priceVolatilityOfProducts != lOther$priceVolatilityOfProducts) {
      return false;
    }
    final l$accessibilityPercentage = accessibilityPercentage;
    final lOther$accessibilityPercentage = other.accessibilityPercentage;
    if (l$accessibilityPercentage != lOther$accessibilityPercentage) {
      return false;
    }
    final l$availabilityOfInputsTimeliness = availabilityOfInputsTimeliness;
    final lOther$availabilityOfInputsTimeliness =
        other.availabilityOfInputsTimeliness;
    if (l$availabilityOfInputsTimeliness !=
        lOther$availabilityOfInputsTimeliness) {
      return false;
    }
    final l$availabilityOfInputsPriceAffordability =
        availabilityOfInputsPriceAffordability;
    final lOther$availabilityOfInputsPriceAffordability =
        other.availabilityOfInputsPriceAffordability;
    if (l$availabilityOfInputsPriceAffordability !=
        lOther$availabilityOfInputsPriceAffordability) {
      return false;
    }
    final l$availabilityOfInputsPlace = availabilityOfInputsPlace;
    final lOther$availabilityOfInputsPlace = other.availabilityOfInputsPlace;
    if (l$availabilityOfInputsPlace != lOther$availabilityOfInputsPlace) {
      return false;
    }
    final l$distanceOfOutputCollectionCentres =
        distanceOfOutputCollectionCentres;
    final lOther$distanceOfOutputCollectionCentres =
        other.distanceOfOutputCollectionCentres;
    if (l$distanceOfOutputCollectionCentres !=
        lOther$distanceOfOutputCollectionCentres) {
      return false;
    }
    final l$electronicWeighingMachines = electronicWeighingMachines;
    final lOther$electronicWeighingMachines = other.electronicWeighingMachines;
    if (l$electronicWeighingMachines != lOther$electronicWeighingMachines) {
      return false;
    }
    final l$transportationFacility = transportationFacility;
    final lOther$transportationFacility = other.transportationFacility;
    if (l$transportationFacility != lOther$transportationFacility) {
      return false;
    }
    final l$storage = storage;
    final lOther$storage = other.storage;
    if (l$storage != lOther$storage) {
      return false;
    }
    final l$cleaning = cleaning;
    final lOther$cleaning = other.cleaning;
    if (l$cleaning != lOther$cleaning) {
      return false;
    }
    final l$gradingAndSorting = gradingAndSorting;
    final lOther$gradingAndSorting = other.gradingAndSorting;
    if (l$gradingAndSorting != lOther$gradingAndSorting) {
      return false;
    }
    final l$chilling = chilling;
    final lOther$chilling = other.chilling;
    if (l$chilling != lOther$chilling) {
      return false;
    }
    final l$packaging = packaging;
    final lOther$packaging = other.packaging;
    if (l$packaging != lOther$packaging) {
      return false;
    }
    final l$labelling = labelling;
    final lOther$labelling = other.labelling;
    if (l$labelling != lOther$labelling) {
      return false;
    }
    final l$processing = processing;
    final lOther$processing = other.processing;
    if (l$processing != lOther$processing) {
      return false;
    }
    final l$qualityCheck = qualityCheck;
    final lOther$qualityCheck = other.qualityCheck;
    if (l$qualityCheck != lOther$qualityCheck) {
      return false;
    }
    final l$soilTestingFacility = soilTestingFacility;
    final lOther$soilTestingFacility = other.soilTestingFacility;
    if (l$soilTestingFacility != lOther$soilTestingFacility) {
      return false;
    }
    final l$customHiringCenters = customHiringCenters;
    final lOther$customHiringCenters = other.customHiringCenters;
    if (l$customHiringCenters != lOther$customHiringCenters) {
      return false;
    }
    final l$contractFarming = contractFarming;
    final lOther$contractFarming = other.contractFarming;
    if (l$contractFarming != lOther$contractFarming) {
      return false;
    }
    final l$advisoryServices = advisoryServices;
    final lOther$advisoryServices = other.advisoryServices;
    if (l$advisoryServices != lOther$advisoryServices) {
      return false;
    }
    final l$creditFacilities = creditFacilities;
    final lOther$creditFacilities = other.creditFacilities;
    if (l$creditFacilities != lOther$creditFacilities) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSubmission$getSubmission$businessOperations
    on Query$GetSubmission$getSubmission$businessOperations {
  CopyWith$Query$GetSubmission$getSubmission$businessOperations<
          Query$GetSubmission$getSubmission$businessOperations>
      get copyWith =>
          CopyWith$Query$GetSubmission$getSubmission$businessOperations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSubmission$getSubmission$businessOperations<
    TRes> {
  factory CopyWith$Query$GetSubmission$getSubmission$businessOperations(
    Query$GetSubmission$getSubmission$businessOperations instance,
    TRes Function(Query$GetSubmission$getSubmission$businessOperations) then,
  ) = _CopyWithImpl$Query$GetSubmission$getSubmission$businessOperations;

  factory CopyWith$Query$GetSubmission$getSubmission$businessOperations.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetSubmission$getSubmission$businessOperations;

  TRes call({
    String? id,
    Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices?
        priceVolatilityOfProducts,
    String? accessibilityPercentage,
    Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices?
        availabilityOfInputsTimeliness,
    Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices?
        availabilityOfInputsPriceAffordability,
    Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices?
        availabilityOfInputsPlace,
    String? distanceOfOutputCollectionCentres,
    bool? electronicWeighingMachines,
    bool? transportationFacility,
    bool? storage,
    bool? cleaning,
    bool? gradingAndSorting,
    bool? chilling,
    bool? packaging,
    bool? labelling,
    bool? processing,
    bool? qualityCheck,
    bool? soilTestingFacility,
    bool? customHiringCenters,
    bool? contractFarming,
    bool? advisoryServices,
    bool? creditFacilities,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetSubmission$getSubmission$businessOperations<TRes>
    implements
        CopyWith$Query$GetSubmission$getSubmission$businessOperations<TRes> {
  _CopyWithImpl$Query$GetSubmission$getSubmission$businessOperations(
    this._instance,
    this._then,
  );

  final Query$GetSubmission$getSubmission$businessOperations _instance;

  final TRes Function(Query$GetSubmission$getSubmission$businessOperations)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? priceVolatilityOfProducts = _undefined,
    Object? accessibilityPercentage = _undefined,
    Object? availabilityOfInputsTimeliness = _undefined,
    Object? availabilityOfInputsPriceAffordability = _undefined,
    Object? availabilityOfInputsPlace = _undefined,
    Object? distanceOfOutputCollectionCentres = _undefined,
    Object? electronicWeighingMachines = _undefined,
    Object? transportationFacility = _undefined,
    Object? storage = _undefined,
    Object? cleaning = _undefined,
    Object? gradingAndSorting = _undefined,
    Object? chilling = _undefined,
    Object? packaging = _undefined,
    Object? labelling = _undefined,
    Object? processing = _undefined,
    Object? qualityCheck = _undefined,
    Object? soilTestingFacility = _undefined,
    Object? customHiringCenters = _undefined,
    Object? contractFarming = _undefined,
    Object? advisoryServices = _undefined,
    Object? creditFacilities = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSubmission$getSubmission$businessOperations(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        priceVolatilityOfProducts: priceVolatilityOfProducts == _undefined ||
                priceVolatilityOfProducts == null
            ? _instance.priceVolatilityOfProducts
            : (priceVolatilityOfProducts
                as Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices),
        accessibilityPercentage: accessibilityPercentage == _undefined
            ? _instance.accessibilityPercentage
            : (accessibilityPercentage as String?),
        availabilityOfInputsTimeliness: availabilityOfInputsTimeliness ==
                _undefined
            ? _instance.availabilityOfInputsTimeliness
            : (availabilityOfInputsTimeliness
                as Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices?),
        availabilityOfInputsPriceAffordability:
            availabilityOfInputsPriceAffordability == _undefined
                ? _instance.availabilityOfInputsPriceAffordability
                : (availabilityOfInputsPriceAffordability
                    as Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices?),
        availabilityOfInputsPlace: availabilityOfInputsPlace == _undefined
            ? _instance.availabilityOfInputsPlace
            : (availabilityOfInputsPlace
                as Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices?),
        distanceOfOutputCollectionCentres:
            distanceOfOutputCollectionCentres == _undefined ||
                    distanceOfOutputCollectionCentres == null
                ? _instance.distanceOfOutputCollectionCentres
                : (distanceOfOutputCollectionCentres as String),
        electronicWeighingMachines: electronicWeighingMachines == _undefined
            ? _instance.electronicWeighingMachines
            : (electronicWeighingMachines as bool?),
        transportationFacility: transportationFacility == _undefined
            ? _instance.transportationFacility
            : (transportationFacility as bool?),
        storage: storage == _undefined ? _instance.storage : (storage as bool?),
        cleaning:
            cleaning == _undefined ? _instance.cleaning : (cleaning as bool?),
        gradingAndSorting: gradingAndSorting == _undefined
            ? _instance.gradingAndSorting
            : (gradingAndSorting as bool?),
        chilling:
            chilling == _undefined ? _instance.chilling : (chilling as bool?),
        packaging: packaging == _undefined
            ? _instance.packaging
            : (packaging as bool?),
        labelling: labelling == _undefined
            ? _instance.labelling
            : (labelling as bool?),
        processing: processing == _undefined
            ? _instance.processing
            : (processing as bool?),
        qualityCheck: qualityCheck == _undefined
            ? _instance.qualityCheck
            : (qualityCheck as bool?),
        soilTestingFacility: soilTestingFacility == _undefined
            ? _instance.soilTestingFacility
            : (soilTestingFacility as bool?),
        customHiringCenters: customHiringCenters == _undefined
            ? _instance.customHiringCenters
            : (customHiringCenters as bool?),
        contractFarming: contractFarming == _undefined
            ? _instance.contractFarming
            : (contractFarming as bool?),
        advisoryServices: advisoryServices == _undefined
            ? _instance.advisoryServices
            : (advisoryServices as bool?),
        creditFacilities: creditFacilities == _undefined
            ? _instance.creditFacilities
            : (creditFacilities as bool?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetSubmission$getSubmission$businessOperations<
        TRes>
    implements
        CopyWith$Query$GetSubmission$getSubmission$businessOperations<TRes> {
  _CopyWithStubImpl$Query$GetSubmission$getSubmission$businessOperations(
      this._res);

  TRes _res;

  call({
    String? id,
    Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices?
        priceVolatilityOfProducts,
    String? accessibilityPercentage,
    Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsTimelinessChoices?
        availabilityOfInputsTimeliness,
    Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPriceAffordabilityChoices?
        availabilityOfInputsPriceAffordability,
    Enum$FpoBusinessOperationsSubmissionAvailabilityOfInputsPlaceChoices?
        availabilityOfInputsPlace,
    String? distanceOfOutputCollectionCentres,
    bool? electronicWeighingMachines,
    bool? transportationFacility,
    bool? storage,
    bool? cleaning,
    bool? gradingAndSorting,
    bool? chilling,
    bool? packaging,
    bool? labelling,
    bool? processing,
    bool? qualityCheck,
    bool? soilTestingFacility,
    bool? customHiringCenters,
    bool? contractFarming,
    bool? advisoryServices,
    bool? creditFacilities,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetSubmission$getSubmission$complianceDetails {
  Query$GetSubmission$getSubmission$complianceDetails({
    required this.id,
    required this.actUnderRegistered,
    required this.dateOfRegistration,
    required this.permanentAccountNumber,
    required this.placeOfRegistration,
    required this.registrationNo,
    required this.taxAccountNumber,
    this.incorporationDate,
    required this.incorporationPlace,
    required this.incorporationRegNo,
    this.commencementDate,
    required this.commencementPlace,
    required this.commencementRegNo,
    this.gstDate,
    required this.gstPlace,
    required this.gstRegNo,
    this.$__typename = 'ComplianceDetailsSubmissionNode',
  });

  factory Query$GetSubmission$getSubmission$complianceDetails.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$actUnderRegistered = json['actUnderRegistered'];
    final l$dateOfRegistration = json['dateOfRegistration'];
    final l$permanentAccountNumber = json['permanentAccountNumber'];
    final l$placeOfRegistration = json['placeOfRegistration'];
    final l$registrationNo = json['registrationNo'];
    final l$taxAccountNumber = json['taxAccountNumber'];
    final l$incorporationDate = json['incorporationDate'];
    final l$incorporationPlace = json['incorporationPlace'];
    final l$incorporationRegNo = json['incorporationRegNo'];
    final l$commencementDate = json['commencementDate'];
    final l$commencementPlace = json['commencementPlace'];
    final l$commencementRegNo = json['commencementRegNo'];
    final l$gstDate = json['gstDate'];
    final l$gstPlace = json['gstPlace'];
    final l$gstRegNo = json['gstRegNo'];
    final l$$__typename = json['__typename'];
    return Query$GetSubmission$getSubmission$complianceDetails(
      id: (l$id as String),
      actUnderRegistered:
          fromJson$Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices(
              (l$actUnderRegistered as String)),
      dateOfRegistration: (l$dateOfRegistration as String),
      permanentAccountNumber: (l$permanentAccountNumber as String),
      placeOfRegistration: (l$placeOfRegistration as String),
      registrationNo: (l$registrationNo as String),
      taxAccountNumber: (l$taxAccountNumber as String),
      incorporationDate: (l$incorporationDate as String?),
      incorporationPlace: (l$incorporationPlace as String),
      incorporationRegNo: (l$incorporationRegNo as String),
      commencementDate: (l$commencementDate as String?),
      commencementPlace: (l$commencementPlace as String),
      commencementRegNo: (l$commencementRegNo as String),
      gstDate: (l$gstDate as String?),
      gstPlace: (l$gstPlace as String),
      gstRegNo: (l$gstRegNo as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices
      actUnderRegistered;

  final String dateOfRegistration;

  final String permanentAccountNumber;

  final String placeOfRegistration;

  final String registrationNo;

  final String taxAccountNumber;

  final String? incorporationDate;

  final String incorporationPlace;

  final String incorporationRegNo;

  final String? commencementDate;

  final String commencementPlace;

  final String commencementRegNo;

  final String? gstDate;

  final String gstPlace;

  final String gstRegNo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$actUnderRegistered = actUnderRegistered;
    _resultData['actUnderRegistered'] =
        toJson$Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices(
            l$actUnderRegistered);
    final l$dateOfRegistration = dateOfRegistration;
    _resultData['dateOfRegistration'] = l$dateOfRegistration;
    final l$permanentAccountNumber = permanentAccountNumber;
    _resultData['permanentAccountNumber'] = l$permanentAccountNumber;
    final l$placeOfRegistration = placeOfRegistration;
    _resultData['placeOfRegistration'] = l$placeOfRegistration;
    final l$registrationNo = registrationNo;
    _resultData['registrationNo'] = l$registrationNo;
    final l$taxAccountNumber = taxAccountNumber;
    _resultData['taxAccountNumber'] = l$taxAccountNumber;
    final l$incorporationDate = incorporationDate;
    _resultData['incorporationDate'] = l$incorporationDate;
    final l$incorporationPlace = incorporationPlace;
    _resultData['incorporationPlace'] = l$incorporationPlace;
    final l$incorporationRegNo = incorporationRegNo;
    _resultData['incorporationRegNo'] = l$incorporationRegNo;
    final l$commencementDate = commencementDate;
    _resultData['commencementDate'] = l$commencementDate;
    final l$commencementPlace = commencementPlace;
    _resultData['commencementPlace'] = l$commencementPlace;
    final l$commencementRegNo = commencementRegNo;
    _resultData['commencementRegNo'] = l$commencementRegNo;
    final l$gstDate = gstDate;
    _resultData['gstDate'] = l$gstDate;
    final l$gstPlace = gstPlace;
    _resultData['gstPlace'] = l$gstPlace;
    final l$gstRegNo = gstRegNo;
    _resultData['gstRegNo'] = l$gstRegNo;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$actUnderRegistered = actUnderRegistered;
    final l$dateOfRegistration = dateOfRegistration;
    final l$permanentAccountNumber = permanentAccountNumber;
    final l$placeOfRegistration = placeOfRegistration;
    final l$registrationNo = registrationNo;
    final l$taxAccountNumber = taxAccountNumber;
    final l$incorporationDate = incorporationDate;
    final l$incorporationPlace = incorporationPlace;
    final l$incorporationRegNo = incorporationRegNo;
    final l$commencementDate = commencementDate;
    final l$commencementPlace = commencementPlace;
    final l$commencementRegNo = commencementRegNo;
    final l$gstDate = gstDate;
    final l$gstPlace = gstPlace;
    final l$gstRegNo = gstRegNo;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$actUnderRegistered,
      l$dateOfRegistration,
      l$permanentAccountNumber,
      l$placeOfRegistration,
      l$registrationNo,
      l$taxAccountNumber,
      l$incorporationDate,
      l$incorporationPlace,
      l$incorporationRegNo,
      l$commencementDate,
      l$commencementPlace,
      l$commencementRegNo,
      l$gstDate,
      l$gstPlace,
      l$gstRegNo,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSubmission$getSubmission$complianceDetails) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$actUnderRegistered = actUnderRegistered;
    final lOther$actUnderRegistered = other.actUnderRegistered;
    if (l$actUnderRegistered != lOther$actUnderRegistered) {
      return false;
    }
    final l$dateOfRegistration = dateOfRegistration;
    final lOther$dateOfRegistration = other.dateOfRegistration;
    if (l$dateOfRegistration != lOther$dateOfRegistration) {
      return false;
    }
    final l$permanentAccountNumber = permanentAccountNumber;
    final lOther$permanentAccountNumber = other.permanentAccountNumber;
    if (l$permanentAccountNumber != lOther$permanentAccountNumber) {
      return false;
    }
    final l$placeOfRegistration = placeOfRegistration;
    final lOther$placeOfRegistration = other.placeOfRegistration;
    if (l$placeOfRegistration != lOther$placeOfRegistration) {
      return false;
    }
    final l$registrationNo = registrationNo;
    final lOther$registrationNo = other.registrationNo;
    if (l$registrationNo != lOther$registrationNo) {
      return false;
    }
    final l$taxAccountNumber = taxAccountNumber;
    final lOther$taxAccountNumber = other.taxAccountNumber;
    if (l$taxAccountNumber != lOther$taxAccountNumber) {
      return false;
    }
    final l$incorporationDate = incorporationDate;
    final lOther$incorporationDate = other.incorporationDate;
    if (l$incorporationDate != lOther$incorporationDate) {
      return false;
    }
    final l$incorporationPlace = incorporationPlace;
    final lOther$incorporationPlace = other.incorporationPlace;
    if (l$incorporationPlace != lOther$incorporationPlace) {
      return false;
    }
    final l$incorporationRegNo = incorporationRegNo;
    final lOther$incorporationRegNo = other.incorporationRegNo;
    if (l$incorporationRegNo != lOther$incorporationRegNo) {
      return false;
    }
    final l$commencementDate = commencementDate;
    final lOther$commencementDate = other.commencementDate;
    if (l$commencementDate != lOther$commencementDate) {
      return false;
    }
    final l$commencementPlace = commencementPlace;
    final lOther$commencementPlace = other.commencementPlace;
    if (l$commencementPlace != lOther$commencementPlace) {
      return false;
    }
    final l$commencementRegNo = commencementRegNo;
    final lOther$commencementRegNo = other.commencementRegNo;
    if (l$commencementRegNo != lOther$commencementRegNo) {
      return false;
    }
    final l$gstDate = gstDate;
    final lOther$gstDate = other.gstDate;
    if (l$gstDate != lOther$gstDate) {
      return false;
    }
    final l$gstPlace = gstPlace;
    final lOther$gstPlace = other.gstPlace;
    if (l$gstPlace != lOther$gstPlace) {
      return false;
    }
    final l$gstRegNo = gstRegNo;
    final lOther$gstRegNo = other.gstRegNo;
    if (l$gstRegNo != lOther$gstRegNo) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSubmission$getSubmission$complianceDetails
    on Query$GetSubmission$getSubmission$complianceDetails {
  CopyWith$Query$GetSubmission$getSubmission$complianceDetails<
          Query$GetSubmission$getSubmission$complianceDetails>
      get copyWith =>
          CopyWith$Query$GetSubmission$getSubmission$complianceDetails(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSubmission$getSubmission$complianceDetails<
    TRes> {
  factory CopyWith$Query$GetSubmission$getSubmission$complianceDetails(
    Query$GetSubmission$getSubmission$complianceDetails instance,
    TRes Function(Query$GetSubmission$getSubmission$complianceDetails) then,
  ) = _CopyWithImpl$Query$GetSubmission$getSubmission$complianceDetails;

  factory CopyWith$Query$GetSubmission$getSubmission$complianceDetails.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetSubmission$getSubmission$complianceDetails;

  TRes call({
    String? id,
    Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices?
        actUnderRegistered,
    String? dateOfRegistration,
    String? permanentAccountNumber,
    String? placeOfRegistration,
    String? registrationNo,
    String? taxAccountNumber,
    String? incorporationDate,
    String? incorporationPlace,
    String? incorporationRegNo,
    String? commencementDate,
    String? commencementPlace,
    String? commencementRegNo,
    String? gstDate,
    String? gstPlace,
    String? gstRegNo,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetSubmission$getSubmission$complianceDetails<TRes>
    implements
        CopyWith$Query$GetSubmission$getSubmission$complianceDetails<TRes> {
  _CopyWithImpl$Query$GetSubmission$getSubmission$complianceDetails(
    this._instance,
    this._then,
  );

  final Query$GetSubmission$getSubmission$complianceDetails _instance;

  final TRes Function(Query$GetSubmission$getSubmission$complianceDetails)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? actUnderRegistered = _undefined,
    Object? dateOfRegistration = _undefined,
    Object? permanentAccountNumber = _undefined,
    Object? placeOfRegistration = _undefined,
    Object? registrationNo = _undefined,
    Object? taxAccountNumber = _undefined,
    Object? incorporationDate = _undefined,
    Object? incorporationPlace = _undefined,
    Object? incorporationRegNo = _undefined,
    Object? commencementDate = _undefined,
    Object? commencementPlace = _undefined,
    Object? commencementRegNo = _undefined,
    Object? gstDate = _undefined,
    Object? gstPlace = _undefined,
    Object? gstRegNo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSubmission$getSubmission$complianceDetails(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        actUnderRegistered: actUnderRegistered == _undefined ||
                actUnderRegistered == null
            ? _instance.actUnderRegistered
            : (actUnderRegistered
                as Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices),
        dateOfRegistration:
            dateOfRegistration == _undefined || dateOfRegistration == null
                ? _instance.dateOfRegistration
                : (dateOfRegistration as String),
        permanentAccountNumber: permanentAccountNumber == _undefined ||
                permanentAccountNumber == null
            ? _instance.permanentAccountNumber
            : (permanentAccountNumber as String),
        placeOfRegistration:
            placeOfRegistration == _undefined || placeOfRegistration == null
                ? _instance.placeOfRegistration
                : (placeOfRegistration as String),
        registrationNo: registrationNo == _undefined || registrationNo == null
            ? _instance.registrationNo
            : (registrationNo as String),
        taxAccountNumber:
            taxAccountNumber == _undefined || taxAccountNumber == null
                ? _instance.taxAccountNumber
                : (taxAccountNumber as String),
        incorporationDate: incorporationDate == _undefined
            ? _instance.incorporationDate
            : (incorporationDate as String?),
        incorporationPlace:
            incorporationPlace == _undefined || incorporationPlace == null
                ? _instance.incorporationPlace
                : (incorporationPlace as String),
        incorporationRegNo:
            incorporationRegNo == _undefined || incorporationRegNo == null
                ? _instance.incorporationRegNo
                : (incorporationRegNo as String),
        commencementDate: commencementDate == _undefined
            ? _instance.commencementDate
            : (commencementDate as String?),
        commencementPlace:
            commencementPlace == _undefined || commencementPlace == null
                ? _instance.commencementPlace
                : (commencementPlace as String),
        commencementRegNo:
            commencementRegNo == _undefined || commencementRegNo == null
                ? _instance.commencementRegNo
                : (commencementRegNo as String),
        gstDate:
            gstDate == _undefined ? _instance.gstDate : (gstDate as String?),
        gstPlace: gstPlace == _undefined || gstPlace == null
            ? _instance.gstPlace
            : (gstPlace as String),
        gstRegNo: gstRegNo == _undefined || gstRegNo == null
            ? _instance.gstRegNo
            : (gstRegNo as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetSubmission$getSubmission$complianceDetails<
        TRes>
    implements
        CopyWith$Query$GetSubmission$getSubmission$complianceDetails<TRes> {
  _CopyWithStubImpl$Query$GetSubmission$getSubmission$complianceDetails(
      this._res);

  TRes _res;

  call({
    String? id,
    Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices?
        actUnderRegistered,
    String? dateOfRegistration,
    String? permanentAccountNumber,
    String? placeOfRegistration,
    String? registrationNo,
    String? taxAccountNumber,
    String? incorporationDate,
    String? incorporationPlace,
    String? incorporationRegNo,
    String? commencementDate,
    String? commencementPlace,
    String? commencementRegNo,
    String? gstDate,
    String? gstPlace,
    String? gstRegNo,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetSubmission$getSubmission$processesSystems {
  Query$GetSubmission$getSubmission$processesSystems({
    required this.id,
    required this.accountsAndMis,
    required this.booksAndRecordsUpToDate,
    required this.creditRecordOfFpo,
    required this.insuranceOfStock,
    required this.penaltiesLeviedBoardMeeting,
    required this.reconciliationOfStocks,
    required this.statutoryFillings,
    this.$__typename = 'ProcessesSystemsSubmissionNode',
  });

  factory Query$GetSubmission$getSubmission$processesSystems.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$accountsAndMis = json['accountsAndMis'];
    final l$booksAndRecordsUpToDate = json['booksAndRecordsUpToDate'];
    final l$creditRecordOfFpo = json['creditRecordOfFpo'];
    final l$insuranceOfStock = json['insuranceOfStock'];
    final l$penaltiesLeviedBoardMeeting = json['penaltiesLeviedBoardMeeting'];
    final l$reconciliationOfStocks = json['reconciliationOfStocks'];
    final l$statutoryFillings = json['statutoryFillings'];
    final l$$__typename = json['__typename'];
    return Query$GetSubmission$getSubmission$processesSystems(
      id: (l$id as String),
      accountsAndMis:
          fromJson$Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices(
              (l$accountsAndMis as String)),
      booksAndRecordsUpToDate:
          fromJson$Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices(
              (l$booksAndRecordsUpToDate as String)),
      creditRecordOfFpo:
          fromJson$Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices(
              (l$creditRecordOfFpo as String)),
      insuranceOfStock:
          fromJson$Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices(
              (l$insuranceOfStock as String)),
      penaltiesLeviedBoardMeeting: (l$penaltiesLeviedBoardMeeting as bool),
      reconciliationOfStocks:
          fromJson$Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices(
              (l$reconciliationOfStocks as String)),
      statutoryFillings:
          fromJson$Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices(
              (l$statutoryFillings as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices accountsAndMis;

  final Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices
      booksAndRecordsUpToDate;

  final Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices
      creditRecordOfFpo;

  final Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices
      insuranceOfStock;

  final bool penaltiesLeviedBoardMeeting;

  final Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices
      reconciliationOfStocks;

  final Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices
      statutoryFillings;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$accountsAndMis = accountsAndMis;
    _resultData['accountsAndMis'] =
        toJson$Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices(
            l$accountsAndMis);
    final l$booksAndRecordsUpToDate = booksAndRecordsUpToDate;
    _resultData['booksAndRecordsUpToDate'] =
        toJson$Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices(
            l$booksAndRecordsUpToDate);
    final l$creditRecordOfFpo = creditRecordOfFpo;
    _resultData['creditRecordOfFpo'] =
        toJson$Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices(
            l$creditRecordOfFpo);
    final l$insuranceOfStock = insuranceOfStock;
    _resultData['insuranceOfStock'] =
        toJson$Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices(
            l$insuranceOfStock);
    final l$penaltiesLeviedBoardMeeting = penaltiesLeviedBoardMeeting;
    _resultData['penaltiesLeviedBoardMeeting'] = l$penaltiesLeviedBoardMeeting;
    final l$reconciliationOfStocks = reconciliationOfStocks;
    _resultData['reconciliationOfStocks'] =
        toJson$Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices(
            l$reconciliationOfStocks);
    final l$statutoryFillings = statutoryFillings;
    _resultData['statutoryFillings'] =
        toJson$Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices(
            l$statutoryFillings);
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$accountsAndMis = accountsAndMis;
    final l$booksAndRecordsUpToDate = booksAndRecordsUpToDate;
    final l$creditRecordOfFpo = creditRecordOfFpo;
    final l$insuranceOfStock = insuranceOfStock;
    final l$penaltiesLeviedBoardMeeting = penaltiesLeviedBoardMeeting;
    final l$reconciliationOfStocks = reconciliationOfStocks;
    final l$statutoryFillings = statutoryFillings;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$accountsAndMis,
      l$booksAndRecordsUpToDate,
      l$creditRecordOfFpo,
      l$insuranceOfStock,
      l$penaltiesLeviedBoardMeeting,
      l$reconciliationOfStocks,
      l$statutoryFillings,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSubmission$getSubmission$processesSystems) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$accountsAndMis = accountsAndMis;
    final lOther$accountsAndMis = other.accountsAndMis;
    if (l$accountsAndMis != lOther$accountsAndMis) {
      return false;
    }
    final l$booksAndRecordsUpToDate = booksAndRecordsUpToDate;
    final lOther$booksAndRecordsUpToDate = other.booksAndRecordsUpToDate;
    if (l$booksAndRecordsUpToDate != lOther$booksAndRecordsUpToDate) {
      return false;
    }
    final l$creditRecordOfFpo = creditRecordOfFpo;
    final lOther$creditRecordOfFpo = other.creditRecordOfFpo;
    if (l$creditRecordOfFpo != lOther$creditRecordOfFpo) {
      return false;
    }
    final l$insuranceOfStock = insuranceOfStock;
    final lOther$insuranceOfStock = other.insuranceOfStock;
    if (l$insuranceOfStock != lOther$insuranceOfStock) {
      return false;
    }
    final l$penaltiesLeviedBoardMeeting = penaltiesLeviedBoardMeeting;
    final lOther$penaltiesLeviedBoardMeeting =
        other.penaltiesLeviedBoardMeeting;
    if (l$penaltiesLeviedBoardMeeting != lOther$penaltiesLeviedBoardMeeting) {
      return false;
    }
    final l$reconciliationOfStocks = reconciliationOfStocks;
    final lOther$reconciliationOfStocks = other.reconciliationOfStocks;
    if (l$reconciliationOfStocks != lOther$reconciliationOfStocks) {
      return false;
    }
    final l$statutoryFillings = statutoryFillings;
    final lOther$statutoryFillings = other.statutoryFillings;
    if (l$statutoryFillings != lOther$statutoryFillings) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSubmission$getSubmission$processesSystems
    on Query$GetSubmission$getSubmission$processesSystems {
  CopyWith$Query$GetSubmission$getSubmission$processesSystems<
          Query$GetSubmission$getSubmission$processesSystems>
      get copyWith =>
          CopyWith$Query$GetSubmission$getSubmission$processesSystems(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSubmission$getSubmission$processesSystems<
    TRes> {
  factory CopyWith$Query$GetSubmission$getSubmission$processesSystems(
    Query$GetSubmission$getSubmission$processesSystems instance,
    TRes Function(Query$GetSubmission$getSubmission$processesSystems) then,
  ) = _CopyWithImpl$Query$GetSubmission$getSubmission$processesSystems;

  factory CopyWith$Query$GetSubmission$getSubmission$processesSystems.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetSubmission$getSubmission$processesSystems;

  TRes call({
    String? id,
    Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices? accountsAndMis,
    Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices?
        booksAndRecordsUpToDate,
    Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices?
        creditRecordOfFpo,
    Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices? insuranceOfStock,
    bool? penaltiesLeviedBoardMeeting,
    Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices?
        reconciliationOfStocks,
    Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices?
        statutoryFillings,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetSubmission$getSubmission$processesSystems<TRes>
    implements
        CopyWith$Query$GetSubmission$getSubmission$processesSystems<TRes> {
  _CopyWithImpl$Query$GetSubmission$getSubmission$processesSystems(
    this._instance,
    this._then,
  );

  final Query$GetSubmission$getSubmission$processesSystems _instance;

  final TRes Function(Query$GetSubmission$getSubmission$processesSystems) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? accountsAndMis = _undefined,
    Object? booksAndRecordsUpToDate = _undefined,
    Object? creditRecordOfFpo = _undefined,
    Object? insuranceOfStock = _undefined,
    Object? penaltiesLeviedBoardMeeting = _undefined,
    Object? reconciliationOfStocks = _undefined,
    Object? statutoryFillings = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSubmission$getSubmission$processesSystems(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        accountsAndMis: accountsAndMis == _undefined || accountsAndMis == null
            ? _instance.accountsAndMis
            : (accountsAndMis
                as Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices),
        booksAndRecordsUpToDate: booksAndRecordsUpToDate == _undefined ||
                booksAndRecordsUpToDate == null
            ? _instance.booksAndRecordsUpToDate
            : (booksAndRecordsUpToDate
                as Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices),
        creditRecordOfFpo: creditRecordOfFpo == _undefined ||
                creditRecordOfFpo == null
            ? _instance.creditRecordOfFpo
            : (creditRecordOfFpo
                as Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices),
        insuranceOfStock: insuranceOfStock == _undefined ||
                insuranceOfStock == null
            ? _instance.insuranceOfStock
            : (insuranceOfStock
                as Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices),
        penaltiesLeviedBoardMeeting:
            penaltiesLeviedBoardMeeting == _undefined ||
                    penaltiesLeviedBoardMeeting == null
                ? _instance.penaltiesLeviedBoardMeeting
                : (penaltiesLeviedBoardMeeting as bool),
        reconciliationOfStocks: reconciliationOfStocks == _undefined ||
                reconciliationOfStocks == null
            ? _instance.reconciliationOfStocks
            : (reconciliationOfStocks
                as Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices),
        statutoryFillings: statutoryFillings == _undefined ||
                statutoryFillings == null
            ? _instance.statutoryFillings
            : (statutoryFillings
                as Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetSubmission$getSubmission$processesSystems<TRes>
    implements
        CopyWith$Query$GetSubmission$getSubmission$processesSystems<TRes> {
  _CopyWithStubImpl$Query$GetSubmission$getSubmission$processesSystems(
      this._res);

  TRes _res;

  call({
    String? id,
    Enum$FpoProcessesSystemsSubmissionAccountsAndMisChoices? accountsAndMis,
    Enum$FpoProcessesSystemsSubmissionBooksAndRecordsUpToDateChoices?
        booksAndRecordsUpToDate,
    Enum$FpoProcessesSystemsSubmissionCreditRecordOfFpoChoices?
        creditRecordOfFpo,
    Enum$FpoProcessesSystemsSubmissionInsuranceOfStockChoices? insuranceOfStock,
    bool? penaltiesLeviedBoardMeeting,
    Enum$FpoProcessesSystemsSubmissionReconciliationOfStocksChoices?
        reconciliationOfStocks,
    Enum$FpoProcessesSystemsSubmissionStatutoryFillingsChoices?
        statutoryFillings,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetSubmission$getSubmission$financialDetails {
  Query$GetSubmission$getSubmission$financialDetails({
    required this.id,
    required this.cashChequePercentage,
    required this.createdAt,
    this.creditDefaultAmount,
    this.creditDefaultLender,
    this.creditDefaultYear,
    required this.currentYearAccountsPayable,
    required this.currentYearAccountsReceivable,
    required this.currentYearAssets,
    required this.loanDetails,
    required this.currentYearClosingInventory,
    required this.currentYearCogs,
    required this.currentYearCurrentAssets,
    required this.currentYearCurrentLiabilities,
    required this.currentYearGrossProfit,
    this.currentYearInstitutionalProducts,
    required this.currentYearInstitutionalRevenue,
    this.currentYearLenderName,
    required this.currentYearLiabilities,
    this.currentYearLoanAmount,
    this.currentYearMatchingGrant,
    required this.currentYearNetProfit,
    required this.currentYearOpeningInventory,
    this.currentYearProducts,
    this.currentYearProjectGrant,
    required this.currentYearQuantityProcured,
    this.currentYearQuantityProducts,
    this.currentYearRetailProducts,
    required this.currentYearRetailRevenue,
    required this.currentYearRevenue,
    required this.currentYearShareCapital,
    required this.currentYearShareholders,
    this.currentYearWholesaleProducts,
    required this.currentYearWholesaleRevenue,
    required this.daysPayableReceivableDifference,
    required this.grossNetProfitMarginDifference,
    this.institutionalLendingHistory,
    required this.operatingMarginCurrentYear,
    required this.previousYearAccountsPayable,
    required this.previousYearAccountsReceivable,
    required this.previousYearAssets,
    required this.previousYearClosingInventory,
    required this.previousYearCogs,
    required this.previousYearCurrentAssets,
    required this.previousYearCurrentLiabilities,
    required this.previousYearGrossProfit,
    this.previousYearInstitutionalProducts,
    required this.previousYearInstitutionalRevenue,
    this.previousYearLenderName,
    required this.previousYearLiabilities,
    this.previousYearLoanAmount,
    this.previousYearMatchingGrant,
    required this.previousYearNetProfit,
    required this.previousYearOpeningInventory,
    this.previousYearProducts,
    this.previousYearProjectGrant,
    required this.previousYearQuantityProcured,
    this.previousYearQuantityProducts,
    this.previousYearRetailProducts,
    required this.previousYearRetailRevenue,
    required this.previousYearRevenue,
    required this.previousYearShareCapital,
    required this.previousYearShareholders,
    this.previousYearWholesaleProducts,
    required this.previousYearWholesaleRevenue,
    this.targetRevenue,
    required this.totalDebtToday,
    required this.twoYearsBackAccountsPayable,
    required this.twoYearsBackAccountsReceivable,
    required this.twoYearsBackAssets,
    required this.twoYearsBackClosingInventory,
    required this.twoYearsBackCogs,
    required this.twoYearsBackCurrentAssets,
    required this.twoYearsBackCurrentLiabilities,
    required this.twoYearsBackGrossProfit,
    this.twoYearsBackInstitutionalProducts,
    required this.twoYearsBackInstitutionalRevenue,
    this.twoYearsBackLenderName,
    required this.twoYearsBackLiabilities,
    this.twoYearsBackLoanAmount,
    this.twoYearsBackMatchingGrant,
    required this.twoYearsBackNetProfit,
    required this.twoYearsBackOpeningInventory,
    this.twoYearsBackProducts,
    this.twoYearsBackProjectGrant,
    required this.twoYearsBackQuantityProcured,
    this.twoYearsBackQuantityProducts,
    this.twoYearsBackRetailProducts,
    required this.twoYearsBackRetailRevenue,
    required this.twoYearsBackRevenue,
    required this.twoYearsBackShareCapital,
    required this.twoYearsBackShareholders,
    this.twoYearsBackWholesaleProducts,
    required this.twoYearsBackWholesaleRevenue,
    required this.updatedAt,
    this.$__typename = 'FinancialDetailsSubmissionV2Node',
  });

  factory Query$GetSubmission$getSubmission$financialDetails.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$cashChequePercentage = json['cashChequePercentage'];
    final l$createdAt = json['createdAt'];
    final l$creditDefaultAmount = json['creditDefaultAmount'];
    final l$creditDefaultLender = json['creditDefaultLender'];
    final l$creditDefaultYear = json['creditDefaultYear'];
    final l$currentYearAccountsPayable = json['currentYearAccountsPayable'];
    final l$currentYearAccountsReceivable =
        json['currentYearAccountsReceivable'];
    final l$currentYearAssets = json['currentYearAssets'];
    final l$loanDetails = json['loanDetails'];
    final l$currentYearClosingInventory = json['currentYearClosingInventory'];
    final l$currentYearCogs = json['currentYearCogs'];
    final l$currentYearCurrentAssets = json['currentYearCurrentAssets'];
    final l$currentYearCurrentLiabilities =
        json['currentYearCurrentLiabilities'];
    final l$currentYearGrossProfit = json['currentYearGrossProfit'];
    final l$currentYearInstitutionalProducts =
        json['currentYearInstitutionalProducts'];
    final l$currentYearInstitutionalRevenue =
        json['currentYearInstitutionalRevenue'];
    final l$currentYearLenderName = json['currentYearLenderName'];
    final l$currentYearLiabilities = json['currentYearLiabilities'];
    final l$currentYearLoanAmount = json['currentYearLoanAmount'];
    final l$currentYearMatchingGrant = json['currentYearMatchingGrant'];
    final l$currentYearNetProfit = json['currentYearNetProfit'];
    final l$currentYearOpeningInventory = json['currentYearOpeningInventory'];
    final l$currentYearProducts = json['currentYearProducts'];
    final l$currentYearProjectGrant = json['currentYearProjectGrant'];
    final l$currentYearQuantityProcured = json['currentYearQuantityProcured'];
    final l$currentYearQuantityProducts = json['currentYearQuantityProducts'];
    final l$currentYearRetailProducts = json['currentYearRetailProducts'];
    final l$currentYearRetailRevenue = json['currentYearRetailRevenue'];
    final l$currentYearRevenue = json['currentYearRevenue'];
    final l$currentYearShareCapital = json['currentYearShareCapital'];
    final l$currentYearShareholders = json['currentYearShareholders'];
    final l$currentYearWholesaleProducts = json['currentYearWholesaleProducts'];
    final l$currentYearWholesaleRevenue = json['currentYearWholesaleRevenue'];
    final l$daysPayableReceivableDifference =
        json['daysPayableReceivableDifference'];
    final l$grossNetProfitMarginDifference =
        json['grossNetProfitMarginDifference'];
    final l$institutionalLendingHistory = json['institutionalLendingHistory'];
    final l$operatingMarginCurrentYear = json['operatingMarginCurrentYear'];
    final l$previousYearAccountsPayable = json['previousYearAccountsPayable'];
    final l$previousYearAccountsReceivable =
        json['previousYearAccountsReceivable'];
    final l$previousYearAssets = json['previousYearAssets'];
    final l$previousYearClosingInventory = json['previousYearClosingInventory'];
    final l$previousYearCogs = json['previousYearCogs'];
    final l$previousYearCurrentAssets = json['previousYearCurrentAssets'];
    final l$previousYearCurrentLiabilities =
        json['previousYearCurrentLiabilities'];
    final l$previousYearGrossProfit = json['previousYearGrossProfit'];
    final l$previousYearInstitutionalProducts =
        json['previousYearInstitutionalProducts'];
    final l$previousYearInstitutionalRevenue =
        json['previousYearInstitutionalRevenue'];
    final l$previousYearLenderName = json['previousYearLenderName'];
    final l$previousYearLiabilities = json['previousYearLiabilities'];
    final l$previousYearLoanAmount = json['previousYearLoanAmount'];
    final l$previousYearMatchingGrant = json['previousYearMatchingGrant'];
    final l$previousYearNetProfit = json['previousYearNetProfit'];
    final l$previousYearOpeningInventory = json['previousYearOpeningInventory'];
    final l$previousYearProducts = json['previousYearProducts'];
    final l$previousYearProjectGrant = json['previousYearProjectGrant'];
    final l$previousYearQuantityProcured = json['previousYearQuantityProcured'];
    final l$previousYearQuantityProducts = json['previousYearQuantityProducts'];
    final l$previousYearRetailProducts = json['previousYearRetailProducts'];
    final l$previousYearRetailRevenue = json['previousYearRetailRevenue'];
    final l$previousYearRevenue = json['previousYearRevenue'];
    final l$previousYearShareCapital = json['previousYearShareCapital'];
    final l$previousYearShareholders = json['previousYearShareholders'];
    final l$previousYearWholesaleProducts =
        json['previousYearWholesaleProducts'];
    final l$previousYearWholesaleRevenue = json['previousYearWholesaleRevenue'];
    final l$targetRevenue = json['targetRevenue'];
    final l$totalDebtToday = json['totalDebtToday'];
    final l$twoYearsBackAccountsPayable = json['twoYearsBackAccountsPayable'];
    final l$twoYearsBackAccountsReceivable =
        json['twoYearsBackAccountsReceivable'];
    final l$twoYearsBackAssets = json['twoYearsBackAssets'];
    final l$twoYearsBackClosingInventory = json['twoYearsBackClosingInventory'];
    final l$twoYearsBackCogs = json['twoYearsBackCogs'];
    final l$twoYearsBackCurrentAssets = json['twoYearsBackCurrentAssets'];
    final l$twoYearsBackCurrentLiabilities =
        json['twoYearsBackCurrentLiabilities'];
    final l$twoYearsBackGrossProfit = json['twoYearsBackGrossProfit'];
    final l$twoYearsBackInstitutionalProducts =
        json['twoYearsBackInstitutionalProducts'];
    final l$twoYearsBackInstitutionalRevenue =
        json['twoYearsBackInstitutionalRevenue'];
    final l$twoYearsBackLenderName = json['twoYearsBackLenderName'];
    final l$twoYearsBackLiabilities = json['twoYearsBackLiabilities'];
    final l$twoYearsBackLoanAmount = json['twoYearsBackLoanAmount'];
    final l$twoYearsBackMatchingGrant = json['twoYearsBackMatchingGrant'];
    final l$twoYearsBackNetProfit = json['twoYearsBackNetProfit'];
    final l$twoYearsBackOpeningInventory = json['twoYearsBackOpeningInventory'];
    final l$twoYearsBackProducts = json['twoYearsBackProducts'];
    final l$twoYearsBackProjectGrant = json['twoYearsBackProjectGrant'];
    final l$twoYearsBackQuantityProcured = json['twoYearsBackQuantityProcured'];
    final l$twoYearsBackQuantityProducts = json['twoYearsBackQuantityProducts'];
    final l$twoYearsBackRetailProducts = json['twoYearsBackRetailProducts'];
    final l$twoYearsBackRetailRevenue = json['twoYearsBackRetailRevenue'];
    final l$twoYearsBackRevenue = json['twoYearsBackRevenue'];
    final l$twoYearsBackShareCapital = json['twoYearsBackShareCapital'];
    final l$twoYearsBackShareholders = json['twoYearsBackShareholders'];
    final l$twoYearsBackWholesaleProducts =
        json['twoYearsBackWholesaleProducts'];
    final l$twoYearsBackWholesaleRevenue = json['twoYearsBackWholesaleRevenue'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Query$GetSubmission$getSubmission$financialDetails(
      id: (l$id as String),
      cashChequePercentage: (l$cashChequePercentage as String),
      createdAt: (l$createdAt as String),
      creditDefaultAmount: (l$creditDefaultAmount as String?),
      creditDefaultLender: (l$creditDefaultLender as String?),
      creditDefaultYear: (l$creditDefaultYear as String?),
      currentYearAccountsPayable: (l$currentYearAccountsPayable as String),
      currentYearAccountsReceivable:
          (l$currentYearAccountsReceivable as String),
      currentYearAssets: (l$currentYearAssets as String),
      loanDetails: (l$loanDetails as String),
      currentYearClosingInventory: (l$currentYearClosingInventory as String),
      currentYearCogs: (l$currentYearCogs as String),
      currentYearCurrentAssets: (l$currentYearCurrentAssets as String),
      currentYearCurrentLiabilities:
          (l$currentYearCurrentLiabilities as String),
      currentYearGrossProfit: (l$currentYearGrossProfit as String),
      currentYearInstitutionalProducts:
          (l$currentYearInstitutionalProducts as String?),
      currentYearInstitutionalRevenue:
          (l$currentYearInstitutionalRevenue as String),
      currentYearLenderName: (l$currentYearLenderName as String?),
      currentYearLiabilities: (l$currentYearLiabilities as String),
      currentYearLoanAmount: (l$currentYearLoanAmount as String?),
      currentYearMatchingGrant: (l$currentYearMatchingGrant as String?),
      currentYearNetProfit: (l$currentYearNetProfit as String),
      currentYearOpeningInventory: (l$currentYearOpeningInventory as String),
      currentYearProducts: (l$currentYearProducts as String?),
      currentYearProjectGrant: (l$currentYearProjectGrant as String?),
      currentYearQuantityProcured: (l$currentYearQuantityProcured as String),
      currentYearQuantityProducts: (l$currentYearQuantityProducts as String?),
      currentYearRetailProducts: (l$currentYearRetailProducts as String?),
      currentYearRetailRevenue: (l$currentYearRetailRevenue as String),
      currentYearRevenue: (l$currentYearRevenue as String),
      currentYearShareCapital: (l$currentYearShareCapital as String),
      currentYearShareholders: (l$currentYearShareholders as int),
      currentYearWholesaleProducts: (l$currentYearWholesaleProducts as String?),
      currentYearWholesaleRevenue: (l$currentYearWholesaleRevenue as String),
      daysPayableReceivableDifference:
          (l$daysPayableReceivableDifference as int),
      grossNetProfitMarginDifference:
          (l$grossNetProfitMarginDifference as String),
      institutionalLendingHistory: (l$institutionalLendingHistory as String?),
      operatingMarginCurrentYear: (l$operatingMarginCurrentYear as String),
      previousYearAccountsPayable: (l$previousYearAccountsPayable as String),
      previousYearAccountsReceivable:
          (l$previousYearAccountsReceivable as String),
      previousYearAssets: (l$previousYearAssets as String),
      previousYearClosingInventory: (l$previousYearClosingInventory as String),
      previousYearCogs: (l$previousYearCogs as String),
      previousYearCurrentAssets: (l$previousYearCurrentAssets as String),
      previousYearCurrentLiabilities:
          (l$previousYearCurrentLiabilities as String),
      previousYearGrossProfit: (l$previousYearGrossProfit as String),
      previousYearInstitutionalProducts:
          (l$previousYearInstitutionalProducts as String?),
      previousYearInstitutionalRevenue:
          (l$previousYearInstitutionalRevenue as String),
      previousYearLenderName: (l$previousYearLenderName as String?),
      previousYearLiabilities: (l$previousYearLiabilities as String),
      previousYearLoanAmount: (l$previousYearLoanAmount as String?),
      previousYearMatchingGrant: (l$previousYearMatchingGrant as String?),
      previousYearNetProfit: (l$previousYearNetProfit as String),
      previousYearOpeningInventory: (l$previousYearOpeningInventory as String),
      previousYearProducts: (l$previousYearProducts as String?),
      previousYearProjectGrant: (l$previousYearProjectGrant as String?),
      previousYearQuantityProcured: (l$previousYearQuantityProcured as String),
      previousYearQuantityProducts: (l$previousYearQuantityProducts as String?),
      previousYearRetailProducts: (l$previousYearRetailProducts as String?),
      previousYearRetailRevenue: (l$previousYearRetailRevenue as String),
      previousYearRevenue: (l$previousYearRevenue as String),
      previousYearShareCapital: (l$previousYearShareCapital as String),
      previousYearShareholders: (l$previousYearShareholders as int),
      previousYearWholesaleProducts:
          (l$previousYearWholesaleProducts as String?),
      previousYearWholesaleRevenue: (l$previousYearWholesaleRevenue as String),
      targetRevenue: (l$targetRevenue as String?),
      totalDebtToday: (l$totalDebtToday as String),
      twoYearsBackAccountsPayable: (l$twoYearsBackAccountsPayable as String),
      twoYearsBackAccountsReceivable:
          (l$twoYearsBackAccountsReceivable as String),
      twoYearsBackAssets: (l$twoYearsBackAssets as String),
      twoYearsBackClosingInventory: (l$twoYearsBackClosingInventory as String),
      twoYearsBackCogs: (l$twoYearsBackCogs as String),
      twoYearsBackCurrentAssets: (l$twoYearsBackCurrentAssets as String),
      twoYearsBackCurrentLiabilities:
          (l$twoYearsBackCurrentLiabilities as String),
      twoYearsBackGrossProfit: (l$twoYearsBackGrossProfit as String),
      twoYearsBackInstitutionalProducts:
          (l$twoYearsBackInstitutionalProducts as String?),
      twoYearsBackInstitutionalRevenue:
          (l$twoYearsBackInstitutionalRevenue as String),
      twoYearsBackLenderName: (l$twoYearsBackLenderName as String?),
      twoYearsBackLiabilities: (l$twoYearsBackLiabilities as String),
      twoYearsBackLoanAmount: (l$twoYearsBackLoanAmount as String?),
      twoYearsBackMatchingGrant: (l$twoYearsBackMatchingGrant as String?),
      twoYearsBackNetProfit: (l$twoYearsBackNetProfit as String),
      twoYearsBackOpeningInventory: (l$twoYearsBackOpeningInventory as String),
      twoYearsBackProducts: (l$twoYearsBackProducts as String?),
      twoYearsBackProjectGrant: (l$twoYearsBackProjectGrant as String?),
      twoYearsBackQuantityProcured: (l$twoYearsBackQuantityProcured as String),
      twoYearsBackQuantityProducts: (l$twoYearsBackQuantityProducts as String?),
      twoYearsBackRetailProducts: (l$twoYearsBackRetailProducts as String?),
      twoYearsBackRetailRevenue: (l$twoYearsBackRetailRevenue as String),
      twoYearsBackRevenue: (l$twoYearsBackRevenue as String),
      twoYearsBackShareCapital: (l$twoYearsBackShareCapital as String),
      twoYearsBackShareholders: (l$twoYearsBackShareholders as int),
      twoYearsBackWholesaleProducts:
          (l$twoYearsBackWholesaleProducts as String?),
      twoYearsBackWholesaleRevenue: (l$twoYearsBackWholesaleRevenue as String),
      updatedAt: (l$updatedAt as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String cashChequePercentage;

  final String createdAt;

  final String? creditDefaultAmount;

  final String? creditDefaultLender;

  final String? creditDefaultYear;

  final String currentYearAccountsPayable;

  final String currentYearAccountsReceivable;

  final String currentYearAssets;

  final String loanDetails;

  final String currentYearClosingInventory;

  final String currentYearCogs;

  final String currentYearCurrentAssets;

  final String currentYearCurrentLiabilities;

  final String currentYearGrossProfit;

  final String? currentYearInstitutionalProducts;

  final String currentYearInstitutionalRevenue;

  final String? currentYearLenderName;

  final String currentYearLiabilities;

  final String? currentYearLoanAmount;

  final String? currentYearMatchingGrant;

  final String currentYearNetProfit;

  final String currentYearOpeningInventory;

  final String? currentYearProducts;

  final String? currentYearProjectGrant;

  final String currentYearQuantityProcured;

  final String? currentYearQuantityProducts;

  final String? currentYearRetailProducts;

  final String currentYearRetailRevenue;

  final String currentYearRevenue;

  final String currentYearShareCapital;

  final int currentYearShareholders;

  final String? currentYearWholesaleProducts;

  final String currentYearWholesaleRevenue;

  final int daysPayableReceivableDifference;

  final String grossNetProfitMarginDifference;

  final String? institutionalLendingHistory;

  final String operatingMarginCurrentYear;

  final String previousYearAccountsPayable;

  final String previousYearAccountsReceivable;

  final String previousYearAssets;

  final String previousYearClosingInventory;

  final String previousYearCogs;

  final String previousYearCurrentAssets;

  final String previousYearCurrentLiabilities;

  final String previousYearGrossProfit;

  final String? previousYearInstitutionalProducts;

  final String previousYearInstitutionalRevenue;

  final String? previousYearLenderName;

  final String previousYearLiabilities;

  final String? previousYearLoanAmount;

  final String? previousYearMatchingGrant;

  final String previousYearNetProfit;

  final String previousYearOpeningInventory;

  final String? previousYearProducts;

  final String? previousYearProjectGrant;

  final String previousYearQuantityProcured;

  final String? previousYearQuantityProducts;

  final String? previousYearRetailProducts;

  final String previousYearRetailRevenue;

  final String previousYearRevenue;

  final String previousYearShareCapital;

  final int previousYearShareholders;

  final String? previousYearWholesaleProducts;

  final String previousYearWholesaleRevenue;

  final String? targetRevenue;

  final String totalDebtToday;

  final String twoYearsBackAccountsPayable;

  final String twoYearsBackAccountsReceivable;

  final String twoYearsBackAssets;

  final String twoYearsBackClosingInventory;

  final String twoYearsBackCogs;

  final String twoYearsBackCurrentAssets;

  final String twoYearsBackCurrentLiabilities;

  final String twoYearsBackGrossProfit;

  final String? twoYearsBackInstitutionalProducts;

  final String twoYearsBackInstitutionalRevenue;

  final String? twoYearsBackLenderName;

  final String twoYearsBackLiabilities;

  final String? twoYearsBackLoanAmount;

  final String? twoYearsBackMatchingGrant;

  final String twoYearsBackNetProfit;

  final String twoYearsBackOpeningInventory;

  final String? twoYearsBackProducts;

  final String? twoYearsBackProjectGrant;

  final String twoYearsBackQuantityProcured;

  final String? twoYearsBackQuantityProducts;

  final String? twoYearsBackRetailProducts;

  final String twoYearsBackRetailRevenue;

  final String twoYearsBackRevenue;

  final String twoYearsBackShareCapital;

  final int twoYearsBackShareholders;

  final String? twoYearsBackWholesaleProducts;

  final String twoYearsBackWholesaleRevenue;

  final String updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$cashChequePercentage = cashChequePercentage;
    _resultData['cashChequePercentage'] = l$cashChequePercentage;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$creditDefaultAmount = creditDefaultAmount;
    _resultData['creditDefaultAmount'] = l$creditDefaultAmount;
    final l$creditDefaultLender = creditDefaultLender;
    _resultData['creditDefaultLender'] = l$creditDefaultLender;
    final l$creditDefaultYear = creditDefaultYear;
    _resultData['creditDefaultYear'] = l$creditDefaultYear;
    final l$currentYearAccountsPayable = currentYearAccountsPayable;
    _resultData['currentYearAccountsPayable'] = l$currentYearAccountsPayable;
    final l$currentYearAccountsReceivable = currentYearAccountsReceivable;
    _resultData['currentYearAccountsReceivable'] =
        l$currentYearAccountsReceivable;
    final l$currentYearAssets = currentYearAssets;
    _resultData['currentYearAssets'] = l$currentYearAssets;
    final l$loanDetails = loanDetails;
    _resultData['loanDetails'] = l$loanDetails;
    final l$currentYearClosingInventory = currentYearClosingInventory;
    _resultData['currentYearClosingInventory'] = l$currentYearClosingInventory;
    final l$currentYearCogs = currentYearCogs;
    _resultData['currentYearCogs'] = l$currentYearCogs;
    final l$currentYearCurrentAssets = currentYearCurrentAssets;
    _resultData['currentYearCurrentAssets'] = l$currentYearCurrentAssets;
    final l$currentYearCurrentLiabilities = currentYearCurrentLiabilities;
    _resultData['currentYearCurrentLiabilities'] =
        l$currentYearCurrentLiabilities;
    final l$currentYearGrossProfit = currentYearGrossProfit;
    _resultData['currentYearGrossProfit'] = l$currentYearGrossProfit;
    final l$currentYearInstitutionalProducts = currentYearInstitutionalProducts;
    _resultData['currentYearInstitutionalProducts'] =
        l$currentYearInstitutionalProducts;
    final l$currentYearInstitutionalRevenue = currentYearInstitutionalRevenue;
    _resultData['currentYearInstitutionalRevenue'] =
        l$currentYearInstitutionalRevenue;
    final l$currentYearLenderName = currentYearLenderName;
    _resultData['currentYearLenderName'] = l$currentYearLenderName;
    final l$currentYearLiabilities = currentYearLiabilities;
    _resultData['currentYearLiabilities'] = l$currentYearLiabilities;
    final l$currentYearLoanAmount = currentYearLoanAmount;
    _resultData['currentYearLoanAmount'] = l$currentYearLoanAmount;
    final l$currentYearMatchingGrant = currentYearMatchingGrant;
    _resultData['currentYearMatchingGrant'] = l$currentYearMatchingGrant;
    final l$currentYearNetProfit = currentYearNetProfit;
    _resultData['currentYearNetProfit'] = l$currentYearNetProfit;
    final l$currentYearOpeningInventory = currentYearOpeningInventory;
    _resultData['currentYearOpeningInventory'] = l$currentYearOpeningInventory;
    final l$currentYearProducts = currentYearProducts;
    _resultData['currentYearProducts'] = l$currentYearProducts;
    final l$currentYearProjectGrant = currentYearProjectGrant;
    _resultData['currentYearProjectGrant'] = l$currentYearProjectGrant;
    final l$currentYearQuantityProcured = currentYearQuantityProcured;
    _resultData['currentYearQuantityProcured'] = l$currentYearQuantityProcured;
    final l$currentYearQuantityProducts = currentYearQuantityProducts;
    _resultData['currentYearQuantityProducts'] = l$currentYearQuantityProducts;
    final l$currentYearRetailProducts = currentYearRetailProducts;
    _resultData['currentYearRetailProducts'] = l$currentYearRetailProducts;
    final l$currentYearRetailRevenue = currentYearRetailRevenue;
    _resultData['currentYearRetailRevenue'] = l$currentYearRetailRevenue;
    final l$currentYearRevenue = currentYearRevenue;
    _resultData['currentYearRevenue'] = l$currentYearRevenue;
    final l$currentYearShareCapital = currentYearShareCapital;
    _resultData['currentYearShareCapital'] = l$currentYearShareCapital;
    final l$currentYearShareholders = currentYearShareholders;
    _resultData['currentYearShareholders'] = l$currentYearShareholders;
    final l$currentYearWholesaleProducts = currentYearWholesaleProducts;
    _resultData['currentYearWholesaleProducts'] =
        l$currentYearWholesaleProducts;
    final l$currentYearWholesaleRevenue = currentYearWholesaleRevenue;
    _resultData['currentYearWholesaleRevenue'] = l$currentYearWholesaleRevenue;
    final l$daysPayableReceivableDifference = daysPayableReceivableDifference;
    _resultData['daysPayableReceivableDifference'] =
        l$daysPayableReceivableDifference;
    final l$grossNetProfitMarginDifference = grossNetProfitMarginDifference;
    _resultData['grossNetProfitMarginDifference'] =
        l$grossNetProfitMarginDifference;
    final l$institutionalLendingHistory = institutionalLendingHistory;
    _resultData['institutionalLendingHistory'] = l$institutionalLendingHistory;
    final l$operatingMarginCurrentYear = operatingMarginCurrentYear;
    _resultData['operatingMarginCurrentYear'] = l$operatingMarginCurrentYear;
    final l$previousYearAccountsPayable = previousYearAccountsPayable;
    _resultData['previousYearAccountsPayable'] = l$previousYearAccountsPayable;
    final l$previousYearAccountsReceivable = previousYearAccountsReceivable;
    _resultData['previousYearAccountsReceivable'] =
        l$previousYearAccountsReceivable;
    final l$previousYearAssets = previousYearAssets;
    _resultData['previousYearAssets'] = l$previousYearAssets;
    final l$previousYearClosingInventory = previousYearClosingInventory;
    _resultData['previousYearClosingInventory'] =
        l$previousYearClosingInventory;
    final l$previousYearCogs = previousYearCogs;
    _resultData['previousYearCogs'] = l$previousYearCogs;
    final l$previousYearCurrentAssets = previousYearCurrentAssets;
    _resultData['previousYearCurrentAssets'] = l$previousYearCurrentAssets;
    final l$previousYearCurrentLiabilities = previousYearCurrentLiabilities;
    _resultData['previousYearCurrentLiabilities'] =
        l$previousYearCurrentLiabilities;
    final l$previousYearGrossProfit = previousYearGrossProfit;
    _resultData['previousYearGrossProfit'] = l$previousYearGrossProfit;
    final l$previousYearInstitutionalProducts =
        previousYearInstitutionalProducts;
    _resultData['previousYearInstitutionalProducts'] =
        l$previousYearInstitutionalProducts;
    final l$previousYearInstitutionalRevenue = previousYearInstitutionalRevenue;
    _resultData['previousYearInstitutionalRevenue'] =
        l$previousYearInstitutionalRevenue;
    final l$previousYearLenderName = previousYearLenderName;
    _resultData['previousYearLenderName'] = l$previousYearLenderName;
    final l$previousYearLiabilities = previousYearLiabilities;
    _resultData['previousYearLiabilities'] = l$previousYearLiabilities;
    final l$previousYearLoanAmount = previousYearLoanAmount;
    _resultData['previousYearLoanAmount'] = l$previousYearLoanAmount;
    final l$previousYearMatchingGrant = previousYearMatchingGrant;
    _resultData['previousYearMatchingGrant'] = l$previousYearMatchingGrant;
    final l$previousYearNetProfit = previousYearNetProfit;
    _resultData['previousYearNetProfit'] = l$previousYearNetProfit;
    final l$previousYearOpeningInventory = previousYearOpeningInventory;
    _resultData['previousYearOpeningInventory'] =
        l$previousYearOpeningInventory;
    final l$previousYearProducts = previousYearProducts;
    _resultData['previousYearProducts'] = l$previousYearProducts;
    final l$previousYearProjectGrant = previousYearProjectGrant;
    _resultData['previousYearProjectGrant'] = l$previousYearProjectGrant;
    final l$previousYearQuantityProcured = previousYearQuantityProcured;
    _resultData['previousYearQuantityProcured'] =
        l$previousYearQuantityProcured;
    final l$previousYearQuantityProducts = previousYearQuantityProducts;
    _resultData['previousYearQuantityProducts'] =
        l$previousYearQuantityProducts;
    final l$previousYearRetailProducts = previousYearRetailProducts;
    _resultData['previousYearRetailProducts'] = l$previousYearRetailProducts;
    final l$previousYearRetailRevenue = previousYearRetailRevenue;
    _resultData['previousYearRetailRevenue'] = l$previousYearRetailRevenue;
    final l$previousYearRevenue = previousYearRevenue;
    _resultData['previousYearRevenue'] = l$previousYearRevenue;
    final l$previousYearShareCapital = previousYearShareCapital;
    _resultData['previousYearShareCapital'] = l$previousYearShareCapital;
    final l$previousYearShareholders = previousYearShareholders;
    _resultData['previousYearShareholders'] = l$previousYearShareholders;
    final l$previousYearWholesaleProducts = previousYearWholesaleProducts;
    _resultData['previousYearWholesaleProducts'] =
        l$previousYearWholesaleProducts;
    final l$previousYearWholesaleRevenue = previousYearWholesaleRevenue;
    _resultData['previousYearWholesaleRevenue'] =
        l$previousYearWholesaleRevenue;
    final l$targetRevenue = targetRevenue;
    _resultData['targetRevenue'] = l$targetRevenue;
    final l$totalDebtToday = totalDebtToday;
    _resultData['totalDebtToday'] = l$totalDebtToday;
    final l$twoYearsBackAccountsPayable = twoYearsBackAccountsPayable;
    _resultData['twoYearsBackAccountsPayable'] = l$twoYearsBackAccountsPayable;
    final l$twoYearsBackAccountsReceivable = twoYearsBackAccountsReceivable;
    _resultData['twoYearsBackAccountsReceivable'] =
        l$twoYearsBackAccountsReceivable;
    final l$twoYearsBackAssets = twoYearsBackAssets;
    _resultData['twoYearsBackAssets'] = l$twoYearsBackAssets;
    final l$twoYearsBackClosingInventory = twoYearsBackClosingInventory;
    _resultData['twoYearsBackClosingInventory'] =
        l$twoYearsBackClosingInventory;
    final l$twoYearsBackCogs = twoYearsBackCogs;
    _resultData['twoYearsBackCogs'] = l$twoYearsBackCogs;
    final l$twoYearsBackCurrentAssets = twoYearsBackCurrentAssets;
    _resultData['twoYearsBackCurrentAssets'] = l$twoYearsBackCurrentAssets;
    final l$twoYearsBackCurrentLiabilities = twoYearsBackCurrentLiabilities;
    _resultData['twoYearsBackCurrentLiabilities'] =
        l$twoYearsBackCurrentLiabilities;
    final l$twoYearsBackGrossProfit = twoYearsBackGrossProfit;
    _resultData['twoYearsBackGrossProfit'] = l$twoYearsBackGrossProfit;
    final l$twoYearsBackInstitutionalProducts =
        twoYearsBackInstitutionalProducts;
    _resultData['twoYearsBackInstitutionalProducts'] =
        l$twoYearsBackInstitutionalProducts;
    final l$twoYearsBackInstitutionalRevenue = twoYearsBackInstitutionalRevenue;
    _resultData['twoYearsBackInstitutionalRevenue'] =
        l$twoYearsBackInstitutionalRevenue;
    final l$twoYearsBackLenderName = twoYearsBackLenderName;
    _resultData['twoYearsBackLenderName'] = l$twoYearsBackLenderName;
    final l$twoYearsBackLiabilities = twoYearsBackLiabilities;
    _resultData['twoYearsBackLiabilities'] = l$twoYearsBackLiabilities;
    final l$twoYearsBackLoanAmount = twoYearsBackLoanAmount;
    _resultData['twoYearsBackLoanAmount'] = l$twoYearsBackLoanAmount;
    final l$twoYearsBackMatchingGrant = twoYearsBackMatchingGrant;
    _resultData['twoYearsBackMatchingGrant'] = l$twoYearsBackMatchingGrant;
    final l$twoYearsBackNetProfit = twoYearsBackNetProfit;
    _resultData['twoYearsBackNetProfit'] = l$twoYearsBackNetProfit;
    final l$twoYearsBackOpeningInventory = twoYearsBackOpeningInventory;
    _resultData['twoYearsBackOpeningInventory'] =
        l$twoYearsBackOpeningInventory;
    final l$twoYearsBackProducts = twoYearsBackProducts;
    _resultData['twoYearsBackProducts'] = l$twoYearsBackProducts;
    final l$twoYearsBackProjectGrant = twoYearsBackProjectGrant;
    _resultData['twoYearsBackProjectGrant'] = l$twoYearsBackProjectGrant;
    final l$twoYearsBackQuantityProcured = twoYearsBackQuantityProcured;
    _resultData['twoYearsBackQuantityProcured'] =
        l$twoYearsBackQuantityProcured;
    final l$twoYearsBackQuantityProducts = twoYearsBackQuantityProducts;
    _resultData['twoYearsBackQuantityProducts'] =
        l$twoYearsBackQuantityProducts;
    final l$twoYearsBackRetailProducts = twoYearsBackRetailProducts;
    _resultData['twoYearsBackRetailProducts'] = l$twoYearsBackRetailProducts;
    final l$twoYearsBackRetailRevenue = twoYearsBackRetailRevenue;
    _resultData['twoYearsBackRetailRevenue'] = l$twoYearsBackRetailRevenue;
    final l$twoYearsBackRevenue = twoYearsBackRevenue;
    _resultData['twoYearsBackRevenue'] = l$twoYearsBackRevenue;
    final l$twoYearsBackShareCapital = twoYearsBackShareCapital;
    _resultData['twoYearsBackShareCapital'] = l$twoYearsBackShareCapital;
    final l$twoYearsBackShareholders = twoYearsBackShareholders;
    _resultData['twoYearsBackShareholders'] = l$twoYearsBackShareholders;
    final l$twoYearsBackWholesaleProducts = twoYearsBackWholesaleProducts;
    _resultData['twoYearsBackWholesaleProducts'] =
        l$twoYearsBackWholesaleProducts;
    final l$twoYearsBackWholesaleRevenue = twoYearsBackWholesaleRevenue;
    _resultData['twoYearsBackWholesaleRevenue'] =
        l$twoYearsBackWholesaleRevenue;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$cashChequePercentage = cashChequePercentage;
    final l$createdAt = createdAt;
    final l$creditDefaultAmount = creditDefaultAmount;
    final l$creditDefaultLender = creditDefaultLender;
    final l$creditDefaultYear = creditDefaultYear;
    final l$currentYearAccountsPayable = currentYearAccountsPayable;
    final l$currentYearAccountsReceivable = currentYearAccountsReceivable;
    final l$currentYearAssets = currentYearAssets;
    final l$loanDetails = loanDetails;
    final l$currentYearClosingInventory = currentYearClosingInventory;
    final l$currentYearCogs = currentYearCogs;
    final l$currentYearCurrentAssets = currentYearCurrentAssets;
    final l$currentYearCurrentLiabilities = currentYearCurrentLiabilities;
    final l$currentYearGrossProfit = currentYearGrossProfit;
    final l$currentYearInstitutionalProducts = currentYearInstitutionalProducts;
    final l$currentYearInstitutionalRevenue = currentYearInstitutionalRevenue;
    final l$currentYearLenderName = currentYearLenderName;
    final l$currentYearLiabilities = currentYearLiabilities;
    final l$currentYearLoanAmount = currentYearLoanAmount;
    final l$currentYearMatchingGrant = currentYearMatchingGrant;
    final l$currentYearNetProfit = currentYearNetProfit;
    final l$currentYearOpeningInventory = currentYearOpeningInventory;
    final l$currentYearProducts = currentYearProducts;
    final l$currentYearProjectGrant = currentYearProjectGrant;
    final l$currentYearQuantityProcured = currentYearQuantityProcured;
    final l$currentYearQuantityProducts = currentYearQuantityProducts;
    final l$currentYearRetailProducts = currentYearRetailProducts;
    final l$currentYearRetailRevenue = currentYearRetailRevenue;
    final l$currentYearRevenue = currentYearRevenue;
    final l$currentYearShareCapital = currentYearShareCapital;
    final l$currentYearShareholders = currentYearShareholders;
    final l$currentYearWholesaleProducts = currentYearWholesaleProducts;
    final l$currentYearWholesaleRevenue = currentYearWholesaleRevenue;
    final l$daysPayableReceivableDifference = daysPayableReceivableDifference;
    final l$grossNetProfitMarginDifference = grossNetProfitMarginDifference;
    final l$institutionalLendingHistory = institutionalLendingHistory;
    final l$operatingMarginCurrentYear = operatingMarginCurrentYear;
    final l$previousYearAccountsPayable = previousYearAccountsPayable;
    final l$previousYearAccountsReceivable = previousYearAccountsReceivable;
    final l$previousYearAssets = previousYearAssets;
    final l$previousYearClosingInventory = previousYearClosingInventory;
    final l$previousYearCogs = previousYearCogs;
    final l$previousYearCurrentAssets = previousYearCurrentAssets;
    final l$previousYearCurrentLiabilities = previousYearCurrentLiabilities;
    final l$previousYearGrossProfit = previousYearGrossProfit;
    final l$previousYearInstitutionalProducts =
        previousYearInstitutionalProducts;
    final l$previousYearInstitutionalRevenue = previousYearInstitutionalRevenue;
    final l$previousYearLenderName = previousYearLenderName;
    final l$previousYearLiabilities = previousYearLiabilities;
    final l$previousYearLoanAmount = previousYearLoanAmount;
    final l$previousYearMatchingGrant = previousYearMatchingGrant;
    final l$previousYearNetProfit = previousYearNetProfit;
    final l$previousYearOpeningInventory = previousYearOpeningInventory;
    final l$previousYearProducts = previousYearProducts;
    final l$previousYearProjectGrant = previousYearProjectGrant;
    final l$previousYearQuantityProcured = previousYearQuantityProcured;
    final l$previousYearQuantityProducts = previousYearQuantityProducts;
    final l$previousYearRetailProducts = previousYearRetailProducts;
    final l$previousYearRetailRevenue = previousYearRetailRevenue;
    final l$previousYearRevenue = previousYearRevenue;
    final l$previousYearShareCapital = previousYearShareCapital;
    final l$previousYearShareholders = previousYearShareholders;
    final l$previousYearWholesaleProducts = previousYearWholesaleProducts;
    final l$previousYearWholesaleRevenue = previousYearWholesaleRevenue;
    final l$targetRevenue = targetRevenue;
    final l$totalDebtToday = totalDebtToday;
    final l$twoYearsBackAccountsPayable = twoYearsBackAccountsPayable;
    final l$twoYearsBackAccountsReceivable = twoYearsBackAccountsReceivable;
    final l$twoYearsBackAssets = twoYearsBackAssets;
    final l$twoYearsBackClosingInventory = twoYearsBackClosingInventory;
    final l$twoYearsBackCogs = twoYearsBackCogs;
    final l$twoYearsBackCurrentAssets = twoYearsBackCurrentAssets;
    final l$twoYearsBackCurrentLiabilities = twoYearsBackCurrentLiabilities;
    final l$twoYearsBackGrossProfit = twoYearsBackGrossProfit;
    final l$twoYearsBackInstitutionalProducts =
        twoYearsBackInstitutionalProducts;
    final l$twoYearsBackInstitutionalRevenue = twoYearsBackInstitutionalRevenue;
    final l$twoYearsBackLenderName = twoYearsBackLenderName;
    final l$twoYearsBackLiabilities = twoYearsBackLiabilities;
    final l$twoYearsBackLoanAmount = twoYearsBackLoanAmount;
    final l$twoYearsBackMatchingGrant = twoYearsBackMatchingGrant;
    final l$twoYearsBackNetProfit = twoYearsBackNetProfit;
    final l$twoYearsBackOpeningInventory = twoYearsBackOpeningInventory;
    final l$twoYearsBackProducts = twoYearsBackProducts;
    final l$twoYearsBackProjectGrant = twoYearsBackProjectGrant;
    final l$twoYearsBackQuantityProcured = twoYearsBackQuantityProcured;
    final l$twoYearsBackQuantityProducts = twoYearsBackQuantityProducts;
    final l$twoYearsBackRetailProducts = twoYearsBackRetailProducts;
    final l$twoYearsBackRetailRevenue = twoYearsBackRetailRevenue;
    final l$twoYearsBackRevenue = twoYearsBackRevenue;
    final l$twoYearsBackShareCapital = twoYearsBackShareCapital;
    final l$twoYearsBackShareholders = twoYearsBackShareholders;
    final l$twoYearsBackWholesaleProducts = twoYearsBackWholesaleProducts;
    final l$twoYearsBackWholesaleRevenue = twoYearsBackWholesaleRevenue;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$cashChequePercentage,
      l$createdAt,
      l$creditDefaultAmount,
      l$creditDefaultLender,
      l$creditDefaultYear,
      l$currentYearAccountsPayable,
      l$currentYearAccountsReceivable,
      l$currentYearAssets,
      l$loanDetails,
      l$currentYearClosingInventory,
      l$currentYearCogs,
      l$currentYearCurrentAssets,
      l$currentYearCurrentLiabilities,
      l$currentYearGrossProfit,
      l$currentYearInstitutionalProducts,
      l$currentYearInstitutionalRevenue,
      l$currentYearLenderName,
      l$currentYearLiabilities,
      l$currentYearLoanAmount,
      l$currentYearMatchingGrant,
      l$currentYearNetProfit,
      l$currentYearOpeningInventory,
      l$currentYearProducts,
      l$currentYearProjectGrant,
      l$currentYearQuantityProcured,
      l$currentYearQuantityProducts,
      l$currentYearRetailProducts,
      l$currentYearRetailRevenue,
      l$currentYearRevenue,
      l$currentYearShareCapital,
      l$currentYearShareholders,
      l$currentYearWholesaleProducts,
      l$currentYearWholesaleRevenue,
      l$daysPayableReceivableDifference,
      l$grossNetProfitMarginDifference,
      l$institutionalLendingHistory,
      l$operatingMarginCurrentYear,
      l$previousYearAccountsPayable,
      l$previousYearAccountsReceivable,
      l$previousYearAssets,
      l$previousYearClosingInventory,
      l$previousYearCogs,
      l$previousYearCurrentAssets,
      l$previousYearCurrentLiabilities,
      l$previousYearGrossProfit,
      l$previousYearInstitutionalProducts,
      l$previousYearInstitutionalRevenue,
      l$previousYearLenderName,
      l$previousYearLiabilities,
      l$previousYearLoanAmount,
      l$previousYearMatchingGrant,
      l$previousYearNetProfit,
      l$previousYearOpeningInventory,
      l$previousYearProducts,
      l$previousYearProjectGrant,
      l$previousYearQuantityProcured,
      l$previousYearQuantityProducts,
      l$previousYearRetailProducts,
      l$previousYearRetailRevenue,
      l$previousYearRevenue,
      l$previousYearShareCapital,
      l$previousYearShareholders,
      l$previousYearWholesaleProducts,
      l$previousYearWholesaleRevenue,
      l$targetRevenue,
      l$totalDebtToday,
      l$twoYearsBackAccountsPayable,
      l$twoYearsBackAccountsReceivable,
      l$twoYearsBackAssets,
      l$twoYearsBackClosingInventory,
      l$twoYearsBackCogs,
      l$twoYearsBackCurrentAssets,
      l$twoYearsBackCurrentLiabilities,
      l$twoYearsBackGrossProfit,
      l$twoYearsBackInstitutionalProducts,
      l$twoYearsBackInstitutionalRevenue,
      l$twoYearsBackLenderName,
      l$twoYearsBackLiabilities,
      l$twoYearsBackLoanAmount,
      l$twoYearsBackMatchingGrant,
      l$twoYearsBackNetProfit,
      l$twoYearsBackOpeningInventory,
      l$twoYearsBackProducts,
      l$twoYearsBackProjectGrant,
      l$twoYearsBackQuantityProcured,
      l$twoYearsBackQuantityProducts,
      l$twoYearsBackRetailProducts,
      l$twoYearsBackRetailRevenue,
      l$twoYearsBackRevenue,
      l$twoYearsBackShareCapital,
      l$twoYearsBackShareholders,
      l$twoYearsBackWholesaleProducts,
      l$twoYearsBackWholesaleRevenue,
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSubmission$getSubmission$financialDetails) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$cashChequePercentage = cashChequePercentage;
    final lOther$cashChequePercentage = other.cashChequePercentage;
    if (l$cashChequePercentage != lOther$cashChequePercentage) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$creditDefaultAmount = creditDefaultAmount;
    final lOther$creditDefaultAmount = other.creditDefaultAmount;
    if (l$creditDefaultAmount != lOther$creditDefaultAmount) {
      return false;
    }
    final l$creditDefaultLender = creditDefaultLender;
    final lOther$creditDefaultLender = other.creditDefaultLender;
    if (l$creditDefaultLender != lOther$creditDefaultLender) {
      return false;
    }
    final l$creditDefaultYear = creditDefaultYear;
    final lOther$creditDefaultYear = other.creditDefaultYear;
    if (l$creditDefaultYear != lOther$creditDefaultYear) {
      return false;
    }
    final l$currentYearAccountsPayable = currentYearAccountsPayable;
    final lOther$currentYearAccountsPayable = other.currentYearAccountsPayable;
    if (l$currentYearAccountsPayable != lOther$currentYearAccountsPayable) {
      return false;
    }
    final l$currentYearAccountsReceivable = currentYearAccountsReceivable;
    final lOther$currentYearAccountsReceivable =
        other.currentYearAccountsReceivable;
    if (l$currentYearAccountsReceivable !=
        lOther$currentYearAccountsReceivable) {
      return false;
    }
    final l$currentYearAssets = currentYearAssets;
    final lOther$currentYearAssets = other.currentYearAssets;
    if (l$currentYearAssets != lOther$currentYearAssets) {
      return false;
    }
    final l$loanDetails = loanDetails;
    final lOther$loanDetails = other.loanDetails;
    if (l$loanDetails != lOther$loanDetails) {
      return false;
    }
    final l$currentYearClosingInventory = currentYearClosingInventory;
    final lOther$currentYearClosingInventory =
        other.currentYearClosingInventory;
    if (l$currentYearClosingInventory != lOther$currentYearClosingInventory) {
      return false;
    }
    final l$currentYearCogs = currentYearCogs;
    final lOther$currentYearCogs = other.currentYearCogs;
    if (l$currentYearCogs != lOther$currentYearCogs) {
      return false;
    }
    final l$currentYearCurrentAssets = currentYearCurrentAssets;
    final lOther$currentYearCurrentAssets = other.currentYearCurrentAssets;
    if (l$currentYearCurrentAssets != lOther$currentYearCurrentAssets) {
      return false;
    }
    final l$currentYearCurrentLiabilities = currentYearCurrentLiabilities;
    final lOther$currentYearCurrentLiabilities =
        other.currentYearCurrentLiabilities;
    if (l$currentYearCurrentLiabilities !=
        lOther$currentYearCurrentLiabilities) {
      return false;
    }
    final l$currentYearGrossProfit = currentYearGrossProfit;
    final lOther$currentYearGrossProfit = other.currentYearGrossProfit;
    if (l$currentYearGrossProfit != lOther$currentYearGrossProfit) {
      return false;
    }
    final l$currentYearInstitutionalProducts = currentYearInstitutionalProducts;
    final lOther$currentYearInstitutionalProducts =
        other.currentYearInstitutionalProducts;
    if (l$currentYearInstitutionalProducts !=
        lOther$currentYearInstitutionalProducts) {
      return false;
    }
    final l$currentYearInstitutionalRevenue = currentYearInstitutionalRevenue;
    final lOther$currentYearInstitutionalRevenue =
        other.currentYearInstitutionalRevenue;
    if (l$currentYearInstitutionalRevenue !=
        lOther$currentYearInstitutionalRevenue) {
      return false;
    }
    final l$currentYearLenderName = currentYearLenderName;
    final lOther$currentYearLenderName = other.currentYearLenderName;
    if (l$currentYearLenderName != lOther$currentYearLenderName) {
      return false;
    }
    final l$currentYearLiabilities = currentYearLiabilities;
    final lOther$currentYearLiabilities = other.currentYearLiabilities;
    if (l$currentYearLiabilities != lOther$currentYearLiabilities) {
      return false;
    }
    final l$currentYearLoanAmount = currentYearLoanAmount;
    final lOther$currentYearLoanAmount = other.currentYearLoanAmount;
    if (l$currentYearLoanAmount != lOther$currentYearLoanAmount) {
      return false;
    }
    final l$currentYearMatchingGrant = currentYearMatchingGrant;
    final lOther$currentYearMatchingGrant = other.currentYearMatchingGrant;
    if (l$currentYearMatchingGrant != lOther$currentYearMatchingGrant) {
      return false;
    }
    final l$currentYearNetProfit = currentYearNetProfit;
    final lOther$currentYearNetProfit = other.currentYearNetProfit;
    if (l$currentYearNetProfit != lOther$currentYearNetProfit) {
      return false;
    }
    final l$currentYearOpeningInventory = currentYearOpeningInventory;
    final lOther$currentYearOpeningInventory =
        other.currentYearOpeningInventory;
    if (l$currentYearOpeningInventory != lOther$currentYearOpeningInventory) {
      return false;
    }
    final l$currentYearProducts = currentYearProducts;
    final lOther$currentYearProducts = other.currentYearProducts;
    if (l$currentYearProducts != lOther$currentYearProducts) {
      return false;
    }
    final l$currentYearProjectGrant = currentYearProjectGrant;
    final lOther$currentYearProjectGrant = other.currentYearProjectGrant;
    if (l$currentYearProjectGrant != lOther$currentYearProjectGrant) {
      return false;
    }
    final l$currentYearQuantityProcured = currentYearQuantityProcured;
    final lOther$currentYearQuantityProcured =
        other.currentYearQuantityProcured;
    if (l$currentYearQuantityProcured != lOther$currentYearQuantityProcured) {
      return false;
    }
    final l$currentYearQuantityProducts = currentYearQuantityProducts;
    final lOther$currentYearQuantityProducts =
        other.currentYearQuantityProducts;
    if (l$currentYearQuantityProducts != lOther$currentYearQuantityProducts) {
      return false;
    }
    final l$currentYearRetailProducts = currentYearRetailProducts;
    final lOther$currentYearRetailProducts = other.currentYearRetailProducts;
    if (l$currentYearRetailProducts != lOther$currentYearRetailProducts) {
      return false;
    }
    final l$currentYearRetailRevenue = currentYearRetailRevenue;
    final lOther$currentYearRetailRevenue = other.currentYearRetailRevenue;
    if (l$currentYearRetailRevenue != lOther$currentYearRetailRevenue) {
      return false;
    }
    final l$currentYearRevenue = currentYearRevenue;
    final lOther$currentYearRevenue = other.currentYearRevenue;
    if (l$currentYearRevenue != lOther$currentYearRevenue) {
      return false;
    }
    final l$currentYearShareCapital = currentYearShareCapital;
    final lOther$currentYearShareCapital = other.currentYearShareCapital;
    if (l$currentYearShareCapital != lOther$currentYearShareCapital) {
      return false;
    }
    final l$currentYearShareholders = currentYearShareholders;
    final lOther$currentYearShareholders = other.currentYearShareholders;
    if (l$currentYearShareholders != lOther$currentYearShareholders) {
      return false;
    }
    final l$currentYearWholesaleProducts = currentYearWholesaleProducts;
    final lOther$currentYearWholesaleProducts =
        other.currentYearWholesaleProducts;
    if (l$currentYearWholesaleProducts != lOther$currentYearWholesaleProducts) {
      return false;
    }
    final l$currentYearWholesaleRevenue = currentYearWholesaleRevenue;
    final lOther$currentYearWholesaleRevenue =
        other.currentYearWholesaleRevenue;
    if (l$currentYearWholesaleRevenue != lOther$currentYearWholesaleRevenue) {
      return false;
    }
    final l$daysPayableReceivableDifference = daysPayableReceivableDifference;
    final lOther$daysPayableReceivableDifference =
        other.daysPayableReceivableDifference;
    if (l$daysPayableReceivableDifference !=
        lOther$daysPayableReceivableDifference) {
      return false;
    }
    final l$grossNetProfitMarginDifference = grossNetProfitMarginDifference;
    final lOther$grossNetProfitMarginDifference =
        other.grossNetProfitMarginDifference;
    if (l$grossNetProfitMarginDifference !=
        lOther$grossNetProfitMarginDifference) {
      return false;
    }
    final l$institutionalLendingHistory = institutionalLendingHistory;
    final lOther$institutionalLendingHistory =
        other.institutionalLendingHistory;
    if (l$institutionalLendingHistory != lOther$institutionalLendingHistory) {
      return false;
    }
    final l$operatingMarginCurrentYear = operatingMarginCurrentYear;
    final lOther$operatingMarginCurrentYear = other.operatingMarginCurrentYear;
    if (l$operatingMarginCurrentYear != lOther$operatingMarginCurrentYear) {
      return false;
    }
    final l$previousYearAccountsPayable = previousYearAccountsPayable;
    final lOther$previousYearAccountsPayable =
        other.previousYearAccountsPayable;
    if (l$previousYearAccountsPayable != lOther$previousYearAccountsPayable) {
      return false;
    }
    final l$previousYearAccountsReceivable = previousYearAccountsReceivable;
    final lOther$previousYearAccountsReceivable =
        other.previousYearAccountsReceivable;
    if (l$previousYearAccountsReceivable !=
        lOther$previousYearAccountsReceivable) {
      return false;
    }
    final l$previousYearAssets = previousYearAssets;
    final lOther$previousYearAssets = other.previousYearAssets;
    if (l$previousYearAssets != lOther$previousYearAssets) {
      return false;
    }
    final l$previousYearClosingInventory = previousYearClosingInventory;
    final lOther$previousYearClosingInventory =
        other.previousYearClosingInventory;
    if (l$previousYearClosingInventory != lOther$previousYearClosingInventory) {
      return false;
    }
    final l$previousYearCogs = previousYearCogs;
    final lOther$previousYearCogs = other.previousYearCogs;
    if (l$previousYearCogs != lOther$previousYearCogs) {
      return false;
    }
    final l$previousYearCurrentAssets = previousYearCurrentAssets;
    final lOther$previousYearCurrentAssets = other.previousYearCurrentAssets;
    if (l$previousYearCurrentAssets != lOther$previousYearCurrentAssets) {
      return false;
    }
    final l$previousYearCurrentLiabilities = previousYearCurrentLiabilities;
    final lOther$previousYearCurrentLiabilities =
        other.previousYearCurrentLiabilities;
    if (l$previousYearCurrentLiabilities !=
        lOther$previousYearCurrentLiabilities) {
      return false;
    }
    final l$previousYearGrossProfit = previousYearGrossProfit;
    final lOther$previousYearGrossProfit = other.previousYearGrossProfit;
    if (l$previousYearGrossProfit != lOther$previousYearGrossProfit) {
      return false;
    }
    final l$previousYearInstitutionalProducts =
        previousYearInstitutionalProducts;
    final lOther$previousYearInstitutionalProducts =
        other.previousYearInstitutionalProducts;
    if (l$previousYearInstitutionalProducts !=
        lOther$previousYearInstitutionalProducts) {
      return false;
    }
    final l$previousYearInstitutionalRevenue = previousYearInstitutionalRevenue;
    final lOther$previousYearInstitutionalRevenue =
        other.previousYearInstitutionalRevenue;
    if (l$previousYearInstitutionalRevenue !=
        lOther$previousYearInstitutionalRevenue) {
      return false;
    }
    final l$previousYearLenderName = previousYearLenderName;
    final lOther$previousYearLenderName = other.previousYearLenderName;
    if (l$previousYearLenderName != lOther$previousYearLenderName) {
      return false;
    }
    final l$previousYearLiabilities = previousYearLiabilities;
    final lOther$previousYearLiabilities = other.previousYearLiabilities;
    if (l$previousYearLiabilities != lOther$previousYearLiabilities) {
      return false;
    }
    final l$previousYearLoanAmount = previousYearLoanAmount;
    final lOther$previousYearLoanAmount = other.previousYearLoanAmount;
    if (l$previousYearLoanAmount != lOther$previousYearLoanAmount) {
      return false;
    }
    final l$previousYearMatchingGrant = previousYearMatchingGrant;
    final lOther$previousYearMatchingGrant = other.previousYearMatchingGrant;
    if (l$previousYearMatchingGrant != lOther$previousYearMatchingGrant) {
      return false;
    }
    final l$previousYearNetProfit = previousYearNetProfit;
    final lOther$previousYearNetProfit = other.previousYearNetProfit;
    if (l$previousYearNetProfit != lOther$previousYearNetProfit) {
      return false;
    }
    final l$previousYearOpeningInventory = previousYearOpeningInventory;
    final lOther$previousYearOpeningInventory =
        other.previousYearOpeningInventory;
    if (l$previousYearOpeningInventory != lOther$previousYearOpeningInventory) {
      return false;
    }
    final l$previousYearProducts = previousYearProducts;
    final lOther$previousYearProducts = other.previousYearProducts;
    if (l$previousYearProducts != lOther$previousYearProducts) {
      return false;
    }
    final l$previousYearProjectGrant = previousYearProjectGrant;
    final lOther$previousYearProjectGrant = other.previousYearProjectGrant;
    if (l$previousYearProjectGrant != lOther$previousYearProjectGrant) {
      return false;
    }
    final l$previousYearQuantityProcured = previousYearQuantityProcured;
    final lOther$previousYearQuantityProcured =
        other.previousYearQuantityProcured;
    if (l$previousYearQuantityProcured != lOther$previousYearQuantityProcured) {
      return false;
    }
    final l$previousYearQuantityProducts = previousYearQuantityProducts;
    final lOther$previousYearQuantityProducts =
        other.previousYearQuantityProducts;
    if (l$previousYearQuantityProducts != lOther$previousYearQuantityProducts) {
      return false;
    }
    final l$previousYearRetailProducts = previousYearRetailProducts;
    final lOther$previousYearRetailProducts = other.previousYearRetailProducts;
    if (l$previousYearRetailProducts != lOther$previousYearRetailProducts) {
      return false;
    }
    final l$previousYearRetailRevenue = previousYearRetailRevenue;
    final lOther$previousYearRetailRevenue = other.previousYearRetailRevenue;
    if (l$previousYearRetailRevenue != lOther$previousYearRetailRevenue) {
      return false;
    }
    final l$previousYearRevenue = previousYearRevenue;
    final lOther$previousYearRevenue = other.previousYearRevenue;
    if (l$previousYearRevenue != lOther$previousYearRevenue) {
      return false;
    }
    final l$previousYearShareCapital = previousYearShareCapital;
    final lOther$previousYearShareCapital = other.previousYearShareCapital;
    if (l$previousYearShareCapital != lOther$previousYearShareCapital) {
      return false;
    }
    final l$previousYearShareholders = previousYearShareholders;
    final lOther$previousYearShareholders = other.previousYearShareholders;
    if (l$previousYearShareholders != lOther$previousYearShareholders) {
      return false;
    }
    final l$previousYearWholesaleProducts = previousYearWholesaleProducts;
    final lOther$previousYearWholesaleProducts =
        other.previousYearWholesaleProducts;
    if (l$previousYearWholesaleProducts !=
        lOther$previousYearWholesaleProducts) {
      return false;
    }
    final l$previousYearWholesaleRevenue = previousYearWholesaleRevenue;
    final lOther$previousYearWholesaleRevenue =
        other.previousYearWholesaleRevenue;
    if (l$previousYearWholesaleRevenue != lOther$previousYearWholesaleRevenue) {
      return false;
    }
    final l$targetRevenue = targetRevenue;
    final lOther$targetRevenue = other.targetRevenue;
    if (l$targetRevenue != lOther$targetRevenue) {
      return false;
    }
    final l$totalDebtToday = totalDebtToday;
    final lOther$totalDebtToday = other.totalDebtToday;
    if (l$totalDebtToday != lOther$totalDebtToday) {
      return false;
    }
    final l$twoYearsBackAccountsPayable = twoYearsBackAccountsPayable;
    final lOther$twoYearsBackAccountsPayable =
        other.twoYearsBackAccountsPayable;
    if (l$twoYearsBackAccountsPayable != lOther$twoYearsBackAccountsPayable) {
      return false;
    }
    final l$twoYearsBackAccountsReceivable = twoYearsBackAccountsReceivable;
    final lOther$twoYearsBackAccountsReceivable =
        other.twoYearsBackAccountsReceivable;
    if (l$twoYearsBackAccountsReceivable !=
        lOther$twoYearsBackAccountsReceivable) {
      return false;
    }
    final l$twoYearsBackAssets = twoYearsBackAssets;
    final lOther$twoYearsBackAssets = other.twoYearsBackAssets;
    if (l$twoYearsBackAssets != lOther$twoYearsBackAssets) {
      return false;
    }
    final l$twoYearsBackClosingInventory = twoYearsBackClosingInventory;
    final lOther$twoYearsBackClosingInventory =
        other.twoYearsBackClosingInventory;
    if (l$twoYearsBackClosingInventory != lOther$twoYearsBackClosingInventory) {
      return false;
    }
    final l$twoYearsBackCogs = twoYearsBackCogs;
    final lOther$twoYearsBackCogs = other.twoYearsBackCogs;
    if (l$twoYearsBackCogs != lOther$twoYearsBackCogs) {
      return false;
    }
    final l$twoYearsBackCurrentAssets = twoYearsBackCurrentAssets;
    final lOther$twoYearsBackCurrentAssets = other.twoYearsBackCurrentAssets;
    if (l$twoYearsBackCurrentAssets != lOther$twoYearsBackCurrentAssets) {
      return false;
    }
    final l$twoYearsBackCurrentLiabilities = twoYearsBackCurrentLiabilities;
    final lOther$twoYearsBackCurrentLiabilities =
        other.twoYearsBackCurrentLiabilities;
    if (l$twoYearsBackCurrentLiabilities !=
        lOther$twoYearsBackCurrentLiabilities) {
      return false;
    }
    final l$twoYearsBackGrossProfit = twoYearsBackGrossProfit;
    final lOther$twoYearsBackGrossProfit = other.twoYearsBackGrossProfit;
    if (l$twoYearsBackGrossProfit != lOther$twoYearsBackGrossProfit) {
      return false;
    }
    final l$twoYearsBackInstitutionalProducts =
        twoYearsBackInstitutionalProducts;
    final lOther$twoYearsBackInstitutionalProducts =
        other.twoYearsBackInstitutionalProducts;
    if (l$twoYearsBackInstitutionalProducts !=
        lOther$twoYearsBackInstitutionalProducts) {
      return false;
    }
    final l$twoYearsBackInstitutionalRevenue = twoYearsBackInstitutionalRevenue;
    final lOther$twoYearsBackInstitutionalRevenue =
        other.twoYearsBackInstitutionalRevenue;
    if (l$twoYearsBackInstitutionalRevenue !=
        lOther$twoYearsBackInstitutionalRevenue) {
      return false;
    }
    final l$twoYearsBackLenderName = twoYearsBackLenderName;
    final lOther$twoYearsBackLenderName = other.twoYearsBackLenderName;
    if (l$twoYearsBackLenderName != lOther$twoYearsBackLenderName) {
      return false;
    }
    final l$twoYearsBackLiabilities = twoYearsBackLiabilities;
    final lOther$twoYearsBackLiabilities = other.twoYearsBackLiabilities;
    if (l$twoYearsBackLiabilities != lOther$twoYearsBackLiabilities) {
      return false;
    }
    final l$twoYearsBackLoanAmount = twoYearsBackLoanAmount;
    final lOther$twoYearsBackLoanAmount = other.twoYearsBackLoanAmount;
    if (l$twoYearsBackLoanAmount != lOther$twoYearsBackLoanAmount) {
      return false;
    }
    final l$twoYearsBackMatchingGrant = twoYearsBackMatchingGrant;
    final lOther$twoYearsBackMatchingGrant = other.twoYearsBackMatchingGrant;
    if (l$twoYearsBackMatchingGrant != lOther$twoYearsBackMatchingGrant) {
      return false;
    }
    final l$twoYearsBackNetProfit = twoYearsBackNetProfit;
    final lOther$twoYearsBackNetProfit = other.twoYearsBackNetProfit;
    if (l$twoYearsBackNetProfit != lOther$twoYearsBackNetProfit) {
      return false;
    }
    final l$twoYearsBackOpeningInventory = twoYearsBackOpeningInventory;
    final lOther$twoYearsBackOpeningInventory =
        other.twoYearsBackOpeningInventory;
    if (l$twoYearsBackOpeningInventory != lOther$twoYearsBackOpeningInventory) {
      return false;
    }
    final l$twoYearsBackProducts = twoYearsBackProducts;
    final lOther$twoYearsBackProducts = other.twoYearsBackProducts;
    if (l$twoYearsBackProducts != lOther$twoYearsBackProducts) {
      return false;
    }
    final l$twoYearsBackProjectGrant = twoYearsBackProjectGrant;
    final lOther$twoYearsBackProjectGrant = other.twoYearsBackProjectGrant;
    if (l$twoYearsBackProjectGrant != lOther$twoYearsBackProjectGrant) {
      return false;
    }
    final l$twoYearsBackQuantityProcured = twoYearsBackQuantityProcured;
    final lOther$twoYearsBackQuantityProcured =
        other.twoYearsBackQuantityProcured;
    if (l$twoYearsBackQuantityProcured != lOther$twoYearsBackQuantityProcured) {
      return false;
    }
    final l$twoYearsBackQuantityProducts = twoYearsBackQuantityProducts;
    final lOther$twoYearsBackQuantityProducts =
        other.twoYearsBackQuantityProducts;
    if (l$twoYearsBackQuantityProducts != lOther$twoYearsBackQuantityProducts) {
      return false;
    }
    final l$twoYearsBackRetailProducts = twoYearsBackRetailProducts;
    final lOther$twoYearsBackRetailProducts = other.twoYearsBackRetailProducts;
    if (l$twoYearsBackRetailProducts != lOther$twoYearsBackRetailProducts) {
      return false;
    }
    final l$twoYearsBackRetailRevenue = twoYearsBackRetailRevenue;
    final lOther$twoYearsBackRetailRevenue = other.twoYearsBackRetailRevenue;
    if (l$twoYearsBackRetailRevenue != lOther$twoYearsBackRetailRevenue) {
      return false;
    }
    final l$twoYearsBackRevenue = twoYearsBackRevenue;
    final lOther$twoYearsBackRevenue = other.twoYearsBackRevenue;
    if (l$twoYearsBackRevenue != lOther$twoYearsBackRevenue) {
      return false;
    }
    final l$twoYearsBackShareCapital = twoYearsBackShareCapital;
    final lOther$twoYearsBackShareCapital = other.twoYearsBackShareCapital;
    if (l$twoYearsBackShareCapital != lOther$twoYearsBackShareCapital) {
      return false;
    }
    final l$twoYearsBackShareholders = twoYearsBackShareholders;
    final lOther$twoYearsBackShareholders = other.twoYearsBackShareholders;
    if (l$twoYearsBackShareholders != lOther$twoYearsBackShareholders) {
      return false;
    }
    final l$twoYearsBackWholesaleProducts = twoYearsBackWholesaleProducts;
    final lOther$twoYearsBackWholesaleProducts =
        other.twoYearsBackWholesaleProducts;
    if (l$twoYearsBackWholesaleProducts !=
        lOther$twoYearsBackWholesaleProducts) {
      return false;
    }
    final l$twoYearsBackWholesaleRevenue = twoYearsBackWholesaleRevenue;
    final lOther$twoYearsBackWholesaleRevenue =
        other.twoYearsBackWholesaleRevenue;
    if (l$twoYearsBackWholesaleRevenue != lOther$twoYearsBackWholesaleRevenue) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSubmission$getSubmission$financialDetails
    on Query$GetSubmission$getSubmission$financialDetails {
  CopyWith$Query$GetSubmission$getSubmission$financialDetails<
          Query$GetSubmission$getSubmission$financialDetails>
      get copyWith =>
          CopyWith$Query$GetSubmission$getSubmission$financialDetails(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSubmission$getSubmission$financialDetails<
    TRes> {
  factory CopyWith$Query$GetSubmission$getSubmission$financialDetails(
    Query$GetSubmission$getSubmission$financialDetails instance,
    TRes Function(Query$GetSubmission$getSubmission$financialDetails) then,
  ) = _CopyWithImpl$Query$GetSubmission$getSubmission$financialDetails;

  factory CopyWith$Query$GetSubmission$getSubmission$financialDetails.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetSubmission$getSubmission$financialDetails;

  TRes call({
    String? id,
    String? cashChequePercentage,
    String? createdAt,
    String? creditDefaultAmount,
    String? creditDefaultLender,
    String? creditDefaultYear,
    String? currentYearAccountsPayable,
    String? currentYearAccountsReceivable,
    String? currentYearAssets,
    String? loanDetails,
    String? currentYearClosingInventory,
    String? currentYearCogs,
    String? currentYearCurrentAssets,
    String? currentYearCurrentLiabilities,
    String? currentYearGrossProfit,
    String? currentYearInstitutionalProducts,
    String? currentYearInstitutionalRevenue,
    String? currentYearLenderName,
    String? currentYearLiabilities,
    String? currentYearLoanAmount,
    String? currentYearMatchingGrant,
    String? currentYearNetProfit,
    String? currentYearOpeningInventory,
    String? currentYearProducts,
    String? currentYearProjectGrant,
    String? currentYearQuantityProcured,
    String? currentYearQuantityProducts,
    String? currentYearRetailProducts,
    String? currentYearRetailRevenue,
    String? currentYearRevenue,
    String? currentYearShareCapital,
    int? currentYearShareholders,
    String? currentYearWholesaleProducts,
    String? currentYearWholesaleRevenue,
    int? daysPayableReceivableDifference,
    String? grossNetProfitMarginDifference,
    String? institutionalLendingHistory,
    String? operatingMarginCurrentYear,
    String? previousYearAccountsPayable,
    String? previousYearAccountsReceivable,
    String? previousYearAssets,
    String? previousYearClosingInventory,
    String? previousYearCogs,
    String? previousYearCurrentAssets,
    String? previousYearCurrentLiabilities,
    String? previousYearGrossProfit,
    String? previousYearInstitutionalProducts,
    String? previousYearInstitutionalRevenue,
    String? previousYearLenderName,
    String? previousYearLiabilities,
    String? previousYearLoanAmount,
    String? previousYearMatchingGrant,
    String? previousYearNetProfit,
    String? previousYearOpeningInventory,
    String? previousYearProducts,
    String? previousYearProjectGrant,
    String? previousYearQuantityProcured,
    String? previousYearQuantityProducts,
    String? previousYearRetailProducts,
    String? previousYearRetailRevenue,
    String? previousYearRevenue,
    String? previousYearShareCapital,
    int? previousYearShareholders,
    String? previousYearWholesaleProducts,
    String? previousYearWholesaleRevenue,
    String? targetRevenue,
    String? totalDebtToday,
    String? twoYearsBackAccountsPayable,
    String? twoYearsBackAccountsReceivable,
    String? twoYearsBackAssets,
    String? twoYearsBackClosingInventory,
    String? twoYearsBackCogs,
    String? twoYearsBackCurrentAssets,
    String? twoYearsBackCurrentLiabilities,
    String? twoYearsBackGrossProfit,
    String? twoYearsBackInstitutionalProducts,
    String? twoYearsBackInstitutionalRevenue,
    String? twoYearsBackLenderName,
    String? twoYearsBackLiabilities,
    String? twoYearsBackLoanAmount,
    String? twoYearsBackMatchingGrant,
    String? twoYearsBackNetProfit,
    String? twoYearsBackOpeningInventory,
    String? twoYearsBackProducts,
    String? twoYearsBackProjectGrant,
    String? twoYearsBackQuantityProcured,
    String? twoYearsBackQuantityProducts,
    String? twoYearsBackRetailProducts,
    String? twoYearsBackRetailRevenue,
    String? twoYearsBackRevenue,
    String? twoYearsBackShareCapital,
    int? twoYearsBackShareholders,
    String? twoYearsBackWholesaleProducts,
    String? twoYearsBackWholesaleRevenue,
    String? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetSubmission$getSubmission$financialDetails<TRes>
    implements
        CopyWith$Query$GetSubmission$getSubmission$financialDetails<TRes> {
  _CopyWithImpl$Query$GetSubmission$getSubmission$financialDetails(
    this._instance,
    this._then,
  );

  final Query$GetSubmission$getSubmission$financialDetails _instance;

  final TRes Function(Query$GetSubmission$getSubmission$financialDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? cashChequePercentage = _undefined,
    Object? createdAt = _undefined,
    Object? creditDefaultAmount = _undefined,
    Object? creditDefaultLender = _undefined,
    Object? creditDefaultYear = _undefined,
    Object? currentYearAccountsPayable = _undefined,
    Object? currentYearAccountsReceivable = _undefined,
    Object? currentYearAssets = _undefined,
    Object? loanDetails = _undefined,
    Object? currentYearClosingInventory = _undefined,
    Object? currentYearCogs = _undefined,
    Object? currentYearCurrentAssets = _undefined,
    Object? currentYearCurrentLiabilities = _undefined,
    Object? currentYearGrossProfit = _undefined,
    Object? currentYearInstitutionalProducts = _undefined,
    Object? currentYearInstitutionalRevenue = _undefined,
    Object? currentYearLenderName = _undefined,
    Object? currentYearLiabilities = _undefined,
    Object? currentYearLoanAmount = _undefined,
    Object? currentYearMatchingGrant = _undefined,
    Object? currentYearNetProfit = _undefined,
    Object? currentYearOpeningInventory = _undefined,
    Object? currentYearProducts = _undefined,
    Object? currentYearProjectGrant = _undefined,
    Object? currentYearQuantityProcured = _undefined,
    Object? currentYearQuantityProducts = _undefined,
    Object? currentYearRetailProducts = _undefined,
    Object? currentYearRetailRevenue = _undefined,
    Object? currentYearRevenue = _undefined,
    Object? currentYearShareCapital = _undefined,
    Object? currentYearShareholders = _undefined,
    Object? currentYearWholesaleProducts = _undefined,
    Object? currentYearWholesaleRevenue = _undefined,
    Object? daysPayableReceivableDifference = _undefined,
    Object? grossNetProfitMarginDifference = _undefined,
    Object? institutionalLendingHistory = _undefined,
    Object? operatingMarginCurrentYear = _undefined,
    Object? previousYearAccountsPayable = _undefined,
    Object? previousYearAccountsReceivable = _undefined,
    Object? previousYearAssets = _undefined,
    Object? previousYearClosingInventory = _undefined,
    Object? previousYearCogs = _undefined,
    Object? previousYearCurrentAssets = _undefined,
    Object? previousYearCurrentLiabilities = _undefined,
    Object? previousYearGrossProfit = _undefined,
    Object? previousYearInstitutionalProducts = _undefined,
    Object? previousYearInstitutionalRevenue = _undefined,
    Object? previousYearLenderName = _undefined,
    Object? previousYearLiabilities = _undefined,
    Object? previousYearLoanAmount = _undefined,
    Object? previousYearMatchingGrant = _undefined,
    Object? previousYearNetProfit = _undefined,
    Object? previousYearOpeningInventory = _undefined,
    Object? previousYearProducts = _undefined,
    Object? previousYearProjectGrant = _undefined,
    Object? previousYearQuantityProcured = _undefined,
    Object? previousYearQuantityProducts = _undefined,
    Object? previousYearRetailProducts = _undefined,
    Object? previousYearRetailRevenue = _undefined,
    Object? previousYearRevenue = _undefined,
    Object? previousYearShareCapital = _undefined,
    Object? previousYearShareholders = _undefined,
    Object? previousYearWholesaleProducts = _undefined,
    Object? previousYearWholesaleRevenue = _undefined,
    Object? targetRevenue = _undefined,
    Object? totalDebtToday = _undefined,
    Object? twoYearsBackAccountsPayable = _undefined,
    Object? twoYearsBackAccountsReceivable = _undefined,
    Object? twoYearsBackAssets = _undefined,
    Object? twoYearsBackClosingInventory = _undefined,
    Object? twoYearsBackCogs = _undefined,
    Object? twoYearsBackCurrentAssets = _undefined,
    Object? twoYearsBackCurrentLiabilities = _undefined,
    Object? twoYearsBackGrossProfit = _undefined,
    Object? twoYearsBackInstitutionalProducts = _undefined,
    Object? twoYearsBackInstitutionalRevenue = _undefined,
    Object? twoYearsBackLenderName = _undefined,
    Object? twoYearsBackLiabilities = _undefined,
    Object? twoYearsBackLoanAmount = _undefined,
    Object? twoYearsBackMatchingGrant = _undefined,
    Object? twoYearsBackNetProfit = _undefined,
    Object? twoYearsBackOpeningInventory = _undefined,
    Object? twoYearsBackProducts = _undefined,
    Object? twoYearsBackProjectGrant = _undefined,
    Object? twoYearsBackQuantityProcured = _undefined,
    Object? twoYearsBackQuantityProducts = _undefined,
    Object? twoYearsBackRetailProducts = _undefined,
    Object? twoYearsBackRetailRevenue = _undefined,
    Object? twoYearsBackRevenue = _undefined,
    Object? twoYearsBackShareCapital = _undefined,
    Object? twoYearsBackShareholders = _undefined,
    Object? twoYearsBackWholesaleProducts = _undefined,
    Object? twoYearsBackWholesaleRevenue = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSubmission$getSubmission$financialDetails(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        cashChequePercentage:
            cashChequePercentage == _undefined || cashChequePercentage == null
                ? _instance.cashChequePercentage
                : (cashChequePercentage as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        creditDefaultAmount: creditDefaultAmount == _undefined
            ? _instance.creditDefaultAmount
            : (creditDefaultAmount as String?),
        creditDefaultLender: creditDefaultLender == _undefined
            ? _instance.creditDefaultLender
            : (creditDefaultLender as String?),
        creditDefaultYear: creditDefaultYear == _undefined
            ? _instance.creditDefaultYear
            : (creditDefaultYear as String?),
        currentYearAccountsPayable: currentYearAccountsPayable == _undefined ||
                currentYearAccountsPayable == null
            ? _instance.currentYearAccountsPayable
            : (currentYearAccountsPayable as String),
        currentYearAccountsReceivable:
            currentYearAccountsReceivable == _undefined ||
                    currentYearAccountsReceivable == null
                ? _instance.currentYearAccountsReceivable
                : (currentYearAccountsReceivable as String),
        currentYearAssets:
            currentYearAssets == _undefined || currentYearAssets == null
                ? _instance.currentYearAssets
                : (currentYearAssets as String),
        loanDetails: loanDetails == _undefined || loanDetails == null
            ? _instance.loanDetails
            : (loanDetails as String),
        currentYearClosingInventory:
            currentYearClosingInventory == _undefined ||
                    currentYearClosingInventory == null
                ? _instance.currentYearClosingInventory
                : (currentYearClosingInventory as String),
        currentYearCogs:
            currentYearCogs == _undefined || currentYearCogs == null
                ? _instance.currentYearCogs
                : (currentYearCogs as String),
        currentYearCurrentAssets: currentYearCurrentAssets == _undefined ||
                currentYearCurrentAssets == null
            ? _instance.currentYearCurrentAssets
            : (currentYearCurrentAssets as String),
        currentYearCurrentLiabilities:
            currentYearCurrentLiabilities == _undefined ||
                    currentYearCurrentLiabilities == null
                ? _instance.currentYearCurrentLiabilities
                : (currentYearCurrentLiabilities as String),
        currentYearGrossProfit: currentYearGrossProfit == _undefined ||
                currentYearGrossProfit == null
            ? _instance.currentYearGrossProfit
            : (currentYearGrossProfit as String),
        currentYearInstitutionalProducts:
            currentYearInstitutionalProducts == _undefined
                ? _instance.currentYearInstitutionalProducts
                : (currentYearInstitutionalProducts as String?),
        currentYearInstitutionalRevenue:
            currentYearInstitutionalRevenue == _undefined ||
                    currentYearInstitutionalRevenue == null
                ? _instance.currentYearInstitutionalRevenue
                : (currentYearInstitutionalRevenue as String),
        currentYearLenderName: currentYearLenderName == _undefined
            ? _instance.currentYearLenderName
            : (currentYearLenderName as String?),
        currentYearLiabilities: currentYearLiabilities == _undefined ||
                currentYearLiabilities == null
            ? _instance.currentYearLiabilities
            : (currentYearLiabilities as String),
        currentYearLoanAmount: currentYearLoanAmount == _undefined
            ? _instance.currentYearLoanAmount
            : (currentYearLoanAmount as String?),
        currentYearMatchingGrant: currentYearMatchingGrant == _undefined
            ? _instance.currentYearMatchingGrant
            : (currentYearMatchingGrant as String?),
        currentYearNetProfit:
            currentYearNetProfit == _undefined || currentYearNetProfit == null
                ? _instance.currentYearNetProfit
                : (currentYearNetProfit as String),
        currentYearOpeningInventory:
            currentYearOpeningInventory == _undefined ||
                    currentYearOpeningInventory == null
                ? _instance.currentYearOpeningInventory
                : (currentYearOpeningInventory as String),
        currentYearProducts: currentYearProducts == _undefined
            ? _instance.currentYearProducts
            : (currentYearProducts as String?),
        currentYearProjectGrant: currentYearProjectGrant == _undefined
            ? _instance.currentYearProjectGrant
            : (currentYearProjectGrant as String?),
        currentYearQuantityProcured:
            currentYearQuantityProcured == _undefined ||
                    currentYearQuantityProcured == null
                ? _instance.currentYearQuantityProcured
                : (currentYearQuantityProcured as String),
        currentYearQuantityProducts: currentYearQuantityProducts == _undefined
            ? _instance.currentYearQuantityProducts
            : (currentYearQuantityProducts as String?),
        currentYearRetailProducts: currentYearRetailProducts == _undefined
            ? _instance.currentYearRetailProducts
            : (currentYearRetailProducts as String?),
        currentYearRetailRevenue: currentYearRetailRevenue == _undefined ||
                currentYearRetailRevenue == null
            ? _instance.currentYearRetailRevenue
            : (currentYearRetailRevenue as String),
        currentYearRevenue:
            currentYearRevenue == _undefined || currentYearRevenue == null
                ? _instance.currentYearRevenue
                : (currentYearRevenue as String),
        currentYearShareCapital: currentYearShareCapital == _undefined ||
                currentYearShareCapital == null
            ? _instance.currentYearShareCapital
            : (currentYearShareCapital as String),
        currentYearShareholders: currentYearShareholders == _undefined ||
                currentYearShareholders == null
            ? _instance.currentYearShareholders
            : (currentYearShareholders as int),
        currentYearWholesaleProducts: currentYearWholesaleProducts == _undefined
            ? _instance.currentYearWholesaleProducts
            : (currentYearWholesaleProducts as String?),
        currentYearWholesaleRevenue:
            currentYearWholesaleRevenue == _undefined ||
                    currentYearWholesaleRevenue == null
                ? _instance.currentYearWholesaleRevenue
                : (currentYearWholesaleRevenue as String),
        daysPayableReceivableDifference:
            daysPayableReceivableDifference == _undefined ||
                    daysPayableReceivableDifference == null
                ? _instance.daysPayableReceivableDifference
                : (daysPayableReceivableDifference as int),
        grossNetProfitMarginDifference:
            grossNetProfitMarginDifference == _undefined ||
                    grossNetProfitMarginDifference == null
                ? _instance.grossNetProfitMarginDifference
                : (grossNetProfitMarginDifference as String),
        institutionalLendingHistory: institutionalLendingHistory == _undefined
            ? _instance.institutionalLendingHistory
            : (institutionalLendingHistory as String?),
        operatingMarginCurrentYear: operatingMarginCurrentYear == _undefined ||
                operatingMarginCurrentYear == null
            ? _instance.operatingMarginCurrentYear
            : (operatingMarginCurrentYear as String),
        previousYearAccountsPayable:
            previousYearAccountsPayable == _undefined ||
                    previousYearAccountsPayable == null
                ? _instance.previousYearAccountsPayable
                : (previousYearAccountsPayable as String),
        previousYearAccountsReceivable:
            previousYearAccountsReceivable == _undefined ||
                    previousYearAccountsReceivable == null
                ? _instance.previousYearAccountsReceivable
                : (previousYearAccountsReceivable as String),
        previousYearAssets:
            previousYearAssets == _undefined || previousYearAssets == null
                ? _instance.previousYearAssets
                : (previousYearAssets as String),
        previousYearClosingInventory:
            previousYearClosingInventory == _undefined ||
                    previousYearClosingInventory == null
                ? _instance.previousYearClosingInventory
                : (previousYearClosingInventory as String),
        previousYearCogs:
            previousYearCogs == _undefined || previousYearCogs == null
                ? _instance.previousYearCogs
                : (previousYearCogs as String),
        previousYearCurrentAssets: previousYearCurrentAssets == _undefined ||
                previousYearCurrentAssets == null
            ? _instance.previousYearCurrentAssets
            : (previousYearCurrentAssets as String),
        previousYearCurrentLiabilities:
            previousYearCurrentLiabilities == _undefined ||
                    previousYearCurrentLiabilities == null
                ? _instance.previousYearCurrentLiabilities
                : (previousYearCurrentLiabilities as String),
        previousYearGrossProfit: previousYearGrossProfit == _undefined ||
                previousYearGrossProfit == null
            ? _instance.previousYearGrossProfit
            : (previousYearGrossProfit as String),
        previousYearInstitutionalProducts:
            previousYearInstitutionalProducts == _undefined
                ? _instance.previousYearInstitutionalProducts
                : (previousYearInstitutionalProducts as String?),
        previousYearInstitutionalRevenue:
            previousYearInstitutionalRevenue == _undefined ||
                    previousYearInstitutionalRevenue == null
                ? _instance.previousYearInstitutionalRevenue
                : (previousYearInstitutionalRevenue as String),
        previousYearLenderName: previousYearLenderName == _undefined
            ? _instance.previousYearLenderName
            : (previousYearLenderName as String?),
        previousYearLiabilities: previousYearLiabilities == _undefined ||
                previousYearLiabilities == null
            ? _instance.previousYearLiabilities
            : (previousYearLiabilities as String),
        previousYearLoanAmount: previousYearLoanAmount == _undefined
            ? _instance.previousYearLoanAmount
            : (previousYearLoanAmount as String?),
        previousYearMatchingGrant: previousYearMatchingGrant == _undefined
            ? _instance.previousYearMatchingGrant
            : (previousYearMatchingGrant as String?),
        previousYearNetProfit:
            previousYearNetProfit == _undefined || previousYearNetProfit == null
                ? _instance.previousYearNetProfit
                : (previousYearNetProfit as String),
        previousYearOpeningInventory:
            previousYearOpeningInventory == _undefined ||
                    previousYearOpeningInventory == null
                ? _instance.previousYearOpeningInventory
                : (previousYearOpeningInventory as String),
        previousYearProducts: previousYearProducts == _undefined
            ? _instance.previousYearProducts
            : (previousYearProducts as String?),
        previousYearProjectGrant: previousYearProjectGrant == _undefined
            ? _instance.previousYearProjectGrant
            : (previousYearProjectGrant as String?),
        previousYearQuantityProcured:
            previousYearQuantityProcured == _undefined ||
                    previousYearQuantityProcured == null
                ? _instance.previousYearQuantityProcured
                : (previousYearQuantityProcured as String),
        previousYearQuantityProducts: previousYearQuantityProducts == _undefined
            ? _instance.previousYearQuantityProducts
            : (previousYearQuantityProducts as String?),
        previousYearRetailProducts: previousYearRetailProducts == _undefined
            ? _instance.previousYearRetailProducts
            : (previousYearRetailProducts as String?),
        previousYearRetailRevenue: previousYearRetailRevenue == _undefined ||
                previousYearRetailRevenue == null
            ? _instance.previousYearRetailRevenue
            : (previousYearRetailRevenue as String),
        previousYearRevenue:
            previousYearRevenue == _undefined || previousYearRevenue == null
                ? _instance.previousYearRevenue
                : (previousYearRevenue as String),
        previousYearShareCapital: previousYearShareCapital == _undefined ||
                previousYearShareCapital == null
            ? _instance.previousYearShareCapital
            : (previousYearShareCapital as String),
        previousYearShareholders: previousYearShareholders == _undefined ||
                previousYearShareholders == null
            ? _instance.previousYearShareholders
            : (previousYearShareholders as int),
        previousYearWholesaleProducts:
            previousYearWholesaleProducts == _undefined
                ? _instance.previousYearWholesaleProducts
                : (previousYearWholesaleProducts as String?),
        previousYearWholesaleRevenue:
            previousYearWholesaleRevenue == _undefined ||
                    previousYearWholesaleRevenue == null
                ? _instance.previousYearWholesaleRevenue
                : (previousYearWholesaleRevenue as String),
        targetRevenue: targetRevenue == _undefined
            ? _instance.targetRevenue
            : (targetRevenue as String?),
        totalDebtToday: totalDebtToday == _undefined || totalDebtToday == null
            ? _instance.totalDebtToday
            : (totalDebtToday as String),
        twoYearsBackAccountsPayable:
            twoYearsBackAccountsPayable == _undefined ||
                    twoYearsBackAccountsPayable == null
                ? _instance.twoYearsBackAccountsPayable
                : (twoYearsBackAccountsPayable as String),
        twoYearsBackAccountsReceivable:
            twoYearsBackAccountsReceivable == _undefined ||
                    twoYearsBackAccountsReceivable == null
                ? _instance.twoYearsBackAccountsReceivable
                : (twoYearsBackAccountsReceivable as String),
        twoYearsBackAssets:
            twoYearsBackAssets == _undefined || twoYearsBackAssets == null
                ? _instance.twoYearsBackAssets
                : (twoYearsBackAssets as String),
        twoYearsBackClosingInventory:
            twoYearsBackClosingInventory == _undefined ||
                    twoYearsBackClosingInventory == null
                ? _instance.twoYearsBackClosingInventory
                : (twoYearsBackClosingInventory as String),
        twoYearsBackCogs:
            twoYearsBackCogs == _undefined || twoYearsBackCogs == null
                ? _instance.twoYearsBackCogs
                : (twoYearsBackCogs as String),
        twoYearsBackCurrentAssets: twoYearsBackCurrentAssets == _undefined ||
                twoYearsBackCurrentAssets == null
            ? _instance.twoYearsBackCurrentAssets
            : (twoYearsBackCurrentAssets as String),
        twoYearsBackCurrentLiabilities:
            twoYearsBackCurrentLiabilities == _undefined ||
                    twoYearsBackCurrentLiabilities == null
                ? _instance.twoYearsBackCurrentLiabilities
                : (twoYearsBackCurrentLiabilities as String),
        twoYearsBackGrossProfit: twoYearsBackGrossProfit == _undefined ||
                twoYearsBackGrossProfit == null
            ? _instance.twoYearsBackGrossProfit
            : (twoYearsBackGrossProfit as String),
        twoYearsBackInstitutionalProducts:
            twoYearsBackInstitutionalProducts == _undefined
                ? _instance.twoYearsBackInstitutionalProducts
                : (twoYearsBackInstitutionalProducts as String?),
        twoYearsBackInstitutionalRevenue:
            twoYearsBackInstitutionalRevenue == _undefined ||
                    twoYearsBackInstitutionalRevenue == null
                ? _instance.twoYearsBackInstitutionalRevenue
                : (twoYearsBackInstitutionalRevenue as String),
        twoYearsBackLenderName: twoYearsBackLenderName == _undefined
            ? _instance.twoYearsBackLenderName
            : (twoYearsBackLenderName as String?),
        twoYearsBackLiabilities: twoYearsBackLiabilities == _undefined ||
                twoYearsBackLiabilities == null
            ? _instance.twoYearsBackLiabilities
            : (twoYearsBackLiabilities as String),
        twoYearsBackLoanAmount: twoYearsBackLoanAmount == _undefined
            ? _instance.twoYearsBackLoanAmount
            : (twoYearsBackLoanAmount as String?),
        twoYearsBackMatchingGrant: twoYearsBackMatchingGrant == _undefined
            ? _instance.twoYearsBackMatchingGrant
            : (twoYearsBackMatchingGrant as String?),
        twoYearsBackNetProfit:
            twoYearsBackNetProfit == _undefined || twoYearsBackNetProfit == null
                ? _instance.twoYearsBackNetProfit
                : (twoYearsBackNetProfit as String),
        twoYearsBackOpeningInventory:
            twoYearsBackOpeningInventory == _undefined ||
                    twoYearsBackOpeningInventory == null
                ? _instance.twoYearsBackOpeningInventory
                : (twoYearsBackOpeningInventory as String),
        twoYearsBackProducts: twoYearsBackProducts == _undefined
            ? _instance.twoYearsBackProducts
            : (twoYearsBackProducts as String?),
        twoYearsBackProjectGrant: twoYearsBackProjectGrant == _undefined
            ? _instance.twoYearsBackProjectGrant
            : (twoYearsBackProjectGrant as String?),
        twoYearsBackQuantityProcured:
            twoYearsBackQuantityProcured == _undefined ||
                    twoYearsBackQuantityProcured == null
                ? _instance.twoYearsBackQuantityProcured
                : (twoYearsBackQuantityProcured as String),
        twoYearsBackQuantityProducts: twoYearsBackQuantityProducts == _undefined
            ? _instance.twoYearsBackQuantityProducts
            : (twoYearsBackQuantityProducts as String?),
        twoYearsBackRetailProducts: twoYearsBackRetailProducts == _undefined
            ? _instance.twoYearsBackRetailProducts
            : (twoYearsBackRetailProducts as String?),
        twoYearsBackRetailRevenue: twoYearsBackRetailRevenue == _undefined ||
                twoYearsBackRetailRevenue == null
            ? _instance.twoYearsBackRetailRevenue
            : (twoYearsBackRetailRevenue as String),
        twoYearsBackRevenue:
            twoYearsBackRevenue == _undefined || twoYearsBackRevenue == null
                ? _instance.twoYearsBackRevenue
                : (twoYearsBackRevenue as String),
        twoYearsBackShareCapital: twoYearsBackShareCapital == _undefined ||
                twoYearsBackShareCapital == null
            ? _instance.twoYearsBackShareCapital
            : (twoYearsBackShareCapital as String),
        twoYearsBackShareholders: twoYearsBackShareholders == _undefined ||
                twoYearsBackShareholders == null
            ? _instance.twoYearsBackShareholders
            : (twoYearsBackShareholders as int),
        twoYearsBackWholesaleProducts:
            twoYearsBackWholesaleProducts == _undefined
                ? _instance.twoYearsBackWholesaleProducts
                : (twoYearsBackWholesaleProducts as String?),
        twoYearsBackWholesaleRevenue:
            twoYearsBackWholesaleRevenue == _undefined ||
                    twoYearsBackWholesaleRevenue == null
                ? _instance.twoYearsBackWholesaleRevenue
                : (twoYearsBackWholesaleRevenue as String),
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetSubmission$getSubmission$financialDetails<TRes>
    implements
        CopyWith$Query$GetSubmission$getSubmission$financialDetails<TRes> {
  _CopyWithStubImpl$Query$GetSubmission$getSubmission$financialDetails(
      this._res);

  TRes _res;

  call({
    String? id,
    String? cashChequePercentage,
    String? createdAt,
    String? creditDefaultAmount,
    String? creditDefaultLender,
    String? creditDefaultYear,
    String? currentYearAccountsPayable,
    String? currentYearAccountsReceivable,
    String? currentYearAssets,
    String? loanDetails,
    String? currentYearClosingInventory,
    String? currentYearCogs,
    String? currentYearCurrentAssets,
    String? currentYearCurrentLiabilities,
    String? currentYearGrossProfit,
    String? currentYearInstitutionalProducts,
    String? currentYearInstitutionalRevenue,
    String? currentYearLenderName,
    String? currentYearLiabilities,
    String? currentYearLoanAmount,
    String? currentYearMatchingGrant,
    String? currentYearNetProfit,
    String? currentYearOpeningInventory,
    String? currentYearProducts,
    String? currentYearProjectGrant,
    String? currentYearQuantityProcured,
    String? currentYearQuantityProducts,
    String? currentYearRetailProducts,
    String? currentYearRetailRevenue,
    String? currentYearRevenue,
    String? currentYearShareCapital,
    int? currentYearShareholders,
    String? currentYearWholesaleProducts,
    String? currentYearWholesaleRevenue,
    int? daysPayableReceivableDifference,
    String? grossNetProfitMarginDifference,
    String? institutionalLendingHistory,
    String? operatingMarginCurrentYear,
    String? previousYearAccountsPayable,
    String? previousYearAccountsReceivable,
    String? previousYearAssets,
    String? previousYearClosingInventory,
    String? previousYearCogs,
    String? previousYearCurrentAssets,
    String? previousYearCurrentLiabilities,
    String? previousYearGrossProfit,
    String? previousYearInstitutionalProducts,
    String? previousYearInstitutionalRevenue,
    String? previousYearLenderName,
    String? previousYearLiabilities,
    String? previousYearLoanAmount,
    String? previousYearMatchingGrant,
    String? previousYearNetProfit,
    String? previousYearOpeningInventory,
    String? previousYearProducts,
    String? previousYearProjectGrant,
    String? previousYearQuantityProcured,
    String? previousYearQuantityProducts,
    String? previousYearRetailProducts,
    String? previousYearRetailRevenue,
    String? previousYearRevenue,
    String? previousYearShareCapital,
    int? previousYearShareholders,
    String? previousYearWholesaleProducts,
    String? previousYearWholesaleRevenue,
    String? targetRevenue,
    String? totalDebtToday,
    String? twoYearsBackAccountsPayable,
    String? twoYearsBackAccountsReceivable,
    String? twoYearsBackAssets,
    String? twoYearsBackClosingInventory,
    String? twoYearsBackCogs,
    String? twoYearsBackCurrentAssets,
    String? twoYearsBackCurrentLiabilities,
    String? twoYearsBackGrossProfit,
    String? twoYearsBackInstitutionalProducts,
    String? twoYearsBackInstitutionalRevenue,
    String? twoYearsBackLenderName,
    String? twoYearsBackLiabilities,
    String? twoYearsBackLoanAmount,
    String? twoYearsBackMatchingGrant,
    String? twoYearsBackNetProfit,
    String? twoYearsBackOpeningInventory,
    String? twoYearsBackProducts,
    String? twoYearsBackProjectGrant,
    String? twoYearsBackQuantityProcured,
    String? twoYearsBackQuantityProducts,
    String? twoYearsBackRetailProducts,
    String? twoYearsBackRetailRevenue,
    String? twoYearsBackRevenue,
    String? twoYearsBackShareCapital,
    int? twoYearsBackShareholders,
    String? twoYearsBackWholesaleProducts,
    String? twoYearsBackWholesaleRevenue,
    String? updatedAt,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetSubmission$getSubmission$sustainableActivities {
  Query$GetSubmission$getSubmission$sustainableActivities({
    required this.id,
    required this.climateResilientSeedsToFarmers,
    required this.compostingUnitsAtFpoLevel,
    required this.dripSprinklerIrrigationToFarmers,
    required this.establishmentOfRainwaterHarvestingAtFpoLevel,
    required this.organicBioManureFertilizersToFarmers,
    required this.pestDiseaseAlertsToFarmers,
    required this.solarPanelsAtFpoLevel,
    required this.supplyingAgriculturalResidueToBioCngGasPlants,
    required this.trainingOnOrganicFarmingToFarmers,
    required this.weatherAdvisoriesToFarmers,
    this.$__typename = 'SustainableActivitiesSubmissionNode',
  });

  factory Query$GetSubmission$getSubmission$sustainableActivities.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$climateResilientSeedsToFarmers =
        json['climateResilientSeedsToFarmers'];
    final l$compostingUnitsAtFpoLevel = json['compostingUnitsAtFpoLevel'];
    final l$dripSprinklerIrrigationToFarmers =
        json['dripSprinklerIrrigationToFarmers'];
    final l$establishmentOfRainwaterHarvestingAtFpoLevel =
        json['establishmentOfRainwaterHarvestingAtFpoLevel'];
    final l$organicBioManureFertilizersToFarmers =
        json['organicBioManureFertilizersToFarmers'];
    final l$pestDiseaseAlertsToFarmers = json['pestDiseaseAlertsToFarmers'];
    final l$solarPanelsAtFpoLevel = json['solarPanelsAtFpoLevel'];
    final l$supplyingAgriculturalResidueToBioCngGasPlants =
        json['supplyingAgriculturalResidueToBioCngGasPlants'];
    final l$trainingOnOrganicFarmingToFarmers =
        json['trainingOnOrganicFarmingToFarmers'];
    final l$weatherAdvisoriesToFarmers = json['weatherAdvisoriesToFarmers'];
    final l$$__typename = json['__typename'];
    return Query$GetSubmission$getSubmission$sustainableActivities(
      id: (l$id as String),
      climateResilientSeedsToFarmers:
          (l$climateResilientSeedsToFarmers as bool),
      compostingUnitsAtFpoLevel: (l$compostingUnitsAtFpoLevel as bool),
      dripSprinklerIrrigationToFarmers:
          (l$dripSprinklerIrrigationToFarmers as bool),
      establishmentOfRainwaterHarvestingAtFpoLevel:
          (l$establishmentOfRainwaterHarvestingAtFpoLevel as bool),
      organicBioManureFertilizersToFarmers:
          (l$organicBioManureFertilizersToFarmers as bool),
      pestDiseaseAlertsToFarmers: (l$pestDiseaseAlertsToFarmers as bool),
      solarPanelsAtFpoLevel: (l$solarPanelsAtFpoLevel as bool),
      supplyingAgriculturalResidueToBioCngGasPlants:
          (l$supplyingAgriculturalResidueToBioCngGasPlants as bool),
      trainingOnOrganicFarmingToFarmers:
          (l$trainingOnOrganicFarmingToFarmers as bool),
      weatherAdvisoriesToFarmers: (l$weatherAdvisoriesToFarmers as bool),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final bool climateResilientSeedsToFarmers;

  final bool compostingUnitsAtFpoLevel;

  final bool dripSprinklerIrrigationToFarmers;

  final bool establishmentOfRainwaterHarvestingAtFpoLevel;

  final bool organicBioManureFertilizersToFarmers;

  final bool pestDiseaseAlertsToFarmers;

  final bool solarPanelsAtFpoLevel;

  final bool supplyingAgriculturalResidueToBioCngGasPlants;

  final bool trainingOnOrganicFarmingToFarmers;

  final bool weatherAdvisoriesToFarmers;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$climateResilientSeedsToFarmers = climateResilientSeedsToFarmers;
    _resultData['climateResilientSeedsToFarmers'] =
        l$climateResilientSeedsToFarmers;
    final l$compostingUnitsAtFpoLevel = compostingUnitsAtFpoLevel;
    _resultData['compostingUnitsAtFpoLevel'] = l$compostingUnitsAtFpoLevel;
    final l$dripSprinklerIrrigationToFarmers = dripSprinklerIrrigationToFarmers;
    _resultData['dripSprinklerIrrigationToFarmers'] =
        l$dripSprinklerIrrigationToFarmers;
    final l$establishmentOfRainwaterHarvestingAtFpoLevel =
        establishmentOfRainwaterHarvestingAtFpoLevel;
    _resultData['establishmentOfRainwaterHarvestingAtFpoLevel'] =
        l$establishmentOfRainwaterHarvestingAtFpoLevel;
    final l$organicBioManureFertilizersToFarmers =
        organicBioManureFertilizersToFarmers;
    _resultData['organicBioManureFertilizersToFarmers'] =
        l$organicBioManureFertilizersToFarmers;
    final l$pestDiseaseAlertsToFarmers = pestDiseaseAlertsToFarmers;
    _resultData['pestDiseaseAlertsToFarmers'] = l$pestDiseaseAlertsToFarmers;
    final l$solarPanelsAtFpoLevel = solarPanelsAtFpoLevel;
    _resultData['solarPanelsAtFpoLevel'] = l$solarPanelsAtFpoLevel;
    final l$supplyingAgriculturalResidueToBioCngGasPlants =
        supplyingAgriculturalResidueToBioCngGasPlants;
    _resultData['supplyingAgriculturalResidueToBioCngGasPlants'] =
        l$supplyingAgriculturalResidueToBioCngGasPlants;
    final l$trainingOnOrganicFarmingToFarmers =
        trainingOnOrganicFarmingToFarmers;
    _resultData['trainingOnOrganicFarmingToFarmers'] =
        l$trainingOnOrganicFarmingToFarmers;
    final l$weatherAdvisoriesToFarmers = weatherAdvisoriesToFarmers;
    _resultData['weatherAdvisoriesToFarmers'] = l$weatherAdvisoriesToFarmers;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$climateResilientSeedsToFarmers = climateResilientSeedsToFarmers;
    final l$compostingUnitsAtFpoLevel = compostingUnitsAtFpoLevel;
    final l$dripSprinklerIrrigationToFarmers = dripSprinklerIrrigationToFarmers;
    final l$establishmentOfRainwaterHarvestingAtFpoLevel =
        establishmentOfRainwaterHarvestingAtFpoLevel;
    final l$organicBioManureFertilizersToFarmers =
        organicBioManureFertilizersToFarmers;
    final l$pestDiseaseAlertsToFarmers = pestDiseaseAlertsToFarmers;
    final l$solarPanelsAtFpoLevel = solarPanelsAtFpoLevel;
    final l$supplyingAgriculturalResidueToBioCngGasPlants =
        supplyingAgriculturalResidueToBioCngGasPlants;
    final l$trainingOnOrganicFarmingToFarmers =
        trainingOnOrganicFarmingToFarmers;
    final l$weatherAdvisoriesToFarmers = weatherAdvisoriesToFarmers;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$climateResilientSeedsToFarmers,
      l$compostingUnitsAtFpoLevel,
      l$dripSprinklerIrrigationToFarmers,
      l$establishmentOfRainwaterHarvestingAtFpoLevel,
      l$organicBioManureFertilizersToFarmers,
      l$pestDiseaseAlertsToFarmers,
      l$solarPanelsAtFpoLevel,
      l$supplyingAgriculturalResidueToBioCngGasPlants,
      l$trainingOnOrganicFarmingToFarmers,
      l$weatherAdvisoriesToFarmers,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetSubmission$getSubmission$sustainableActivities) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$climateResilientSeedsToFarmers = climateResilientSeedsToFarmers;
    final lOther$climateResilientSeedsToFarmers =
        other.climateResilientSeedsToFarmers;
    if (l$climateResilientSeedsToFarmers !=
        lOther$climateResilientSeedsToFarmers) {
      return false;
    }
    final l$compostingUnitsAtFpoLevel = compostingUnitsAtFpoLevel;
    final lOther$compostingUnitsAtFpoLevel = other.compostingUnitsAtFpoLevel;
    if (l$compostingUnitsAtFpoLevel != lOther$compostingUnitsAtFpoLevel) {
      return false;
    }
    final l$dripSprinklerIrrigationToFarmers = dripSprinklerIrrigationToFarmers;
    final lOther$dripSprinklerIrrigationToFarmers =
        other.dripSprinklerIrrigationToFarmers;
    if (l$dripSprinklerIrrigationToFarmers !=
        lOther$dripSprinklerIrrigationToFarmers) {
      return false;
    }
    final l$establishmentOfRainwaterHarvestingAtFpoLevel =
        establishmentOfRainwaterHarvestingAtFpoLevel;
    final lOther$establishmentOfRainwaterHarvestingAtFpoLevel =
        other.establishmentOfRainwaterHarvestingAtFpoLevel;
    if (l$establishmentOfRainwaterHarvestingAtFpoLevel !=
        lOther$establishmentOfRainwaterHarvestingAtFpoLevel) {
      return false;
    }
    final l$organicBioManureFertilizersToFarmers =
        organicBioManureFertilizersToFarmers;
    final lOther$organicBioManureFertilizersToFarmers =
        other.organicBioManureFertilizersToFarmers;
    if (l$organicBioManureFertilizersToFarmers !=
        lOther$organicBioManureFertilizersToFarmers) {
      return false;
    }
    final l$pestDiseaseAlertsToFarmers = pestDiseaseAlertsToFarmers;
    final lOther$pestDiseaseAlertsToFarmers = other.pestDiseaseAlertsToFarmers;
    if (l$pestDiseaseAlertsToFarmers != lOther$pestDiseaseAlertsToFarmers) {
      return false;
    }
    final l$solarPanelsAtFpoLevel = solarPanelsAtFpoLevel;
    final lOther$solarPanelsAtFpoLevel = other.solarPanelsAtFpoLevel;
    if (l$solarPanelsAtFpoLevel != lOther$solarPanelsAtFpoLevel) {
      return false;
    }
    final l$supplyingAgriculturalResidueToBioCngGasPlants =
        supplyingAgriculturalResidueToBioCngGasPlants;
    final lOther$supplyingAgriculturalResidueToBioCngGasPlants =
        other.supplyingAgriculturalResidueToBioCngGasPlants;
    if (l$supplyingAgriculturalResidueToBioCngGasPlants !=
        lOther$supplyingAgriculturalResidueToBioCngGasPlants) {
      return false;
    }
    final l$trainingOnOrganicFarmingToFarmers =
        trainingOnOrganicFarmingToFarmers;
    final lOther$trainingOnOrganicFarmingToFarmers =
        other.trainingOnOrganicFarmingToFarmers;
    if (l$trainingOnOrganicFarmingToFarmers !=
        lOther$trainingOnOrganicFarmingToFarmers) {
      return false;
    }
    final l$weatherAdvisoriesToFarmers = weatherAdvisoriesToFarmers;
    final lOther$weatherAdvisoriesToFarmers = other.weatherAdvisoriesToFarmers;
    if (l$weatherAdvisoriesToFarmers != lOther$weatherAdvisoriesToFarmers) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetSubmission$getSubmission$sustainableActivities
    on Query$GetSubmission$getSubmission$sustainableActivities {
  CopyWith$Query$GetSubmission$getSubmission$sustainableActivities<
          Query$GetSubmission$getSubmission$sustainableActivities>
      get copyWith =>
          CopyWith$Query$GetSubmission$getSubmission$sustainableActivities(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetSubmission$getSubmission$sustainableActivities<
    TRes> {
  factory CopyWith$Query$GetSubmission$getSubmission$sustainableActivities(
    Query$GetSubmission$getSubmission$sustainableActivities instance,
    TRes Function(Query$GetSubmission$getSubmission$sustainableActivities) then,
  ) = _CopyWithImpl$Query$GetSubmission$getSubmission$sustainableActivities;

  factory CopyWith$Query$GetSubmission$getSubmission$sustainableActivities.stub(
          TRes res) =
      _CopyWithStubImpl$Query$GetSubmission$getSubmission$sustainableActivities;

  TRes call({
    String? id,
    bool? climateResilientSeedsToFarmers,
    bool? compostingUnitsAtFpoLevel,
    bool? dripSprinklerIrrigationToFarmers,
    bool? establishmentOfRainwaterHarvestingAtFpoLevel,
    bool? organicBioManureFertilizersToFarmers,
    bool? pestDiseaseAlertsToFarmers,
    bool? solarPanelsAtFpoLevel,
    bool? supplyingAgriculturalResidueToBioCngGasPlants,
    bool? trainingOnOrganicFarmingToFarmers,
    bool? weatherAdvisoriesToFarmers,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetSubmission$getSubmission$sustainableActivities<
        TRes>
    implements
        CopyWith$Query$GetSubmission$getSubmission$sustainableActivities<TRes> {
  _CopyWithImpl$Query$GetSubmission$getSubmission$sustainableActivities(
    this._instance,
    this._then,
  );

  final Query$GetSubmission$getSubmission$sustainableActivities _instance;

  final TRes Function(Query$GetSubmission$getSubmission$sustainableActivities)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? climateResilientSeedsToFarmers = _undefined,
    Object? compostingUnitsAtFpoLevel = _undefined,
    Object? dripSprinklerIrrigationToFarmers = _undefined,
    Object? establishmentOfRainwaterHarvestingAtFpoLevel = _undefined,
    Object? organicBioManureFertilizersToFarmers = _undefined,
    Object? pestDiseaseAlertsToFarmers = _undefined,
    Object? solarPanelsAtFpoLevel = _undefined,
    Object? supplyingAgriculturalResidueToBioCngGasPlants = _undefined,
    Object? trainingOnOrganicFarmingToFarmers = _undefined,
    Object? weatherAdvisoriesToFarmers = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetSubmission$getSubmission$sustainableActivities(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        climateResilientSeedsToFarmers:
            climateResilientSeedsToFarmers == _undefined ||
                    climateResilientSeedsToFarmers == null
                ? _instance.climateResilientSeedsToFarmers
                : (climateResilientSeedsToFarmers as bool),
        compostingUnitsAtFpoLevel: compostingUnitsAtFpoLevel == _undefined ||
                compostingUnitsAtFpoLevel == null
            ? _instance.compostingUnitsAtFpoLevel
            : (compostingUnitsAtFpoLevel as bool),
        dripSprinklerIrrigationToFarmers:
            dripSprinklerIrrigationToFarmers == _undefined ||
                    dripSprinklerIrrigationToFarmers == null
                ? _instance.dripSprinklerIrrigationToFarmers
                : (dripSprinklerIrrigationToFarmers as bool),
        establishmentOfRainwaterHarvestingAtFpoLevel:
            establishmentOfRainwaterHarvestingAtFpoLevel == _undefined ||
                    establishmentOfRainwaterHarvestingAtFpoLevel == null
                ? _instance.establishmentOfRainwaterHarvestingAtFpoLevel
                : (establishmentOfRainwaterHarvestingAtFpoLevel as bool),
        organicBioManureFertilizersToFarmers:
            organicBioManureFertilizersToFarmers == _undefined ||
                    organicBioManureFertilizersToFarmers == null
                ? _instance.organicBioManureFertilizersToFarmers
                : (organicBioManureFertilizersToFarmers as bool),
        pestDiseaseAlertsToFarmers: pestDiseaseAlertsToFarmers == _undefined ||
                pestDiseaseAlertsToFarmers == null
            ? _instance.pestDiseaseAlertsToFarmers
            : (pestDiseaseAlertsToFarmers as bool),
        solarPanelsAtFpoLevel:
            solarPanelsAtFpoLevel == _undefined || solarPanelsAtFpoLevel == null
                ? _instance.solarPanelsAtFpoLevel
                : (solarPanelsAtFpoLevel as bool),
        supplyingAgriculturalResidueToBioCngGasPlants:
            supplyingAgriculturalResidueToBioCngGasPlants == _undefined ||
                    supplyingAgriculturalResidueToBioCngGasPlants == null
                ? _instance.supplyingAgriculturalResidueToBioCngGasPlants
                : (supplyingAgriculturalResidueToBioCngGasPlants as bool),
        trainingOnOrganicFarmingToFarmers:
            trainingOnOrganicFarmingToFarmers == _undefined ||
                    trainingOnOrganicFarmingToFarmers == null
                ? _instance.trainingOnOrganicFarmingToFarmers
                : (trainingOnOrganicFarmingToFarmers as bool),
        weatherAdvisoriesToFarmers: weatherAdvisoriesToFarmers == _undefined ||
                weatherAdvisoriesToFarmers == null
            ? _instance.weatherAdvisoriesToFarmers
            : (weatherAdvisoriesToFarmers as bool),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetSubmission$getSubmission$sustainableActivities<
        TRes>
    implements
        CopyWith$Query$GetSubmission$getSubmission$sustainableActivities<TRes> {
  _CopyWithStubImpl$Query$GetSubmission$getSubmission$sustainableActivities(
      this._res);

  TRes _res;

  call({
    String? id,
    bool? climateResilientSeedsToFarmers,
    bool? compostingUnitsAtFpoLevel,
    bool? dripSprinklerIrrigationToFarmers,
    bool? establishmentOfRainwaterHarvestingAtFpoLevel,
    bool? organicBioManureFertilizersToFarmers,
    bool? pestDiseaseAlertsToFarmers,
    bool? solarPanelsAtFpoLevel,
    bool? supplyingAgriculturalResidueToBioCngGasPlants,
    bool? trainingOnOrganicFarmingToFarmers,
    bool? weatherAdvisoriesToFarmers,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetAllMyFpos {
  Query$GetAllMyFpos({
    this.allMyFpos,
    this.$__typename = 'Query',
  });

  factory Query$GetAllMyFpos.fromJson(Map<String, dynamic> json) {
    final l$allMyFpos = json['allMyFpos'];
    final l$$__typename = json['__typename'];
    return Query$GetAllMyFpos(
      allMyFpos: l$allMyFpos == null
          ? null
          : Query$GetAllMyFpos$allMyFpos.fromJson(
              (l$allMyFpos as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetAllMyFpos$allMyFpos? allMyFpos;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$allMyFpos = allMyFpos;
    _resultData['allMyFpos'] = l$allMyFpos?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$allMyFpos = allMyFpos;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$allMyFpos,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetAllMyFpos) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$allMyFpos = allMyFpos;
    final lOther$allMyFpos = other.allMyFpos;
    if (l$allMyFpos != lOther$allMyFpos) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetAllMyFpos on Query$GetAllMyFpos {
  CopyWith$Query$GetAllMyFpos<Query$GetAllMyFpos> get copyWith =>
      CopyWith$Query$GetAllMyFpos(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetAllMyFpos<TRes> {
  factory CopyWith$Query$GetAllMyFpos(
    Query$GetAllMyFpos instance,
    TRes Function(Query$GetAllMyFpos) then,
  ) = _CopyWithImpl$Query$GetAllMyFpos;

  factory CopyWith$Query$GetAllMyFpos.stub(TRes res) =
      _CopyWithStubImpl$Query$GetAllMyFpos;

  TRes call({
    Query$GetAllMyFpos$allMyFpos? allMyFpos,
    String? $__typename,
  });
  CopyWith$Query$GetAllMyFpos$allMyFpos<TRes> get allMyFpos;
}

class _CopyWithImpl$Query$GetAllMyFpos<TRes>
    implements CopyWith$Query$GetAllMyFpos<TRes> {
  _CopyWithImpl$Query$GetAllMyFpos(
    this._instance,
    this._then,
  );

  final Query$GetAllMyFpos _instance;

  final TRes Function(Query$GetAllMyFpos) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? allMyFpos = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetAllMyFpos(
        allMyFpos: allMyFpos == _undefined
            ? _instance.allMyFpos
            : (allMyFpos as Query$GetAllMyFpos$allMyFpos?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetAllMyFpos$allMyFpos<TRes> get allMyFpos {
    final local$allMyFpos = _instance.allMyFpos;
    return local$allMyFpos == null
        ? CopyWith$Query$GetAllMyFpos$allMyFpos.stub(_then(_instance))
        : CopyWith$Query$GetAllMyFpos$allMyFpos(
            local$allMyFpos, (e) => call(allMyFpos: e));
  }
}

class _CopyWithStubImpl$Query$GetAllMyFpos<TRes>
    implements CopyWith$Query$GetAllMyFpos<TRes> {
  _CopyWithStubImpl$Query$GetAllMyFpos(this._res);

  TRes _res;

  call({
    Query$GetAllMyFpos$allMyFpos? allMyFpos,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetAllMyFpos$allMyFpos<TRes> get allMyFpos =>
      CopyWith$Query$GetAllMyFpos$allMyFpos.stub(_res);
}

const documentNodeQueryGetAllMyFpos = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetAllMyFpos'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'allMyFpos'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'edges'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'node'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'name'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'email'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'district'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'state'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'isActive'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'verificationStatus'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'verificationNotes'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: '__typename'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$GetAllMyFpos _parserFn$Query$GetAllMyFpos(Map<String, dynamic> data) =>
    Query$GetAllMyFpos.fromJson(data);
typedef OnQueryComplete$Query$GetAllMyFpos = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetAllMyFpos?,
);

class Options$Query$GetAllMyFpos
    extends graphql.QueryOptions<Query$GetAllMyFpos> {
  Options$Query$GetAllMyFpos({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetAllMyFpos? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetAllMyFpos? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$GetAllMyFpos(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetAllMyFpos,
          parserFn: _parserFn$Query$GetAllMyFpos,
        );

  final OnQueryComplete$Query$GetAllMyFpos? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetAllMyFpos
    extends graphql.WatchQueryOptions<Query$GetAllMyFpos> {
  WatchOptions$Query$GetAllMyFpos({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetAllMyFpos? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetAllMyFpos,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetAllMyFpos,
        );
}

class FetchMoreOptions$Query$GetAllMyFpos extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetAllMyFpos(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetAllMyFpos,
        );
}

extension ClientExtension$Query$GetAllMyFpos on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetAllMyFpos>> query$GetAllMyFpos(
          [Options$Query$GetAllMyFpos? options]) async =>
      await this.query(options ?? Options$Query$GetAllMyFpos());
  graphql.ObservableQuery<Query$GetAllMyFpos> watchQuery$GetAllMyFpos(
          [WatchOptions$Query$GetAllMyFpos? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetAllMyFpos());
  void writeQuery$GetAllMyFpos({
    required Query$GetAllMyFpos data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation:
                graphql.Operation(document: documentNodeQueryGetAllMyFpos)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetAllMyFpos? readQuery$GetAllMyFpos({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetAllMyFpos)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetAllMyFpos.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetAllMyFpos> useQuery$GetAllMyFpos(
        [Options$Query$GetAllMyFpos? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$GetAllMyFpos());
graphql.ObservableQuery<Query$GetAllMyFpos> useWatchQuery$GetAllMyFpos(
        [WatchOptions$Query$GetAllMyFpos? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$GetAllMyFpos());

class Query$GetAllMyFpos$Widget
    extends graphql_flutter.Query<Query$GetAllMyFpos> {
  Query$GetAllMyFpos$Widget({
    widgets.Key? key,
    Options$Query$GetAllMyFpos? options,
    required graphql_flutter.QueryBuilder<Query$GetAllMyFpos> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetAllMyFpos(),
          builder: builder,
        );
}

class Query$GetAllMyFpos$allMyFpos {
  Query$GetAllMyFpos$allMyFpos({
    required this.edges,
    this.$__typename = 'FPONodeConnection',
  });

  factory Query$GetAllMyFpos$allMyFpos.fromJson(Map<String, dynamic> json) {
    final l$edges = json['edges'];
    final l$$__typename = json['__typename'];
    return Query$GetAllMyFpos$allMyFpos(
      edges: (l$edges as List<dynamic>)
          .map((e) => e == null
              ? null
              : Query$GetAllMyFpos$allMyFpos$edges.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$GetAllMyFpos$allMyFpos$edges?> edges;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$edges = edges;
    _resultData['edges'] = l$edges.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$edges = edges;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$edges.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetAllMyFpos$allMyFpos) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$edges = edges;
    final lOther$edges = other.edges;
    if (l$edges.length != lOther$edges.length) {
      return false;
    }
    for (int i = 0; i < l$edges.length; i++) {
      final l$edges$entry = l$edges[i];
      final lOther$edges$entry = lOther$edges[i];
      if (l$edges$entry != lOther$edges$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetAllMyFpos$allMyFpos
    on Query$GetAllMyFpos$allMyFpos {
  CopyWith$Query$GetAllMyFpos$allMyFpos<Query$GetAllMyFpos$allMyFpos>
      get copyWith => CopyWith$Query$GetAllMyFpos$allMyFpos(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetAllMyFpos$allMyFpos<TRes> {
  factory CopyWith$Query$GetAllMyFpos$allMyFpos(
    Query$GetAllMyFpos$allMyFpos instance,
    TRes Function(Query$GetAllMyFpos$allMyFpos) then,
  ) = _CopyWithImpl$Query$GetAllMyFpos$allMyFpos;

  factory CopyWith$Query$GetAllMyFpos$allMyFpos.stub(TRes res) =
      _CopyWithStubImpl$Query$GetAllMyFpos$allMyFpos;

  TRes call({
    List<Query$GetAllMyFpos$allMyFpos$edges?>? edges,
    String? $__typename,
  });
  TRes edges(
      Iterable<Query$GetAllMyFpos$allMyFpos$edges?> Function(
              Iterable<
                  CopyWith$Query$GetAllMyFpos$allMyFpos$edges<
                      Query$GetAllMyFpos$allMyFpos$edges>?>)
          _fn);
}

class _CopyWithImpl$Query$GetAllMyFpos$allMyFpos<TRes>
    implements CopyWith$Query$GetAllMyFpos$allMyFpos<TRes> {
  _CopyWithImpl$Query$GetAllMyFpos$allMyFpos(
    this._instance,
    this._then,
  );

  final Query$GetAllMyFpos$allMyFpos _instance;

  final TRes Function(Query$GetAllMyFpos$allMyFpos) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? edges = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetAllMyFpos$allMyFpos(
        edges: edges == _undefined || edges == null
            ? _instance.edges
            : (edges as List<Query$GetAllMyFpos$allMyFpos$edges?>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes edges(
          Iterable<Query$GetAllMyFpos$allMyFpos$edges?> Function(
                  Iterable<
                      CopyWith$Query$GetAllMyFpos$allMyFpos$edges<
                          Query$GetAllMyFpos$allMyFpos$edges>?>)
              _fn) =>
      call(
          edges: _fn(_instance.edges.map((e) => e == null
              ? null
              : CopyWith$Query$GetAllMyFpos$allMyFpos$edges(
                  e,
                  (i) => i,
                ))).toList());
}

class _CopyWithStubImpl$Query$GetAllMyFpos$allMyFpos<TRes>
    implements CopyWith$Query$GetAllMyFpos$allMyFpos<TRes> {
  _CopyWithStubImpl$Query$GetAllMyFpos$allMyFpos(this._res);

  TRes _res;

  call({
    List<Query$GetAllMyFpos$allMyFpos$edges?>? edges,
    String? $__typename,
  }) =>
      _res;

  edges(_fn) => _res;
}

class Query$GetAllMyFpos$allMyFpos$edges {
  Query$GetAllMyFpos$allMyFpos$edges({
    this.node,
    this.$__typename = 'FPONodeEdge',
  });

  factory Query$GetAllMyFpos$allMyFpos$edges.fromJson(
      Map<String, dynamic> json) {
    final l$node = json['node'];
    final l$$__typename = json['__typename'];
    return Query$GetAllMyFpos$allMyFpos$edges(
      node: l$node == null
          ? null
          : Query$GetAllMyFpos$allMyFpos$edges$node.fromJson(
              (l$node as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetAllMyFpos$allMyFpos$edges$node? node;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$node = node;
    _resultData['node'] = l$node?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$node = node;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$node,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetAllMyFpos$allMyFpos$edges) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$node = node;
    final lOther$node = other.node;
    if (l$node != lOther$node) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetAllMyFpos$allMyFpos$edges
    on Query$GetAllMyFpos$allMyFpos$edges {
  CopyWith$Query$GetAllMyFpos$allMyFpos$edges<
          Query$GetAllMyFpos$allMyFpos$edges>
      get copyWith => CopyWith$Query$GetAllMyFpos$allMyFpos$edges(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetAllMyFpos$allMyFpos$edges<TRes> {
  factory CopyWith$Query$GetAllMyFpos$allMyFpos$edges(
    Query$GetAllMyFpos$allMyFpos$edges instance,
    TRes Function(Query$GetAllMyFpos$allMyFpos$edges) then,
  ) = _CopyWithImpl$Query$GetAllMyFpos$allMyFpos$edges;

  factory CopyWith$Query$GetAllMyFpos$allMyFpos$edges.stub(TRes res) =
      _CopyWithStubImpl$Query$GetAllMyFpos$allMyFpos$edges;

  TRes call({
    Query$GetAllMyFpos$allMyFpos$edges$node? node,
    String? $__typename,
  });
  CopyWith$Query$GetAllMyFpos$allMyFpos$edges$node<TRes> get node;
}

class _CopyWithImpl$Query$GetAllMyFpos$allMyFpos$edges<TRes>
    implements CopyWith$Query$GetAllMyFpos$allMyFpos$edges<TRes> {
  _CopyWithImpl$Query$GetAllMyFpos$allMyFpos$edges(
    this._instance,
    this._then,
  );

  final Query$GetAllMyFpos$allMyFpos$edges _instance;

  final TRes Function(Query$GetAllMyFpos$allMyFpos$edges) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? node = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetAllMyFpos$allMyFpos$edges(
        node: node == _undefined
            ? _instance.node
            : (node as Query$GetAllMyFpos$allMyFpos$edges$node?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetAllMyFpos$allMyFpos$edges$node<TRes> get node {
    final local$node = _instance.node;
    return local$node == null
        ? CopyWith$Query$GetAllMyFpos$allMyFpos$edges$node.stub(
            _then(_instance))
        : CopyWith$Query$GetAllMyFpos$allMyFpos$edges$node(
            local$node, (e) => call(node: e));
  }
}

class _CopyWithStubImpl$Query$GetAllMyFpos$allMyFpos$edges<TRes>
    implements CopyWith$Query$GetAllMyFpos$allMyFpos$edges<TRes> {
  _CopyWithStubImpl$Query$GetAllMyFpos$allMyFpos$edges(this._res);

  TRes _res;

  call({
    Query$GetAllMyFpos$allMyFpos$edges$node? node,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetAllMyFpos$allMyFpos$edges$node<TRes> get node =>
      CopyWith$Query$GetAllMyFpos$allMyFpos$edges$node.stub(_res);
}

class Query$GetAllMyFpos$allMyFpos$edges$node {
  Query$GetAllMyFpos$allMyFpos$edges$node({
    required this.id,
    required this.name,
    required this.email,
    required this.district,
    required this.state,
    required this.isActive,
    required this.verificationStatus,
    required this.verificationNotes,
    this.$__typename = 'FPONode',
  });

  factory Query$GetAllMyFpos$allMyFpos$edges$node.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$email = json['email'];
    final l$district = json['district'];
    final l$state = json['state'];
    final l$isActive = json['isActive'];
    final l$verificationStatus = json['verificationStatus'];
    final l$verificationNotes = json['verificationNotes'];
    final l$$__typename = json['__typename'];
    return Query$GetAllMyFpos$allMyFpos$edges$node(
      id: (l$id as String),
      name: (l$name as String),
      email: (l$email as String),
      district: (l$district as String),
      state: (l$state as String),
      isActive: (l$isActive as bool),
      verificationStatus: (l$verificationStatus as String),
      verificationNotes: (l$verificationNotes as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String email;

  final String district;

  final String state;

  final bool isActive;

  final String verificationStatus;

  final String verificationNotes;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$district = district;
    _resultData['district'] = l$district;
    final l$state = state;
    _resultData['state'] = l$state;
    final l$isActive = isActive;
    _resultData['isActive'] = l$isActive;
    final l$verificationStatus = verificationStatus;
    _resultData['verificationStatus'] = l$verificationStatus;
    final l$verificationNotes = verificationNotes;
    _resultData['verificationNotes'] = l$verificationNotes;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$email = email;
    final l$district = district;
    final l$state = state;
    final l$isActive = isActive;
    final l$verificationStatus = verificationStatus;
    final l$verificationNotes = verificationNotes;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$email,
      l$district,
      l$state,
      l$isActive,
      l$verificationStatus,
      l$verificationNotes,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetAllMyFpos$allMyFpos$edges$node) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$district = district;
    final lOther$district = other.district;
    if (l$district != lOther$district) {
      return false;
    }
    final l$state = state;
    final lOther$state = other.state;
    if (l$state != lOther$state) {
      return false;
    }
    final l$isActive = isActive;
    final lOther$isActive = other.isActive;
    if (l$isActive != lOther$isActive) {
      return false;
    }
    final l$verificationStatus = verificationStatus;
    final lOther$verificationStatus = other.verificationStatus;
    if (l$verificationStatus != lOther$verificationStatus) {
      return false;
    }
    final l$verificationNotes = verificationNotes;
    final lOther$verificationNotes = other.verificationNotes;
    if (l$verificationNotes != lOther$verificationNotes) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetAllMyFpos$allMyFpos$edges$node
    on Query$GetAllMyFpos$allMyFpos$edges$node {
  CopyWith$Query$GetAllMyFpos$allMyFpos$edges$node<
          Query$GetAllMyFpos$allMyFpos$edges$node>
      get copyWith => CopyWith$Query$GetAllMyFpos$allMyFpos$edges$node(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetAllMyFpos$allMyFpos$edges$node<TRes> {
  factory CopyWith$Query$GetAllMyFpos$allMyFpos$edges$node(
    Query$GetAllMyFpos$allMyFpos$edges$node instance,
    TRes Function(Query$GetAllMyFpos$allMyFpos$edges$node) then,
  ) = _CopyWithImpl$Query$GetAllMyFpos$allMyFpos$edges$node;

  factory CopyWith$Query$GetAllMyFpos$allMyFpos$edges$node.stub(TRes res) =
      _CopyWithStubImpl$Query$GetAllMyFpos$allMyFpos$edges$node;

  TRes call({
    String? id,
    String? name,
    String? email,
    String? district,
    String? state,
    bool? isActive,
    String? verificationStatus,
    String? verificationNotes,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetAllMyFpos$allMyFpos$edges$node<TRes>
    implements CopyWith$Query$GetAllMyFpos$allMyFpos$edges$node<TRes> {
  _CopyWithImpl$Query$GetAllMyFpos$allMyFpos$edges$node(
    this._instance,
    this._then,
  );

  final Query$GetAllMyFpos$allMyFpos$edges$node _instance;

  final TRes Function(Query$GetAllMyFpos$allMyFpos$edges$node) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? email = _undefined,
    Object? district = _undefined,
    Object? state = _undefined,
    Object? isActive = _undefined,
    Object? verificationStatus = _undefined,
    Object? verificationNotes = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetAllMyFpos$allMyFpos$edges$node(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        email: email == _undefined || email == null
            ? _instance.email
            : (email as String),
        district: district == _undefined || district == null
            ? _instance.district
            : (district as String),
        state: state == _undefined || state == null
            ? _instance.state
            : (state as String),
        isActive: isActive == _undefined || isActive == null
            ? _instance.isActive
            : (isActive as bool),
        verificationStatus:
            verificationStatus == _undefined || verificationStatus == null
                ? _instance.verificationStatus
                : (verificationStatus as String),
        verificationNotes:
            verificationNotes == _undefined || verificationNotes == null
                ? _instance.verificationNotes
                : (verificationNotes as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetAllMyFpos$allMyFpos$edges$node<TRes>
    implements CopyWith$Query$GetAllMyFpos$allMyFpos$edges$node<TRes> {
  _CopyWithStubImpl$Query$GetAllMyFpos$allMyFpos$edges$node(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? email,
    String? district,
    String? state,
    bool? isActive,
    String? verificationStatus,
    String? verificationNotes,
    String? $__typename,
  }) =>
      _res;
}

class Query$GetMyFpo {
  Query$GetMyFpo({
    this.myFpo,
    this.$__typename = 'Query',
  });

  factory Query$GetMyFpo.fromJson(Map<String, dynamic> json) {
    final l$myFpo = json['myFpo'];
    final l$$__typename = json['__typename'];
    return Query$GetMyFpo(
      myFpo: l$myFpo == null
          ? null
          : Query$GetMyFpo$myFpo.fromJson((l$myFpo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetMyFpo$myFpo? myFpo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$myFpo = myFpo;
    _resultData['myFpo'] = l$myFpo?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$myFpo = myFpo;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$myFpo,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetMyFpo) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$myFpo = myFpo;
    final lOther$myFpo = other.myFpo;
    if (l$myFpo != lOther$myFpo) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetMyFpo on Query$GetMyFpo {
  CopyWith$Query$GetMyFpo<Query$GetMyFpo> get copyWith =>
      CopyWith$Query$GetMyFpo(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetMyFpo<TRes> {
  factory CopyWith$Query$GetMyFpo(
    Query$GetMyFpo instance,
    TRes Function(Query$GetMyFpo) then,
  ) = _CopyWithImpl$Query$GetMyFpo;

  factory CopyWith$Query$GetMyFpo.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMyFpo;

  TRes call({
    Query$GetMyFpo$myFpo? myFpo,
    String? $__typename,
  });
  CopyWith$Query$GetMyFpo$myFpo<TRes> get myFpo;
}

class _CopyWithImpl$Query$GetMyFpo<TRes>
    implements CopyWith$Query$GetMyFpo<TRes> {
  _CopyWithImpl$Query$GetMyFpo(
    this._instance,
    this._then,
  );

  final Query$GetMyFpo _instance;

  final TRes Function(Query$GetMyFpo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? myFpo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMyFpo(
        myFpo: myFpo == _undefined
            ? _instance.myFpo
            : (myFpo as Query$GetMyFpo$myFpo?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Query$GetMyFpo$myFpo<TRes> get myFpo {
    final local$myFpo = _instance.myFpo;
    return local$myFpo == null
        ? CopyWith$Query$GetMyFpo$myFpo.stub(_then(_instance))
        : CopyWith$Query$GetMyFpo$myFpo(local$myFpo, (e) => call(myFpo: e));
  }
}

class _CopyWithStubImpl$Query$GetMyFpo<TRes>
    implements CopyWith$Query$GetMyFpo<TRes> {
  _CopyWithStubImpl$Query$GetMyFpo(this._res);

  TRes _res;

  call({
    Query$GetMyFpo$myFpo? myFpo,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Query$GetMyFpo$myFpo<TRes> get myFpo =>
      CopyWith$Query$GetMyFpo$myFpo.stub(_res);
}

const documentNodeQueryGetMyFpo = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetMyFpo'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'myFpo'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'email'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'phone'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'addressLine1'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'addressLine2'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'city'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'district'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'state'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'pincode'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'alternatePhone'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'logo'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'isActive'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'verificationStatus'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'verificationNotes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'updatedAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$GetMyFpo _parserFn$Query$GetMyFpo(Map<String, dynamic> data) =>
    Query$GetMyFpo.fromJson(data);
typedef OnQueryComplete$Query$GetMyFpo = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetMyFpo?,
);

class Options$Query$GetMyFpo extends graphql.QueryOptions<Query$GetMyFpo> {
  Options$Query$GetMyFpo({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMyFpo? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetMyFpo? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$GetMyFpo(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetMyFpo,
          parserFn: _parserFn$Query$GetMyFpo,
        );

  final OnQueryComplete$Query$GetMyFpo? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetMyFpo
    extends graphql.WatchQueryOptions<Query$GetMyFpo> {
  WatchOptions$Query$GetMyFpo({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetMyFpo? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryGetMyFpo,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetMyFpo,
        );
}

class FetchMoreOptions$Query$GetMyFpo extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetMyFpo({required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryGetMyFpo,
        );
}

extension ClientExtension$Query$GetMyFpo on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetMyFpo>> query$GetMyFpo(
          [Options$Query$GetMyFpo? options]) async =>
      await this.query(options ?? Options$Query$GetMyFpo());
  graphql.ObservableQuery<Query$GetMyFpo> watchQuery$GetMyFpo(
          [WatchOptions$Query$GetMyFpo? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$GetMyFpo());
  void writeQuery$GetMyFpo({
    required Query$GetMyFpo data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQueryGetMyFpo)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetMyFpo? readQuery$GetMyFpo({bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryGetMyFpo)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetMyFpo.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetMyFpo> useQuery$GetMyFpo(
        [Options$Query$GetMyFpo? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$GetMyFpo());
graphql.ObservableQuery<Query$GetMyFpo> useWatchQuery$GetMyFpo(
        [WatchOptions$Query$GetMyFpo? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$GetMyFpo());

class Query$GetMyFpo$Widget extends graphql_flutter.Query<Query$GetMyFpo> {
  Query$GetMyFpo$Widget({
    widgets.Key? key,
    Options$Query$GetMyFpo? options,
    required graphql_flutter.QueryBuilder<Query$GetMyFpo> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$GetMyFpo(),
          builder: builder,
        );
}

class Query$GetMyFpo$myFpo {
  Query$GetMyFpo$myFpo({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.district,
    required this.state,
    required this.pincode,
    required this.alternatePhone,
    this.logo,
    required this.isActive,
    required this.verificationStatus,
    required this.verificationNotes,
    required this.createdAt,
    required this.updatedAt,
    this.$__typename = 'FPONode',
  });

  factory Query$GetMyFpo$myFpo.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$email = json['email'];
    final l$phone = json['phone'];
    final l$addressLine1 = json['addressLine1'];
    final l$addressLine2 = json['addressLine2'];
    final l$city = json['city'];
    final l$district = json['district'];
    final l$state = json['state'];
    final l$pincode = json['pincode'];
    final l$alternatePhone = json['alternatePhone'];
    final l$logo = json['logo'];
    final l$isActive = json['isActive'];
    final l$verificationStatus = json['verificationStatus'];
    final l$verificationNotes = json['verificationNotes'];
    final l$createdAt = json['createdAt'];
    final l$updatedAt = json['updatedAt'];
    final l$$__typename = json['__typename'];
    return Query$GetMyFpo$myFpo(
      id: (l$id as String),
      name: (l$name as String),
      email: (l$email as String),
      phone: (l$phone as String),
      addressLine1: (l$addressLine1 as String),
      addressLine2: (l$addressLine2 as String),
      city: (l$city as String),
      district: (l$district as String),
      state: (l$state as String),
      pincode: (l$pincode as String),
      alternatePhone: (l$alternatePhone as String),
      logo: (l$logo as String?),
      isActive: (l$isActive as bool),
      verificationStatus: (l$verificationStatus as String),
      verificationNotes: (l$verificationNotes as String),
      createdAt: (l$createdAt as String),
      updatedAt: (l$updatedAt as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final String email;

  final String phone;

  final String addressLine1;

  final String addressLine2;

  final String city;

  final String district;

  final String state;

  final String pincode;

  final String alternatePhone;

  final String? logo;

  final bool isActive;

  final String verificationStatus;

  final String verificationNotes;

  final String createdAt;

  final String updatedAt;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$email = email;
    _resultData['email'] = l$email;
    final l$phone = phone;
    _resultData['phone'] = l$phone;
    final l$addressLine1 = addressLine1;
    _resultData['addressLine1'] = l$addressLine1;
    final l$addressLine2 = addressLine2;
    _resultData['addressLine2'] = l$addressLine2;
    final l$city = city;
    _resultData['city'] = l$city;
    final l$district = district;
    _resultData['district'] = l$district;
    final l$state = state;
    _resultData['state'] = l$state;
    final l$pincode = pincode;
    _resultData['pincode'] = l$pincode;
    final l$alternatePhone = alternatePhone;
    _resultData['alternatePhone'] = l$alternatePhone;
    final l$logo = logo;
    _resultData['logo'] = l$logo;
    final l$isActive = isActive;
    _resultData['isActive'] = l$isActive;
    final l$verificationStatus = verificationStatus;
    _resultData['verificationStatus'] = l$verificationStatus;
    final l$verificationNotes = verificationNotes;
    _resultData['verificationNotes'] = l$verificationNotes;
    final l$createdAt = createdAt;
    _resultData['createdAt'] = l$createdAt;
    final l$updatedAt = updatedAt;
    _resultData['updatedAt'] = l$updatedAt;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$email = email;
    final l$phone = phone;
    final l$addressLine1 = addressLine1;
    final l$addressLine2 = addressLine2;
    final l$city = city;
    final l$district = district;
    final l$state = state;
    final l$pincode = pincode;
    final l$alternatePhone = alternatePhone;
    final l$logo = logo;
    final l$isActive = isActive;
    final l$verificationStatus = verificationStatus;
    final l$verificationNotes = verificationNotes;
    final l$createdAt = createdAt;
    final l$updatedAt = updatedAt;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$email,
      l$phone,
      l$addressLine1,
      l$addressLine2,
      l$city,
      l$district,
      l$state,
      l$pincode,
      l$alternatePhone,
      l$logo,
      l$isActive,
      l$verificationStatus,
      l$verificationNotes,
      l$createdAt,
      l$updatedAt,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$GetMyFpo$myFpo) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$email = email;
    final lOther$email = other.email;
    if (l$email != lOther$email) {
      return false;
    }
    final l$phone = phone;
    final lOther$phone = other.phone;
    if (l$phone != lOther$phone) {
      return false;
    }
    final l$addressLine1 = addressLine1;
    final lOther$addressLine1 = other.addressLine1;
    if (l$addressLine1 != lOther$addressLine1) {
      return false;
    }
    final l$addressLine2 = addressLine2;
    final lOther$addressLine2 = other.addressLine2;
    if (l$addressLine2 != lOther$addressLine2) {
      return false;
    }
    final l$city = city;
    final lOther$city = other.city;
    if (l$city != lOther$city) {
      return false;
    }
    final l$district = district;
    final lOther$district = other.district;
    if (l$district != lOther$district) {
      return false;
    }
    final l$state = state;
    final lOther$state = other.state;
    if (l$state != lOther$state) {
      return false;
    }
    final l$pincode = pincode;
    final lOther$pincode = other.pincode;
    if (l$pincode != lOther$pincode) {
      return false;
    }
    final l$alternatePhone = alternatePhone;
    final lOther$alternatePhone = other.alternatePhone;
    if (l$alternatePhone != lOther$alternatePhone) {
      return false;
    }
    final l$logo = logo;
    final lOther$logo = other.logo;
    if (l$logo != lOther$logo) {
      return false;
    }
    final l$isActive = isActive;
    final lOther$isActive = other.isActive;
    if (l$isActive != lOther$isActive) {
      return false;
    }
    final l$verificationStatus = verificationStatus;
    final lOther$verificationStatus = other.verificationStatus;
    if (l$verificationStatus != lOther$verificationStatus) {
      return false;
    }
    final l$verificationNotes = verificationNotes;
    final lOther$verificationNotes = other.verificationNotes;
    if (l$verificationNotes != lOther$verificationNotes) {
      return false;
    }
    final l$createdAt = createdAt;
    final lOther$createdAt = other.createdAt;
    if (l$createdAt != lOther$createdAt) {
      return false;
    }
    final l$updatedAt = updatedAt;
    final lOther$updatedAt = other.updatedAt;
    if (l$updatedAt != lOther$updatedAt) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetMyFpo$myFpo on Query$GetMyFpo$myFpo {
  CopyWith$Query$GetMyFpo$myFpo<Query$GetMyFpo$myFpo> get copyWith =>
      CopyWith$Query$GetMyFpo$myFpo(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetMyFpo$myFpo<TRes> {
  factory CopyWith$Query$GetMyFpo$myFpo(
    Query$GetMyFpo$myFpo instance,
    TRes Function(Query$GetMyFpo$myFpo) then,
  ) = _CopyWithImpl$Query$GetMyFpo$myFpo;

  factory CopyWith$Query$GetMyFpo$myFpo.stub(TRes res) =
      _CopyWithStubImpl$Query$GetMyFpo$myFpo;

  TRes call({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? addressLine1,
    String? addressLine2,
    String? city,
    String? district,
    String? state,
    String? pincode,
    String? alternatePhone,
    String? logo,
    bool? isActive,
    String? verificationStatus,
    String? verificationNotes,
    String? createdAt,
    String? updatedAt,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetMyFpo$myFpo<TRes>
    implements CopyWith$Query$GetMyFpo$myFpo<TRes> {
  _CopyWithImpl$Query$GetMyFpo$myFpo(
    this._instance,
    this._then,
  );

  final Query$GetMyFpo$myFpo _instance;

  final TRes Function(Query$GetMyFpo$myFpo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? email = _undefined,
    Object? phone = _undefined,
    Object? addressLine1 = _undefined,
    Object? addressLine2 = _undefined,
    Object? city = _undefined,
    Object? district = _undefined,
    Object? state = _undefined,
    Object? pincode = _undefined,
    Object? alternatePhone = _undefined,
    Object? logo = _undefined,
    Object? isActive = _undefined,
    Object? verificationStatus = _undefined,
    Object? verificationNotes = _undefined,
    Object? createdAt = _undefined,
    Object? updatedAt = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetMyFpo$myFpo(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        email: email == _undefined || email == null
            ? _instance.email
            : (email as String),
        phone: phone == _undefined || phone == null
            ? _instance.phone
            : (phone as String),
        addressLine1: addressLine1 == _undefined || addressLine1 == null
            ? _instance.addressLine1
            : (addressLine1 as String),
        addressLine2: addressLine2 == _undefined || addressLine2 == null
            ? _instance.addressLine2
            : (addressLine2 as String),
        city: city == _undefined || city == null
            ? _instance.city
            : (city as String),
        district: district == _undefined || district == null
            ? _instance.district
            : (district as String),
        state: state == _undefined || state == null
            ? _instance.state
            : (state as String),
        pincode: pincode == _undefined || pincode == null
            ? _instance.pincode
            : (pincode as String),
        alternatePhone: alternatePhone == _undefined || alternatePhone == null
            ? _instance.alternatePhone
            : (alternatePhone as String),
        logo: logo == _undefined ? _instance.logo : (logo as String?),
        isActive: isActive == _undefined || isActive == null
            ? _instance.isActive
            : (isActive as bool),
        verificationStatus:
            verificationStatus == _undefined || verificationStatus == null
                ? _instance.verificationStatus
                : (verificationStatus as String),
        verificationNotes:
            verificationNotes == _undefined || verificationNotes == null
                ? _instance.verificationNotes
                : (verificationNotes as String),
        createdAt: createdAt == _undefined || createdAt == null
            ? _instance.createdAt
            : (createdAt as String),
        updatedAt: updatedAt == _undefined || updatedAt == null
            ? _instance.updatedAt
            : (updatedAt as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$GetMyFpo$myFpo<TRes>
    implements CopyWith$Query$GetMyFpo$myFpo<TRes> {
  _CopyWithStubImpl$Query$GetMyFpo$myFpo(this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? addressLine1,
    String? addressLine2,
    String? city,
    String? district,
    String? state,
    String? pincode,
    String? alternatePhone,
    String? logo,
    bool? isActive,
    String? verificationStatus,
    String? verificationNotes,
    String? createdAt,
    String? updatedAt,
    String? $__typename,
  }) =>
      _res;
}
