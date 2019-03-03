library twilio_dart.test.twilio_message_test;

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

import '../lib/twilio.dart';
import 'fixtures/expected_messages.dart';
import 'fixtures/status_messages.dart';
//import 'package:twilio_dart/twilio.dart';

void main() {
  group(
    'Methods :: ',
    () {
      const String _accountSid = "AC9d3e7fbe4b0d27fa1b5c60146fcb3bea";
      const String _authToken = "12345";
      const String _apiVersion = "2010-04-01";
      const String _baseUri = "api.twilio.com";

      group(
        'Message :: ',
        () {
          group(
            'Send SMS :: ',
            () {
              test(
                "Send SMS errors with wrong account",
                () {
                  final mockHttpClient = MockClient(
                    (request) {
                      return Future<http.Response>.value(http.Response(
                          smsWrongAccount, 400,
                          headers: {'content-type': 'application/json'}));
                    },
                  );

                  final twilio = Twilio(
                      _accountSid, _authToken, _apiVersion, mockHttpClient);
                  Future future;

                  future = twilio.sendSMS(
                      "+112345678", "+44123456789", "this is a test");
                  expect(future, throwsArgumentError);
                },
              );

              test(
                "Send SMS errors with wrong 'From' number",
                () {
                  final mockHttpClient = MockClient(
                    (request) {
                      return Future<http.Response>.value(http.Response(
                          smsWrongFrom, 400,
                          headers: {'content-type': 'application/json'}));
                    },
                  );

                  final twilio = Twilio(
                      _accountSid, _authToken, _apiVersion, mockHttpClient);
                  Future future;

                  future = twilio.sendSMS(
                      "+112345678", "+44123456789", "this is a test");
                  expect(future, throwsArgumentError);
                },
              );

              test(
                "Send SMS not owned by the account",
                () {
                  final mockHttpClient = MockClient(
                    (request) {
                      return Future<http.Response>.value(http.Response(
                          smsWrongFrom, 400,
                          headers: {'content-type': 'application/json'}));
                    },
                  );

                  final twilio = Twilio(
                      _accountSid, _authToken, _apiVersion, mockHttpClient);
                  Future future;

                  future = twilio.sendSMS(
                      "+15005550007", "+44123456789", "this is a test");
                  expect(future, throwsArgumentError);
                },
              );

              test(
                "Send SMS successfuly sent",
                () {
                  final mockHttpClient = MockClient(
                    (request) {
                      return Future<http.Response>.value(http.Response(
                          smsWriteResponse, 200,
                          headers: {'content-type': 'application/json'}));
                    },
                  );

                  final twilio = Twilio(
                      _accountSid, _authToken, _apiVersion, mockHttpClient);
                  Future future;

                  future = twilio.sendSMS(
                      "+441234567890", "+44123456789", "this is a test");
                  expect(
                      future.then((value) => jsonDecode(value.toString())),
                      completion(
                          containsValue("SMb938df8bb21a4b7faf240e5c99e6efbd")));
                },
              );

              test(
                "Send MMS successfuly sent",
                () {
                  final mockHttpClient = MockClient(
                    (request) {
                      return Future<http.Response>.value(http.Response(
                          smsWriteResponse, 200,
                          headers: {'content-type': 'application/json'}));
                    },
                  );

                  final twilio = Twilio(
                      _accountSid, _authToken, _apiVersion, mockHttpClient);
                  Future future;

                  future = twilio.sendSMS("+441234567890", "+44123456789",
                      "this is a test", "http://www.example.com/sample.png");
                  expect(
                      future.then((value) => jsonDecode(value.toString())),
                      completion(
                          containsValue("SMb938df8bb21a4b7faf240e5c99e6efbd")));
                },
              );
            },
          );

          group(
            'Read SMS :: ',
            () {
              const _messageSid = "something_that_doesnt_exist";
              test(
                "Read SMS errors with wrong account",
                () {
                  final mockHttpClient = MockClient(
                    (request) {
                      return Future<http.Response>.value(http.Response(
                          smsReadWrongAccount, 401,
                          headers: {'content-type': 'application/json'}));
                    },
                  );

                  final twilio = Twilio(
                      _accountSid, _authToken, _apiVersion, mockHttpClient);
                  Future future;

                  future = twilio.readSMS(_messageSid);
                  expect(future, throwsArgumentError);
                },
              );

              test(
                "Read SMS",
                () {
                  final mockHttpClient = MockClient(
                    (request) {
                      return Future<http.Response>.value(http.Response(
                          smsReadResponse, 200,
                          headers: {'content-type': 'application/json'}));
                    },
                  );

                  final twilio = Twilio(
                      _accountSid, _authToken, _apiVersion, mockHttpClient);
                  Future future;

                  future = twilio.readSMS(_messageSid);
                  expect(future.then((value) => jsonDecode(value.toString())),
                      completion(containsValue("this is a test")));
                },
              );
            },
          );

          group(
            'Read SMS List :: ',
            () {
              test(
                "Read SMS errors with wrong account",
                () {
                  final mockHttpClient = MockClient(
                    (request) {
                      return Future<http.Response>.value(http.Response(
                          message401, 401,
                          headers: {'content-type': 'application/json'}));
                    },
                  );

                  final twilio = Twilio(
                      _accountSid, _authToken, _apiVersion, mockHttpClient);
                  Future future;

                  future = twilio.readSMSList();
                  expect(future, throwsArgumentError);
                },
              );

              test(
                "SMS List",
                () {
                  final mockHttpClient = MockClient(
                    (request) {
                      return Future<http.Response>.value(http.Response(
                          smsReadListResponse, 200,
                          headers: {'content-type': 'application/json'}));
                    },
                  );

                  final twilio = Twilio(
                      _accountSid, _authToken, _apiVersion, mockHttpClient);
                  Future future;

                  future = twilio.readSMSList();
                  expect(
                      future.then(
                          (value) => jsonDecode(value.toString()).toString()),
                      completion(matches("this is a test")));
                },
              );
            },
          );
        },
      );
    },
  );
}
