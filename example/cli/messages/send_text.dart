import 'package:twilio_dart/twilio.dart';
import 'dart:io';
main() {
    var key = Platform.environment['TWILIO_KEY'];
    var authToken = Platform.environment['TWILIO_TOKEN'];
    var version = "2010-04-01";
    var from = "your_twilio_phone";
    var to = "your_phone_number";
    var body = "Look ma! Dart can now send SMS's in under 15 lines";

    //create a new twilio object
    Twilio twilio = new Twilio(key, authToken, version);

    // Send SMS for LOLZ
    var future = twilio.sendSMS(from, to, body);
    future.then((res) => print(res)).catchError((error) => print(error));
}
