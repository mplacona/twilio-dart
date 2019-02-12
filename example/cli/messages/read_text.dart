import 'package:twilio_dart/twilio.dart';
import 'dart:io';
main() {
    var key = Platform.environment['TWILIO_KEY'];
    var authToken = Platform.environment['TWILIO_TOKEN'];
    var version = "2010-04-01";
    var sid = "your_twilio_sid";

    //create a new twilio object
    Twilio twilio = new Twilio(key, authToken, version);

    // Read single SMS message
    twilio.readSMS(sid).then((response) => print(response.toString())).catchError((error) => print(error.toString()));
}
