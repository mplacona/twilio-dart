import 'package:twilio_dart/twilio.dart';
main() {
    var key = "your_twilio_key";
    var authToken = "your_auth_token";
    var version = "2010-04-01";
    var sid = "SM51eedb1659d748a2ae1a897ca9199fee";

    //create a new twilio object
    Twilio twilio = new Twilio(key, authToken, version);

    // Read single SMS message
    twilio.readSMS(sid).then((response) => print(response.toString())).catchError((error) => print(error.toString()));
}
