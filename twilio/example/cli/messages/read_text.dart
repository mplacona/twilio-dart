import 'dart:io';

import '../../../lib/twilio.dart';

// import 'package:twilio_dart/twilio.dart';

void main() {
  final key = Platform.environment['TWILIO_KEY'];
  final authToken = Platform.environment['TWILIO_TOKEN'];
  const version = "2010-04-01";
  const sid = "your_twilio_sid";

  //create a new twilio object
  final Twilio twilio = Twilio(key, authToken, version);

  // Read single SMS message
  twilio
      .readSMS(sid)
      .then((response) => print(response.toString()))
      .catchError((error) => print(error.toString()));
}
