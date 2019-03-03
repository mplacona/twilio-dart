library twilio_dart.tests;

import 'twilio_call_test.dart' as twilio_test;
import 'twilio_message_test.dart' as twilio_message_test;
import 'twilio_test.dart' as twilio_call_test;
import 'utils/utils_test.dart' as utils_test;

void main() {
  print("Twilio API Tests!");
  twilio_test.main();
  twilio_message_test.main();
  twilio_call_test.main();
  utils_test.main();
}
