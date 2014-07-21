library twilio_dart.tests;
import 'twilio_test.dart' as twilioTest;
import 'twilio_message_test.dart' as twilioMessageTest;
import 'twilio_call_test.dart' as twilioCallTest;
import 'utils/utils_test.dart' as utilsTest;


void main(){
    print("Twilio API Tests!");
    twilioTest.main();
    twilioMessageTest.main();
    twilioCallTest.main();
    utilsTest.main();
}