library twilio_dart.test.twilio_test;

import 'package:unittest/unittest.dart';
import 'package:twilio_dart/twilio.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'fixtures/status_messages.dart';
import 'fixtures/expected_messages.dart';
import 'package:http/testing.dart';

void main() {
    print("Twilio API implementation Tests!");

    group('Object Setup :: ', () {
        var key = "12345";
        var authToken = "12345";
        var version = "2010-04-01";

        test("New instance of Twilio is created", () {
            var twilio = new Twilio(key, authToken, version);
            expect(twilio is Twilio, isTrue);
        });
        test("New instance of Twilio is created with format specified", () {
            var twilio = new Twilio(key, authToken, version);
            expect(twilio is Twilio, isTrue);
        });
    });

    group('Methods :: ', () {
        var _accountSid = "AC9d3e7fbe4b0d27fa1b5c60146fcb3bea",
                _authToken = "12345",
                _apiVersion = "2010-04-01",
                _baseUri = "api.twilio.com";

        group('Message :: ', () {
            group('Send SMS :: ', () {
                test("Send SMS errors with wrong account", () {

                    var mockHttpClient = new MockClient((request) {
                        return new http.Response(smsWrongAccount, 400, headers: {
                            'content-type': 'application/json'
                        });
                    });

                    var twilio = new Twilio(_accountSid, _authToken, _apiVersion, mockHttpClient);
                    Future<http.Request> future;

                    future = twilio.sendSMS("+112345678", "+44123456789", "this is a test");
                    expect(future, throwsArgumentError);

                });

                test("Send SMS errors with wrong 'From' number", () {
                    var mockHttpClient = new MockClient((request) {
                        return new http.Response(smsWrongFrom, 400, headers: {
                            'content-type': 'application/json'
                        });
                    });

                    var twilio = new Twilio(_accountSid, _authToken, _apiVersion, mockHttpClient);
                    Future<http.Request> future;

                    future = twilio.sendSMS("+112345678", "+44123456789", "this is a test");
                    expect(future, throwsArgumentError);

                });

                test("Send SMS not owned by the account", () {
                    var mockHttpClient = new MockClient((request) {
                        return new http.Response(smsWrongFrom, 400, headers: {
                            'content-type': 'application/json'
                        });
                    });

                    var twilio = new Twilio(_accountSid, _authToken, _apiVersion, mockHttpClient);
                    Future<http.Request> future;

                    future = twilio.sendSMS("+15005550007", "+44123456789", "this is a test");
                    expect(future, throwsArgumentError);
                });

                test("Send SMS successfuly sent", () {
                    var mockHttpClient = new MockClient((request) {
                        return new http.Response(smsWriteResponse, 200, headers: {
                            'content-type': 'application/json'
                        });
                    });

                    var twilio = new Twilio(_accountSid, _authToken, _apiVersion, mockHttpClient);
                    Future<http.Request> future;

                    future = twilio.sendSMS("+441234567890", "+44123456789", "this is a test");
                    expect(future.then((value) => JSON.decode(value.toString())), completion(containsValue("SMb938df8bb21a4b7faf240e5c99e6efbd")));
                });

                test("Send MMS successfuly sent", () {
                    var mockHttpClient = new MockClient((request) {
                        return new http.Response(smsWriteResponse, 200, headers: {
                            'content-type': 'application/json'
                        });
                    });

                    var twilio = new Twilio(_accountSid, _authToken, _apiVersion, mockHttpClient);
                    Future<http.Request> future;

                    future = twilio.sendSMS("+441234567890", "+44123456789", "this is a test", "http://www.example.com/sample.png");
                    expect(future.then((value) => JSON.decode(value.toString())), completion(containsValue("SMb938df8bb21a4b7faf240e5c99e6efbd")));
                });
            });

            group('Read SMS :: ', () {
                var _messageSid = "something_that_doesnt_exist";
                test("Read SMS errors with wrong account", () {

                    var mockHttpClient = new MockClient((request) {
                        return new http.Response(smsReadWrongAccount, 401, headers: {
                            'content-type': 'application/json'
                        });
                    });

                    var twilio = new Twilio(_accountSid, _authToken, _apiVersion, mockHttpClient);
                    Future<http.Request> future;

                    future = twilio.readSMS(_messageSid);
                    expect(future, throwsArgumentError);
                });

                test("Read SMS", () {
                    var mockHttpClient = new MockClient((request) {
                        return new http.Response(smsReadResponse, 200, headers: {
                            'content-type': 'application/json'
                        });
                    });

                    var twilio = new Twilio(_accountSid, _authToken, _apiVersion, mockHttpClient);
                    Future<http.Request> future;

                    future = twilio.readSMS(_messageSid);
                    expect(future.then((value) => JSON.decode(value.toString())), completion(containsValue("this is a test")));
                });
            });

            group('Read SMS List :: ', () {
                test("Read SMS errors with wrong account", () {
                    var mockHttpClient = new MockClient((request) {
                        return new http.Response(message401, 401, headers: {
                            'content-type': 'application/json'
                        });
                    });

                    var twilio = new Twilio(_accountSid, _authToken, _apiVersion, mockHttpClient);
                    Future<http.Request> future;

                    future = twilio.readSMSList();
                    expect(future, throwsArgumentError);
                });

                test("SMS List", () {
                    var mockHttpClient = new MockClient((request) {
                        return new http.Response(smsReadListResponse, 200, headers: {
                            'content-type': 'application/json'
                        });
                    });

                    var twilio = new Twilio(_accountSid, _authToken, _apiVersion, mockHttpClient);
                    Future<http.Request> future;

                    future = twilio.readSMSList();
                    expect(future.then((value) => JSON.decode(value.toString()).toString()), completion(matches("this is a test")));
                });
            });

        });
        
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
        });
        
    });
}
