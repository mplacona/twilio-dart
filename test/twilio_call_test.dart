library twilio_dart.test.twilio_call_test;

import 'package:unittest/unittest.dart';
import 'package:twilio_dart/twilio.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'fixtures/status_messages.dart';
import 'fixtures/expected_messages.dart';
import 'package:http/testing.dart';

void main() {
    group('Methods :: ', () {
        var _accountSid = "AC9d3e7fbe4b0d27fa1b5c60146fcb3bea",
                _authToken = "12345",
                _apiVersion = "2010-04-01",
                _baseUri = "api.twilio.com";

        group('Calls :: ', () {
            group('List Calls :: ', () {
                test("Return success", () {
                    var mockHttpClient = new MockClient((request) {
                        return new http.Response(callListResponse, 200, headers: {
                            'content-type': 'application/json'
                        });
                    });

                    var twilio = new Twilio(_accountSid, _authToken, _apiVersion, mockHttpClient);
                    Future<http.Request> future;
                    future = twilio.readCallsList();
                    expect(future.then((value) => value.toString()), completion(contains('CAcb3d7a3ad6c4195aaaeb882e98eaea31')));
                });

                test("Errors with wrong account", () {
                    var _authToken = "something_that_doesnt_exist";
                    var mockHttpClient = new MockClient((request) {
                        return new http.Response(message401, 401, headers: {
                            'content-type': 'application/json'
                        });
                    });

                    var twilio = new Twilio(_accountSid, _authToken, _apiVersion, mockHttpClient);
                    Future<http.Request> future;

                    future = twilio.readCallsList();
                    expect(future, throwsArgumentError);
                });
            });  
            group('Make Call ::', (){
                test("Return success", (){
                    
                });
            });
        });

    });
}
