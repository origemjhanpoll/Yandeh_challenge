// Mocks generated by Mockito 5.4.4 from annotations
// in yandeh_challenge/test/features/home/data/repositories/sections_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i4;
import 'package:yandeh_challenge/features/home/data/datasources/remote_datasource.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeClient_0 extends _i1.SmartFake implements _i2.Client {
  _FakeClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [RemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteDataSource extends _i1.Mock implements _i3.RemoteDataSource {
  MockRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Client get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeClient_0(
          this,
          Invocation.getter(#client),
        ),
      ) as _i2.Client);

  @override
  String get token => (super.noSuchMethod(
        Invocation.getter(#token),
        returnValue: _i4.dummyValue<String>(
          this,
          Invocation.getter(#token),
        ),
      ) as String);

  @override
  _i5.Future<Map<String, dynamic>> getSections({
    bool? originalSections,
    String? argument,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getSections,
          [],
          {
            #originalSections: originalSections,
            #argument: argument,
          },
        ),
        returnValue:
            _i5.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i5.Future<Map<String, dynamic>>);
}
