import 'package:twilio_dart/twilio.dart';
import 'dart:convert';
import 'dart:io';
main() {
    var key = Platform.environment['TWILIO_KEY'];
    var authToken = Platform.environment['TWILIO_TOKEN'];
    var version = "2010-04-01";

    //create a new twilio object
    Twilio twilio = new Twilio(key, authToken, version);

    // Read SMS list
    twilio.readCallsList().then((response) {
        print(response.toString());
        jsonDecode(response)['calls'].forEach((e) => print(e));
    }).catchError((error) => print(error.toString()));
}
