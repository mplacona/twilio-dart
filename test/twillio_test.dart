import 'package:unittest/unittest.dart';
import 'package:twillio_dart/twillio.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:mock/mock.dart';
import 'fixtures/status_messages.dart';
import 'package:twillio_dart/resources/accounts.dart';
import 'package:twillio_dart/resources/messages.dart';
import 'package:http/testing.dart';

/*
void main() {
  test('bla', () {
    var mockHttpClient = new HttpClientMock()
            ..when(callsTo('send')).alwaysReturn(new Future(() => [""]));

    http.Request req = new http.Request('POST', Uri.parse('http://www.google.com'));
    var s = mockHttpClient.send(req).then((val) => print(val.toString()));
  });
}
*/

void main() {
    print("Twillio API implementation Tests!");
    /*
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
*/
    group('Methods :: ', () {
        var _accountSid = "AC9d3e7fbe4b0d27fa1b5c60146fcb3bea",
                _authToken = "12345",
                _apiVersion = "2010-04-01",
                _baseUri = "api.twilio.com";

        var mockHttpClient = new MockClient((request) {
            return new http.Response(message401, 200, headers: {
                'content-type': 'application/json'
            });
        });

        var twillio = new Twillio(_accountSid, _authToken, _apiVersion, mockHttpClient);
        Future<http.Request> future;


        test("New SMS URL is created correctly", () {
            var accounts = new Accounts().resource;
            var messages = new Messages(_accountSid);
            var url = "https://$_accountSid:$_authToken@$_baseUri/$_apiVersion/" + messages.resource;
            expect(twillio.buildBaseUrl(messages.resource), equals(url));
        });


        test("Send SMS errors with wrong account", () {
            var response = JSON.encode({
                "code": 20003,
                "detail": "Your AccountSid or AuthToken was incorrect.",
                "message": "Authenticate",
                "more_info": "https://www.twilio.com/docs/errors/20003",
                "status": 401
            });
            
            future = twillio.sendSMS("+112345678", "+447590566866", "this is a test").then((value) => value.toString());
            expect(future.then((value) => JSON.decode(value)), completion(equals(JSON.decode(response))));
        });

    });
}
