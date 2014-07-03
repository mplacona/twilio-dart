import 'dart:html';
import 'package:twilio_dart/twilio_browser.dart';

void main() {
    var key = "your_twilio_key";
    var authToken = "your_auth_token";
    var version = "2010-04-01";
    //create a new twillio object
    Twilio twilio = new Twilio(key, authToken, version);

    // Send SMS for LOLZ
    var from = "your_twilio_phone";
    var to = "your_mobile_number";
    var body = "Look ma! Dart can now send SMS's in under 15 lines";

    Element status = querySelector('#status');

    querySelector('button').onClick.listen((e) {
        twilio.sendSMS(from, to, body).then((response) => status.text = "Your message has been sent!").catchError((error) => status.text = error.toString());
    });

}
