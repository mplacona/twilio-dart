library twilio_dart.test.twilio_call_test;

import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

import '../lib/twilio.dart';
import 'fixtures/expected_messages.dart';
import 'fixtures/status_messages.dart';
// import 'package:twilio_dart/twilio.dart';

void main() {
  group('Methods :: ', () {
    const String _accountSid = "AC9d3e7fbe4b0d27fa1b5c60146fcb3bea";
    const String _authToken = "12345";
    const String _apiVersion = "2010-04-01";
    const String _baseUri = "api.twilio.com";

    group('Calls :: ', () {
      group('List Calls :: ', () {
        test("Return success", () {
          final mockHttpClient = MockClient((request) {
            return Future<http.Response>.value(http.Response(
                callListResponse, 200,
                headers: {'content-type': 'application/json'}));
          });

          final twilio =
              Twilio(_accountSid, _authToken, _apiVersion, mockHttpClient);
          Future future;
          future = twilio.readCallsList();
          expect(future.then((value) => value.toString()),
              completion(contains('CAcb3d7a3ad6c4195aaaeb882e98eaea31')));
        });

        test("Errors with wrong account", () {
          const _authToken = "something_that_doesnt_exist";
          final mockHttpClient = MockClient((request) {
            return Future<http.Response>.value(http.Response(message401, 401,
                headers: {'content-type': 'application/json'}));
          });

          final twilio =
              Twilio(_accountSid, _authToken, _apiVersion, mockHttpClient);
          Future future;

          future = twilio.readCallsList();
          expect(future, throwsArgumentError);
        });
      });
      group('Make Call ::', () {
        test("Return success", () {});
      });
    });
  });
}
