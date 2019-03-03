library twilio_dart.test.utils.utils_test;

import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

import '../../lib/resources/accounts.dart';
import '../../lib/resources/messages.dart';
import '../../lib/utils/utils.dart';

void main() {
  group(
    'URL & HTTP :: ',
    () {
      const String _accountSid = "AC9d3e7fbe4b0d27fa1b5c60146fcb3bea";
      const String _authToken = "12345";
      const String _apiVersion = "2010-04-01";
      const String _baseUri = "api.twilio.com";
      final Map<String, String> _auth = <String, String>{
        'accountSid': _accountSid,
        'authToken': _authToken,
        'apiVersion': _apiVersion,
        'baseUri': _baseUri,
      };

      // This is foobar and needs fixing

      group(
        'Http Request :: ',
        () {
          test(
            "Mocked always returns 200",
            () {
              final mockHttpClient = MockClient(
                (request) {
                  return Future<http.Response>.value(http.Response(
                      "something will always return", 200,
                      headers: {'content-type': 'application/json'}));
                },
              );
              const resource = "http://iama200.com";
              final Future future = apiRequest(resource, mockHttpClient, _auth);
              future.then(
                (value) {
                  expect(value, equals("something will always return"));
                },
              );
            },
          );
        },
      );

      group(
        'Send SMS URL :: ',
        () {
          test(
            "New SMS URL is created correctly",
            () {
              final accounts = Accounts().resource;
              final messages = Messages(_accountSid);
              const url =
                  "https://AC9d3e7fbe4b0d27fa1b5c60146fcb3bea:12345@api.twilio.com/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Messages.json";
              expect(
                  buildAuthUrl(messages.getPostResource(), _auth), equals(url));
            },
          );
        },
      );

      group(
        'Read SMS URL :: ',
        () {
          const _messageSid = "SMb938df8bb21a4b7faf240e5c99e6efbd";
          test(
            "Read SMS URL is created correctly",
            () {
              final messages = Messages(_accountSid);
              const url =
                  "https://AC9d3e7fbe4b0d27fa1b5c60146fcb3bea:12345@api.twilio.com/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Messages/SMb938df8bb21a4b7faf240e5c99e6efbd.json";
              expect(
                  buildAuthUrl(
                      messages.getGetMessageResource(_messageSid), _auth),
                  equals(url));
            },
          );
        },
      );

      group(
        'Read SMS List URL :: ',
        () {
          test(
            "Read SMS List URL is created correctly",
            () {
              final messages = Messages(_accountSid);
              const url =
                  "https://AC9d3e7fbe4b0d27fa1b5c60146fcb3bea:12345@api.twilio.com/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Messages.json";
              expect(buildAuthUrl(messages.getGetMessageListResource(), _auth),
                  equals(url));
            },
          );
        },
      );
    },
  );
}
