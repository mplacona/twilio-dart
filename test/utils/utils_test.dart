library twilio_dart.test.utils.utils_test;

import 'package:unittest/unittest.dart';
import 'package:twilio_dart/utils/utils.dart';
import 'package:twilio_dart/resources/accounts.dart';
import 'package:twilio_dart/resources/messages.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';


void main() {
    group('URL & HTTP :: ', () {
        var _accountSid = "AC9d3e7fbe4b0d27fa1b5c60146fcb3bea",
                _authToken = "12345",
                _apiVersion = "2010-04-01",
                _baseUri = "api.twilio.com";
        Map<String, String> _auth = new Map<String, String>();
        _auth['accountSid'] = _accountSid;
        _auth['authToken'] = _authToken;
        _auth['apiVersion'] = _apiVersion;
        _auth['baseUri'] = _baseUri;

        // This needs fixing
        /*
        group('Http Request', () {
            var mockHttpClient = new MockClient((request) {
                return new http.Response("something will always return", 200, headers: {
                    'content-type': 'application/json'
                });
            });
            var resource = "http://iama200.com";
            Future<http.Request> future = apiRequest(resource, mockHttpClient, _auth);
            expect(future.then((value) => value.toString()), completion(equals("something will always return")));
        });
        */

        group('Send SMS URL :: ', () {
            test("New SMS URL is created correctly", () {
                var accounts = new Accounts().resource;
                var messages = new Messages(_accountSid);
                var url = "https://AC9d3e7fbe4b0d27fa1b5c60146fcb3bea:12345@api.twilio.com/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Messages.json";
                expect(buildAuthUrl(messages.getPostResource(), _auth), equals(url));
            });

        });

        group('Read SMS URL :: ', () {
            var _messageSid = "SMb938df8bb21a4b7faf240e5c99e6efbd";
            test("Read SMS URL is created correctly", () {
                var messages = new Messages(_accountSid);
                var url = "https://AC9d3e7fbe4b0d27fa1b5c60146fcb3bea:12345@api.twilio.com/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Messages/SMb938df8bb21a4b7faf240e5c99e6efbd.json";
                expect(buildAuthUrl(messages.getGetMessageResource(_messageSid), _auth), equals(url));
            });
        });

        group('Read SMS List URL :: ', () {
            test("Read SMS List URL is created correctly", () {
                var messages = new Messages(_accountSid);
                var url = "https://AC9d3e7fbe4b0d27fa1b5c60146fcb3bea:12345@api.twilio.com/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Messages.json";
                expect(buildAuthUrl(messages.getGetMessageListResource(), _auth), equals(url));
            });
        });
    });
}
