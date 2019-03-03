import 'dart:io';

import '../../../lib/twilio.dart';

// import 'package:twilio_dart/twilio.dart';

void main() {
  final key = Platform.environment['TWILIO_KEY'];
  final authToken = Platform.environment['TWILIO_TOKEN'];
  const version = "2010-04-01";
  const from = "your_twilio_phone";
  const to = "your_phone_number";
  const body = "Look ma! Dart can now send SMS's in under 15 lines";

  //create a new twilio object
  final Twilio twilio = Twilio(key, authToken, version);

  // Send SMS for LOLZ
  final future = twilio.sendSMS(from, to, body);
  future.then(print).catchError(print);
}
