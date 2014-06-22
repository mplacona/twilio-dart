import 'package:unittest/unittest.dart';
import 'package:twillio_dart/twillio.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'fixtures/status_messages.dart';
import 'fixtures/expected_messages.dart';
import 'package:twillio_dart/resources/accounts.dart';
import 'package:twillio_dart/resources/messages.dart';
import 'package:http/testing.dart'; 

void main() {
    print("Twillio API implementation Tests!");

    group('Object Setup :: ', () {
        var key = "12345";
        var authToken = "12345";
        var version = "2010-04-01";

        test("New instance of Twillio is created", () {
            var twillio = new Twillio(key, authToken, version);
            expect(twillio is Twillio, isTrue);
        });
        test("New instance of Twillio is created with format specified", () {
            var twillio = new Twillio(key, authToken, version);
            expect(twillio is Twillio, isTrue);
        });
    });

    group('Methods :: ', () {
        var _accountSid = "AC9d3e7fbe4b0d27fa1b5c60146fcb3bea",
                _authToken = "12345",
                _apiVersion = "2010-04-01",
                _baseUri = "api.twilio.com";


        group('Send SMS :: ', () {
            test("New SMS URL is created correctly", () {
                var twillio = new Twillio(_accountSid, _authToken, _apiVersion);
                var accounts = new Accounts().resource;
                var messages = new Messages(_accountSid);
                var url = "https://AC9d3e7fbe4b0d27fa1b5c60146fcb3bea:12345@api.twilio.com/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Messages.json";
                expect(twillio.buildBaseUrl(messages.getPostResource()), equals(url));
            });


            test("Send SMS errors with wrong account", () {
                var mockHttpClient = new MockClient((request) {
                    return new http.Response(message401, 401, headers: {
                        'content-type': 'application/json'
                    });
                });

                var twillio = new Twillio(_accountSid, _authToken, _apiVersion, mockHttpClient);
                Future<http.Request> future;

                future = twillio.sendSMS("+112345678", "+44123456789", "this is a test").then((value) => value);
                expect(future.then((value) => JSON.decode(value.toString())), completion(equals(JSON.decode(smsWrongAccount))));
            });

            test("Send SMS successfuly sent", () {
                var mockHttpClient = new MockClient((request) {
                    return new http.Response(smsWriteResponse, 200, headers: {
                        'content-type': 'application/json'
                    });
                });

                var twillio = new Twillio(_accountSid, _authToken, _apiVersion, mockHttpClient);
                Future<http.Request> future;

                future = twillio.sendSMS("+441234567890", "+44123456789", "this is a test").then((value) => value);
                expect(future.then((value) => JSON.decode(value.toString())), completion(containsValue("SMb938df8bb21a4b7faf240e5c99e6efbd")));
            });
        });

        group('Read SMS :: ', () {
            var _messageSid = "SMb938df8bb21a4b7faf240e5c99e6efbd";
            test("Read SMS URL is created correctly", () {
                var twillio = new Twillio(_accountSid, _authToken, _apiVersion);
                var messages = new Messages(_accountSid);
                var url = "https://AC9d3e7fbe4b0d27fa1b5c60146fcb3bea:12345@api.twilio.com/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Messages/SMb938df8bb21a4b7faf240e5c99e6efbd.json";
                expect(twillio.buildBaseUrl(messages.getGetMessageResource(_messageSid)), equals(url));
            });
            test("Read SMS errors with wrong account", () {
                var mockHttpClient = new MockClient((request) {
                    return new http.Response(message401, 401, headers: {
                        'content-type': 'application/json'
                    });
                });

                var twillio = new Twillio(_accountSid, _authToken, _apiVersion, mockHttpClient);
                Future<http.Request> future;

                future = twillio.readSMS(_messageSid).then((value) => value);
                expect(future.then((value) => JSON.decode(value.toString())), completion(equals(JSON.decode(smsWrongAccount))));
            });

            test("Read SMS", () {
                var mockHttpClient = new MockClient((request) {
                    return new http.Response(smsReadResponse, 200, headers: {
                        'content-type': 'application/json'
                    });
                });

                var twillio = new Twillio(_accountSid, _authToken, _apiVersion, mockHttpClient);
                Future<http.Request> future;

                future = twillio.readSMS(_messageSid).then((value) => value);
                expect(future.then((value) => JSON.decode(value.toString())), completion(containsValue("this is a test")));
            });
        });
        
        group('Read SMS List :: ', () {
            test("Read SMS List URL is created correctly", () {
                var twillio = new Twillio(_accountSid, _authToken, _apiVersion);
                var messages = new Messages(_accountSid);
                var url = "https://AC9d3e7fbe4b0d27fa1b5c60146fcb3bea:12345@api.twilio.com/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Messages.json";
                expect(twillio.buildBaseUrl(messages.getGetMessageListResource()), equals(url));
            });
            test("Read SMS errors with wrong account", () {
                var mockHttpClient = new MockClient((request) {
                    return new http.Response(message401, 401, headers: {
                        'content-type': 'application/json'
                    });
                });

                var twillio = new Twillio(_accountSid, _authToken, _apiVersion, mockHttpClient);
                Future<http.Request> future;

                future = twillio.readSMSList().then((value) => value);
                expect(future.then((value) => JSON.decode(value.toString())), completion(equals(JSON.decode(smsWrongAccount))));
            });

            test("Read SMS List", () {
                var mockHttpClient = new MockClient((request) {
                    return new http.Response(smsReadListResponse, 200, headers: {
                        'content-type': 'application/json'
                    });
                });

                var twillio = new Twillio(_accountSid, _authToken, _apiVersion, mockHttpClient);
                Future<http.Request> future;

                future = twillio.readSMSList().then((value) => value);
                expect(future.then((value) => JSON.decode(value.toString()).toString()), completion(matches("this is a test")));
            });
        });


    });
}
