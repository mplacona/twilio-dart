import 'package:unittest/unittest.dart';
import 'package:twillio_dart/twillio.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:mock/mock.dart';
import 'dart:io';
import 'package:twillio_dart/resources/messages.dart';
import 'package:twillio_dart/resources/accounts.dart';
import 'fixtures/status_messages.dart';


class HttpRequestMock extends Mock implements http.Response {
    Uri uri;
    String method;
    HttpResponseMock response = new HttpResponseMock();

    HttpRequestMock(this.uri, {this.method});

    noSuchMethod(i) => super.noSuchMethod(i);
}

class HttpClientMock extends Mock implements http.Client{
    noSuchMethod(i) => super.noSuchMethod(i);
}

class HttpResponseMock extends Mock implements HttpResponse {
    int statusCode;
    var _onClose;

    Future close() {
        if (_onClose != null) {
            _onClose();
        }
        return new Future.value();
    }

    noSuchMethod(i) => super.noSuchMethod(i);
}

void main() {
    print("Twillio API implementation Tests!");

    group('Object Setup :: ', () {
        test("New instance of Twillio is created", () {
            var key = "12345";
            var authToken = "12345";
            var version = "2010-04-01";
            var twillio = new Twillio(key, authToken, version);
            expect(twillio is Twillio, isTrue);
        });
        test("New instance of Twillio is created with format specified", () {
            var key = "12345";
            var authToken = "12345";
            var version = "2010-04-01";
            var twillio = new Twillio(key, authToken, version);
            expect(twillio is Twillio, isTrue);
        });
    });

    group('Methods :: ', () {
        var _accountSid = "AC9d3e7fbe4b0d27fa1b5c60146fcb3bea",
                _authToken = "12345",
                _apiVersion = "2010-04-01",
                _baseUri = "api.twilio.com";
        var mockHttpClient = new HttpClientMock()
                ..when(callsTo('post')).alwaysReturn("this is a test");
        var twillio = new Twillio(_accountSid, _authToken, _apiVersion, mockHttpClient);
        Future<HttpRequestMock> future;
        test("New SMS URL is created correctly", () {
            var accounts = new Accounts().resource;
            var messages = new Messages(_accountSid);
            // New URL representation
            var url = "https://$_accountSid:$_authToken@$_baseUri/$_apiVersion/" + messages.resource;
            expect(twillio.buildBaseUrl(messages.resource), equals(url));
        });

        test("Send SMS errors with wrong account", () {
            future = twillio.sendSMS("+112345678", "+447590566866", "this is a test");
            expect(future.then((value) => JSON.decode(value)), completion(equals(JSON.decode(message401))));
        });
    });
}
