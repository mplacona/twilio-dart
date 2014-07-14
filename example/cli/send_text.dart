import 'package:twilio_dart/twilio.dart';
main() {
    var key = "your_twilio_key";
    var authToken = "your_auth_token";
    var version = "2010-04-01";
    var from = "your_twilio_phone";
    var to = "your_mobile_number";
    var body = "Look ma! Dart can now send SMS's in under 15 lines";

    //create a new twilio object
    Twilio twilio = new Twilio(key, authToken, version);

    // Send SMS for LOLZ
    var future = twilio.sendSMS("+44123456789", "+44123456789", "this is a test");
    future.then((res) => print('message sent')).catchError((error) => print(error));
}
