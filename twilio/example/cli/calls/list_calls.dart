import 'dart:convert';
import 'dart:io';

import '../../../lib/twilio.dart';

// import 'package:twilio_dart/twilio.dart';

void main() {
  final key = Platform.environment['TWILIO_KEY'];
  final authToken = Platform.environment['TWILIO_TOKEN'];
  const version = "2010-04-01";

  //create a new twilio object
  final Twilio twilio = Twilio(key, authToken, version);

  // Read SMS list
  twilio.readCallsList().then((response) {
    print(response.toString());
    jsonDecode(response as String)['calls'].forEach(print);
  }).catchError((error) => print(error.toString()));
}
