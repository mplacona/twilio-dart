import 'dart:html';

// import 'package:twilio_dart/twilio_browser.dart';
import '../../../lib/twilio.dart';

void main() {
  const key = "your_twilio_key";
  const authToken = "your_auth_token";
  const version = "2010-04-01";
  //create a new twillio object
  final Twilio twilio = Twilio(key, authToken, version);

  // Send SMS for LOLZ
  const from = "your_twilio_phone";
  const to = "your_mobile_number";
  const body = "Look ma! Dart can now send SMS's in under 15 lines";

  final Element status = querySelector('#status');

  querySelector('button').onClick.listen((e) {
    twilio
        .sendSMS(from, to, body)
        .then((response) => status.text = "Your message has been sent!")
        .catchError((error) => status.text = error.toString());
  });
}
