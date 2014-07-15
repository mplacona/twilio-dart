library twilio.src.validator;
import 'dart:async';

abstract class IValidator<T> {
    validateResponse(T response);
}

class Validator implements IValidator {
    @override
    validateResponse(response) {
        if (response.toString().contains("20003")) {
            return new Future.error(throw new ArgumentError("twilio-dart requires a valid Account SID and Auth Token"));
        } else if (response.toString().contains("21212")) {
            return new Future.error(throw new ArgumentError("the provided 'From' number is not a valid phone number or shortcode"));
        } else if (response.toString().contains("20404")) {
            return new Future.error(throw new ArgumentError("twilio-dart requires a valid Account SID and Auth Token"));
        } else if (response.toString().contains("21606")) {
            return new Future.error(throw new ArgumentError("this phone number is not owned by your account or is not SMS-capable."));
        } else {
            return response;
        }
    }
}
