import 'package:twilio_dart/twilio.dart';
import 'dart:convert';
main() {
    var key = "your_twilio_key";
    var authToken = "your_auth_token";
    var version = "2010-04-01";

    //create a new twilio object
    Twilio twilio = new Twilio(key, authToken, version);

    // Read SMS list
    twilio.readSMSList().then((response) {
        print(response.toString());
        JSON.decode(response)['messages'].forEach((e) => print(e));
    }).catchError((error) => print(error.toString()));
}
