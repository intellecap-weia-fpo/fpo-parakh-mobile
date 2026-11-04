import '../../schema.graphql.dart';
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Mutation$SubmitBasicDetails {
  factory Variables$Mutation$SubmitBasicDetails({
    required Input$FPODetailsSubmissionInput input,
    required String financialYear,
    required String fpoId,
  }) =>
      Variables$Mutation$SubmitBasicDetails._({
        r'input': input,
        r'financialYear': financialYear,
        r'fpoId': fpoId,
      });

  Variables$Mutation$SubmitBasicDetails._(this._$data);

  factory Variables$Mutation$SubmitBasicDetails.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$FPODetailsSubmissionInput.fromJson(
        (l$input as Map<String, dynamic>));
    final l$financialYear = data['financialYear'];
    result$data['financialYear'] = (l$financialYear as String);
    final l$fpoId = data['fpoId'];
    result$data['fpoId'] = (l$fpoId as String);
    return Variables$Mutation$SubmitBasicDetails._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$FPODetailsSubmissionInput get input =>
      (_$data['input'] as Input$FPODetailsSubmissionInput);

  String get financialYear => (_$data['financialYear'] as String);

  String get fpoId => (_$data['fpoId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    final l$financialYear = financialYear;
    result$data['financialYear'] = l$financialYear;
    final l$fpoId = fpoId;
    result$data['fpoId'] = l$fpoId;
    return result$data;
  }

  CopyWith$Variables$Mutation$SubmitBasicDetails<
          Variables$Mutation$SubmitBasicDetails>
      get copyWith => CopyWith$Variables$Mutation$SubmitBasicDetails(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$SubmitBasicDetails) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
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
    final l$input = input;
    final l$financialYear = financialYear;
    final l$fpoId = fpoId;
    return Object.hashAll([
      l$input,
      l$financialYear,
      l$fpoId,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$SubmitBasicDetails<TRes> {
  factory CopyWith$Variables$Mutation$SubmitBasicDetails(
    Variables$Mutation$SubmitBasicDetails instance,
    TRes Function(Variables$Mutation$SubmitBasicDetails) then,
  ) = _CopyWithImpl$Variables$Mutation$SubmitBasicDetails;

  factory CopyWith$Variables$Mutation$SubmitBasicDetails.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SubmitBasicDetails;

  TRes call({
    Input$FPODetailsSubmissionInput? input,
    String? financialYear,
    String? fpoId,
  });
}

class _CopyWithImpl$Variables$Mutation$SubmitBasicDetails<TRes>
    implements CopyWith$Variables$Mutation$SubmitBasicDetails<TRes> {
  _CopyWithImpl$Variables$Mutation$SubmitBasicDetails(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SubmitBasicDetails _instance;

  final TRes Function(Variables$Mutation$SubmitBasicDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? input = _undefined,
    Object? financialYear = _undefined,
    Object? fpoId = _undefined,
  }) =>
      _then(Variables$Mutation$SubmitBasicDetails._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$FPODetailsSubmissionInput),
        if (financialYear != _undefined && financialYear != null)
          'financialYear': (financialYear as String),
        if (fpoId != _undefined && fpoId != null) 'fpoId': (fpoId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SubmitBasicDetails<TRes>
    implements CopyWith$Variables$Mutation$SubmitBasicDetails<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SubmitBasicDetails(this._res);

  TRes _res;

  call({
    Input$FPODetailsSubmissionInput? input,
    String? financialYear,
    String? fpoId,
  }) =>
      _res;
}

class Mutation$SubmitBasicDetails {
  Mutation$SubmitBasicDetails({
    this.createFpoDetailsSubmission,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SubmitBasicDetails.fromJson(Map<String, dynamic> json) {
    final l$createFpoDetailsSubmission = json['createFpoDetailsSubmission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitBasicDetails(
      createFpoDetailsSubmission: l$createFpoDetailsSubmission == null
          ? null
          : Mutation$SubmitBasicDetails$createFpoDetailsSubmission.fromJson(
              (l$createFpoDetailsSubmission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SubmitBasicDetails$createFpoDetailsSubmission?
      createFpoDetailsSubmission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createFpoDetailsSubmission = createFpoDetailsSubmission;
    _resultData['createFpoDetailsSubmission'] =
        l$createFpoDetailsSubmission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createFpoDetailsSubmission = createFpoDetailsSubmission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createFpoDetailsSubmission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SubmitBasicDetails) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createFpoDetailsSubmission = createFpoDetailsSubmission;
    final lOther$createFpoDetailsSubmission = other.createFpoDetailsSubmission;
    if (l$createFpoDetailsSubmission != lOther$createFpoDetailsSubmission) {
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

extension UtilityExtension$Mutation$SubmitBasicDetails
    on Mutation$SubmitBasicDetails {
  CopyWith$Mutation$SubmitBasicDetails<Mutation$SubmitBasicDetails>
      get copyWith => CopyWith$Mutation$SubmitBasicDetails(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitBasicDetails<TRes> {
  factory CopyWith$Mutation$SubmitBasicDetails(
    Mutation$SubmitBasicDetails instance,
    TRes Function(Mutation$SubmitBasicDetails) then,
  ) = _CopyWithImpl$Mutation$SubmitBasicDetails;

  factory CopyWith$Mutation$SubmitBasicDetails.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SubmitBasicDetails;

  TRes call({
    Mutation$SubmitBasicDetails$createFpoDetailsSubmission?
        createFpoDetailsSubmission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission<TRes>
      get createFpoDetailsSubmission;
}

class _CopyWithImpl$Mutation$SubmitBasicDetails<TRes>
    implements CopyWith$Mutation$SubmitBasicDetails<TRes> {
  _CopyWithImpl$Mutation$SubmitBasicDetails(
    this._instance,
    this._then,
  );

  final Mutation$SubmitBasicDetails _instance;

  final TRes Function(Mutation$SubmitBasicDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createFpoDetailsSubmission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitBasicDetails(
        createFpoDetailsSubmission: createFpoDetailsSubmission == _undefined
            ? _instance.createFpoDetailsSubmission
            : (createFpoDetailsSubmission
                as Mutation$SubmitBasicDetails$createFpoDetailsSubmission?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission<TRes>
      get createFpoDetailsSubmission {
    final local$createFpoDetailsSubmission =
        _instance.createFpoDetailsSubmission;
    return local$createFpoDetailsSubmission == null
        ? CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission.stub(
            _then(_instance))
        : CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission(
            local$createFpoDetailsSubmission,
            (e) => call(createFpoDetailsSubmission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitBasicDetails<TRes>
    implements CopyWith$Mutation$SubmitBasicDetails<TRes> {
  _CopyWithStubImpl$Mutation$SubmitBasicDetails(this._res);

  TRes _res;

  call({
    Mutation$SubmitBasicDetails$createFpoDetailsSubmission?
        createFpoDetailsSubmission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission<TRes>
      get createFpoDetailsSubmission =>
          CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission.stub(
              _res);
}

const documentNodeMutationSubmitBasicDetails = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SubmitBasicDetails'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'FPODetailsSubmissionInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
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
        name: NameNode(value: 'createFpoDetailsSubmission'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          ),
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
            name: NameNode(value: 'success'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'errors'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'submission'),
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
Mutation$SubmitBasicDetails _parserFn$Mutation$SubmitBasicDetails(
        Map<String, dynamic> data) =>
    Mutation$SubmitBasicDetails.fromJson(data);
typedef OnMutationCompleted$Mutation$SubmitBasicDetails = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$SubmitBasicDetails?,
);

class Options$Mutation$SubmitBasicDetails
    extends graphql.MutationOptions<Mutation$SubmitBasicDetails> {
  Options$Mutation$SubmitBasicDetails({
    String? operationName,
    required Variables$Mutation$SubmitBasicDetails variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitBasicDetails? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SubmitBasicDetails? onCompleted,
    graphql.OnMutationUpdate<Mutation$SubmitBasicDetails>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SubmitBasicDetails(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSubmitBasicDetails,
          parserFn: _parserFn$Mutation$SubmitBasicDetails,
        );

  final OnMutationCompleted$Mutation$SubmitBasicDetails? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SubmitBasicDetails
    extends graphql.WatchQueryOptions<Mutation$SubmitBasicDetails> {
  WatchOptions$Mutation$SubmitBasicDetails({
    String? operationName,
    required Variables$Mutation$SubmitBasicDetails variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitBasicDetails? typedOptimisticResult,
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
          document: documentNodeMutationSubmitBasicDetails,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SubmitBasicDetails,
        );
}

extension ClientExtension$Mutation$SubmitBasicDetails on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SubmitBasicDetails>>
      mutate$SubmitBasicDetails(
              Options$Mutation$SubmitBasicDetails options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$SubmitBasicDetails>
      watchMutation$SubmitBasicDetails(
              WatchOptions$Mutation$SubmitBasicDetails options) =>
          this.watchMutation(options);
}

class Mutation$SubmitBasicDetails$HookResult {
  Mutation$SubmitBasicDetails$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SubmitBasicDetails runMutation;

  final graphql.QueryResult<Mutation$SubmitBasicDetails> result;
}

Mutation$SubmitBasicDetails$HookResult useMutation$SubmitBasicDetails(
    [WidgetOptions$Mutation$SubmitBasicDetails? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$SubmitBasicDetails());
  return Mutation$SubmitBasicDetails$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SubmitBasicDetails>
    useWatchMutation$SubmitBasicDetails(
            WatchOptions$Mutation$SubmitBasicDetails options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SubmitBasicDetails
    extends graphql.MutationOptions<Mutation$SubmitBasicDetails> {
  WidgetOptions$Mutation$SubmitBasicDetails({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitBasicDetails? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SubmitBasicDetails? onCompleted,
    graphql.OnMutationUpdate<Mutation$SubmitBasicDetails>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SubmitBasicDetails(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSubmitBasicDetails,
          parserFn: _parserFn$Mutation$SubmitBasicDetails,
        );

  final OnMutationCompleted$Mutation$SubmitBasicDetails? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SubmitBasicDetails
    = graphql.MultiSourceResult<Mutation$SubmitBasicDetails> Function(
  Variables$Mutation$SubmitBasicDetails, {
  Object? optimisticResult,
  Mutation$SubmitBasicDetails? typedOptimisticResult,
});
typedef Builder$Mutation$SubmitBasicDetails = widgets.Widget Function(
  RunMutation$Mutation$SubmitBasicDetails,
  graphql.QueryResult<Mutation$SubmitBasicDetails>?,
);

class Mutation$SubmitBasicDetails$Widget
    extends graphql_flutter.Mutation<Mutation$SubmitBasicDetails> {
  Mutation$SubmitBasicDetails$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SubmitBasicDetails? options,
    required Builder$Mutation$SubmitBasicDetails builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SubmitBasicDetails(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$SubmitBasicDetails$createFpoDetailsSubmission {
  Mutation$SubmitBasicDetails$createFpoDetailsSubmission({
    this.success,
    this.errors,
    this.submission,
    this.$__typename = 'CreateFPODetailsSubmissionMutation',
  });

  factory Mutation$SubmitBasicDetails$createFpoDetailsSubmission.fromJson(
      Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$errors = json['errors'];
    final l$submission = json['submission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitBasicDetails$createFpoDetailsSubmission(
      success: (l$success as bool?),
      errors: (l$errors as List<dynamic>?)?.map((e) => (e as String?)).toList(),
      submission: l$submission == null
          ? null
          : Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission
              .fromJson((l$submission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? success;

  final List<String?>? errors;

  final Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission?
      submission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$errors = errors;
    _resultData['errors'] = l$errors?.map((e) => e).toList();
    final l$submission = submission;
    _resultData['submission'] = l$submission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$errors = errors;
    final l$submission = submission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$success,
      l$errors == null ? null : Object.hashAll(l$errors.map((v) => v)),
      l$submission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SubmitBasicDetails$createFpoDetailsSubmission) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$errors = errors;
    final lOther$errors = other.errors;
    if (l$errors != null && lOther$errors != null) {
      if (l$errors.length != lOther$errors.length) {
        return false;
      }
      for (int i = 0; i < l$errors.length; i++) {
        final l$errors$entry = l$errors[i];
        final lOther$errors$entry = lOther$errors[i];
        if (l$errors$entry != lOther$errors$entry) {
          return false;
        }
      }
    } else if (l$errors != lOther$errors) {
      return false;
    }
    final l$submission = submission;
    final lOther$submission = other.submission;
    if (l$submission != lOther$submission) {
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

extension UtilityExtension$Mutation$SubmitBasicDetails$createFpoDetailsSubmission
    on Mutation$SubmitBasicDetails$createFpoDetailsSubmission {
  CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission<
          Mutation$SubmitBasicDetails$createFpoDetailsSubmission>
      get copyWith =>
          CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission<
    TRes> {
  factory CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission(
    Mutation$SubmitBasicDetails$createFpoDetailsSubmission instance,
    TRes Function(Mutation$SubmitBasicDetails$createFpoDetailsSubmission) then,
  ) = _CopyWithImpl$Mutation$SubmitBasicDetails$createFpoDetailsSubmission;

  factory CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitBasicDetails$createFpoDetailsSubmission;

  TRes call({
    bool? success,
    List<String?>? errors,
    Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission?
        submission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission<
      TRes> get submission;
}

class _CopyWithImpl$Mutation$SubmitBasicDetails$createFpoDetailsSubmission<TRes>
    implements
        CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission<TRes> {
  _CopyWithImpl$Mutation$SubmitBasicDetails$createFpoDetailsSubmission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitBasicDetails$createFpoDetailsSubmission _instance;

  final TRes Function(Mutation$SubmitBasicDetails$createFpoDetailsSubmission)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? errors = _undefined,
    Object? submission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitBasicDetails$createFpoDetailsSubmission(
        success: success == _undefined ? _instance.success : (success as bool?),
        errors: errors == _undefined
            ? _instance.errors
            : (errors as List<String?>?),
        submission: submission == _undefined
            ? _instance.submission
            : (submission
                as Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission<
      TRes> get submission {
    final local$submission = _instance.submission;
    return local$submission == null
        ? CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission
            .stub(_then(_instance))
        : CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission(
            local$submission, (e) => call(submission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitBasicDetails$createFpoDetailsSubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission<TRes> {
  _CopyWithStubImpl$Mutation$SubmitBasicDetails$createFpoDetailsSubmission(
      this._res);

  TRes _res;

  call({
    bool? success,
    List<String?>? errors,
    Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission?
        submission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission<
          TRes>
      get submission =>
          CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission
              .stub(_res);
}

class Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission {
  Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission({
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

  factory Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission.fromJson(
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
    return Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission(
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
    if (!(other
            is Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission) ||
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

extension UtilityExtension$Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission
    on Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission {
  CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission<
          Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission>
      get copyWith =>
          CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission<
    TRes> {
  factory CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission(
    Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission instance,
    TRes Function(
            Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission)
        then,
  ) = _CopyWithImpl$Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission;

  factory CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission;

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

class _CopyWithImpl$Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission<
        TRes>
    implements
        CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission<
            TRes> {
  _CopyWithImpl$Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission
      _instance;

  final TRes Function(
      Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission) _then;

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
      _then(Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission(
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

class _CopyWithStubImpl$Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission<
        TRes>
    implements
        CopyWith$Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitBasicDetails$createFpoDetailsSubmission$submission(
      this._res);

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

class Variables$Mutation$SubmitGovernance {
  factory Variables$Mutation$SubmitGovernance({
    required Input$GovernanceSubmissionInput input,
    required String financialYear,
    required String fpoId,
  }) =>
      Variables$Mutation$SubmitGovernance._({
        r'input': input,
        r'financialYear': financialYear,
        r'fpoId': fpoId,
      });

  Variables$Mutation$SubmitGovernance._(this._$data);

  factory Variables$Mutation$SubmitGovernance.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$GovernanceSubmissionInput.fromJson(
        (l$input as Map<String, dynamic>));
    final l$financialYear = data['financialYear'];
    result$data['financialYear'] = (l$financialYear as String);
    final l$fpoId = data['fpoId'];
    result$data['fpoId'] = (l$fpoId as String);
    return Variables$Mutation$SubmitGovernance._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$GovernanceSubmissionInput get input =>
      (_$data['input'] as Input$GovernanceSubmissionInput);

  String get financialYear => (_$data['financialYear'] as String);

  String get fpoId => (_$data['fpoId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    final l$financialYear = financialYear;
    result$data['financialYear'] = l$financialYear;
    final l$fpoId = fpoId;
    result$data['fpoId'] = l$fpoId;
    return result$data;
  }

  CopyWith$Variables$Mutation$SubmitGovernance<
          Variables$Mutation$SubmitGovernance>
      get copyWith => CopyWith$Variables$Mutation$SubmitGovernance(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$SubmitGovernance) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
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
    final l$input = input;
    final l$financialYear = financialYear;
    final l$fpoId = fpoId;
    return Object.hashAll([
      l$input,
      l$financialYear,
      l$fpoId,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$SubmitGovernance<TRes> {
  factory CopyWith$Variables$Mutation$SubmitGovernance(
    Variables$Mutation$SubmitGovernance instance,
    TRes Function(Variables$Mutation$SubmitGovernance) then,
  ) = _CopyWithImpl$Variables$Mutation$SubmitGovernance;

  factory CopyWith$Variables$Mutation$SubmitGovernance.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SubmitGovernance;

  TRes call({
    Input$GovernanceSubmissionInput? input,
    String? financialYear,
    String? fpoId,
  });
}

class _CopyWithImpl$Variables$Mutation$SubmitGovernance<TRes>
    implements CopyWith$Variables$Mutation$SubmitGovernance<TRes> {
  _CopyWithImpl$Variables$Mutation$SubmitGovernance(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SubmitGovernance _instance;

  final TRes Function(Variables$Mutation$SubmitGovernance) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? input = _undefined,
    Object? financialYear = _undefined,
    Object? fpoId = _undefined,
  }) =>
      _then(Variables$Mutation$SubmitGovernance._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$GovernanceSubmissionInput),
        if (financialYear != _undefined && financialYear != null)
          'financialYear': (financialYear as String),
        if (fpoId != _undefined && fpoId != null) 'fpoId': (fpoId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SubmitGovernance<TRes>
    implements CopyWith$Variables$Mutation$SubmitGovernance<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SubmitGovernance(this._res);

  TRes _res;

  call({
    Input$GovernanceSubmissionInput? input,
    String? financialYear,
    String? fpoId,
  }) =>
      _res;
}

class Mutation$SubmitGovernance {
  Mutation$SubmitGovernance({
    this.createGovernanceSubmission,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SubmitGovernance.fromJson(Map<String, dynamic> json) {
    final l$createGovernanceSubmission = json['createGovernanceSubmission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitGovernance(
      createGovernanceSubmission: l$createGovernanceSubmission == null
          ? null
          : Mutation$SubmitGovernance$createGovernanceSubmission.fromJson(
              (l$createGovernanceSubmission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SubmitGovernance$createGovernanceSubmission?
      createGovernanceSubmission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createGovernanceSubmission = createGovernanceSubmission;
    _resultData['createGovernanceSubmission'] =
        l$createGovernanceSubmission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createGovernanceSubmission = createGovernanceSubmission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createGovernanceSubmission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SubmitGovernance) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createGovernanceSubmission = createGovernanceSubmission;
    final lOther$createGovernanceSubmission = other.createGovernanceSubmission;
    if (l$createGovernanceSubmission != lOther$createGovernanceSubmission) {
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

extension UtilityExtension$Mutation$SubmitGovernance
    on Mutation$SubmitGovernance {
  CopyWith$Mutation$SubmitGovernance<Mutation$SubmitGovernance> get copyWith =>
      CopyWith$Mutation$SubmitGovernance(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SubmitGovernance<TRes> {
  factory CopyWith$Mutation$SubmitGovernance(
    Mutation$SubmitGovernance instance,
    TRes Function(Mutation$SubmitGovernance) then,
  ) = _CopyWithImpl$Mutation$SubmitGovernance;

  factory CopyWith$Mutation$SubmitGovernance.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SubmitGovernance;

  TRes call({
    Mutation$SubmitGovernance$createGovernanceSubmission?
        createGovernanceSubmission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission<TRes>
      get createGovernanceSubmission;
}

class _CopyWithImpl$Mutation$SubmitGovernance<TRes>
    implements CopyWith$Mutation$SubmitGovernance<TRes> {
  _CopyWithImpl$Mutation$SubmitGovernance(
    this._instance,
    this._then,
  );

  final Mutation$SubmitGovernance _instance;

  final TRes Function(Mutation$SubmitGovernance) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createGovernanceSubmission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitGovernance(
        createGovernanceSubmission: createGovernanceSubmission == _undefined
            ? _instance.createGovernanceSubmission
            : (createGovernanceSubmission
                as Mutation$SubmitGovernance$createGovernanceSubmission?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission<TRes>
      get createGovernanceSubmission {
    final local$createGovernanceSubmission =
        _instance.createGovernanceSubmission;
    return local$createGovernanceSubmission == null
        ? CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission.stub(
            _then(_instance))
        : CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission(
            local$createGovernanceSubmission,
            (e) => call(createGovernanceSubmission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitGovernance<TRes>
    implements CopyWith$Mutation$SubmitGovernance<TRes> {
  _CopyWithStubImpl$Mutation$SubmitGovernance(this._res);

  TRes _res;

  call({
    Mutation$SubmitGovernance$createGovernanceSubmission?
        createGovernanceSubmission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission<TRes>
      get createGovernanceSubmission =>
          CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission.stub(
              _res);
}

const documentNodeMutationSubmitGovernance = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SubmitGovernance'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'GovernanceSubmissionInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
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
        name: NameNode(value: 'createGovernanceSubmission'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          ),
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
            name: NameNode(value: 'success'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'errors'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'submission'),
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
Mutation$SubmitGovernance _parserFn$Mutation$SubmitGovernance(
        Map<String, dynamic> data) =>
    Mutation$SubmitGovernance.fromJson(data);
typedef OnMutationCompleted$Mutation$SubmitGovernance = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$SubmitGovernance?,
);

class Options$Mutation$SubmitGovernance
    extends graphql.MutationOptions<Mutation$SubmitGovernance> {
  Options$Mutation$SubmitGovernance({
    String? operationName,
    required Variables$Mutation$SubmitGovernance variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitGovernance? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SubmitGovernance? onCompleted,
    graphql.OnMutationUpdate<Mutation$SubmitGovernance>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SubmitGovernance(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSubmitGovernance,
          parserFn: _parserFn$Mutation$SubmitGovernance,
        );

  final OnMutationCompleted$Mutation$SubmitGovernance? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SubmitGovernance
    extends graphql.WatchQueryOptions<Mutation$SubmitGovernance> {
  WatchOptions$Mutation$SubmitGovernance({
    String? operationName,
    required Variables$Mutation$SubmitGovernance variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitGovernance? typedOptimisticResult,
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
          document: documentNodeMutationSubmitGovernance,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SubmitGovernance,
        );
}

extension ClientExtension$Mutation$SubmitGovernance on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SubmitGovernance>>
      mutate$SubmitGovernance(
              Options$Mutation$SubmitGovernance options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$SubmitGovernance>
      watchMutation$SubmitGovernance(
              WatchOptions$Mutation$SubmitGovernance options) =>
          this.watchMutation(options);
}

class Mutation$SubmitGovernance$HookResult {
  Mutation$SubmitGovernance$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SubmitGovernance runMutation;

  final graphql.QueryResult<Mutation$SubmitGovernance> result;
}

Mutation$SubmitGovernance$HookResult useMutation$SubmitGovernance(
    [WidgetOptions$Mutation$SubmitGovernance? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$SubmitGovernance());
  return Mutation$SubmitGovernance$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SubmitGovernance>
    useWatchMutation$SubmitGovernance(
            WatchOptions$Mutation$SubmitGovernance options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SubmitGovernance
    extends graphql.MutationOptions<Mutation$SubmitGovernance> {
  WidgetOptions$Mutation$SubmitGovernance({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitGovernance? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SubmitGovernance? onCompleted,
    graphql.OnMutationUpdate<Mutation$SubmitGovernance>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SubmitGovernance(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSubmitGovernance,
          parserFn: _parserFn$Mutation$SubmitGovernance,
        );

  final OnMutationCompleted$Mutation$SubmitGovernance? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SubmitGovernance
    = graphql.MultiSourceResult<Mutation$SubmitGovernance> Function(
  Variables$Mutation$SubmitGovernance, {
  Object? optimisticResult,
  Mutation$SubmitGovernance? typedOptimisticResult,
});
typedef Builder$Mutation$SubmitGovernance = widgets.Widget Function(
  RunMutation$Mutation$SubmitGovernance,
  graphql.QueryResult<Mutation$SubmitGovernance>?,
);

class Mutation$SubmitGovernance$Widget
    extends graphql_flutter.Mutation<Mutation$SubmitGovernance> {
  Mutation$SubmitGovernance$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SubmitGovernance? options,
    required Builder$Mutation$SubmitGovernance builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SubmitGovernance(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$SubmitGovernance$createGovernanceSubmission {
  Mutation$SubmitGovernance$createGovernanceSubmission({
    this.success,
    this.errors,
    this.submission,
    this.$__typename = 'CreateGovernanceSubmissionMutation',
  });

  factory Mutation$SubmitGovernance$createGovernanceSubmission.fromJson(
      Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$errors = json['errors'];
    final l$submission = json['submission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitGovernance$createGovernanceSubmission(
      success: (l$success as bool?),
      errors: (l$errors as List<dynamic>?)?.map((e) => (e as String?)).toList(),
      submission: l$submission == null
          ? null
          : Mutation$SubmitGovernance$createGovernanceSubmission$submission
              .fromJson((l$submission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? success;

  final List<String?>? errors;

  final Mutation$SubmitGovernance$createGovernanceSubmission$submission?
      submission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$errors = errors;
    _resultData['errors'] = l$errors?.map((e) => e).toList();
    final l$submission = submission;
    _resultData['submission'] = l$submission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$errors = errors;
    final l$submission = submission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$success,
      l$errors == null ? null : Object.hashAll(l$errors.map((v) => v)),
      l$submission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SubmitGovernance$createGovernanceSubmission) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$errors = errors;
    final lOther$errors = other.errors;
    if (l$errors != null && lOther$errors != null) {
      if (l$errors.length != lOther$errors.length) {
        return false;
      }
      for (int i = 0; i < l$errors.length; i++) {
        final l$errors$entry = l$errors[i];
        final lOther$errors$entry = lOther$errors[i];
        if (l$errors$entry != lOther$errors$entry) {
          return false;
        }
      }
    } else if (l$errors != lOther$errors) {
      return false;
    }
    final l$submission = submission;
    final lOther$submission = other.submission;
    if (l$submission != lOther$submission) {
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

extension UtilityExtension$Mutation$SubmitGovernance$createGovernanceSubmission
    on Mutation$SubmitGovernance$createGovernanceSubmission {
  CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission<
          Mutation$SubmitGovernance$createGovernanceSubmission>
      get copyWith =>
          CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission<
    TRes> {
  factory CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission(
    Mutation$SubmitGovernance$createGovernanceSubmission instance,
    TRes Function(Mutation$SubmitGovernance$createGovernanceSubmission) then,
  ) = _CopyWithImpl$Mutation$SubmitGovernance$createGovernanceSubmission;

  factory CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitGovernance$createGovernanceSubmission;

  TRes call({
    bool? success,
    List<String?>? errors,
    Mutation$SubmitGovernance$createGovernanceSubmission$submission? submission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission$submission<TRes>
      get submission;
}

class _CopyWithImpl$Mutation$SubmitGovernance$createGovernanceSubmission<TRes>
    implements
        CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission<TRes> {
  _CopyWithImpl$Mutation$SubmitGovernance$createGovernanceSubmission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitGovernance$createGovernanceSubmission _instance;

  final TRes Function(Mutation$SubmitGovernance$createGovernanceSubmission)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? errors = _undefined,
    Object? submission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitGovernance$createGovernanceSubmission(
        success: success == _undefined ? _instance.success : (success as bool?),
        errors: errors == _undefined
            ? _instance.errors
            : (errors as List<String?>?),
        submission: submission == _undefined
            ? _instance.submission
            : (submission
                as Mutation$SubmitGovernance$createGovernanceSubmission$submission?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission$submission<TRes>
      get submission {
    final local$submission = _instance.submission;
    return local$submission == null
        ? CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission$submission
            .stub(_then(_instance))
        : CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission$submission(
            local$submission, (e) => call(submission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitGovernance$createGovernanceSubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission<TRes> {
  _CopyWithStubImpl$Mutation$SubmitGovernance$createGovernanceSubmission(
      this._res);

  TRes _res;

  call({
    bool? success,
    List<String?>? errors,
    Mutation$SubmitGovernance$createGovernanceSubmission$submission? submission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission$submission<TRes>
      get submission =>
          CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission$submission
              .stub(_res);
}

class Mutation$SubmitGovernance$createGovernanceSubmission$submission {
  Mutation$SubmitGovernance$createGovernanceSubmission$submission({
    required this.id,
    required this.annualGeneralBodyMeetings,
    required this.bodMeetingsLastFinancialYear,
    required this.numBods,
    required this.numWomenBods,
    required this.minutesMaintenance,
    this.$__typename = 'GovernanceSubmissionNode',
  });

  factory Mutation$SubmitGovernance$createGovernanceSubmission$submission.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$annualGeneralBodyMeetings = json['annualGeneralBodyMeetings'];
    final l$bodMeetingsLastFinancialYear = json['bodMeetingsLastFinancialYear'];
    final l$numBods = json['numBods'];
    final l$numWomenBods = json['numWomenBods'];
    final l$minutesMaintenance = json['minutesMaintenance'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitGovernance$createGovernanceSubmission$submission(
      id: (l$id as String),
      annualGeneralBodyMeetings: (l$annualGeneralBodyMeetings as int),
      bodMeetingsLastFinancialYear: (l$bodMeetingsLastFinancialYear as int),
      numBods: (l$numBods as int),
      numWomenBods: (l$numWomenBods as int),
      minutesMaintenance:
          fromJson$Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices(
              (l$minutesMaintenance as String)),
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
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$annualGeneralBodyMeetings,
      l$bodMeetingsLastFinancialYear,
      l$numBods,
      l$numWomenBods,
      l$minutesMaintenance,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$SubmitGovernance$createGovernanceSubmission$submission) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$SubmitGovernance$createGovernanceSubmission$submission
    on Mutation$SubmitGovernance$createGovernanceSubmission$submission {
  CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission$submission<
          Mutation$SubmitGovernance$createGovernanceSubmission$submission>
      get copyWith =>
          CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission$submission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission$submission<
    TRes> {
  factory CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission$submission(
    Mutation$SubmitGovernance$createGovernanceSubmission$submission instance,
    TRes Function(
            Mutation$SubmitGovernance$createGovernanceSubmission$submission)
        then,
  ) = _CopyWithImpl$Mutation$SubmitGovernance$createGovernanceSubmission$submission;

  factory CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission$submission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitGovernance$createGovernanceSubmission$submission;

  TRes call({
    String? id,
    int? annualGeneralBodyMeetings,
    int? bodMeetingsLastFinancialYear,
    int? numBods,
    int? numWomenBods,
    Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices? minutesMaintenance,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SubmitGovernance$createGovernanceSubmission$submission<
        TRes>
    implements
        CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission$submission<
            TRes> {
  _CopyWithImpl$Mutation$SubmitGovernance$createGovernanceSubmission$submission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitGovernance$createGovernanceSubmission$submission
      _instance;

  final TRes Function(
      Mutation$SubmitGovernance$createGovernanceSubmission$submission) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? annualGeneralBodyMeetings = _undefined,
    Object? bodMeetingsLastFinancialYear = _undefined,
    Object? numBods = _undefined,
    Object? numWomenBods = _undefined,
    Object? minutesMaintenance = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitGovernance$createGovernanceSubmission$submission(
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
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SubmitGovernance$createGovernanceSubmission$submission<
        TRes>
    implements
        CopyWith$Mutation$SubmitGovernance$createGovernanceSubmission$submission<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitGovernance$createGovernanceSubmission$submission(
      this._res);

  TRes _res;

  call({
    String? id,
    int? annualGeneralBodyMeetings,
    int? bodMeetingsLastFinancialYear,
    int? numBods,
    int? numWomenBods,
    Enum$FpoGovernanceSubmissionMinutesMaintenanceChoices? minutesMaintenance,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$SubmitCEOProfile {
  factory Variables$Mutation$SubmitCEOProfile({
    required Input$CEOProfileSubmissionInput input,
    required String financialYear,
    required String fpoId,
  }) =>
      Variables$Mutation$SubmitCEOProfile._({
        r'input': input,
        r'financialYear': financialYear,
        r'fpoId': fpoId,
      });

  Variables$Mutation$SubmitCEOProfile._(this._$data);

  factory Variables$Mutation$SubmitCEOProfile.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$CEOProfileSubmissionInput.fromJson(
        (l$input as Map<String, dynamic>));
    final l$financialYear = data['financialYear'];
    result$data['financialYear'] = (l$financialYear as String);
    final l$fpoId = data['fpoId'];
    result$data['fpoId'] = (l$fpoId as String);
    return Variables$Mutation$SubmitCEOProfile._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$CEOProfileSubmissionInput get input =>
      (_$data['input'] as Input$CEOProfileSubmissionInput);

  String get financialYear => (_$data['financialYear'] as String);

  String get fpoId => (_$data['fpoId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    final l$financialYear = financialYear;
    result$data['financialYear'] = l$financialYear;
    final l$fpoId = fpoId;
    result$data['fpoId'] = l$fpoId;
    return result$data;
  }

  CopyWith$Variables$Mutation$SubmitCEOProfile<
          Variables$Mutation$SubmitCEOProfile>
      get copyWith => CopyWith$Variables$Mutation$SubmitCEOProfile(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$SubmitCEOProfile) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
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
    final l$input = input;
    final l$financialYear = financialYear;
    final l$fpoId = fpoId;
    return Object.hashAll([
      l$input,
      l$financialYear,
      l$fpoId,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$SubmitCEOProfile<TRes> {
  factory CopyWith$Variables$Mutation$SubmitCEOProfile(
    Variables$Mutation$SubmitCEOProfile instance,
    TRes Function(Variables$Mutation$SubmitCEOProfile) then,
  ) = _CopyWithImpl$Variables$Mutation$SubmitCEOProfile;

  factory CopyWith$Variables$Mutation$SubmitCEOProfile.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SubmitCEOProfile;

  TRes call({
    Input$CEOProfileSubmissionInput? input,
    String? financialYear,
    String? fpoId,
  });
}

class _CopyWithImpl$Variables$Mutation$SubmitCEOProfile<TRes>
    implements CopyWith$Variables$Mutation$SubmitCEOProfile<TRes> {
  _CopyWithImpl$Variables$Mutation$SubmitCEOProfile(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SubmitCEOProfile _instance;

  final TRes Function(Variables$Mutation$SubmitCEOProfile) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? input = _undefined,
    Object? financialYear = _undefined,
    Object? fpoId = _undefined,
  }) =>
      _then(Variables$Mutation$SubmitCEOProfile._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$CEOProfileSubmissionInput),
        if (financialYear != _undefined && financialYear != null)
          'financialYear': (financialYear as String),
        if (fpoId != _undefined && fpoId != null) 'fpoId': (fpoId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SubmitCEOProfile<TRes>
    implements CopyWith$Variables$Mutation$SubmitCEOProfile<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SubmitCEOProfile(this._res);

  TRes _res;

  call({
    Input$CEOProfileSubmissionInput? input,
    String? financialYear,
    String? fpoId,
  }) =>
      _res;
}

class Mutation$SubmitCEOProfile {
  Mutation$SubmitCEOProfile({
    this.createCeoProfileSubmission,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SubmitCEOProfile.fromJson(Map<String, dynamic> json) {
    final l$createCeoProfileSubmission = json['createCeoProfileSubmission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitCEOProfile(
      createCeoProfileSubmission: l$createCeoProfileSubmission == null
          ? null
          : Mutation$SubmitCEOProfile$createCeoProfileSubmission.fromJson(
              (l$createCeoProfileSubmission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SubmitCEOProfile$createCeoProfileSubmission?
      createCeoProfileSubmission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createCeoProfileSubmission = createCeoProfileSubmission;
    _resultData['createCeoProfileSubmission'] =
        l$createCeoProfileSubmission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createCeoProfileSubmission = createCeoProfileSubmission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createCeoProfileSubmission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SubmitCEOProfile) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createCeoProfileSubmission = createCeoProfileSubmission;
    final lOther$createCeoProfileSubmission = other.createCeoProfileSubmission;
    if (l$createCeoProfileSubmission != lOther$createCeoProfileSubmission) {
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

extension UtilityExtension$Mutation$SubmitCEOProfile
    on Mutation$SubmitCEOProfile {
  CopyWith$Mutation$SubmitCEOProfile<Mutation$SubmitCEOProfile> get copyWith =>
      CopyWith$Mutation$SubmitCEOProfile(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$SubmitCEOProfile<TRes> {
  factory CopyWith$Mutation$SubmitCEOProfile(
    Mutation$SubmitCEOProfile instance,
    TRes Function(Mutation$SubmitCEOProfile) then,
  ) = _CopyWithImpl$Mutation$SubmitCEOProfile;

  factory CopyWith$Mutation$SubmitCEOProfile.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SubmitCEOProfile;

  TRes call({
    Mutation$SubmitCEOProfile$createCeoProfileSubmission?
        createCeoProfileSubmission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission<TRes>
      get createCeoProfileSubmission;
}

class _CopyWithImpl$Mutation$SubmitCEOProfile<TRes>
    implements CopyWith$Mutation$SubmitCEOProfile<TRes> {
  _CopyWithImpl$Mutation$SubmitCEOProfile(
    this._instance,
    this._then,
  );

  final Mutation$SubmitCEOProfile _instance;

  final TRes Function(Mutation$SubmitCEOProfile) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createCeoProfileSubmission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitCEOProfile(
        createCeoProfileSubmission: createCeoProfileSubmission == _undefined
            ? _instance.createCeoProfileSubmission
            : (createCeoProfileSubmission
                as Mutation$SubmitCEOProfile$createCeoProfileSubmission?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission<TRes>
      get createCeoProfileSubmission {
    final local$createCeoProfileSubmission =
        _instance.createCeoProfileSubmission;
    return local$createCeoProfileSubmission == null
        ? CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission.stub(
            _then(_instance))
        : CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission(
            local$createCeoProfileSubmission,
            (e) => call(createCeoProfileSubmission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitCEOProfile<TRes>
    implements CopyWith$Mutation$SubmitCEOProfile<TRes> {
  _CopyWithStubImpl$Mutation$SubmitCEOProfile(this._res);

  TRes _res;

  call({
    Mutation$SubmitCEOProfile$createCeoProfileSubmission?
        createCeoProfileSubmission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission<TRes>
      get createCeoProfileSubmission =>
          CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission.stub(
              _res);
}

const documentNodeMutationSubmitCEOProfile = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SubmitCEOProfile'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'CEOProfileSubmissionInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
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
        name: NameNode(value: 'createCeoProfileSubmission'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          ),
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
            name: NameNode(value: 'success'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'errors'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'submission'),
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
                name: NameNode(value: 'numberOfYearsAssociated'),
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
                name: NameNode(value: 'yearlySubmission'),
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
Mutation$SubmitCEOProfile _parserFn$Mutation$SubmitCEOProfile(
        Map<String, dynamic> data) =>
    Mutation$SubmitCEOProfile.fromJson(data);
typedef OnMutationCompleted$Mutation$SubmitCEOProfile = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$SubmitCEOProfile?,
);

class Options$Mutation$SubmitCEOProfile
    extends graphql.MutationOptions<Mutation$SubmitCEOProfile> {
  Options$Mutation$SubmitCEOProfile({
    String? operationName,
    required Variables$Mutation$SubmitCEOProfile variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitCEOProfile? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SubmitCEOProfile? onCompleted,
    graphql.OnMutationUpdate<Mutation$SubmitCEOProfile>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SubmitCEOProfile(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSubmitCEOProfile,
          parserFn: _parserFn$Mutation$SubmitCEOProfile,
        );

  final OnMutationCompleted$Mutation$SubmitCEOProfile? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SubmitCEOProfile
    extends graphql.WatchQueryOptions<Mutation$SubmitCEOProfile> {
  WatchOptions$Mutation$SubmitCEOProfile({
    String? operationName,
    required Variables$Mutation$SubmitCEOProfile variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitCEOProfile? typedOptimisticResult,
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
          document: documentNodeMutationSubmitCEOProfile,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SubmitCEOProfile,
        );
}

extension ClientExtension$Mutation$SubmitCEOProfile on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SubmitCEOProfile>>
      mutate$SubmitCEOProfile(
              Options$Mutation$SubmitCEOProfile options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$SubmitCEOProfile>
      watchMutation$SubmitCEOProfile(
              WatchOptions$Mutation$SubmitCEOProfile options) =>
          this.watchMutation(options);
}

class Mutation$SubmitCEOProfile$HookResult {
  Mutation$SubmitCEOProfile$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SubmitCEOProfile runMutation;

  final graphql.QueryResult<Mutation$SubmitCEOProfile> result;
}

Mutation$SubmitCEOProfile$HookResult useMutation$SubmitCEOProfile(
    [WidgetOptions$Mutation$SubmitCEOProfile? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$SubmitCEOProfile());
  return Mutation$SubmitCEOProfile$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SubmitCEOProfile>
    useWatchMutation$SubmitCEOProfile(
            WatchOptions$Mutation$SubmitCEOProfile options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SubmitCEOProfile
    extends graphql.MutationOptions<Mutation$SubmitCEOProfile> {
  WidgetOptions$Mutation$SubmitCEOProfile({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitCEOProfile? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SubmitCEOProfile? onCompleted,
    graphql.OnMutationUpdate<Mutation$SubmitCEOProfile>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SubmitCEOProfile(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSubmitCEOProfile,
          parserFn: _parserFn$Mutation$SubmitCEOProfile,
        );

  final OnMutationCompleted$Mutation$SubmitCEOProfile? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SubmitCEOProfile
    = graphql.MultiSourceResult<Mutation$SubmitCEOProfile> Function(
  Variables$Mutation$SubmitCEOProfile, {
  Object? optimisticResult,
  Mutation$SubmitCEOProfile? typedOptimisticResult,
});
typedef Builder$Mutation$SubmitCEOProfile = widgets.Widget Function(
  RunMutation$Mutation$SubmitCEOProfile,
  graphql.QueryResult<Mutation$SubmitCEOProfile>?,
);

class Mutation$SubmitCEOProfile$Widget
    extends graphql_flutter.Mutation<Mutation$SubmitCEOProfile> {
  Mutation$SubmitCEOProfile$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SubmitCEOProfile? options,
    required Builder$Mutation$SubmitCEOProfile builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SubmitCEOProfile(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$SubmitCEOProfile$createCeoProfileSubmission {
  Mutation$SubmitCEOProfile$createCeoProfileSubmission({
    this.success,
    this.errors,
    this.submission,
    this.$__typename = 'CreateCEOProfileSubmissionMutation',
  });

  factory Mutation$SubmitCEOProfile$createCeoProfileSubmission.fromJson(
      Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$errors = json['errors'];
    final l$submission = json['submission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitCEOProfile$createCeoProfileSubmission(
      success: (l$success as bool?),
      errors: (l$errors as List<dynamic>?)?.map((e) => (e as String?)).toList(),
      submission: l$submission == null
          ? null
          : Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission
              .fromJson((l$submission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? success;

  final List<String?>? errors;

  final Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission?
      submission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$errors = errors;
    _resultData['errors'] = l$errors?.map((e) => e).toList();
    final l$submission = submission;
    _resultData['submission'] = l$submission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$errors = errors;
    final l$submission = submission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$success,
      l$errors == null ? null : Object.hashAll(l$errors.map((v) => v)),
      l$submission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SubmitCEOProfile$createCeoProfileSubmission) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$errors = errors;
    final lOther$errors = other.errors;
    if (l$errors != null && lOther$errors != null) {
      if (l$errors.length != lOther$errors.length) {
        return false;
      }
      for (int i = 0; i < l$errors.length; i++) {
        final l$errors$entry = l$errors[i];
        final lOther$errors$entry = lOther$errors[i];
        if (l$errors$entry != lOther$errors$entry) {
          return false;
        }
      }
    } else if (l$errors != lOther$errors) {
      return false;
    }
    final l$submission = submission;
    final lOther$submission = other.submission;
    if (l$submission != lOther$submission) {
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

extension UtilityExtension$Mutation$SubmitCEOProfile$createCeoProfileSubmission
    on Mutation$SubmitCEOProfile$createCeoProfileSubmission {
  CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission<
          Mutation$SubmitCEOProfile$createCeoProfileSubmission>
      get copyWith =>
          CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission<
    TRes> {
  factory CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission(
    Mutation$SubmitCEOProfile$createCeoProfileSubmission instance,
    TRes Function(Mutation$SubmitCEOProfile$createCeoProfileSubmission) then,
  ) = _CopyWithImpl$Mutation$SubmitCEOProfile$createCeoProfileSubmission;

  factory CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitCEOProfile$createCeoProfileSubmission;

  TRes call({
    bool? success,
    List<String?>? errors,
    Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission? submission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission<TRes>
      get submission;
}

class _CopyWithImpl$Mutation$SubmitCEOProfile$createCeoProfileSubmission<TRes>
    implements
        CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission<TRes> {
  _CopyWithImpl$Mutation$SubmitCEOProfile$createCeoProfileSubmission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitCEOProfile$createCeoProfileSubmission _instance;

  final TRes Function(Mutation$SubmitCEOProfile$createCeoProfileSubmission)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? errors = _undefined,
    Object? submission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitCEOProfile$createCeoProfileSubmission(
        success: success == _undefined ? _instance.success : (success as bool?),
        errors: errors == _undefined
            ? _instance.errors
            : (errors as List<String?>?),
        submission: submission == _undefined
            ? _instance.submission
            : (submission
                as Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission<TRes>
      get submission {
    final local$submission = _instance.submission;
    return local$submission == null
        ? CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission
            .stub(_then(_instance))
        : CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission(
            local$submission, (e) => call(submission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitCEOProfile$createCeoProfileSubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission<TRes> {
  _CopyWithStubImpl$Mutation$SubmitCEOProfile$createCeoProfileSubmission(
      this._res);

  TRes _res;

  call({
    bool? success,
    List<String?>? errors,
    Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission? submission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission<TRes>
      get submission =>
          CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission
              .stub(_res);
}

class Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission {
  Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission({
    required this.id,
    required this.name,
    required this.numberOfYearsAssociated,
    required this.qualification,
    required this.totalYearsOfExperience,
    required this.typeOfExperience,
    required this.yearlySubmission,
    this.$__typename = 'CEOProfileSubmissionNode',
  });

  factory Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$numberOfYearsAssociated = json['numberOfYearsAssociated'];
    final l$qualification = json['qualification'];
    final l$totalYearsOfExperience = json['totalYearsOfExperience'];
    final l$typeOfExperience = json['typeOfExperience'];
    final l$yearlySubmission = json['yearlySubmission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission(
      id: (l$id as String),
      name: (l$name as String),
      numberOfYearsAssociated: (l$numberOfYearsAssociated as int),
      qualification: (l$qualification as String),
      totalYearsOfExperience: (l$totalYearsOfExperience as int),
      typeOfExperience:
          fromJson$Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices(
              (l$typeOfExperience as String)),
      yearlySubmission:
          Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission
              .fromJson((l$yearlySubmission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String name;

  final int numberOfYearsAssociated;

  final String qualification;

  final int totalYearsOfExperience;

  final Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices typeOfExperience;

  final Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission
      yearlySubmission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$name = name;
    _resultData['name'] = l$name;
    final l$numberOfYearsAssociated = numberOfYearsAssociated;
    _resultData['numberOfYearsAssociated'] = l$numberOfYearsAssociated;
    final l$qualification = qualification;
    _resultData['qualification'] = l$qualification;
    final l$totalYearsOfExperience = totalYearsOfExperience;
    _resultData['totalYearsOfExperience'] = l$totalYearsOfExperience;
    final l$typeOfExperience = typeOfExperience;
    _resultData['typeOfExperience'] =
        toJson$Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices(
            l$typeOfExperience);
    final l$yearlySubmission = yearlySubmission;
    _resultData['yearlySubmission'] = l$yearlySubmission.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$name = name;
    final l$numberOfYearsAssociated = numberOfYearsAssociated;
    final l$qualification = qualification;
    final l$totalYearsOfExperience = totalYearsOfExperience;
    final l$typeOfExperience = typeOfExperience;
    final l$yearlySubmission = yearlySubmission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$name,
      l$numberOfYearsAssociated,
      l$qualification,
      l$totalYearsOfExperience,
      l$typeOfExperience,
      l$yearlySubmission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission) ||
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
    final l$numberOfYearsAssociated = numberOfYearsAssociated;
    final lOther$numberOfYearsAssociated = other.numberOfYearsAssociated;
    if (l$numberOfYearsAssociated != lOther$numberOfYearsAssociated) {
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
    final l$yearlySubmission = yearlySubmission;
    final lOther$yearlySubmission = other.yearlySubmission;
    if (l$yearlySubmission != lOther$yearlySubmission) {
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

extension UtilityExtension$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission
    on Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission {
  CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission<
          Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission>
      get copyWith =>
          CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission<
    TRes> {
  factory CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission(
    Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission instance,
    TRes Function(
            Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission)
        then,
  ) = _CopyWithImpl$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission;

  factory CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission;

  TRes call({
    String? id,
    String? name,
    int? numberOfYearsAssociated,
    String? qualification,
    int? totalYearsOfExperience,
    Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices? typeOfExperience,
    Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission?
        yearlySubmission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission<
      TRes> get yearlySubmission;
}

class _CopyWithImpl$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission<
        TRes>
    implements
        CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission<
            TRes> {
  _CopyWithImpl$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission
      _instance;

  final TRes Function(
      Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? numberOfYearsAssociated = _undefined,
    Object? qualification = _undefined,
    Object? totalYearsOfExperience = _undefined,
    Object? typeOfExperience = _undefined,
    Object? yearlySubmission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        numberOfYearsAssociated: numberOfYearsAssociated == _undefined ||
                numberOfYearsAssociated == null
            ? _instance.numberOfYearsAssociated
            : (numberOfYearsAssociated as int),
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
        yearlySubmission: yearlySubmission == _undefined ||
                yearlySubmission == null
            ? _instance.yearlySubmission
            : (yearlySubmission
                as Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission<
      TRes> get yearlySubmission {
    final local$yearlySubmission = _instance.yearlySubmission;
    return CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission(
        local$yearlySubmission, (e) => call(yearlySubmission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission<
        TRes>
    implements
        CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission(
      this._res);

  TRes _res;

  call({
    String? id,
    String? name,
    int? numberOfYearsAssociated,
    String? qualification,
    int? totalYearsOfExperience,
    Enum$FpoCEOProfileSubmissionTypeOfExperienceChoices? typeOfExperience,
    Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission?
        yearlySubmission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission<
          TRes>
      get yearlySubmission =>
          CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission
              .stub(_res);
}

class Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission {
  Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission({
    required this.id,
    required this.financialYear,
    required this.status,
    this.$__typename = 'YearlySubmissionNode',
  });

  factory Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$financialYear = json['financialYear'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission(
      id: (l$id as String),
      financialYear: (l$financialYear as String),
      status:
          fromJson$Enum$FpoYearlySubmissionStatusChoices((l$status as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String financialYear;

  final Enum$FpoYearlySubmissionStatusChoices status;

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
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$financialYear = financialYear;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$financialYear,
      l$status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission
    on Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission {
  CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission<
          Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission>
      get copyWith =>
          CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission<
    TRes> {
  factory CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission(
    Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission
        instance,
    TRes Function(
            Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission)
        then,
  ) = _CopyWithImpl$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission;

  factory CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission;

  TRes call({
    String? id,
    String? financialYear,
    Enum$FpoYearlySubmissionStatusChoices? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission<
            TRes> {
  _CopyWithImpl$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission
      _instance;

  final TRes Function(
          Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? financialYear = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        financialYear: financialYear == _undefined || financialYear == null
            ? _instance.financialYear
            : (financialYear as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$FpoYearlySubmissionStatusChoices),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitCEOProfile$createCeoProfileSubmission$submission$yearlySubmission(
      this._res);

  TRes _res;

  call({
    String? id,
    String? financialYear,
    Enum$FpoYearlySubmissionStatusChoices? status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$SubmitBoardProfiles {
  factory Variables$Mutation$SubmitBoardProfiles({
    required List<Input$BoardDirectorProfileInput?> directors,
    required String financialYear,
    required String fpoId,
  }) =>
      Variables$Mutation$SubmitBoardProfiles._({
        r'directors': directors,
        r'financialYear': financialYear,
        r'fpoId': fpoId,
      });

  Variables$Mutation$SubmitBoardProfiles._(this._$data);

  factory Variables$Mutation$SubmitBoardProfiles.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$directors = data['directors'];
    result$data['directors'] = (l$directors as List<dynamic>)
        .map((e) => e == null
            ? null
            : Input$BoardDirectorProfileInput.fromJson(
                (e as Map<String, dynamic>)))
        .toList();
    final l$financialYear = data['financialYear'];
    result$data['financialYear'] = (l$financialYear as String);
    final l$fpoId = data['fpoId'];
    result$data['fpoId'] = (l$fpoId as String);
    return Variables$Mutation$SubmitBoardProfiles._(result$data);
  }

  Map<String, dynamic> _$data;

  List<Input$BoardDirectorProfileInput?> get directors =>
      (_$data['directors'] as List<Input$BoardDirectorProfileInput?>);

  String get financialYear => (_$data['financialYear'] as String);

  String get fpoId => (_$data['fpoId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$directors = directors;
    result$data['directors'] = l$directors.map((e) => e?.toJson()).toList();
    final l$financialYear = financialYear;
    result$data['financialYear'] = l$financialYear;
    final l$fpoId = fpoId;
    result$data['fpoId'] = l$fpoId;
    return result$data;
  }

  CopyWith$Variables$Mutation$SubmitBoardProfiles<
          Variables$Mutation$SubmitBoardProfiles>
      get copyWith => CopyWith$Variables$Mutation$SubmitBoardProfiles(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$SubmitBoardProfiles) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$directors = directors;
    final lOther$directors = other.directors;
    if (l$directors.length != lOther$directors.length) {
      return false;
    }
    for (int i = 0; i < l$directors.length; i++) {
      final l$directors$entry = l$directors[i];
      final lOther$directors$entry = lOther$directors[i];
      if (l$directors$entry != lOther$directors$entry) {
        return false;
      }
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
    final l$directors = directors;
    final l$financialYear = financialYear;
    final l$fpoId = fpoId;
    return Object.hashAll([
      Object.hashAll(l$directors.map((v) => v)),
      l$financialYear,
      l$fpoId,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$SubmitBoardProfiles<TRes> {
  factory CopyWith$Variables$Mutation$SubmitBoardProfiles(
    Variables$Mutation$SubmitBoardProfiles instance,
    TRes Function(Variables$Mutation$SubmitBoardProfiles) then,
  ) = _CopyWithImpl$Variables$Mutation$SubmitBoardProfiles;

  factory CopyWith$Variables$Mutation$SubmitBoardProfiles.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SubmitBoardProfiles;

  TRes call({
    List<Input$BoardDirectorProfileInput?>? directors,
    String? financialYear,
    String? fpoId,
  });
}

class _CopyWithImpl$Variables$Mutation$SubmitBoardProfiles<TRes>
    implements CopyWith$Variables$Mutation$SubmitBoardProfiles<TRes> {
  _CopyWithImpl$Variables$Mutation$SubmitBoardProfiles(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SubmitBoardProfiles _instance;

  final TRes Function(Variables$Mutation$SubmitBoardProfiles) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? directors = _undefined,
    Object? financialYear = _undefined,
    Object? fpoId = _undefined,
  }) =>
      _then(Variables$Mutation$SubmitBoardProfiles._({
        ..._instance._$data,
        if (directors != _undefined && directors != null)
          'directors': (directors as List<Input$BoardDirectorProfileInput?>),
        if (financialYear != _undefined && financialYear != null)
          'financialYear': (financialYear as String),
        if (fpoId != _undefined && fpoId != null) 'fpoId': (fpoId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SubmitBoardProfiles<TRes>
    implements CopyWith$Variables$Mutation$SubmitBoardProfiles<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SubmitBoardProfiles(this._res);

  TRes _res;

  call({
    List<Input$BoardDirectorProfileInput?>? directors,
    String? financialYear,
    String? fpoId,
  }) =>
      _res;
}

class Mutation$SubmitBoardProfiles {
  Mutation$SubmitBoardProfiles({
    this.createBoardDirectorProfiles,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SubmitBoardProfiles.fromJson(Map<String, dynamic> json) {
    final l$createBoardDirectorProfiles = json['createBoardDirectorProfiles'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitBoardProfiles(
      createBoardDirectorProfiles: l$createBoardDirectorProfiles == null
          ? null
          : Mutation$SubmitBoardProfiles$createBoardDirectorProfiles.fromJson(
              (l$createBoardDirectorProfiles as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SubmitBoardProfiles$createBoardDirectorProfiles?
      createBoardDirectorProfiles;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createBoardDirectorProfiles = createBoardDirectorProfiles;
    _resultData['createBoardDirectorProfiles'] =
        l$createBoardDirectorProfiles?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createBoardDirectorProfiles = createBoardDirectorProfiles;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createBoardDirectorProfiles,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SubmitBoardProfiles) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createBoardDirectorProfiles = createBoardDirectorProfiles;
    final lOther$createBoardDirectorProfiles =
        other.createBoardDirectorProfiles;
    if (l$createBoardDirectorProfiles != lOther$createBoardDirectorProfiles) {
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

extension UtilityExtension$Mutation$SubmitBoardProfiles
    on Mutation$SubmitBoardProfiles {
  CopyWith$Mutation$SubmitBoardProfiles<Mutation$SubmitBoardProfiles>
      get copyWith => CopyWith$Mutation$SubmitBoardProfiles(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitBoardProfiles<TRes> {
  factory CopyWith$Mutation$SubmitBoardProfiles(
    Mutation$SubmitBoardProfiles instance,
    TRes Function(Mutation$SubmitBoardProfiles) then,
  ) = _CopyWithImpl$Mutation$SubmitBoardProfiles;

  factory CopyWith$Mutation$SubmitBoardProfiles.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SubmitBoardProfiles;

  TRes call({
    Mutation$SubmitBoardProfiles$createBoardDirectorProfiles?
        createBoardDirectorProfiles,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles<TRes>
      get createBoardDirectorProfiles;
}

class _CopyWithImpl$Mutation$SubmitBoardProfiles<TRes>
    implements CopyWith$Mutation$SubmitBoardProfiles<TRes> {
  _CopyWithImpl$Mutation$SubmitBoardProfiles(
    this._instance,
    this._then,
  );

  final Mutation$SubmitBoardProfiles _instance;

  final TRes Function(Mutation$SubmitBoardProfiles) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createBoardDirectorProfiles = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitBoardProfiles(
        createBoardDirectorProfiles: createBoardDirectorProfiles == _undefined
            ? _instance.createBoardDirectorProfiles
            : (createBoardDirectorProfiles
                as Mutation$SubmitBoardProfiles$createBoardDirectorProfiles?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles<TRes>
      get createBoardDirectorProfiles {
    final local$createBoardDirectorProfiles =
        _instance.createBoardDirectorProfiles;
    return local$createBoardDirectorProfiles == null
        ? CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles
            .stub(_then(_instance))
        : CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles(
            local$createBoardDirectorProfiles,
            (e) => call(createBoardDirectorProfiles: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitBoardProfiles<TRes>
    implements CopyWith$Mutation$SubmitBoardProfiles<TRes> {
  _CopyWithStubImpl$Mutation$SubmitBoardProfiles(this._res);

  TRes _res;

  call({
    Mutation$SubmitBoardProfiles$createBoardDirectorProfiles?
        createBoardDirectorProfiles,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles<TRes>
      get createBoardDirectorProfiles =>
          CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles
              .stub(_res);
}

const documentNodeMutationSubmitBoardProfiles = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SubmitBoardProfiles'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'directors')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'BoardDirectorProfileInput'),
            isNonNull: false,
          ),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
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
        name: NameNode(value: 'createBoardDirectorProfiles'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'directors'),
            value: VariableNode(name: NameNode(value: 'directors')),
          ),
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
            name: NameNode(value: 'success'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'errors'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'directors'),
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
]);
Mutation$SubmitBoardProfiles _parserFn$Mutation$SubmitBoardProfiles(
        Map<String, dynamic> data) =>
    Mutation$SubmitBoardProfiles.fromJson(data);
typedef OnMutationCompleted$Mutation$SubmitBoardProfiles = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$SubmitBoardProfiles?,
);

class Options$Mutation$SubmitBoardProfiles
    extends graphql.MutationOptions<Mutation$SubmitBoardProfiles> {
  Options$Mutation$SubmitBoardProfiles({
    String? operationName,
    required Variables$Mutation$SubmitBoardProfiles variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitBoardProfiles? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SubmitBoardProfiles? onCompleted,
    graphql.OnMutationUpdate<Mutation$SubmitBoardProfiles>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SubmitBoardProfiles(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSubmitBoardProfiles,
          parserFn: _parserFn$Mutation$SubmitBoardProfiles,
        );

  final OnMutationCompleted$Mutation$SubmitBoardProfiles? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SubmitBoardProfiles
    extends graphql.WatchQueryOptions<Mutation$SubmitBoardProfiles> {
  WatchOptions$Mutation$SubmitBoardProfiles({
    String? operationName,
    required Variables$Mutation$SubmitBoardProfiles variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitBoardProfiles? typedOptimisticResult,
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
          document: documentNodeMutationSubmitBoardProfiles,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SubmitBoardProfiles,
        );
}

extension ClientExtension$Mutation$SubmitBoardProfiles
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SubmitBoardProfiles>>
      mutate$SubmitBoardProfiles(
              Options$Mutation$SubmitBoardProfiles options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$SubmitBoardProfiles>
      watchMutation$SubmitBoardProfiles(
              WatchOptions$Mutation$SubmitBoardProfiles options) =>
          this.watchMutation(options);
}

class Mutation$SubmitBoardProfiles$HookResult {
  Mutation$SubmitBoardProfiles$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SubmitBoardProfiles runMutation;

  final graphql.QueryResult<Mutation$SubmitBoardProfiles> result;
}

Mutation$SubmitBoardProfiles$HookResult useMutation$SubmitBoardProfiles(
    [WidgetOptions$Mutation$SubmitBoardProfiles? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$SubmitBoardProfiles());
  return Mutation$SubmitBoardProfiles$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SubmitBoardProfiles>
    useWatchMutation$SubmitBoardProfiles(
            WatchOptions$Mutation$SubmitBoardProfiles options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SubmitBoardProfiles
    extends graphql.MutationOptions<Mutation$SubmitBoardProfiles> {
  WidgetOptions$Mutation$SubmitBoardProfiles({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitBoardProfiles? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SubmitBoardProfiles? onCompleted,
    graphql.OnMutationUpdate<Mutation$SubmitBoardProfiles>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SubmitBoardProfiles(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSubmitBoardProfiles,
          parserFn: _parserFn$Mutation$SubmitBoardProfiles,
        );

  final OnMutationCompleted$Mutation$SubmitBoardProfiles? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SubmitBoardProfiles
    = graphql.MultiSourceResult<Mutation$SubmitBoardProfiles> Function(
  Variables$Mutation$SubmitBoardProfiles, {
  Object? optimisticResult,
  Mutation$SubmitBoardProfiles? typedOptimisticResult,
});
typedef Builder$Mutation$SubmitBoardProfiles = widgets.Widget Function(
  RunMutation$Mutation$SubmitBoardProfiles,
  graphql.QueryResult<Mutation$SubmitBoardProfiles>?,
);

class Mutation$SubmitBoardProfiles$Widget
    extends graphql_flutter.Mutation<Mutation$SubmitBoardProfiles> {
  Mutation$SubmitBoardProfiles$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SubmitBoardProfiles? options,
    required Builder$Mutation$SubmitBoardProfiles builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SubmitBoardProfiles(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$SubmitBoardProfiles$createBoardDirectorProfiles {
  Mutation$SubmitBoardProfiles$createBoardDirectorProfiles({
    this.success,
    this.errors,
    this.directors,
    this.$__typename = 'CreateBoardDirectorProfileMutation',
  });

  factory Mutation$SubmitBoardProfiles$createBoardDirectorProfiles.fromJson(
      Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$errors = json['errors'];
    final l$directors = json['directors'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitBoardProfiles$createBoardDirectorProfiles(
      success: (l$success as bool?),
      errors: (l$errors as List<dynamic>?)?.map((e) => (e as String?)).toList(),
      directors: (l$directors as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? success;

  final List<String?>? errors;

  final List<
          Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors?>?
      directors;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$errors = errors;
    _resultData['errors'] = l$errors?.map((e) => e).toList();
    final l$directors = directors;
    _resultData['directors'] = l$directors?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$errors = errors;
    final l$directors = directors;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$success,
      l$errors == null ? null : Object.hashAll(l$errors.map((v) => v)),
      l$directors == null ? null : Object.hashAll(l$directors.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SubmitBoardProfiles$createBoardDirectorProfiles) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$errors = errors;
    final lOther$errors = other.errors;
    if (l$errors != null && lOther$errors != null) {
      if (l$errors.length != lOther$errors.length) {
        return false;
      }
      for (int i = 0; i < l$errors.length; i++) {
        final l$errors$entry = l$errors[i];
        final lOther$errors$entry = lOther$errors[i];
        if (l$errors$entry != lOther$errors$entry) {
          return false;
        }
      }
    } else if (l$errors != lOther$errors) {
      return false;
    }
    final l$directors = directors;
    final lOther$directors = other.directors;
    if (l$directors != null && lOther$directors != null) {
      if (l$directors.length != lOther$directors.length) {
        return false;
      }
      for (int i = 0; i < l$directors.length; i++) {
        final l$directors$entry = l$directors[i];
        final lOther$directors$entry = lOther$directors[i];
        if (l$directors$entry != lOther$directors$entry) {
          return false;
        }
      }
    } else if (l$directors != lOther$directors) {
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

extension UtilityExtension$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles
    on Mutation$SubmitBoardProfiles$createBoardDirectorProfiles {
  CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles<
          Mutation$SubmitBoardProfiles$createBoardDirectorProfiles>
      get copyWith =>
          CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles<
    TRes> {
  factory CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles(
    Mutation$SubmitBoardProfiles$createBoardDirectorProfiles instance,
    TRes Function(Mutation$SubmitBoardProfiles$createBoardDirectorProfiles)
        then,
  ) = _CopyWithImpl$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles;

  factory CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles;

  TRes call({
    bool? success,
    List<String?>? errors,
    List<Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors?>?
        directors,
    String? $__typename,
  });
  TRes directors(
      Iterable<Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors?>? Function(
              Iterable<
                  CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors<
                      Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors>?>?)
          _fn);
}

class _CopyWithImpl$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles<
        TRes>
    implements
        CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles<
            TRes> {
  _CopyWithImpl$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles(
    this._instance,
    this._then,
  );

  final Mutation$SubmitBoardProfiles$createBoardDirectorProfiles _instance;

  final TRes Function(Mutation$SubmitBoardProfiles$createBoardDirectorProfiles)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? errors = _undefined,
    Object? directors = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitBoardProfiles$createBoardDirectorProfiles(
        success: success == _undefined ? _instance.success : (success as bool?),
        errors: errors == _undefined
            ? _instance.errors
            : (errors as List<String?>?),
        directors: directors == _undefined
            ? _instance.directors
            : (directors as List<
                Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  TRes directors(
          Iterable<Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors?>? Function(
                  Iterable<
                      CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors<
                          Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors>?>?)
              _fn) =>
      call(
          directors: _fn(_instance.directors?.map((e) => e == null
              ? null
              : CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles<
        TRes>
    implements
        CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles(
      this._res);

  TRes _res;

  call({
    bool? success,
    List<String?>? errors,
    List<Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors?>?
        directors,
    String? $__typename,
  }) =>
      _res;

  directors(_fn) => _res;
}

class Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors {
  Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors({
    required this.id,
    required this.name,
    required this.educationalQualification,
    required this.totalYearsOfExperience,
    required this.typeOfExperience,
    this.$__typename = 'BoardDirectorProfileNode',
  });

  factory Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$name = json['name'];
    final l$educationalQualification = json['educationalQualification'];
    final l$totalYearsOfExperience = json['totalYearsOfExperience'];
    final l$typeOfExperience = json['typeOfExperience'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors(
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
            is Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors) ||
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

extension UtilityExtension$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors
    on Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors {
  CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors<
          Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors>
      get copyWith =>
          CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors<
    TRes> {
  factory CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors(
    Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors instance,
    TRes Function(
            Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors)
        then,
  ) = _CopyWithImpl$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors;

  factory CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors;

  TRes call({
    String? id,
    String? name,
    String? educationalQualification,
    int? totalYearsOfExperience,
    Enum$FpoBoardDirectorProfileTypeOfExperienceChoices? typeOfExperience,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors<
        TRes>
    implements
        CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors<
            TRes> {
  _CopyWithImpl$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors(
    this._instance,
    this._then,
  );

  final Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors
      _instance;

  final TRes Function(
      Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? name = _undefined,
    Object? educationalQualification = _undefined,
    Object? totalYearsOfExperience = _undefined,
    Object? typeOfExperience = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors(
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

class _CopyWithStubImpl$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors<
        TRes>
    implements
        CopyWith$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitBoardProfiles$createBoardDirectorProfiles$directors(
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

class Variables$Mutation$SubmitBusinessOperations {
  factory Variables$Mutation$SubmitBusinessOperations({
    required Input$BusinessOperationsSubmissionInput input,
    required String financialYear,
    required String fpoId,
  }) =>
      Variables$Mutation$SubmitBusinessOperations._({
        r'input': input,
        r'financialYear': financialYear,
        r'fpoId': fpoId,
      });

  Variables$Mutation$SubmitBusinessOperations._(this._$data);

  factory Variables$Mutation$SubmitBusinessOperations.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$BusinessOperationsSubmissionInput.fromJson(
        (l$input as Map<String, dynamic>));
    final l$financialYear = data['financialYear'];
    result$data['financialYear'] = (l$financialYear as String);
    final l$fpoId = data['fpoId'];
    result$data['fpoId'] = (l$fpoId as String);
    return Variables$Mutation$SubmitBusinessOperations._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$BusinessOperationsSubmissionInput get input =>
      (_$data['input'] as Input$BusinessOperationsSubmissionInput);

  String get financialYear => (_$data['financialYear'] as String);

  String get fpoId => (_$data['fpoId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    final l$financialYear = financialYear;
    result$data['financialYear'] = l$financialYear;
    final l$fpoId = fpoId;
    result$data['fpoId'] = l$fpoId;
    return result$data;
  }

  CopyWith$Variables$Mutation$SubmitBusinessOperations<
          Variables$Mutation$SubmitBusinessOperations>
      get copyWith => CopyWith$Variables$Mutation$SubmitBusinessOperations(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$SubmitBusinessOperations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
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
    final l$input = input;
    final l$financialYear = financialYear;
    final l$fpoId = fpoId;
    return Object.hashAll([
      l$input,
      l$financialYear,
      l$fpoId,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$SubmitBusinessOperations<TRes> {
  factory CopyWith$Variables$Mutation$SubmitBusinessOperations(
    Variables$Mutation$SubmitBusinessOperations instance,
    TRes Function(Variables$Mutation$SubmitBusinessOperations) then,
  ) = _CopyWithImpl$Variables$Mutation$SubmitBusinessOperations;

  factory CopyWith$Variables$Mutation$SubmitBusinessOperations.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SubmitBusinessOperations;

  TRes call({
    Input$BusinessOperationsSubmissionInput? input,
    String? financialYear,
    String? fpoId,
  });
}

class _CopyWithImpl$Variables$Mutation$SubmitBusinessOperations<TRes>
    implements CopyWith$Variables$Mutation$SubmitBusinessOperations<TRes> {
  _CopyWithImpl$Variables$Mutation$SubmitBusinessOperations(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SubmitBusinessOperations _instance;

  final TRes Function(Variables$Mutation$SubmitBusinessOperations) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? input = _undefined,
    Object? financialYear = _undefined,
    Object? fpoId = _undefined,
  }) =>
      _then(Variables$Mutation$SubmitBusinessOperations._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$BusinessOperationsSubmissionInput),
        if (financialYear != _undefined && financialYear != null)
          'financialYear': (financialYear as String),
        if (fpoId != _undefined && fpoId != null) 'fpoId': (fpoId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SubmitBusinessOperations<TRes>
    implements CopyWith$Variables$Mutation$SubmitBusinessOperations<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SubmitBusinessOperations(this._res);

  TRes _res;

  call({
    Input$BusinessOperationsSubmissionInput? input,
    String? financialYear,
    String? fpoId,
  }) =>
      _res;
}

class Mutation$SubmitBusinessOperations {
  Mutation$SubmitBusinessOperations({
    this.createBusinessOperationsSubmission,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SubmitBusinessOperations.fromJson(
      Map<String, dynamic> json) {
    final l$createBusinessOperationsSubmission =
        json['createBusinessOperationsSubmission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitBusinessOperations(
      createBusinessOperationsSubmission: l$createBusinessOperationsSubmission ==
              null
          ? null
          : Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission
              .fromJson((l$createBusinessOperationsSubmission
                  as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission?
      createBusinessOperationsSubmission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createBusinessOperationsSubmission =
        createBusinessOperationsSubmission;
    _resultData['createBusinessOperationsSubmission'] =
        l$createBusinessOperationsSubmission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createBusinessOperationsSubmission =
        createBusinessOperationsSubmission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createBusinessOperationsSubmission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SubmitBusinessOperations) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createBusinessOperationsSubmission =
        createBusinessOperationsSubmission;
    final lOther$createBusinessOperationsSubmission =
        other.createBusinessOperationsSubmission;
    if (l$createBusinessOperationsSubmission !=
        lOther$createBusinessOperationsSubmission) {
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

extension UtilityExtension$Mutation$SubmitBusinessOperations
    on Mutation$SubmitBusinessOperations {
  CopyWith$Mutation$SubmitBusinessOperations<Mutation$SubmitBusinessOperations>
      get copyWith => CopyWith$Mutation$SubmitBusinessOperations(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitBusinessOperations<TRes> {
  factory CopyWith$Mutation$SubmitBusinessOperations(
    Mutation$SubmitBusinessOperations instance,
    TRes Function(Mutation$SubmitBusinessOperations) then,
  ) = _CopyWithImpl$Mutation$SubmitBusinessOperations;

  factory CopyWith$Mutation$SubmitBusinessOperations.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SubmitBusinessOperations;

  TRes call({
    Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission?
        createBusinessOperationsSubmission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission<
      TRes> get createBusinessOperationsSubmission;
}

class _CopyWithImpl$Mutation$SubmitBusinessOperations<TRes>
    implements CopyWith$Mutation$SubmitBusinessOperations<TRes> {
  _CopyWithImpl$Mutation$SubmitBusinessOperations(
    this._instance,
    this._then,
  );

  final Mutation$SubmitBusinessOperations _instance;

  final TRes Function(Mutation$SubmitBusinessOperations) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createBusinessOperationsSubmission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitBusinessOperations(
        createBusinessOperationsSubmission: createBusinessOperationsSubmission ==
                _undefined
            ? _instance.createBusinessOperationsSubmission
            : (createBusinessOperationsSubmission
                as Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission<
      TRes> get createBusinessOperationsSubmission {
    final local$createBusinessOperationsSubmission =
        _instance.createBusinessOperationsSubmission;
    return local$createBusinessOperationsSubmission == null
        ? CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission
            .stub(_then(_instance))
        : CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission(
            local$createBusinessOperationsSubmission,
            (e) => call(createBusinessOperationsSubmission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitBusinessOperations<TRes>
    implements CopyWith$Mutation$SubmitBusinessOperations<TRes> {
  _CopyWithStubImpl$Mutation$SubmitBusinessOperations(this._res);

  TRes _res;

  call({
    Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission?
        createBusinessOperationsSubmission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission<
          TRes>
      get createBusinessOperationsSubmission =>
          CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission
              .stub(_res);
}

const documentNodeMutationSubmitBusinessOperations = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SubmitBusinessOperations'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'BusinessOperationsSubmissionInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
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
        name: NameNode(value: 'createBusinessOperationsSubmission'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          ),
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
            name: NameNode(value: 'success'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'errors'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'submission'),
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
                name: NameNode(value: 'yearlySubmission'),
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
Mutation$SubmitBusinessOperations _parserFn$Mutation$SubmitBusinessOperations(
        Map<String, dynamic> data) =>
    Mutation$SubmitBusinessOperations.fromJson(data);
typedef OnMutationCompleted$Mutation$SubmitBusinessOperations = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$SubmitBusinessOperations?,
);

class Options$Mutation$SubmitBusinessOperations
    extends graphql.MutationOptions<Mutation$SubmitBusinessOperations> {
  Options$Mutation$SubmitBusinessOperations({
    String? operationName,
    required Variables$Mutation$SubmitBusinessOperations variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitBusinessOperations? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SubmitBusinessOperations? onCompleted,
    graphql.OnMutationUpdate<Mutation$SubmitBusinessOperations>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SubmitBusinessOperations(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSubmitBusinessOperations,
          parserFn: _parserFn$Mutation$SubmitBusinessOperations,
        );

  final OnMutationCompleted$Mutation$SubmitBusinessOperations?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SubmitBusinessOperations
    extends graphql.WatchQueryOptions<Mutation$SubmitBusinessOperations> {
  WatchOptions$Mutation$SubmitBusinessOperations({
    String? operationName,
    required Variables$Mutation$SubmitBusinessOperations variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitBusinessOperations? typedOptimisticResult,
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
          document: documentNodeMutationSubmitBusinessOperations,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SubmitBusinessOperations,
        );
}

extension ClientExtension$Mutation$SubmitBusinessOperations
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SubmitBusinessOperations>>
      mutate$SubmitBusinessOperations(
              Options$Mutation$SubmitBusinessOperations options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$SubmitBusinessOperations>
      watchMutation$SubmitBusinessOperations(
              WatchOptions$Mutation$SubmitBusinessOperations options) =>
          this.watchMutation(options);
}

class Mutation$SubmitBusinessOperations$HookResult {
  Mutation$SubmitBusinessOperations$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SubmitBusinessOperations runMutation;

  final graphql.QueryResult<Mutation$SubmitBusinessOperations> result;
}

Mutation$SubmitBusinessOperations$HookResult
    useMutation$SubmitBusinessOperations(
        [WidgetOptions$Mutation$SubmitBusinessOperations? options]) {
  final result = graphql_flutter.useMutation(
      options ?? WidgetOptions$Mutation$SubmitBusinessOperations());
  return Mutation$SubmitBusinessOperations$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SubmitBusinessOperations>
    useWatchMutation$SubmitBusinessOperations(
            WatchOptions$Mutation$SubmitBusinessOperations options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SubmitBusinessOperations
    extends graphql.MutationOptions<Mutation$SubmitBusinessOperations> {
  WidgetOptions$Mutation$SubmitBusinessOperations({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitBusinessOperations? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SubmitBusinessOperations? onCompleted,
    graphql.OnMutationUpdate<Mutation$SubmitBusinessOperations>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SubmitBusinessOperations(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSubmitBusinessOperations,
          parserFn: _parserFn$Mutation$SubmitBusinessOperations,
        );

  final OnMutationCompleted$Mutation$SubmitBusinessOperations?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SubmitBusinessOperations
    = graphql.MultiSourceResult<Mutation$SubmitBusinessOperations> Function(
  Variables$Mutation$SubmitBusinessOperations, {
  Object? optimisticResult,
  Mutation$SubmitBusinessOperations? typedOptimisticResult,
});
typedef Builder$Mutation$SubmitBusinessOperations = widgets.Widget Function(
  RunMutation$Mutation$SubmitBusinessOperations,
  graphql.QueryResult<Mutation$SubmitBusinessOperations>?,
);

class Mutation$SubmitBusinessOperations$Widget
    extends graphql_flutter.Mutation<Mutation$SubmitBusinessOperations> {
  Mutation$SubmitBusinessOperations$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SubmitBusinessOperations? options,
    required Builder$Mutation$SubmitBusinessOperations builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SubmitBusinessOperations(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission {
  Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission({
    this.success,
    this.errors,
    this.submission,
    this.$__typename = 'CreateBusinessOperationsSubmissionMutation',
  });

  factory Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission.fromJson(
      Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$errors = json['errors'];
    final l$submission = json['submission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission(
      success: (l$success as bool?),
      errors: (l$errors as List<dynamic>?)?.map((e) => (e as String?)).toList(),
      submission: l$submission == null
          ? null
          : Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission
              .fromJson((l$submission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? success;

  final List<String?>? errors;

  final Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission?
      submission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$errors = errors;
    _resultData['errors'] = l$errors?.map((e) => e).toList();
    final l$submission = submission;
    _resultData['submission'] = l$submission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$errors = errors;
    final l$submission = submission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$success,
      l$errors == null ? null : Object.hashAll(l$errors.map((v) => v)),
      l$submission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$errors = errors;
    final lOther$errors = other.errors;
    if (l$errors != null && lOther$errors != null) {
      if (l$errors.length != lOther$errors.length) {
        return false;
      }
      for (int i = 0; i < l$errors.length; i++) {
        final l$errors$entry = l$errors[i];
        final lOther$errors$entry = lOther$errors[i];
        if (l$errors$entry != lOther$errors$entry) {
          return false;
        }
      }
    } else if (l$errors != lOther$errors) {
      return false;
    }
    final l$submission = submission;
    final lOther$submission = other.submission;
    if (l$submission != lOther$submission) {
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

extension UtilityExtension$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission
    on Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission {
  CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission<
          Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission>
      get copyWith =>
          CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission<
    TRes> {
  factory CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission(
    Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission
        instance,
    TRes Function(
            Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission)
        then,
  ) = _CopyWithImpl$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission;

  factory CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission;

  TRes call({
    bool? success,
    List<String?>? errors,
    Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission?
        submission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission<
      TRes> get submission;
}

class _CopyWithImpl$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission<
            TRes> {
  _CopyWithImpl$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission
      _instance;

  final TRes Function(
          Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? errors = _undefined,
    Object? submission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission(
        success: success == _undefined ? _instance.success : (success as bool?),
        errors: errors == _undefined
            ? _instance.errors
            : (errors as List<String?>?),
        submission: submission == _undefined
            ? _instance.submission
            : (submission
                as Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission<
      TRes> get submission {
    final local$submission = _instance.submission;
    return local$submission == null
        ? CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission
            .stub(_then(_instance))
        : CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission(
            local$submission, (e) => call(submission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission(
      this._res);

  TRes _res;

  call({
    bool? success,
    List<String?>? errors,
    Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission?
        submission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission<
          TRes>
      get submission =>
          CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission
              .stub(_res);
}

class Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission {
  Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission({
    required this.id,
    required this.priceVolatilityOfProducts,
    required this.yearlySubmission,
    this.$__typename = 'BusinessOperationsSubmissionNode',
  });

  factory Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$priceVolatilityOfProducts = json['priceVolatilityOfProducts'];
    final l$yearlySubmission = json['yearlySubmission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission(
      id: (l$id as String),
      priceVolatilityOfProducts:
          fromJson$Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices(
              (l$priceVolatilityOfProducts as String)),
      yearlySubmission:
          Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission
              .fromJson((l$yearlySubmission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices
      priceVolatilityOfProducts;

  final Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission
      yearlySubmission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$priceVolatilityOfProducts = priceVolatilityOfProducts;
    _resultData['priceVolatilityOfProducts'] =
        toJson$Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices(
            l$priceVolatilityOfProducts);
    final l$yearlySubmission = yearlySubmission;
    _resultData['yearlySubmission'] = l$yearlySubmission.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$priceVolatilityOfProducts = priceVolatilityOfProducts;
    final l$yearlySubmission = yearlySubmission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$priceVolatilityOfProducts,
      l$yearlySubmission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission) ||
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
    final l$yearlySubmission = yearlySubmission;
    final lOther$yearlySubmission = other.yearlySubmission;
    if (l$yearlySubmission != lOther$yearlySubmission) {
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

extension UtilityExtension$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission
    on Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission {
  CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission<
          Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission>
      get copyWith =>
          CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission<
    TRes> {
  factory CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission(
    Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission
        instance,
    TRes Function(
            Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission)
        then,
  ) = _CopyWithImpl$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission;

  factory CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission;

  TRes call({
    String? id,
    Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices?
        priceVolatilityOfProducts,
    Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission?
        yearlySubmission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission<
      TRes> get yearlySubmission;
}

class _CopyWithImpl$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission<
        TRes>
    implements
        CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission<
            TRes> {
  _CopyWithImpl$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission
      _instance;

  final TRes Function(
          Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? priceVolatilityOfProducts = _undefined,
    Object? yearlySubmission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        priceVolatilityOfProducts: priceVolatilityOfProducts == _undefined ||
                priceVolatilityOfProducts == null
            ? _instance.priceVolatilityOfProducts
            : (priceVolatilityOfProducts
                as Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices),
        yearlySubmission: yearlySubmission == _undefined ||
                yearlySubmission == null
            ? _instance.yearlySubmission
            : (yearlySubmission
                as Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission<
      TRes> get yearlySubmission {
    final local$yearlySubmission = _instance.yearlySubmission;
    return CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission(
        local$yearlySubmission, (e) => call(yearlySubmission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission<
        TRes>
    implements
        CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission(
      this._res);

  TRes _res;

  call({
    String? id,
    Enum$FpoBusinessOperationsSubmissionPriceVolatilityOfProductsChoices?
        priceVolatilityOfProducts,
    Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission?
        yearlySubmission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission<
          TRes>
      get yearlySubmission =>
          CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission
              .stub(_res);
}

class Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission {
  Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission({
    required this.id,
    required this.financialYear,
    required this.status,
    this.$__typename = 'YearlySubmissionNode',
  });

  factory Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$financialYear = json['financialYear'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission(
      id: (l$id as String),
      financialYear: (l$financialYear as String),
      status:
          fromJson$Enum$FpoYearlySubmissionStatusChoices((l$status as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String financialYear;

  final Enum$FpoYearlySubmissionStatusChoices status;

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
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$financialYear = financialYear;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$financialYear,
      l$status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission
    on Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission {
  CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission<
          Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission>
      get copyWith =>
          CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission<
    TRes> {
  factory CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission(
    Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission
        instance,
    TRes Function(
            Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission)
        then,
  ) = _CopyWithImpl$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission;

  factory CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission;

  TRes call({
    String? id,
    String? financialYear,
    Enum$FpoYearlySubmissionStatusChoices? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission<
            TRes> {
  _CopyWithImpl$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission
      _instance;

  final TRes Function(
          Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? financialYear = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        financialYear: financialYear == _undefined || financialYear == null
            ? _instance.financialYear
            : (financialYear as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$FpoYearlySubmissionStatusChoices),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitBusinessOperations$createBusinessOperationsSubmission$submission$yearlySubmission(
      this._res);

  TRes _res;

  call({
    String? id,
    String? financialYear,
    Enum$FpoYearlySubmissionStatusChoices? status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$SubmitComplianceDetails {
  factory Variables$Mutation$SubmitComplianceDetails({
    required Input$ComplianceDetailsSubmissionInput input,
    required String financialYear,
    required String fpoId,
  }) =>
      Variables$Mutation$SubmitComplianceDetails._({
        r'input': input,
        r'financialYear': financialYear,
        r'fpoId': fpoId,
      });

  Variables$Mutation$SubmitComplianceDetails._(this._$data);

  factory Variables$Mutation$SubmitComplianceDetails.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$ComplianceDetailsSubmissionInput.fromJson(
        (l$input as Map<String, dynamic>));
    final l$financialYear = data['financialYear'];
    result$data['financialYear'] = (l$financialYear as String);
    final l$fpoId = data['fpoId'];
    result$data['fpoId'] = (l$fpoId as String);
    return Variables$Mutation$SubmitComplianceDetails._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$ComplianceDetailsSubmissionInput get input =>
      (_$data['input'] as Input$ComplianceDetailsSubmissionInput);

  String get financialYear => (_$data['financialYear'] as String);

  String get fpoId => (_$data['fpoId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    final l$financialYear = financialYear;
    result$data['financialYear'] = l$financialYear;
    final l$fpoId = fpoId;
    result$data['fpoId'] = l$fpoId;
    return result$data;
  }

  CopyWith$Variables$Mutation$SubmitComplianceDetails<
          Variables$Mutation$SubmitComplianceDetails>
      get copyWith => CopyWith$Variables$Mutation$SubmitComplianceDetails(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$SubmitComplianceDetails) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
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
    final l$input = input;
    final l$financialYear = financialYear;
    final l$fpoId = fpoId;
    return Object.hashAll([
      l$input,
      l$financialYear,
      l$fpoId,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$SubmitComplianceDetails<TRes> {
  factory CopyWith$Variables$Mutation$SubmitComplianceDetails(
    Variables$Mutation$SubmitComplianceDetails instance,
    TRes Function(Variables$Mutation$SubmitComplianceDetails) then,
  ) = _CopyWithImpl$Variables$Mutation$SubmitComplianceDetails;

  factory CopyWith$Variables$Mutation$SubmitComplianceDetails.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SubmitComplianceDetails;

  TRes call({
    Input$ComplianceDetailsSubmissionInput? input,
    String? financialYear,
    String? fpoId,
  });
}

class _CopyWithImpl$Variables$Mutation$SubmitComplianceDetails<TRes>
    implements CopyWith$Variables$Mutation$SubmitComplianceDetails<TRes> {
  _CopyWithImpl$Variables$Mutation$SubmitComplianceDetails(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SubmitComplianceDetails _instance;

  final TRes Function(Variables$Mutation$SubmitComplianceDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? input = _undefined,
    Object? financialYear = _undefined,
    Object? fpoId = _undefined,
  }) =>
      _then(Variables$Mutation$SubmitComplianceDetails._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$ComplianceDetailsSubmissionInput),
        if (financialYear != _undefined && financialYear != null)
          'financialYear': (financialYear as String),
        if (fpoId != _undefined && fpoId != null) 'fpoId': (fpoId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SubmitComplianceDetails<TRes>
    implements CopyWith$Variables$Mutation$SubmitComplianceDetails<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SubmitComplianceDetails(this._res);

  TRes _res;

  call({
    Input$ComplianceDetailsSubmissionInput? input,
    String? financialYear,
    String? fpoId,
  }) =>
      _res;
}

class Mutation$SubmitComplianceDetails {
  Mutation$SubmitComplianceDetails({
    this.createComplianceDetailsSubmission,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SubmitComplianceDetails.fromJson(Map<String, dynamic> json) {
    final l$createComplianceDetailsSubmission =
        json['createComplianceDetailsSubmission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitComplianceDetails(
      createComplianceDetailsSubmission: l$createComplianceDetailsSubmission ==
              null
          ? null
          : Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission
              .fromJson((l$createComplianceDetailsSubmission
                  as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission?
      createComplianceDetailsSubmission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createComplianceDetailsSubmission =
        createComplianceDetailsSubmission;
    _resultData['createComplianceDetailsSubmission'] =
        l$createComplianceDetailsSubmission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createComplianceDetailsSubmission =
        createComplianceDetailsSubmission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createComplianceDetailsSubmission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SubmitComplianceDetails) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createComplianceDetailsSubmission =
        createComplianceDetailsSubmission;
    final lOther$createComplianceDetailsSubmission =
        other.createComplianceDetailsSubmission;
    if (l$createComplianceDetailsSubmission !=
        lOther$createComplianceDetailsSubmission) {
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

extension UtilityExtension$Mutation$SubmitComplianceDetails
    on Mutation$SubmitComplianceDetails {
  CopyWith$Mutation$SubmitComplianceDetails<Mutation$SubmitComplianceDetails>
      get copyWith => CopyWith$Mutation$SubmitComplianceDetails(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitComplianceDetails<TRes> {
  factory CopyWith$Mutation$SubmitComplianceDetails(
    Mutation$SubmitComplianceDetails instance,
    TRes Function(Mutation$SubmitComplianceDetails) then,
  ) = _CopyWithImpl$Mutation$SubmitComplianceDetails;

  factory CopyWith$Mutation$SubmitComplianceDetails.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SubmitComplianceDetails;

  TRes call({
    Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission?
        createComplianceDetailsSubmission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission<
      TRes> get createComplianceDetailsSubmission;
}

class _CopyWithImpl$Mutation$SubmitComplianceDetails<TRes>
    implements CopyWith$Mutation$SubmitComplianceDetails<TRes> {
  _CopyWithImpl$Mutation$SubmitComplianceDetails(
    this._instance,
    this._then,
  );

  final Mutation$SubmitComplianceDetails _instance;

  final TRes Function(Mutation$SubmitComplianceDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createComplianceDetailsSubmission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitComplianceDetails(
        createComplianceDetailsSubmission: createComplianceDetailsSubmission ==
                _undefined
            ? _instance.createComplianceDetailsSubmission
            : (createComplianceDetailsSubmission
                as Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission<
      TRes> get createComplianceDetailsSubmission {
    final local$createComplianceDetailsSubmission =
        _instance.createComplianceDetailsSubmission;
    return local$createComplianceDetailsSubmission == null
        ? CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission
            .stub(_then(_instance))
        : CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission(
            local$createComplianceDetailsSubmission,
            (e) => call(createComplianceDetailsSubmission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitComplianceDetails<TRes>
    implements CopyWith$Mutation$SubmitComplianceDetails<TRes> {
  _CopyWithStubImpl$Mutation$SubmitComplianceDetails(this._res);

  TRes _res;

  call({
    Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission?
        createComplianceDetailsSubmission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission<
          TRes>
      get createComplianceDetailsSubmission =>
          CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission
              .stub(_res);
}

const documentNodeMutationSubmitComplianceDetails = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SubmitComplianceDetails'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'ComplianceDetailsSubmissionInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
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
        name: NameNode(value: 'createComplianceDetailsSubmission'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          ),
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
            name: NameNode(value: 'success'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'errors'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'submission'),
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
                name: NameNode(value: 'yearlySubmission'),
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
Mutation$SubmitComplianceDetails _parserFn$Mutation$SubmitComplianceDetails(
        Map<String, dynamic> data) =>
    Mutation$SubmitComplianceDetails.fromJson(data);
typedef OnMutationCompleted$Mutation$SubmitComplianceDetails = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$SubmitComplianceDetails?,
);

class Options$Mutation$SubmitComplianceDetails
    extends graphql.MutationOptions<Mutation$SubmitComplianceDetails> {
  Options$Mutation$SubmitComplianceDetails({
    String? operationName,
    required Variables$Mutation$SubmitComplianceDetails variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitComplianceDetails? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SubmitComplianceDetails? onCompleted,
    graphql.OnMutationUpdate<Mutation$SubmitComplianceDetails>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SubmitComplianceDetails(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSubmitComplianceDetails,
          parserFn: _parserFn$Mutation$SubmitComplianceDetails,
        );

  final OnMutationCompleted$Mutation$SubmitComplianceDetails?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SubmitComplianceDetails
    extends graphql.WatchQueryOptions<Mutation$SubmitComplianceDetails> {
  WatchOptions$Mutation$SubmitComplianceDetails({
    String? operationName,
    required Variables$Mutation$SubmitComplianceDetails variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitComplianceDetails? typedOptimisticResult,
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
          document: documentNodeMutationSubmitComplianceDetails,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SubmitComplianceDetails,
        );
}

extension ClientExtension$Mutation$SubmitComplianceDetails
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SubmitComplianceDetails>>
      mutate$SubmitComplianceDetails(
              Options$Mutation$SubmitComplianceDetails options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$SubmitComplianceDetails>
      watchMutation$SubmitComplianceDetails(
              WatchOptions$Mutation$SubmitComplianceDetails options) =>
          this.watchMutation(options);
}

class Mutation$SubmitComplianceDetails$HookResult {
  Mutation$SubmitComplianceDetails$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SubmitComplianceDetails runMutation;

  final graphql.QueryResult<Mutation$SubmitComplianceDetails> result;
}

Mutation$SubmitComplianceDetails$HookResult useMutation$SubmitComplianceDetails(
    [WidgetOptions$Mutation$SubmitComplianceDetails? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$SubmitComplianceDetails());
  return Mutation$SubmitComplianceDetails$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SubmitComplianceDetails>
    useWatchMutation$SubmitComplianceDetails(
            WatchOptions$Mutation$SubmitComplianceDetails options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SubmitComplianceDetails
    extends graphql.MutationOptions<Mutation$SubmitComplianceDetails> {
  WidgetOptions$Mutation$SubmitComplianceDetails({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitComplianceDetails? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SubmitComplianceDetails? onCompleted,
    graphql.OnMutationUpdate<Mutation$SubmitComplianceDetails>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SubmitComplianceDetails(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSubmitComplianceDetails,
          parserFn: _parserFn$Mutation$SubmitComplianceDetails,
        );

  final OnMutationCompleted$Mutation$SubmitComplianceDetails?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SubmitComplianceDetails
    = graphql.MultiSourceResult<Mutation$SubmitComplianceDetails> Function(
  Variables$Mutation$SubmitComplianceDetails, {
  Object? optimisticResult,
  Mutation$SubmitComplianceDetails? typedOptimisticResult,
});
typedef Builder$Mutation$SubmitComplianceDetails = widgets.Widget Function(
  RunMutation$Mutation$SubmitComplianceDetails,
  graphql.QueryResult<Mutation$SubmitComplianceDetails>?,
);

class Mutation$SubmitComplianceDetails$Widget
    extends graphql_flutter.Mutation<Mutation$SubmitComplianceDetails> {
  Mutation$SubmitComplianceDetails$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SubmitComplianceDetails? options,
    required Builder$Mutation$SubmitComplianceDetails builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SubmitComplianceDetails(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission {
  Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission({
    this.success,
    this.errors,
    this.submission,
    this.$__typename = 'CreateComplianceDetailsSubmissionMutation',
  });

  factory Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission.fromJson(
      Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$errors = json['errors'];
    final l$submission = json['submission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission(
      success: (l$success as bool?),
      errors: (l$errors as List<dynamic>?)?.map((e) => (e as String?)).toList(),
      submission: l$submission == null
          ? null
          : Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission
              .fromJson((l$submission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? success;

  final List<String?>? errors;

  final Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission?
      submission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$errors = errors;
    _resultData['errors'] = l$errors?.map((e) => e).toList();
    final l$submission = submission;
    _resultData['submission'] = l$submission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$errors = errors;
    final l$submission = submission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$success,
      l$errors == null ? null : Object.hashAll(l$errors.map((v) => v)),
      l$submission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$errors = errors;
    final lOther$errors = other.errors;
    if (l$errors != null && lOther$errors != null) {
      if (l$errors.length != lOther$errors.length) {
        return false;
      }
      for (int i = 0; i < l$errors.length; i++) {
        final l$errors$entry = l$errors[i];
        final lOther$errors$entry = lOther$errors[i];
        if (l$errors$entry != lOther$errors$entry) {
          return false;
        }
      }
    } else if (l$errors != lOther$errors) {
      return false;
    }
    final l$submission = submission;
    final lOther$submission = other.submission;
    if (l$submission != lOther$submission) {
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

extension UtilityExtension$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission
    on Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission {
  CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission<
          Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission>
      get copyWith =>
          CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission<
    TRes> {
  factory CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission(
    Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission instance,
    TRes Function(
            Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission)
        then,
  ) = _CopyWithImpl$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission;

  factory CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission;

  TRes call({
    bool? success,
    List<String?>? errors,
    Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission?
        submission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission<
      TRes> get submission;
}

class _CopyWithImpl$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission<
            TRes> {
  _CopyWithImpl$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission
      _instance;

  final TRes Function(
      Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? errors = _undefined,
    Object? submission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission(
        success: success == _undefined ? _instance.success : (success as bool?),
        errors: errors == _undefined
            ? _instance.errors
            : (errors as List<String?>?),
        submission: submission == _undefined
            ? _instance.submission
            : (submission
                as Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission<
      TRes> get submission {
    final local$submission = _instance.submission;
    return local$submission == null
        ? CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission
            .stub(_then(_instance))
        : CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission(
            local$submission, (e) => call(submission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission(
      this._res);

  TRes _res;

  call({
    bool? success,
    List<String?>? errors,
    Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission?
        submission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission<
          TRes>
      get submission =>
          CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission
              .stub(_res);
}

class Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission {
  Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission({
    required this.id,
    required this.actUnderRegistered,
    required this.dateOfRegistration,
    required this.permanentAccountNumber,
    required this.placeOfRegistration,
    required this.registrationNo,
    required this.taxAccountNumber,
    required this.yearlySubmission,
    this.$__typename = 'ComplianceDetailsSubmissionNode',
  });

  factory Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$actUnderRegistered = json['actUnderRegistered'];
    final l$dateOfRegistration = json['dateOfRegistration'];
    final l$permanentAccountNumber = json['permanentAccountNumber'];
    final l$placeOfRegistration = json['placeOfRegistration'];
    final l$registrationNo = json['registrationNo'];
    final l$taxAccountNumber = json['taxAccountNumber'];
    final l$yearlySubmission = json['yearlySubmission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission(
      id: (l$id as String),
      actUnderRegistered:
          fromJson$Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices(
              (l$actUnderRegistered as String)),
      dateOfRegistration: (l$dateOfRegistration as String),
      permanentAccountNumber: (l$permanentAccountNumber as String),
      placeOfRegistration: (l$placeOfRegistration as String),
      registrationNo: (l$registrationNo as String),
      taxAccountNumber: (l$taxAccountNumber as String),
      yearlySubmission:
          Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission
              .fromJson((l$yearlySubmission as Map<String, dynamic>)),
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

  final Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission
      yearlySubmission;

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
    final l$yearlySubmission = yearlySubmission;
    _resultData['yearlySubmission'] = l$yearlySubmission.toJson();
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
    final l$yearlySubmission = yearlySubmission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$actUnderRegistered,
      l$dateOfRegistration,
      l$permanentAccountNumber,
      l$placeOfRegistration,
      l$registrationNo,
      l$taxAccountNumber,
      l$yearlySubmission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission) ||
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
    final l$yearlySubmission = yearlySubmission;
    final lOther$yearlySubmission = other.yearlySubmission;
    if (l$yearlySubmission != lOther$yearlySubmission) {
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

extension UtilityExtension$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission
    on Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission {
  CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission<
          Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission>
      get copyWith =>
          CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission<
    TRes> {
  factory CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission(
    Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission
        instance,
    TRes Function(
            Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission)
        then,
  ) = _CopyWithImpl$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission;

  factory CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission;

  TRes call({
    String? id,
    Enum$FpoComplianceDetailsSubmissionActUnderRegisteredChoices?
        actUnderRegistered,
    String? dateOfRegistration,
    String? permanentAccountNumber,
    String? placeOfRegistration,
    String? registrationNo,
    String? taxAccountNumber,
    Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission?
        yearlySubmission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission<
      TRes> get yearlySubmission;
}

class _CopyWithImpl$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission<
        TRes>
    implements
        CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission<
            TRes> {
  _CopyWithImpl$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission
      _instance;

  final TRes Function(
          Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission)
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
    Object? yearlySubmission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission(
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
        yearlySubmission: yearlySubmission == _undefined ||
                yearlySubmission == null
            ? _instance.yearlySubmission
            : (yearlySubmission
                as Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission<
      TRes> get yearlySubmission {
    final local$yearlySubmission = _instance.yearlySubmission;
    return CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission(
        local$yearlySubmission, (e) => call(yearlySubmission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission<
        TRes>
    implements
        CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission(
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
    Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission?
        yearlySubmission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission<
          TRes>
      get yearlySubmission =>
          CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission
              .stub(_res);
}

class Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission {
  Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission({
    required this.id,
    required this.financialYear,
    required this.status,
    this.$__typename = 'YearlySubmissionNode',
  });

  factory Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$financialYear = json['financialYear'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission(
      id: (l$id as String),
      financialYear: (l$financialYear as String),
      status:
          fromJson$Enum$FpoYearlySubmissionStatusChoices((l$status as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String financialYear;

  final Enum$FpoYearlySubmissionStatusChoices status;

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
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$financialYear = financialYear;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$financialYear,
      l$status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission
    on Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission {
  CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission<
          Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission>
      get copyWith =>
          CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission<
    TRes> {
  factory CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission(
    Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission
        instance,
    TRes Function(
            Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission)
        then,
  ) = _CopyWithImpl$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission;

  factory CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission;

  TRes call({
    String? id,
    String? financialYear,
    Enum$FpoYearlySubmissionStatusChoices? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission<
            TRes> {
  _CopyWithImpl$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission
      _instance;

  final TRes Function(
          Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? financialYear = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        financialYear: financialYear == _undefined || financialYear == null
            ? _instance.financialYear
            : (financialYear as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$FpoYearlySubmissionStatusChoices),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitComplianceDetails$createComplianceDetailsSubmission$submission$yearlySubmission(
      this._res);

  TRes _res;

  call({
    String? id,
    String? financialYear,
    Enum$FpoYearlySubmissionStatusChoices? status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$SubmitProcessesSystems {
  factory Variables$Mutation$SubmitProcessesSystems({
    required Input$ProcessesSystemsSubmissionInput input,
    required String financialYear,
    required String fpoId,
  }) =>
      Variables$Mutation$SubmitProcessesSystems._({
        r'input': input,
        r'financialYear': financialYear,
        r'fpoId': fpoId,
      });

  Variables$Mutation$SubmitProcessesSystems._(this._$data);

  factory Variables$Mutation$SubmitProcessesSystems.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$ProcessesSystemsSubmissionInput.fromJson(
        (l$input as Map<String, dynamic>));
    final l$financialYear = data['financialYear'];
    result$data['financialYear'] = (l$financialYear as String);
    final l$fpoId = data['fpoId'];
    result$data['fpoId'] = (l$fpoId as String);
    return Variables$Mutation$SubmitProcessesSystems._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$ProcessesSystemsSubmissionInput get input =>
      (_$data['input'] as Input$ProcessesSystemsSubmissionInput);

  String get financialYear => (_$data['financialYear'] as String);

  String get fpoId => (_$data['fpoId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    final l$financialYear = financialYear;
    result$data['financialYear'] = l$financialYear;
    final l$fpoId = fpoId;
    result$data['fpoId'] = l$fpoId;
    return result$data;
  }

  CopyWith$Variables$Mutation$SubmitProcessesSystems<
          Variables$Mutation$SubmitProcessesSystems>
      get copyWith => CopyWith$Variables$Mutation$SubmitProcessesSystems(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$SubmitProcessesSystems) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
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
    final l$input = input;
    final l$financialYear = financialYear;
    final l$fpoId = fpoId;
    return Object.hashAll([
      l$input,
      l$financialYear,
      l$fpoId,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$SubmitProcessesSystems<TRes> {
  factory CopyWith$Variables$Mutation$SubmitProcessesSystems(
    Variables$Mutation$SubmitProcessesSystems instance,
    TRes Function(Variables$Mutation$SubmitProcessesSystems) then,
  ) = _CopyWithImpl$Variables$Mutation$SubmitProcessesSystems;

  factory CopyWith$Variables$Mutation$SubmitProcessesSystems.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SubmitProcessesSystems;

  TRes call({
    Input$ProcessesSystemsSubmissionInput? input,
    String? financialYear,
    String? fpoId,
  });
}

class _CopyWithImpl$Variables$Mutation$SubmitProcessesSystems<TRes>
    implements CopyWith$Variables$Mutation$SubmitProcessesSystems<TRes> {
  _CopyWithImpl$Variables$Mutation$SubmitProcessesSystems(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SubmitProcessesSystems _instance;

  final TRes Function(Variables$Mutation$SubmitProcessesSystems) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? input = _undefined,
    Object? financialYear = _undefined,
    Object? fpoId = _undefined,
  }) =>
      _then(Variables$Mutation$SubmitProcessesSystems._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$ProcessesSystemsSubmissionInput),
        if (financialYear != _undefined && financialYear != null)
          'financialYear': (financialYear as String),
        if (fpoId != _undefined && fpoId != null) 'fpoId': (fpoId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SubmitProcessesSystems<TRes>
    implements CopyWith$Variables$Mutation$SubmitProcessesSystems<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SubmitProcessesSystems(this._res);

  TRes _res;

  call({
    Input$ProcessesSystemsSubmissionInput? input,
    String? financialYear,
    String? fpoId,
  }) =>
      _res;
}

class Mutation$SubmitProcessesSystems {
  Mutation$SubmitProcessesSystems({
    this.createProcessesSystemsSubmission,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SubmitProcessesSystems.fromJson(Map<String, dynamic> json) {
    final l$createProcessesSystemsSubmission =
        json['createProcessesSystemsSubmission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitProcessesSystems(
      createProcessesSystemsSubmission: l$createProcessesSystemsSubmission ==
              null
          ? null
          : Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission
              .fromJson(
                  (l$createProcessesSystemsSubmission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission?
      createProcessesSystemsSubmission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createProcessesSystemsSubmission = createProcessesSystemsSubmission;
    _resultData['createProcessesSystemsSubmission'] =
        l$createProcessesSystemsSubmission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createProcessesSystemsSubmission = createProcessesSystemsSubmission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createProcessesSystemsSubmission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SubmitProcessesSystems) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createProcessesSystemsSubmission = createProcessesSystemsSubmission;
    final lOther$createProcessesSystemsSubmission =
        other.createProcessesSystemsSubmission;
    if (l$createProcessesSystemsSubmission !=
        lOther$createProcessesSystemsSubmission) {
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

extension UtilityExtension$Mutation$SubmitProcessesSystems
    on Mutation$SubmitProcessesSystems {
  CopyWith$Mutation$SubmitProcessesSystems<Mutation$SubmitProcessesSystems>
      get copyWith => CopyWith$Mutation$SubmitProcessesSystems(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitProcessesSystems<TRes> {
  factory CopyWith$Mutation$SubmitProcessesSystems(
    Mutation$SubmitProcessesSystems instance,
    TRes Function(Mutation$SubmitProcessesSystems) then,
  ) = _CopyWithImpl$Mutation$SubmitProcessesSystems;

  factory CopyWith$Mutation$SubmitProcessesSystems.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SubmitProcessesSystems;

  TRes call({
    Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission?
        createProcessesSystemsSubmission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission<
      TRes> get createProcessesSystemsSubmission;
}

class _CopyWithImpl$Mutation$SubmitProcessesSystems<TRes>
    implements CopyWith$Mutation$SubmitProcessesSystems<TRes> {
  _CopyWithImpl$Mutation$SubmitProcessesSystems(
    this._instance,
    this._then,
  );

  final Mutation$SubmitProcessesSystems _instance;

  final TRes Function(Mutation$SubmitProcessesSystems) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createProcessesSystemsSubmission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitProcessesSystems(
        createProcessesSystemsSubmission: createProcessesSystemsSubmission ==
                _undefined
            ? _instance.createProcessesSystemsSubmission
            : (createProcessesSystemsSubmission
                as Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission<
      TRes> get createProcessesSystemsSubmission {
    final local$createProcessesSystemsSubmission =
        _instance.createProcessesSystemsSubmission;
    return local$createProcessesSystemsSubmission == null
        ? CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission
            .stub(_then(_instance))
        : CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission(
            local$createProcessesSystemsSubmission,
            (e) => call(createProcessesSystemsSubmission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitProcessesSystems<TRes>
    implements CopyWith$Mutation$SubmitProcessesSystems<TRes> {
  _CopyWithStubImpl$Mutation$SubmitProcessesSystems(this._res);

  TRes _res;

  call({
    Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission?
        createProcessesSystemsSubmission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission<
          TRes>
      get createProcessesSystemsSubmission =>
          CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission
              .stub(_res);
}

const documentNodeMutationSubmitProcessesSystems = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SubmitProcessesSystems'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'ProcessesSystemsSubmissionInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
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
        name: NameNode(value: 'createProcessesSystemsSubmission'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          ),
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
            name: NameNode(value: 'success'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'errors'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'submission'),
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
                name: NameNode(value: 'yearlySubmission'),
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
Mutation$SubmitProcessesSystems _parserFn$Mutation$SubmitProcessesSystems(
        Map<String, dynamic> data) =>
    Mutation$SubmitProcessesSystems.fromJson(data);
typedef OnMutationCompleted$Mutation$SubmitProcessesSystems = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$SubmitProcessesSystems?,
);

class Options$Mutation$SubmitProcessesSystems
    extends graphql.MutationOptions<Mutation$SubmitProcessesSystems> {
  Options$Mutation$SubmitProcessesSystems({
    String? operationName,
    required Variables$Mutation$SubmitProcessesSystems variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitProcessesSystems? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SubmitProcessesSystems? onCompleted,
    graphql.OnMutationUpdate<Mutation$SubmitProcessesSystems>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SubmitProcessesSystems(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSubmitProcessesSystems,
          parserFn: _parserFn$Mutation$SubmitProcessesSystems,
        );

  final OnMutationCompleted$Mutation$SubmitProcessesSystems?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SubmitProcessesSystems
    extends graphql.WatchQueryOptions<Mutation$SubmitProcessesSystems> {
  WatchOptions$Mutation$SubmitProcessesSystems({
    String? operationName,
    required Variables$Mutation$SubmitProcessesSystems variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitProcessesSystems? typedOptimisticResult,
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
          document: documentNodeMutationSubmitProcessesSystems,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SubmitProcessesSystems,
        );
}

extension ClientExtension$Mutation$SubmitProcessesSystems
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SubmitProcessesSystems>>
      mutate$SubmitProcessesSystems(
              Options$Mutation$SubmitProcessesSystems options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$SubmitProcessesSystems>
      watchMutation$SubmitProcessesSystems(
              WatchOptions$Mutation$SubmitProcessesSystems options) =>
          this.watchMutation(options);
}

class Mutation$SubmitProcessesSystems$HookResult {
  Mutation$SubmitProcessesSystems$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SubmitProcessesSystems runMutation;

  final graphql.QueryResult<Mutation$SubmitProcessesSystems> result;
}

Mutation$SubmitProcessesSystems$HookResult useMutation$SubmitProcessesSystems(
    [WidgetOptions$Mutation$SubmitProcessesSystems? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$SubmitProcessesSystems());
  return Mutation$SubmitProcessesSystems$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SubmitProcessesSystems>
    useWatchMutation$SubmitProcessesSystems(
            WatchOptions$Mutation$SubmitProcessesSystems options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SubmitProcessesSystems
    extends graphql.MutationOptions<Mutation$SubmitProcessesSystems> {
  WidgetOptions$Mutation$SubmitProcessesSystems({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitProcessesSystems? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SubmitProcessesSystems? onCompleted,
    graphql.OnMutationUpdate<Mutation$SubmitProcessesSystems>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SubmitProcessesSystems(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSubmitProcessesSystems,
          parserFn: _parserFn$Mutation$SubmitProcessesSystems,
        );

  final OnMutationCompleted$Mutation$SubmitProcessesSystems?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SubmitProcessesSystems
    = graphql.MultiSourceResult<Mutation$SubmitProcessesSystems> Function(
  Variables$Mutation$SubmitProcessesSystems, {
  Object? optimisticResult,
  Mutation$SubmitProcessesSystems? typedOptimisticResult,
});
typedef Builder$Mutation$SubmitProcessesSystems = widgets.Widget Function(
  RunMutation$Mutation$SubmitProcessesSystems,
  graphql.QueryResult<Mutation$SubmitProcessesSystems>?,
);

class Mutation$SubmitProcessesSystems$Widget
    extends graphql_flutter.Mutation<Mutation$SubmitProcessesSystems> {
  Mutation$SubmitProcessesSystems$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SubmitProcessesSystems? options,
    required Builder$Mutation$SubmitProcessesSystems builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SubmitProcessesSystems(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission {
  Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission({
    this.success,
    this.errors,
    this.submission,
    this.$__typename = 'CreateProcessesSystemsSubmissionMutation',
  });

  factory Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission.fromJson(
      Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$errors = json['errors'];
    final l$submission = json['submission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission(
      success: (l$success as bool?),
      errors: (l$errors as List<dynamic>?)?.map((e) => (e as String?)).toList(),
      submission: l$submission == null
          ? null
          : Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission
              .fromJson((l$submission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? success;

  final List<String?>? errors;

  final Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission?
      submission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$errors = errors;
    _resultData['errors'] = l$errors?.map((e) => e).toList();
    final l$submission = submission;
    _resultData['submission'] = l$submission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$errors = errors;
    final l$submission = submission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$success,
      l$errors == null ? null : Object.hashAll(l$errors.map((v) => v)),
      l$submission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$errors = errors;
    final lOther$errors = other.errors;
    if (l$errors != null && lOther$errors != null) {
      if (l$errors.length != lOther$errors.length) {
        return false;
      }
      for (int i = 0; i < l$errors.length; i++) {
        final l$errors$entry = l$errors[i];
        final lOther$errors$entry = lOther$errors[i];
        if (l$errors$entry != lOther$errors$entry) {
          return false;
        }
      }
    } else if (l$errors != lOther$errors) {
      return false;
    }
    final l$submission = submission;
    final lOther$submission = other.submission;
    if (l$submission != lOther$submission) {
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

extension UtilityExtension$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission
    on Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission {
  CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission<
          Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission>
      get copyWith =>
          CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission<
    TRes> {
  factory CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission(
    Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission instance,
    TRes Function(
            Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission)
        then,
  ) = _CopyWithImpl$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission;

  factory CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission;

  TRes call({
    bool? success,
    List<String?>? errors,
    Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission?
        submission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission<
      TRes> get submission;
}

class _CopyWithImpl$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission<
            TRes> {
  _CopyWithImpl$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission
      _instance;

  final TRes Function(
      Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? errors = _undefined,
    Object? submission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission(
        success: success == _undefined ? _instance.success : (success as bool?),
        errors: errors == _undefined
            ? _instance.errors
            : (errors as List<String?>?),
        submission: submission == _undefined
            ? _instance.submission
            : (submission
                as Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission<
      TRes> get submission {
    final local$submission = _instance.submission;
    return local$submission == null
        ? CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission
            .stub(_then(_instance))
        : CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission(
            local$submission, (e) => call(submission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission(
      this._res);

  TRes _res;

  call({
    bool? success,
    List<String?>? errors,
    Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission?
        submission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission<
          TRes>
      get submission =>
          CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission
              .stub(_res);
}

class Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission {
  Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission({
    required this.id,
    required this.accountsAndMis,
    required this.booksAndRecordsUpToDate,
    required this.creditRecordOfFpo,
    required this.insuranceOfStock,
    required this.penaltiesLeviedBoardMeeting,
    required this.reconciliationOfStocks,
    required this.statutoryFillings,
    required this.yearlySubmission,
    this.$__typename = 'ProcessesSystemsSubmissionNode',
  });

  factory Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$accountsAndMis = json['accountsAndMis'];
    final l$booksAndRecordsUpToDate = json['booksAndRecordsUpToDate'];
    final l$creditRecordOfFpo = json['creditRecordOfFpo'];
    final l$insuranceOfStock = json['insuranceOfStock'];
    final l$penaltiesLeviedBoardMeeting = json['penaltiesLeviedBoardMeeting'];
    final l$reconciliationOfStocks = json['reconciliationOfStocks'];
    final l$statutoryFillings = json['statutoryFillings'];
    final l$yearlySubmission = json['yearlySubmission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission(
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
      yearlySubmission:
          Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission
              .fromJson((l$yearlySubmission as Map<String, dynamic>)),
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

  final Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission
      yearlySubmission;

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
    final l$yearlySubmission = yearlySubmission;
    _resultData['yearlySubmission'] = l$yearlySubmission.toJson();
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
    final l$yearlySubmission = yearlySubmission;
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
      l$yearlySubmission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission) ||
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
    final l$yearlySubmission = yearlySubmission;
    final lOther$yearlySubmission = other.yearlySubmission;
    if (l$yearlySubmission != lOther$yearlySubmission) {
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

extension UtilityExtension$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission
    on Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission {
  CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission<
          Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission>
      get copyWith =>
          CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission<
    TRes> {
  factory CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission(
    Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission
        instance,
    TRes Function(
            Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission)
        then,
  ) = _CopyWithImpl$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission;

  factory CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission;

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
    Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission?
        yearlySubmission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission<
      TRes> get yearlySubmission;
}

class _CopyWithImpl$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission<
        TRes>
    implements
        CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission<
            TRes> {
  _CopyWithImpl$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission
      _instance;

  final TRes Function(
          Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission)
      _then;

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
    Object? yearlySubmission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission(
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
        yearlySubmission: yearlySubmission == _undefined ||
                yearlySubmission == null
            ? _instance.yearlySubmission
            : (yearlySubmission
                as Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission<
      TRes> get yearlySubmission {
    final local$yearlySubmission = _instance.yearlySubmission;
    return CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission(
        local$yearlySubmission, (e) => call(yearlySubmission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission<
        TRes>
    implements
        CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission(
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
    Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission?
        yearlySubmission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission<
          TRes>
      get yearlySubmission =>
          CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission
              .stub(_res);
}

class Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission {
  Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission({
    required this.id,
    required this.financialYear,
    required this.status,
    this.$__typename = 'YearlySubmissionNode',
  });

  factory Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$financialYear = json['financialYear'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission(
      id: (l$id as String),
      financialYear: (l$financialYear as String),
      status:
          fromJson$Enum$FpoYearlySubmissionStatusChoices((l$status as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String financialYear;

  final Enum$FpoYearlySubmissionStatusChoices status;

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
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$financialYear = financialYear;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$financialYear,
      l$status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission
    on Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission {
  CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission<
          Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission>
      get copyWith =>
          CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission<
    TRes> {
  factory CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission(
    Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission
        instance,
    TRes Function(
            Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission)
        then,
  ) = _CopyWithImpl$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission;

  factory CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission;

  TRes call({
    String? id,
    String? financialYear,
    Enum$FpoYearlySubmissionStatusChoices? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission<
            TRes> {
  _CopyWithImpl$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission
      _instance;

  final TRes Function(
          Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? financialYear = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        financialYear: financialYear == _undefined || financialYear == null
            ? _instance.financialYear
            : (financialYear as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$FpoYearlySubmissionStatusChoices),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitProcessesSystems$createProcessesSystemsSubmission$submission$yearlySubmission(
      this._res);

  TRes _res;

  call({
    String? id,
    String? financialYear,
    Enum$FpoYearlySubmissionStatusChoices? status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$SubmitFinancialDetails {
  factory Variables$Mutation$SubmitFinancialDetails({
    required Input$FinancialDetailsSubmissionV2Input input,
    required String financialYear,
    required String fpoId,
  }) =>
      Variables$Mutation$SubmitFinancialDetails._({
        r'input': input,
        r'financialYear': financialYear,
        r'fpoId': fpoId,
      });

  Variables$Mutation$SubmitFinancialDetails._(this._$data);

  factory Variables$Mutation$SubmitFinancialDetails.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$FinancialDetailsSubmissionV2Input.fromJson(
        (l$input as Map<String, dynamic>));
    final l$financialYear = data['financialYear'];
    result$data['financialYear'] = (l$financialYear as String);
    final l$fpoId = data['fpoId'];
    result$data['fpoId'] = (l$fpoId as String);
    return Variables$Mutation$SubmitFinancialDetails._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$FinancialDetailsSubmissionV2Input get input =>
      (_$data['input'] as Input$FinancialDetailsSubmissionV2Input);

  String get financialYear => (_$data['financialYear'] as String);

  String get fpoId => (_$data['fpoId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    final l$financialYear = financialYear;
    result$data['financialYear'] = l$financialYear;
    final l$fpoId = fpoId;
    result$data['fpoId'] = l$fpoId;
    return result$data;
  }

  CopyWith$Variables$Mutation$SubmitFinancialDetails<
          Variables$Mutation$SubmitFinancialDetails>
      get copyWith => CopyWith$Variables$Mutation$SubmitFinancialDetails(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$SubmitFinancialDetails) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
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
    final l$input = input;
    final l$financialYear = financialYear;
    final l$fpoId = fpoId;
    return Object.hashAll([
      l$input,
      l$financialYear,
      l$fpoId,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$SubmitFinancialDetails<TRes> {
  factory CopyWith$Variables$Mutation$SubmitFinancialDetails(
    Variables$Mutation$SubmitFinancialDetails instance,
    TRes Function(Variables$Mutation$SubmitFinancialDetails) then,
  ) = _CopyWithImpl$Variables$Mutation$SubmitFinancialDetails;

  factory CopyWith$Variables$Mutation$SubmitFinancialDetails.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SubmitFinancialDetails;

  TRes call({
    Input$FinancialDetailsSubmissionV2Input? input,
    String? financialYear,
    String? fpoId,
  });
}

class _CopyWithImpl$Variables$Mutation$SubmitFinancialDetails<TRes>
    implements CopyWith$Variables$Mutation$SubmitFinancialDetails<TRes> {
  _CopyWithImpl$Variables$Mutation$SubmitFinancialDetails(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SubmitFinancialDetails _instance;

  final TRes Function(Variables$Mutation$SubmitFinancialDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? input = _undefined,
    Object? financialYear = _undefined,
    Object? fpoId = _undefined,
  }) =>
      _then(Variables$Mutation$SubmitFinancialDetails._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$FinancialDetailsSubmissionV2Input),
        if (financialYear != _undefined && financialYear != null)
          'financialYear': (financialYear as String),
        if (fpoId != _undefined && fpoId != null) 'fpoId': (fpoId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SubmitFinancialDetails<TRes>
    implements CopyWith$Variables$Mutation$SubmitFinancialDetails<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SubmitFinancialDetails(this._res);

  TRes _res;

  call({
    Input$FinancialDetailsSubmissionV2Input? input,
    String? financialYear,
    String? fpoId,
  }) =>
      _res;
}

class Mutation$SubmitFinancialDetails {
  Mutation$SubmitFinancialDetails({
    this.createFinancialDetailsSubmission,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SubmitFinancialDetails.fromJson(Map<String, dynamic> json) {
    final l$createFinancialDetailsSubmission =
        json['createFinancialDetailsSubmission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitFinancialDetails(
      createFinancialDetailsSubmission: l$createFinancialDetailsSubmission ==
              null
          ? null
          : Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission
              .fromJson(
                  (l$createFinancialDetailsSubmission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission?
      createFinancialDetailsSubmission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createFinancialDetailsSubmission = createFinancialDetailsSubmission;
    _resultData['createFinancialDetailsSubmission'] =
        l$createFinancialDetailsSubmission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createFinancialDetailsSubmission = createFinancialDetailsSubmission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createFinancialDetailsSubmission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SubmitFinancialDetails) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createFinancialDetailsSubmission = createFinancialDetailsSubmission;
    final lOther$createFinancialDetailsSubmission =
        other.createFinancialDetailsSubmission;
    if (l$createFinancialDetailsSubmission !=
        lOther$createFinancialDetailsSubmission) {
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

extension UtilityExtension$Mutation$SubmitFinancialDetails
    on Mutation$SubmitFinancialDetails {
  CopyWith$Mutation$SubmitFinancialDetails<Mutation$SubmitFinancialDetails>
      get copyWith => CopyWith$Mutation$SubmitFinancialDetails(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitFinancialDetails<TRes> {
  factory CopyWith$Mutation$SubmitFinancialDetails(
    Mutation$SubmitFinancialDetails instance,
    TRes Function(Mutation$SubmitFinancialDetails) then,
  ) = _CopyWithImpl$Mutation$SubmitFinancialDetails;

  factory CopyWith$Mutation$SubmitFinancialDetails.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SubmitFinancialDetails;

  TRes call({
    Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission?
        createFinancialDetailsSubmission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission<
      TRes> get createFinancialDetailsSubmission;
}

class _CopyWithImpl$Mutation$SubmitFinancialDetails<TRes>
    implements CopyWith$Mutation$SubmitFinancialDetails<TRes> {
  _CopyWithImpl$Mutation$SubmitFinancialDetails(
    this._instance,
    this._then,
  );

  final Mutation$SubmitFinancialDetails _instance;

  final TRes Function(Mutation$SubmitFinancialDetails) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createFinancialDetailsSubmission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitFinancialDetails(
        createFinancialDetailsSubmission: createFinancialDetailsSubmission ==
                _undefined
            ? _instance.createFinancialDetailsSubmission
            : (createFinancialDetailsSubmission
                as Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission<
      TRes> get createFinancialDetailsSubmission {
    final local$createFinancialDetailsSubmission =
        _instance.createFinancialDetailsSubmission;
    return local$createFinancialDetailsSubmission == null
        ? CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission
            .stub(_then(_instance))
        : CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission(
            local$createFinancialDetailsSubmission,
            (e) => call(createFinancialDetailsSubmission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitFinancialDetails<TRes>
    implements CopyWith$Mutation$SubmitFinancialDetails<TRes> {
  _CopyWithStubImpl$Mutation$SubmitFinancialDetails(this._res);

  TRes _res;

  call({
    Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission?
        createFinancialDetailsSubmission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission<
          TRes>
      get createFinancialDetailsSubmission =>
          CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission
              .stub(_res);
}

const documentNodeMutationSubmitFinancialDetails = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SubmitFinancialDetails'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'FinancialDetailsSubmissionV2Input'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
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
        name: NameNode(value: 'createFinancialDetailsSubmissionV2'),
        alias: NameNode(value: 'createFinancialDetailsSubmission'),
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          ),
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
            name: NameNode(value: 'success'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'errors'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'submission'),
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
                name: NameNode(value: 'yearlySubmission'),
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
                    name: NameNode(value: 'financialDetailsV2'),
                    alias: NameNode(value: 'financialDetails'),
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'cashChequePercentage'),
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
Mutation$SubmitFinancialDetails _parserFn$Mutation$SubmitFinancialDetails(
        Map<String, dynamic> data) =>
    Mutation$SubmitFinancialDetails.fromJson(data);
typedef OnMutationCompleted$Mutation$SubmitFinancialDetails = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$SubmitFinancialDetails?,
);

class Options$Mutation$SubmitFinancialDetails
    extends graphql.MutationOptions<Mutation$SubmitFinancialDetails> {
  Options$Mutation$SubmitFinancialDetails({
    String? operationName,
    required Variables$Mutation$SubmitFinancialDetails variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitFinancialDetails? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SubmitFinancialDetails? onCompleted,
    graphql.OnMutationUpdate<Mutation$SubmitFinancialDetails>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SubmitFinancialDetails(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSubmitFinancialDetails,
          parserFn: _parserFn$Mutation$SubmitFinancialDetails,
        );

  final OnMutationCompleted$Mutation$SubmitFinancialDetails?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SubmitFinancialDetails
    extends graphql.WatchQueryOptions<Mutation$SubmitFinancialDetails> {
  WatchOptions$Mutation$SubmitFinancialDetails({
    String? operationName,
    required Variables$Mutation$SubmitFinancialDetails variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitFinancialDetails? typedOptimisticResult,
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
          document: documentNodeMutationSubmitFinancialDetails,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SubmitFinancialDetails,
        );
}

extension ClientExtension$Mutation$SubmitFinancialDetails
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SubmitFinancialDetails>>
      mutate$SubmitFinancialDetails(
              Options$Mutation$SubmitFinancialDetails options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$SubmitFinancialDetails>
      watchMutation$SubmitFinancialDetails(
              WatchOptions$Mutation$SubmitFinancialDetails options) =>
          this.watchMutation(options);
}

class Mutation$SubmitFinancialDetails$HookResult {
  Mutation$SubmitFinancialDetails$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SubmitFinancialDetails runMutation;

  final graphql.QueryResult<Mutation$SubmitFinancialDetails> result;
}

Mutation$SubmitFinancialDetails$HookResult useMutation$SubmitFinancialDetails(
    [WidgetOptions$Mutation$SubmitFinancialDetails? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$SubmitFinancialDetails());
  return Mutation$SubmitFinancialDetails$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SubmitFinancialDetails>
    useWatchMutation$SubmitFinancialDetails(
            WatchOptions$Mutation$SubmitFinancialDetails options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SubmitFinancialDetails
    extends graphql.MutationOptions<Mutation$SubmitFinancialDetails> {
  WidgetOptions$Mutation$SubmitFinancialDetails({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitFinancialDetails? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SubmitFinancialDetails? onCompleted,
    graphql.OnMutationUpdate<Mutation$SubmitFinancialDetails>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SubmitFinancialDetails(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSubmitFinancialDetails,
          parserFn: _parserFn$Mutation$SubmitFinancialDetails,
        );

  final OnMutationCompleted$Mutation$SubmitFinancialDetails?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SubmitFinancialDetails
    = graphql.MultiSourceResult<Mutation$SubmitFinancialDetails> Function(
  Variables$Mutation$SubmitFinancialDetails, {
  Object? optimisticResult,
  Mutation$SubmitFinancialDetails? typedOptimisticResult,
});
typedef Builder$Mutation$SubmitFinancialDetails = widgets.Widget Function(
  RunMutation$Mutation$SubmitFinancialDetails,
  graphql.QueryResult<Mutation$SubmitFinancialDetails>?,
);

class Mutation$SubmitFinancialDetails$Widget
    extends graphql_flutter.Mutation<Mutation$SubmitFinancialDetails> {
  Mutation$SubmitFinancialDetails$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SubmitFinancialDetails? options,
    required Builder$Mutation$SubmitFinancialDetails builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$SubmitFinancialDetails(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission {
  Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission({
    this.success,
    this.errors,
    this.submission,
    this.$__typename = 'CreateFinancialDetailsSubmissionV2Mutation',
  });

  factory Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission.fromJson(
      Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$errors = json['errors'];
    final l$submission = json['submission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission(
      success: (l$success as bool?),
      errors: (l$errors as List<dynamic>?)?.map((e) => (e as String?)).toList(),
      submission: l$submission == null
          ? null
          : Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission
              .fromJson((l$submission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? success;

  final List<String?>? errors;

  final Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission?
      submission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$errors = errors;
    _resultData['errors'] = l$errors?.map((e) => e).toList();
    final l$submission = submission;
    _resultData['submission'] = l$submission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$errors = errors;
    final l$submission = submission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$success,
      l$errors == null ? null : Object.hashAll(l$errors.map((v) => v)),
      l$submission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$errors = errors;
    final lOther$errors = other.errors;
    if (l$errors != null && lOther$errors != null) {
      if (l$errors.length != lOther$errors.length) {
        return false;
      }
      for (int i = 0; i < l$errors.length; i++) {
        final l$errors$entry = l$errors[i];
        final lOther$errors$entry = lOther$errors[i];
        if (l$errors$entry != lOther$errors$entry) {
          return false;
        }
      }
    } else if (l$errors != lOther$errors) {
      return false;
    }
    final l$submission = submission;
    final lOther$submission = other.submission;
    if (l$submission != lOther$submission) {
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

extension UtilityExtension$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission
    on Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission {
  CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission<
          Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission>
      get copyWith =>
          CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission<
    TRes> {
  factory CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission(
    Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission instance,
    TRes Function(
            Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission)
        then,
  ) = _CopyWithImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission;

  factory CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission;

  TRes call({
    bool? success,
    List<String?>? errors,
    Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission?
        submission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission<
      TRes> get submission;
}

class _CopyWithImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission<
            TRes> {
  _CopyWithImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission
      _instance;

  final TRes Function(
      Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? errors = _undefined,
    Object? submission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission(
        success: success == _undefined ? _instance.success : (success as bool?),
        errors: errors == _undefined
            ? _instance.errors
            : (errors as List<String?>?),
        submission: submission == _undefined
            ? _instance.submission
            : (submission
                as Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission<
      TRes> get submission {
    final local$submission = _instance.submission;
    return local$submission == null
        ? CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission
            .stub(_then(_instance))
        : CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission(
            local$submission, (e) => call(submission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission(
      this._res);

  TRes _res;

  call({
    bool? success,
    List<String?>? errors,
    Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission?
        submission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission<
          TRes>
      get submission =>
          CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission
              .stub(_res);
}

class Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission {
  Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission({
    required this.id,
    required this.yearlySubmission,
    this.$__typename = 'FinancialDetailsSubmissionV2Node',
  });

  factory Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$yearlySubmission = json['yearlySubmission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission(
      id: (l$id as String),
      yearlySubmission:
          Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission
              .fromJson((l$yearlySubmission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission
      yearlySubmission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$yearlySubmission = yearlySubmission;
    _resultData['yearlySubmission'] = l$yearlySubmission.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$yearlySubmission = yearlySubmission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$yearlySubmission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$yearlySubmission = yearlySubmission;
    final lOther$yearlySubmission = other.yearlySubmission;
    if (l$yearlySubmission != lOther$yearlySubmission) {
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

extension UtilityExtension$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission
    on Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission {
  CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission<
          Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission>
      get copyWith =>
          CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission<
    TRes> {
  factory CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission(
    Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission
        instance,
    TRes Function(
            Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission)
        then,
  ) = _CopyWithImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission;

  factory CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission;

  TRes call({
    String? id,
    Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission?
        yearlySubmission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission<
      TRes> get yearlySubmission;
}

class _CopyWithImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission<
        TRes>
    implements
        CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission<
            TRes> {
  _CopyWithImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission
      _instance;

  final TRes Function(
          Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? yearlySubmission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        yearlySubmission: yearlySubmission == _undefined ||
                yearlySubmission == null
            ? _instance.yearlySubmission
            : (yearlySubmission
                as Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission<
      TRes> get yearlySubmission {
    final local$yearlySubmission = _instance.yearlySubmission;
    return CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission(
        local$yearlySubmission, (e) => call(yearlySubmission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission<
        TRes>
    implements
        CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission(
      this._res);

  TRes _res;

  call({
    String? id,
    Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission?
        yearlySubmission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission<
          TRes>
      get yearlySubmission =>
          CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission
              .stub(_res);
}

class Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission {
  Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission({
    required this.id,
    required this.financialYear,
    required this.status,
    this.financialDetails,
    this.$__typename = 'YearlySubmissionNode',
  });

  factory Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$financialYear = json['financialYear'];
    final l$status = json['status'];
    final l$financialDetails = json['financialDetails'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission(
      id: (l$id as String),
      financialYear: (l$financialYear as String),
      status:
          fromJson$Enum$FpoYearlySubmissionStatusChoices((l$status as String)),
      financialDetails: l$financialDetails == null
          ? null
          : Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails
              .fromJson((l$financialDetails as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String financialYear;

  final Enum$FpoYearlySubmissionStatusChoices status;

  final Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails?
      financialDetails;

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
    final l$financialDetails = financialDetails;
    _resultData['financialDetails'] = l$financialDetails?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$financialYear = financialYear;
    final l$status = status;
    final l$financialDetails = financialDetails;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$financialYear,
      l$status,
      l$financialDetails,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission) ||
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
    final l$financialDetails = financialDetails;
    final lOther$financialDetails = other.financialDetails;
    if (l$financialDetails != lOther$financialDetails) {
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

extension UtilityExtension$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission
    on Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission {
  CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission<
          Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission>
      get copyWith =>
          CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission<
    TRes> {
  factory CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission(
    Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission
        instance,
    TRes Function(
            Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission)
        then,
  ) = _CopyWithImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission;

  factory CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission;

  TRes call({
    String? id,
    String? financialYear,
    Enum$FpoYearlySubmissionStatusChoices? status,
    Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails?
        financialDetails,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails<
      TRes> get financialDetails;
}

class _CopyWithImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission<
            TRes> {
  _CopyWithImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission
      _instance;

  final TRes Function(
          Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? financialYear = _undefined,
    Object? status = _undefined,
    Object? financialDetails = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        financialYear: financialYear == _undefined || financialYear == null
            ? _instance.financialYear
            : (financialYear as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$FpoYearlySubmissionStatusChoices),
        financialDetails: financialDetails == _undefined
            ? _instance.financialDetails
            : (financialDetails
                as Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails<
      TRes> get financialDetails {
    final local$financialDetails = _instance.financialDetails;
    return local$financialDetails == null
        ? CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails
            .stub(_then(_instance))
        : CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails(
            local$financialDetails, (e) => call(financialDetails: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission(
      this._res);

  TRes _res;

  call({
    String? id,
    String? financialYear,
    Enum$FpoYearlySubmissionStatusChoices? status,
    Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails?
        financialDetails,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails<
          TRes>
      get financialDetails =>
          CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails
              .stub(_res);
}

class Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails {
  Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails({
    required this.cashChequePercentage,
    this.$__typename = 'FinancialDetailsSubmissionV2Node',
  });

  factory Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails.fromJson(
      Map<String, dynamic> json) {
    final l$cashChequePercentage = json['cashChequePercentage'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails(
      cashChequePercentage: (l$cashChequePercentage as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String cashChequePercentage;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$cashChequePercentage = cashChequePercentage;
    _resultData['cashChequePercentage'] = l$cashChequePercentage;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$cashChequePercentage = cashChequePercentage;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$cashChequePercentage,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$cashChequePercentage = cashChequePercentage;
    final lOther$cashChequePercentage = other.cashChequePercentage;
    if (l$cashChequePercentage != lOther$cashChequePercentage) {
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

extension UtilityExtension$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails
    on Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails {
  CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails<
          Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails>
      get copyWith =>
          CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails<
    TRes> {
  factory CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails(
    Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails
        instance,
    TRes Function(
            Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails)
        then,
  ) = _CopyWithImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails;

  factory CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails;

  TRes call({
    String? cashChequePercentage,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails<
        TRes>
    implements
        CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails<
            TRes> {
  _CopyWithImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails(
    this._instance,
    this._then,
  );

  final Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails
      _instance;

  final TRes Function(
          Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? cashChequePercentage = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails(
        cashChequePercentage:
            cashChequePercentage == _undefined || cashChequePercentage == null
                ? _instance.cashChequePercentage
                : (cashChequePercentage as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails<
        TRes>
    implements
        CopyWith$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitFinancialDetails$createFinancialDetailsSubmission$submission$yearlySubmission$financialDetails(
      this._res);

  TRes _res;

  call({
    String? cashChequePercentage,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$SubmitSustainableActivities {
  factory Variables$Mutation$SubmitSustainableActivities({
    required Input$SustainableActivitiesSubmissionInput input,
    required String financialYear,
    required String fpoId,
  }) =>
      Variables$Mutation$SubmitSustainableActivities._({
        r'input': input,
        r'financialYear': financialYear,
        r'fpoId': fpoId,
      });

  Variables$Mutation$SubmitSustainableActivities._(this._$data);

  factory Variables$Mutation$SubmitSustainableActivities.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$input = data['input'];
    result$data['input'] = Input$SustainableActivitiesSubmissionInput.fromJson(
        (l$input as Map<String, dynamic>));
    final l$financialYear = data['financialYear'];
    result$data['financialYear'] = (l$financialYear as String);
    final l$fpoId = data['fpoId'];
    result$data['fpoId'] = (l$fpoId as String);
    return Variables$Mutation$SubmitSustainableActivities._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$SustainableActivitiesSubmissionInput get input =>
      (_$data['input'] as Input$SustainableActivitiesSubmissionInput);

  String get financialYear => (_$data['financialYear'] as String);

  String get fpoId => (_$data['fpoId'] as String);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$input = input;
    result$data['input'] = l$input.toJson();
    final l$financialYear = financialYear;
    result$data['financialYear'] = l$financialYear;
    final l$fpoId = fpoId;
    result$data['fpoId'] = l$fpoId;
    return result$data;
  }

  CopyWith$Variables$Mutation$SubmitSustainableActivities<
          Variables$Mutation$SubmitSustainableActivities>
      get copyWith => CopyWith$Variables$Mutation$SubmitSustainableActivities(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$SubmitSustainableActivities) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$input = input;
    final lOther$input = other.input;
    if (l$input != lOther$input) {
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
    final l$input = input;
    final l$financialYear = financialYear;
    final l$fpoId = fpoId;
    return Object.hashAll([
      l$input,
      l$financialYear,
      l$fpoId,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$SubmitSustainableActivities<TRes> {
  factory CopyWith$Variables$Mutation$SubmitSustainableActivities(
    Variables$Mutation$SubmitSustainableActivities instance,
    TRes Function(Variables$Mutation$SubmitSustainableActivities) then,
  ) = _CopyWithImpl$Variables$Mutation$SubmitSustainableActivities;

  factory CopyWith$Variables$Mutation$SubmitSustainableActivities.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Mutation$SubmitSustainableActivities;

  TRes call({
    Input$SustainableActivitiesSubmissionInput? input,
    String? financialYear,
    String? fpoId,
  });
}

class _CopyWithImpl$Variables$Mutation$SubmitSustainableActivities<TRes>
    implements CopyWith$Variables$Mutation$SubmitSustainableActivities<TRes> {
  _CopyWithImpl$Variables$Mutation$SubmitSustainableActivities(
    this._instance,
    this._then,
  );

  final Variables$Mutation$SubmitSustainableActivities _instance;

  final TRes Function(Variables$Mutation$SubmitSustainableActivities) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? input = _undefined,
    Object? financialYear = _undefined,
    Object? fpoId = _undefined,
  }) =>
      _then(Variables$Mutation$SubmitSustainableActivities._({
        ..._instance._$data,
        if (input != _undefined && input != null)
          'input': (input as Input$SustainableActivitiesSubmissionInput),
        if (financialYear != _undefined && financialYear != null)
          'financialYear': (financialYear as String),
        if (fpoId != _undefined && fpoId != null) 'fpoId': (fpoId as String),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$SubmitSustainableActivities<TRes>
    implements CopyWith$Variables$Mutation$SubmitSustainableActivities<TRes> {
  _CopyWithStubImpl$Variables$Mutation$SubmitSustainableActivities(this._res);

  TRes _res;

  call({
    Input$SustainableActivitiesSubmissionInput? input,
    String? financialYear,
    String? fpoId,
  }) =>
      _res;
}

class Mutation$SubmitSustainableActivities {
  Mutation$SubmitSustainableActivities({
    this.createSustainableActivitiesSubmission,
    this.$__typename = 'Mutation',
  });

  factory Mutation$SubmitSustainableActivities.fromJson(
      Map<String, dynamic> json) {
    final l$createSustainableActivitiesSubmission =
        json['createSustainableActivitiesSubmission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitSustainableActivities(
      createSustainableActivitiesSubmission:
          l$createSustainableActivitiesSubmission == null
              ? null
              : Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission
                  .fromJson((l$createSustainableActivitiesSubmission
                      as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission?
      createSustainableActivitiesSubmission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createSustainableActivitiesSubmission =
        createSustainableActivitiesSubmission;
    _resultData['createSustainableActivitiesSubmission'] =
        l$createSustainableActivitiesSubmission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createSustainableActivitiesSubmission =
        createSustainableActivitiesSubmission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createSustainableActivitiesSubmission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$SubmitSustainableActivities) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createSustainableActivitiesSubmission =
        createSustainableActivitiesSubmission;
    final lOther$createSustainableActivitiesSubmission =
        other.createSustainableActivitiesSubmission;
    if (l$createSustainableActivitiesSubmission !=
        lOther$createSustainableActivitiesSubmission) {
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

extension UtilityExtension$Mutation$SubmitSustainableActivities
    on Mutation$SubmitSustainableActivities {
  CopyWith$Mutation$SubmitSustainableActivities<
          Mutation$SubmitSustainableActivities>
      get copyWith => CopyWith$Mutation$SubmitSustainableActivities(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitSustainableActivities<TRes> {
  factory CopyWith$Mutation$SubmitSustainableActivities(
    Mutation$SubmitSustainableActivities instance,
    TRes Function(Mutation$SubmitSustainableActivities) then,
  ) = _CopyWithImpl$Mutation$SubmitSustainableActivities;

  factory CopyWith$Mutation$SubmitSustainableActivities.stub(TRes res) =
      _CopyWithStubImpl$Mutation$SubmitSustainableActivities;

  TRes call({
    Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission?
        createSustainableActivitiesSubmission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission<
      TRes> get createSustainableActivitiesSubmission;
}

class _CopyWithImpl$Mutation$SubmitSustainableActivities<TRes>
    implements CopyWith$Mutation$SubmitSustainableActivities<TRes> {
  _CopyWithImpl$Mutation$SubmitSustainableActivities(
    this._instance,
    this._then,
  );

  final Mutation$SubmitSustainableActivities _instance;

  final TRes Function(Mutation$SubmitSustainableActivities) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createSustainableActivitiesSubmission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$SubmitSustainableActivities(
        createSustainableActivitiesSubmission:
            createSustainableActivitiesSubmission == _undefined
                ? _instance.createSustainableActivitiesSubmission
                : (createSustainableActivitiesSubmission
                    as Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission<
      TRes> get createSustainableActivitiesSubmission {
    final local$createSustainableActivitiesSubmission =
        _instance.createSustainableActivitiesSubmission;
    return local$createSustainableActivitiesSubmission == null
        ? CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission
            .stub(_then(_instance))
        : CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission(
            local$createSustainableActivitiesSubmission,
            (e) => call(createSustainableActivitiesSubmission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitSustainableActivities<TRes>
    implements CopyWith$Mutation$SubmitSustainableActivities<TRes> {
  _CopyWithStubImpl$Mutation$SubmitSustainableActivities(this._res);

  TRes _res;

  call({
    Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission?
        createSustainableActivitiesSubmission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission<
          TRes>
      get createSustainableActivitiesSubmission =>
          CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission
              .stub(_res);
}

const documentNodeMutationSubmitSustainableActivities =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SubmitSustainableActivities'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'SustainableActivitiesSubmissionInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
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
        name: NameNode(value: 'createSustainableActivitiesSubmission'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          ),
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
            name: NameNode(value: 'success'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'errors'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'submission'),
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
                name: NameNode(value: 'yearlySubmission'),
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
Mutation$SubmitSustainableActivities
    _parserFn$Mutation$SubmitSustainableActivities(Map<String, dynamic> data) =>
        Mutation$SubmitSustainableActivities.fromJson(data);
typedef OnMutationCompleted$Mutation$SubmitSustainableActivities
    = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$SubmitSustainableActivities?,
);

class Options$Mutation$SubmitSustainableActivities
    extends graphql.MutationOptions<Mutation$SubmitSustainableActivities> {
  Options$Mutation$SubmitSustainableActivities({
    String? operationName,
    required Variables$Mutation$SubmitSustainableActivities variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitSustainableActivities? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SubmitSustainableActivities? onCompleted,
    graphql.OnMutationUpdate<Mutation$SubmitSustainableActivities>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SubmitSustainableActivities(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSubmitSustainableActivities,
          parserFn: _parserFn$Mutation$SubmitSustainableActivities,
        );

  final OnMutationCompleted$Mutation$SubmitSustainableActivities?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$SubmitSustainableActivities
    extends graphql.WatchQueryOptions<Mutation$SubmitSustainableActivities> {
  WatchOptions$Mutation$SubmitSustainableActivities({
    String? operationName,
    required Variables$Mutation$SubmitSustainableActivities variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitSustainableActivities? typedOptimisticResult,
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
          document: documentNodeMutationSubmitSustainableActivities,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$SubmitSustainableActivities,
        );
}

extension ClientExtension$Mutation$SubmitSustainableActivities
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$SubmitSustainableActivities>>
      mutate$SubmitSustainableActivities(
              Options$Mutation$SubmitSustainableActivities options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$SubmitSustainableActivities>
      watchMutation$SubmitSustainableActivities(
              WatchOptions$Mutation$SubmitSustainableActivities options) =>
          this.watchMutation(options);
}

class Mutation$SubmitSustainableActivities$HookResult {
  Mutation$SubmitSustainableActivities$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$SubmitSustainableActivities runMutation;

  final graphql.QueryResult<Mutation$SubmitSustainableActivities> result;
}

Mutation$SubmitSustainableActivities$HookResult
    useMutation$SubmitSustainableActivities(
        [WidgetOptions$Mutation$SubmitSustainableActivities? options]) {
  final result = graphql_flutter.useMutation(
      options ?? WidgetOptions$Mutation$SubmitSustainableActivities());
  return Mutation$SubmitSustainableActivities$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$SubmitSustainableActivities>
    useWatchMutation$SubmitSustainableActivities(
            WatchOptions$Mutation$SubmitSustainableActivities options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$SubmitSustainableActivities
    extends graphql.MutationOptions<Mutation$SubmitSustainableActivities> {
  WidgetOptions$Mutation$SubmitSustainableActivities({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$SubmitSustainableActivities? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$SubmitSustainableActivities? onCompleted,
    graphql.OnMutationUpdate<Mutation$SubmitSustainableActivities>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$SubmitSustainableActivities(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationSubmitSustainableActivities,
          parserFn: _parserFn$Mutation$SubmitSustainableActivities,
        );

  final OnMutationCompleted$Mutation$SubmitSustainableActivities?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$SubmitSustainableActivities
    = graphql.MultiSourceResult<Mutation$SubmitSustainableActivities> Function(
  Variables$Mutation$SubmitSustainableActivities, {
  Object? optimisticResult,
  Mutation$SubmitSustainableActivities? typedOptimisticResult,
});
typedef Builder$Mutation$SubmitSustainableActivities = widgets.Widget Function(
  RunMutation$Mutation$SubmitSustainableActivities,
  graphql.QueryResult<Mutation$SubmitSustainableActivities>?,
);

class Mutation$SubmitSustainableActivities$Widget
    extends graphql_flutter.Mutation<Mutation$SubmitSustainableActivities> {
  Mutation$SubmitSustainableActivities$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$SubmitSustainableActivities? options,
    required Builder$Mutation$SubmitSustainableActivities builder,
  }) : super(
          key: key,
          options:
              options ?? WidgetOptions$Mutation$SubmitSustainableActivities(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission {
  Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission({
    this.success,
    this.errors,
    this.submission,
    this.$__typename = 'CreateSustainableActivitiesSubmissionMutation',
  });

  factory Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission.fromJson(
      Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$errors = json['errors'];
    final l$submission = json['submission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission(
      success: (l$success as bool?),
      errors: (l$errors as List<dynamic>?)?.map((e) => (e as String?)).toList(),
      submission: l$submission == null
          ? null
          : Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission
              .fromJson((l$submission as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? success;

  final List<String?>? errors;

  final Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission?
      submission;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$errors = errors;
    _resultData['errors'] = l$errors?.map((e) => e).toList();
    final l$submission = submission;
    _resultData['submission'] = l$submission?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$errors = errors;
    final l$submission = submission;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$success,
      l$errors == null ? null : Object.hashAll(l$errors.map((v) => v)),
      l$submission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$errors = errors;
    final lOther$errors = other.errors;
    if (l$errors != null && lOther$errors != null) {
      if (l$errors.length != lOther$errors.length) {
        return false;
      }
      for (int i = 0; i < l$errors.length; i++) {
        final l$errors$entry = l$errors[i];
        final lOther$errors$entry = lOther$errors[i];
        if (l$errors$entry != lOther$errors$entry) {
          return false;
        }
      }
    } else if (l$errors != lOther$errors) {
      return false;
    }
    final l$submission = submission;
    final lOther$submission = other.submission;
    if (l$submission != lOther$submission) {
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

extension UtilityExtension$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission
    on Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission {
  CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission<
          Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission>
      get copyWith =>
          CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission<
    TRes> {
  factory CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission(
    Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission
        instance,
    TRes Function(
            Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission)
        then,
  ) = _CopyWithImpl$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission;

  factory CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission;

  TRes call({
    bool? success,
    List<String?>? errors,
    Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission?
        submission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission<
      TRes> get submission;
}

class _CopyWithImpl$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission<
            TRes> {
  _CopyWithImpl$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission
      _instance;

  final TRes Function(
          Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? errors = _undefined,
    Object? submission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission(
        success: success == _undefined ? _instance.success : (success as bool?),
        errors: errors == _undefined
            ? _instance.errors
            : (errors as List<String?>?),
        submission: submission == _undefined
            ? _instance.submission
            : (submission
                as Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission<
      TRes> get submission {
    final local$submission = _instance.submission;
    return local$submission == null
        ? CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission
            .stub(_then(_instance))
        : CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission(
            local$submission, (e) => call(submission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission(
      this._res);

  TRes _res;

  call({
    bool? success,
    List<String?>? errors,
    Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission?
        submission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission<
          TRes>
      get submission =>
          CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission
              .stub(_res);
}

class Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission {
  Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission({
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
    required this.yearlySubmission,
    this.$__typename = 'SustainableActivitiesSubmissionNode',
  });

  factory Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission.fromJson(
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
    final l$yearlySubmission = json['yearlySubmission'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission(
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
      yearlySubmission:
          Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission
              .fromJson((l$yearlySubmission as Map<String, dynamic>)),
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

  final Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission
      yearlySubmission;

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
    final l$yearlySubmission = yearlySubmission;
    _resultData['yearlySubmission'] = l$yearlySubmission.toJson();
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
    final l$yearlySubmission = yearlySubmission;
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
      l$yearlySubmission,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission) ||
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
    final l$yearlySubmission = yearlySubmission;
    final lOther$yearlySubmission = other.yearlySubmission;
    if (l$yearlySubmission != lOther$yearlySubmission) {
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

extension UtilityExtension$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission
    on Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission {
  CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission<
          Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission>
      get copyWith =>
          CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission<
    TRes> {
  factory CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission(
    Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission
        instance,
    TRes Function(
            Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission)
        then,
  ) = _CopyWithImpl$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission;

  factory CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission;

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
    Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission?
        yearlySubmission,
    String? $__typename,
  });
  CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission<
      TRes> get yearlySubmission;
}

class _CopyWithImpl$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission<
        TRes>
    implements
        CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission<
            TRes> {
  _CopyWithImpl$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission
      _instance;

  final TRes Function(
          Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission)
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
    Object? yearlySubmission = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission(
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
        yearlySubmission: yearlySubmission == _undefined ||
                yearlySubmission == null
            ? _instance.yearlySubmission
            : (yearlySubmission
                as Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission<
      TRes> get yearlySubmission {
    final local$yearlySubmission = _instance.yearlySubmission;
    return CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission(
        local$yearlySubmission, (e) => call(yearlySubmission: e));
  }
}

class _CopyWithStubImpl$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission<
        TRes>
    implements
        CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission(
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
    Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission?
        yearlySubmission,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission<
          TRes>
      get yearlySubmission =>
          CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission
              .stub(_res);
}

class Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission {
  Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission({
    required this.id,
    required this.financialYear,
    required this.status,
    this.$__typename = 'YearlySubmissionNode',
  });

  factory Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission.fromJson(
      Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$financialYear = json['financialYear'];
    final l$status = json['status'];
    final l$$__typename = json['__typename'];
    return Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission(
      id: (l$id as String),
      financialYear: (l$financialYear as String),
      status:
          fromJson$Enum$FpoYearlySubmissionStatusChoices((l$status as String)),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String financialYear;

  final Enum$FpoYearlySubmissionStatusChoices status;

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
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$financialYear = financialYear;
    final l$status = status;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$financialYear,
      l$status,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission
    on Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission {
  CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission<
          Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission>
      get copyWith =>
          CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission<
    TRes> {
  factory CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission(
    Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission
        instance,
    TRes Function(
            Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission)
        then,
  ) = _CopyWithImpl$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission;

  factory CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission;

  TRes call({
    String? id,
    String? financialYear,
    Enum$FpoYearlySubmissionStatusChoices? status,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission<
            TRes> {
  _CopyWithImpl$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission(
    this._instance,
    this._then,
  );

  final Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission
      _instance;

  final TRes Function(
          Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? financialYear = _undefined,
    Object? status = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(
          Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        financialYear: financialYear == _undefined || financialYear == null
            ? _instance.financialYear
            : (financialYear as String),
        status: status == _undefined || status == null
            ? _instance.status
            : (status as Enum$FpoYearlySubmissionStatusChoices),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission<
        TRes>
    implements
        CopyWith$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission<
            TRes> {
  _CopyWithStubImpl$Mutation$SubmitSustainableActivities$createSustainableActivitiesSubmission$submission$yearlySubmission(
      this._res);

  TRes _res;

  call({
    String? id,
    String? financialYear,
    Enum$FpoYearlySubmissionStatusChoices? status,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$CreateFPO {
  factory Variables$Mutation$CreateFPO({
    required String name,
    required String email,
    required String phone,
    required String addressLine1,
    String? addressLine2,
    required String city,
    required String district,
    required String state,
    required String pincode,
    String? alternatePhone,
    String? logo,
  }) =>
      Variables$Mutation$CreateFPO._({
        r'name': name,
        r'email': email,
        r'phone': phone,
        r'addressLine1': addressLine1,
        if (addressLine2 != null) r'addressLine2': addressLine2,
        r'city': city,
        r'district': district,
        r'state': state,
        r'pincode': pincode,
        if (alternatePhone != null) r'alternatePhone': alternatePhone,
        if (logo != null) r'logo': logo,
      });

  Variables$Mutation$CreateFPO._(this._$data);

  factory Variables$Mutation$CreateFPO.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    final l$email = data['email'];
    result$data['email'] = (l$email as String);
    final l$phone = data['phone'];
    result$data['phone'] = (l$phone as String);
    final l$addressLine1 = data['addressLine1'];
    result$data['addressLine1'] = (l$addressLine1 as String);
    if (data.containsKey('addressLine2')) {
      final l$addressLine2 = data['addressLine2'];
      result$data['addressLine2'] = (l$addressLine2 as String?);
    }
    final l$city = data['city'];
    result$data['city'] = (l$city as String);
    final l$district = data['district'];
    result$data['district'] = (l$district as String);
    final l$state = data['state'];
    result$data['state'] = (l$state as String);
    final l$pincode = data['pincode'];
    result$data['pincode'] = (l$pincode as String);
    if (data.containsKey('alternatePhone')) {
      final l$alternatePhone = data['alternatePhone'];
      result$data['alternatePhone'] = (l$alternatePhone as String?);
    }
    if (data.containsKey('logo')) {
      final l$logo = data['logo'];
      result$data['logo'] = (l$logo as String?);
    }
    return Variables$Mutation$CreateFPO._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);

  String get email => (_$data['email'] as String);

  String get phone => (_$data['phone'] as String);

  String get addressLine1 => (_$data['addressLine1'] as String);

  String? get addressLine2 => (_$data['addressLine2'] as String?);

  String get city => (_$data['city'] as String);

  String get district => (_$data['district'] as String);

  String get state => (_$data['state'] as String);

  String get pincode => (_$data['pincode'] as String);

  String? get alternatePhone => (_$data['alternatePhone'] as String?);

  String? get logo => (_$data['logo'] as String?);

  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    final l$email = email;
    result$data['email'] = l$email;
    final l$phone = phone;
    result$data['phone'] = l$phone;
    final l$addressLine1 = addressLine1;
    result$data['addressLine1'] = l$addressLine1;
    if (_$data.containsKey('addressLine2')) {
      final l$addressLine2 = addressLine2;
      result$data['addressLine2'] = l$addressLine2;
    }
    final l$city = city;
    result$data['city'] = l$city;
    final l$district = district;
    result$data['district'] = l$district;
    final l$state = state;
    result$data['state'] = l$state;
    final l$pincode = pincode;
    result$data['pincode'] = l$pincode;
    if (_$data.containsKey('alternatePhone')) {
      final l$alternatePhone = alternatePhone;
      result$data['alternatePhone'] = l$alternatePhone;
    }
    if (_$data.containsKey('logo')) {
      final l$logo = logo;
      result$data['logo'] = l$logo;
    }
    return result$data;
  }

  CopyWith$Variables$Mutation$CreateFPO<Variables$Mutation$CreateFPO>
      get copyWith => CopyWith$Variables$Mutation$CreateFPO(
            this,
            (i) => i,
          );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$CreateFPO) ||
        runtimeType != other.runtimeType) {
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
    if (_$data.containsKey('addressLine2') !=
        other._$data.containsKey('addressLine2')) {
      return false;
    }
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
    if (_$data.containsKey('alternatePhone') !=
        other._$data.containsKey('alternatePhone')) {
      return false;
    }
    if (l$alternatePhone != lOther$alternatePhone) {
      return false;
    }
    final l$logo = logo;
    final lOther$logo = other.logo;
    if (_$data.containsKey('logo') != other._$data.containsKey('logo')) {
      return false;
    }
    if (l$logo != lOther$logo) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
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
    return Object.hashAll([
      l$name,
      l$email,
      l$phone,
      l$addressLine1,
      _$data.containsKey('addressLine2') ? l$addressLine2 : const {},
      l$city,
      l$district,
      l$state,
      l$pincode,
      _$data.containsKey('alternatePhone') ? l$alternatePhone : const {},
      _$data.containsKey('logo') ? l$logo : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$CreateFPO<TRes> {
  factory CopyWith$Variables$Mutation$CreateFPO(
    Variables$Mutation$CreateFPO instance,
    TRes Function(Variables$Mutation$CreateFPO) then,
  ) = _CopyWithImpl$Variables$Mutation$CreateFPO;

  factory CopyWith$Variables$Mutation$CreateFPO.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$CreateFPO;

  TRes call({
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
  });
}

class _CopyWithImpl$Variables$Mutation$CreateFPO<TRes>
    implements CopyWith$Variables$Mutation$CreateFPO<TRes> {
  _CopyWithImpl$Variables$Mutation$CreateFPO(
    this._instance,
    this._then,
  );

  final Variables$Mutation$CreateFPO _instance;

  final TRes Function(Variables$Mutation$CreateFPO) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
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
  }) =>
      _then(Variables$Mutation$CreateFPO._({
        ..._instance._$data,
        if (name != _undefined && name != null) 'name': (name as String),
        if (email != _undefined && email != null) 'email': (email as String),
        if (phone != _undefined && phone != null) 'phone': (phone as String),
        if (addressLine1 != _undefined && addressLine1 != null)
          'addressLine1': (addressLine1 as String),
        if (addressLine2 != _undefined)
          'addressLine2': (addressLine2 as String?),
        if (city != _undefined && city != null) 'city': (city as String),
        if (district != _undefined && district != null)
          'district': (district as String),
        if (state != _undefined && state != null) 'state': (state as String),
        if (pincode != _undefined && pincode != null)
          'pincode': (pincode as String),
        if (alternatePhone != _undefined)
          'alternatePhone': (alternatePhone as String?),
        if (logo != _undefined) 'logo': (logo as String?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$CreateFPO<TRes>
    implements CopyWith$Variables$Mutation$CreateFPO<TRes> {
  _CopyWithStubImpl$Variables$Mutation$CreateFPO(this._res);

  TRes _res;

  call({
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
  }) =>
      _res;
}

class Mutation$CreateFPO {
  Mutation$CreateFPO({
    this.createFpo,
    this.$__typename = 'Mutation',
  });

  factory Mutation$CreateFPO.fromJson(Map<String, dynamic> json) {
    final l$createFpo = json['createFpo'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateFPO(
      createFpo: l$createFpo == null
          ? null
          : Mutation$CreateFPO$createFpo.fromJson(
              (l$createFpo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$CreateFPO$createFpo? createFpo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createFpo = createFpo;
    _resultData['createFpo'] = l$createFpo?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createFpo = createFpo;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$createFpo,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CreateFPO) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$createFpo = createFpo;
    final lOther$createFpo = other.createFpo;
    if (l$createFpo != lOther$createFpo) {
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

extension UtilityExtension$Mutation$CreateFPO on Mutation$CreateFPO {
  CopyWith$Mutation$CreateFPO<Mutation$CreateFPO> get copyWith =>
      CopyWith$Mutation$CreateFPO(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$CreateFPO<TRes> {
  factory CopyWith$Mutation$CreateFPO(
    Mutation$CreateFPO instance,
    TRes Function(Mutation$CreateFPO) then,
  ) = _CopyWithImpl$Mutation$CreateFPO;

  factory CopyWith$Mutation$CreateFPO.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateFPO;

  TRes call({
    Mutation$CreateFPO$createFpo? createFpo,
    String? $__typename,
  });
  CopyWith$Mutation$CreateFPO$createFpo<TRes> get createFpo;
}

class _CopyWithImpl$Mutation$CreateFPO<TRes>
    implements CopyWith$Mutation$CreateFPO<TRes> {
  _CopyWithImpl$Mutation$CreateFPO(
    this._instance,
    this._then,
  );

  final Mutation$CreateFPO _instance;

  final TRes Function(Mutation$CreateFPO) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? createFpo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateFPO(
        createFpo: createFpo == _undefined
            ? _instance.createFpo
            : (createFpo as Mutation$CreateFPO$createFpo?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateFPO$createFpo<TRes> get createFpo {
    final local$createFpo = _instance.createFpo;
    return local$createFpo == null
        ? CopyWith$Mutation$CreateFPO$createFpo.stub(_then(_instance))
        : CopyWith$Mutation$CreateFPO$createFpo(
            local$createFpo, (e) => call(createFpo: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateFPO<TRes>
    implements CopyWith$Mutation$CreateFPO<TRes> {
  _CopyWithStubImpl$Mutation$CreateFPO(this._res);

  TRes _res;

  call({
    Mutation$CreateFPO$createFpo? createFpo,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateFPO$createFpo<TRes> get createFpo =>
      CopyWith$Mutation$CreateFPO$createFpo.stub(_res);
}

const documentNodeMutationCreateFPO = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateFPO'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'name')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'email')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'phone')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'addressLine1')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'addressLine2')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'city')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'district')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'state')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'pincode')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'alternatePhone')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'logo')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createFpo'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'name'),
            value: VariableNode(name: NameNode(value: 'name')),
          ),
          ArgumentNode(
            name: NameNode(value: 'email'),
            value: VariableNode(name: NameNode(value: 'email')),
          ),
          ArgumentNode(
            name: NameNode(value: 'phone'),
            value: VariableNode(name: NameNode(value: 'phone')),
          ),
          ArgumentNode(
            name: NameNode(value: 'addressLine1'),
            value: VariableNode(name: NameNode(value: 'addressLine1')),
          ),
          ArgumentNode(
            name: NameNode(value: 'addressLine2'),
            value: VariableNode(name: NameNode(value: 'addressLine2')),
          ),
          ArgumentNode(
            name: NameNode(value: 'city'),
            value: VariableNode(name: NameNode(value: 'city')),
          ),
          ArgumentNode(
            name: NameNode(value: 'district'),
            value: VariableNode(name: NameNode(value: 'district')),
          ),
          ArgumentNode(
            name: NameNode(value: 'state'),
            value: VariableNode(name: NameNode(value: 'state')),
          ),
          ArgumentNode(
            name: NameNode(value: 'pincode'),
            value: VariableNode(name: NameNode(value: 'pincode')),
          ),
          ArgumentNode(
            name: NameNode(value: 'alternatePhone'),
            value: VariableNode(name: NameNode(value: 'alternatePhone')),
          ),
          ArgumentNode(
            name: NameNode(value: 'logo'),
            value: VariableNode(name: NameNode(value: 'logo')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'success'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'errors'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'fpo'),
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
Mutation$CreateFPO _parserFn$Mutation$CreateFPO(Map<String, dynamic> data) =>
    Mutation$CreateFPO.fromJson(data);
typedef OnMutationCompleted$Mutation$CreateFPO = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$CreateFPO?,
);

class Options$Mutation$CreateFPO
    extends graphql.MutationOptions<Mutation$CreateFPO> {
  Options$Mutation$CreateFPO({
    String? operationName,
    required Variables$Mutation$CreateFPO variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateFPO? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateFPO? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateFPO>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$CreateFPO(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateFPO,
          parserFn: _parserFn$Mutation$CreateFPO,
        );

  final OnMutationCompleted$Mutation$CreateFPO? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$CreateFPO
    extends graphql.WatchQueryOptions<Mutation$CreateFPO> {
  WatchOptions$Mutation$CreateFPO({
    String? operationName,
    required Variables$Mutation$CreateFPO variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateFPO? typedOptimisticResult,
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
          document: documentNodeMutationCreateFPO,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$CreateFPO,
        );
}

extension ClientExtension$Mutation$CreateFPO on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$CreateFPO>> mutate$CreateFPO(
          Options$Mutation$CreateFPO options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$CreateFPO> watchMutation$CreateFPO(
          WatchOptions$Mutation$CreateFPO options) =>
      this.watchMutation(options);
}

class Mutation$CreateFPO$HookResult {
  Mutation$CreateFPO$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$CreateFPO runMutation;

  final graphql.QueryResult<Mutation$CreateFPO> result;
}

Mutation$CreateFPO$HookResult useMutation$CreateFPO(
    [WidgetOptions$Mutation$CreateFPO? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$CreateFPO());
  return Mutation$CreateFPO$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$CreateFPO> useWatchMutation$CreateFPO(
        WatchOptions$Mutation$CreateFPO options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$CreateFPO
    extends graphql.MutationOptions<Mutation$CreateFPO> {
  WidgetOptions$Mutation$CreateFPO({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$CreateFPO? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$CreateFPO? onCompleted,
    graphql.OnMutationUpdate<Mutation$CreateFPO>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$CreateFPO(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationCreateFPO,
          parserFn: _parserFn$Mutation$CreateFPO,
        );

  final OnMutationCompleted$Mutation$CreateFPO? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$CreateFPO
    = graphql.MultiSourceResult<Mutation$CreateFPO> Function(
  Variables$Mutation$CreateFPO, {
  Object? optimisticResult,
  Mutation$CreateFPO? typedOptimisticResult,
});
typedef Builder$Mutation$CreateFPO = widgets.Widget Function(
  RunMutation$Mutation$CreateFPO,
  graphql.QueryResult<Mutation$CreateFPO>?,
);

class Mutation$CreateFPO$Widget
    extends graphql_flutter.Mutation<Mutation$CreateFPO> {
  Mutation$CreateFPO$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$CreateFPO? options,
    required Builder$Mutation$CreateFPO builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$CreateFPO(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$CreateFPO$createFpo {
  Mutation$CreateFPO$createFpo({
    this.success,
    this.errors,
    this.fpo,
    this.$__typename = 'CreateFPOMutation',
  });

  factory Mutation$CreateFPO$createFpo.fromJson(Map<String, dynamic> json) {
    final l$success = json['success'];
    final l$errors = json['errors'];
    final l$fpo = json['fpo'];
    final l$$__typename = json['__typename'];
    return Mutation$CreateFPO$createFpo(
      success: (l$success as bool?),
      errors: (l$errors as List<dynamic>?)?.map((e) => (e as String?)).toList(),
      fpo: l$fpo == null
          ? null
          : Mutation$CreateFPO$createFpo$fpo.fromJson(
              (l$fpo as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final bool? success;

  final List<String?>? errors;

  final Mutation$CreateFPO$createFpo$fpo? fpo;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$success = success;
    _resultData['success'] = l$success;
    final l$errors = errors;
    _resultData['errors'] = l$errors?.map((e) => e).toList();
    final l$fpo = fpo;
    _resultData['fpo'] = l$fpo?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$success = success;
    final l$errors = errors;
    final l$fpo = fpo;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$success,
      l$errors == null ? null : Object.hashAll(l$errors.map((v) => v)),
      l$fpo,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$CreateFPO$createFpo) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$success = success;
    final lOther$success = other.success;
    if (l$success != lOther$success) {
      return false;
    }
    final l$errors = errors;
    final lOther$errors = other.errors;
    if (l$errors != null && lOther$errors != null) {
      if (l$errors.length != lOther$errors.length) {
        return false;
      }
      for (int i = 0; i < l$errors.length; i++) {
        final l$errors$entry = l$errors[i];
        final lOther$errors$entry = lOther$errors[i];
        if (l$errors$entry != lOther$errors$entry) {
          return false;
        }
      }
    } else if (l$errors != lOther$errors) {
      return false;
    }
    final l$fpo = fpo;
    final lOther$fpo = other.fpo;
    if (l$fpo != lOther$fpo) {
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

extension UtilityExtension$Mutation$CreateFPO$createFpo
    on Mutation$CreateFPO$createFpo {
  CopyWith$Mutation$CreateFPO$createFpo<Mutation$CreateFPO$createFpo>
      get copyWith => CopyWith$Mutation$CreateFPO$createFpo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateFPO$createFpo<TRes> {
  factory CopyWith$Mutation$CreateFPO$createFpo(
    Mutation$CreateFPO$createFpo instance,
    TRes Function(Mutation$CreateFPO$createFpo) then,
  ) = _CopyWithImpl$Mutation$CreateFPO$createFpo;

  factory CopyWith$Mutation$CreateFPO$createFpo.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateFPO$createFpo;

  TRes call({
    bool? success,
    List<String?>? errors,
    Mutation$CreateFPO$createFpo$fpo? fpo,
    String? $__typename,
  });
  CopyWith$Mutation$CreateFPO$createFpo$fpo<TRes> get fpo;
}

class _CopyWithImpl$Mutation$CreateFPO$createFpo<TRes>
    implements CopyWith$Mutation$CreateFPO$createFpo<TRes> {
  _CopyWithImpl$Mutation$CreateFPO$createFpo(
    this._instance,
    this._then,
  );

  final Mutation$CreateFPO$createFpo _instance;

  final TRes Function(Mutation$CreateFPO$createFpo) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? success = _undefined,
    Object? errors = _undefined,
    Object? fpo = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$CreateFPO$createFpo(
        success: success == _undefined ? _instance.success : (success as bool?),
        errors: errors == _undefined
            ? _instance.errors
            : (errors as List<String?>?),
        fpo: fpo == _undefined
            ? _instance.fpo
            : (fpo as Mutation$CreateFPO$createFpo$fpo?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));

  CopyWith$Mutation$CreateFPO$createFpo$fpo<TRes> get fpo {
    final local$fpo = _instance.fpo;
    return local$fpo == null
        ? CopyWith$Mutation$CreateFPO$createFpo$fpo.stub(_then(_instance))
        : CopyWith$Mutation$CreateFPO$createFpo$fpo(
            local$fpo, (e) => call(fpo: e));
  }
}

class _CopyWithStubImpl$Mutation$CreateFPO$createFpo<TRes>
    implements CopyWith$Mutation$CreateFPO$createFpo<TRes> {
  _CopyWithStubImpl$Mutation$CreateFPO$createFpo(this._res);

  TRes _res;

  call({
    bool? success,
    List<String?>? errors,
    Mutation$CreateFPO$createFpo$fpo? fpo,
    String? $__typename,
  }) =>
      _res;

  CopyWith$Mutation$CreateFPO$createFpo$fpo<TRes> get fpo =>
      CopyWith$Mutation$CreateFPO$createFpo$fpo.stub(_res);
}

class Mutation$CreateFPO$createFpo$fpo {
  Mutation$CreateFPO$createFpo$fpo({
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

  factory Mutation$CreateFPO$createFpo$fpo.fromJson(Map<String, dynamic> json) {
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
    return Mutation$CreateFPO$createFpo$fpo(
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
    if (!(other is Mutation$CreateFPO$createFpo$fpo) ||
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

extension UtilityExtension$Mutation$CreateFPO$createFpo$fpo
    on Mutation$CreateFPO$createFpo$fpo {
  CopyWith$Mutation$CreateFPO$createFpo$fpo<Mutation$CreateFPO$createFpo$fpo>
      get copyWith => CopyWith$Mutation$CreateFPO$createFpo$fpo(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$CreateFPO$createFpo$fpo<TRes> {
  factory CopyWith$Mutation$CreateFPO$createFpo$fpo(
    Mutation$CreateFPO$createFpo$fpo instance,
    TRes Function(Mutation$CreateFPO$createFpo$fpo) then,
  ) = _CopyWithImpl$Mutation$CreateFPO$createFpo$fpo;

  factory CopyWith$Mutation$CreateFPO$createFpo$fpo.stub(TRes res) =
      _CopyWithStubImpl$Mutation$CreateFPO$createFpo$fpo;

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

class _CopyWithImpl$Mutation$CreateFPO$createFpo$fpo<TRes>
    implements CopyWith$Mutation$CreateFPO$createFpo$fpo<TRes> {
  _CopyWithImpl$Mutation$CreateFPO$createFpo$fpo(
    this._instance,
    this._then,
  );

  final Mutation$CreateFPO$createFpo$fpo _instance;

  final TRes Function(Mutation$CreateFPO$createFpo$fpo) _then;

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
      _then(Mutation$CreateFPO$createFpo$fpo(
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

class _CopyWithStubImpl$Mutation$CreateFPO$createFpo$fpo<TRes>
    implements CopyWith$Mutation$CreateFPO$createFpo$fpo<TRes> {
  _CopyWithStubImpl$Mutation$CreateFPO$createFpo$fpo(this._res);

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
