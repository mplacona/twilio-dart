library twilio_dart.test.twilio_test;

import 'package:test/test.dart';

import '../lib/twilio.dart';
// import 'package:twilio_dart/twilio.dart';

void main() {
  group(
    'Object Setup :: ',
    () {
      const String key = "12345";
      const String authToken = "12345";
      const String version = "2010-04-01";

      test(
        "New instance of Twilio is created",
        () {
          final Twilio twilio = Twilio(key, authToken, version);
          expect(twilio is Twilio, isTrue);
        },
      );
      test(
        "New instance of Twilio is created with format specified",
        () {
          final Twilio twilio = Twilio(key, authToken, version);
          expect(twilio is Twilio, isTrue);
        },
      );
    },
  );
}
