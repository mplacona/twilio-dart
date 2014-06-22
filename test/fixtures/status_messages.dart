library twilio.test.fixtures.statusMessages;
import 'dart:convert'; 

var message401 = JSON.encode({
  "code": 20003,
  "detail": "Your AccountSid or AuthToken was incorrect.",
  "message": "Authenticate",
  "more_info": "https://www.twilio.com/docs/errors/20003",
  "status": 401
});