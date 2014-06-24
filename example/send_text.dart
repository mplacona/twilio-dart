import 'package:twilio_dart/twilio.dart';
main() {
    var key = "your_twilio_key";
    var authToken = "your_auth_token";
    var version = "2010-04-01";
    //create a new twillio object
    Twilio twilio = new Twilio(key, authToken, version);

    // Send SMS for LOLZ
    var from = "your_twilio_phone";
    var to = "your_mobile_number";
    var body = "Look ma! Dart can now send SMS's in under 15 lines";
    twilio.sendSMS(from, to, body).then((response) => print("Your message has been sent!")).catchError((error) => print(error));
}
