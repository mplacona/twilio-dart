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

        test("New SMS URL is created correctly", () {
            var twillio = new Twillio(_accountSid, _authToken, _apiVersion);
            var accounts = new Accounts().resource;
            var messages = new Messages(_accountSid);
            var url = "https://$_accountSid:$_authToken@$_baseUri/$_apiVersion/" + messages.resource;
            expect(twillio.buildBaseUrl(messages.resource), equals(url));
        });


        test("Send SMS errors with wrong account", () {
            var mockHttpClient = new MockClient((request) {
                return new http.Response(message401, 401, headers: {
                    'content-type': 'application/json'
                });
            });

            var twillio = new Twillio(_accountSid, _authToken, _apiVersion, mockHttpClient);
            Future<http.Request> future;

            future = twillio.sendSMS("+112345678", "+44123456789", "this is a test").then((value) => value.toString());
            expect(future.then((value) => JSON.decode(value.toString())), completion(equals(JSON.decode(smsWrongAccount))));
        });

        test("Send SMS successfuly sent", () {
            var mockHttpClient = new MockClient((request) {
                return new http.Response(messageSMSSent, 200, headers: {
                    'content-type': 'application/json'
                });
            });
            
            var twillio = new Twillio(_accountSid, _authToken, _apiVersion, mockHttpClient);
            Future<http.Request> future;

            future = twillio.sendSMS("+441234567890", "+44123456789", "this is a test").then((value) => value.toString());
            expect(future.then((value) => JSON.decode(value.toString())), completion(containsValue("SMb938df8bb21a4b7faf240e5c99e6efbd")));
        });

    });
}
