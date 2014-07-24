library twilio_dart_cli;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'resources/messages.dart';
import 'resources/calls.dart';
import 'utils/utils.dart';
import 'src/validator.dart';

class Twilio {
    final _baseUri = "api.twilio.com";
    http.Client _httpClient;
    Messages _messages;
    Calls _calls;
    Map<String, String> _auth = new Map<String, String>();
    IValidator _validator = new Validator();

    Twilio(String key, String authToken, String version, [http.Client httpClient = null]) {
        _auth['accountSid'] = key;
        _auth['authToken'] = authToken;
        _auth['apiVersion'] = version;
        _auth['baseUri'] = _baseUri;
        this._httpClient = (httpClient == null) ? new http.Client() : httpClient;
        this._messages = new Messages(key);
        this._calls = new Calls(key);
    }

    // Messages
    Future sendSMS(String from, String to, String body, [String mediaUrl = null]) {
        Map<String, String> _parameters;
        _parameters = {
            'From': from,
            'To': to,
            'Body': body
        };
        // If we're trying to send an MMS
        if (mediaUrl != null) {
            _parameters.addAll({
                'media_url': mediaUrl
            });
        }
        return apiRequest(_messages.getPostResource(), _httpClient, _auth, verb: 'POST', body: _parameters).then((msg) {
            return _validator.validateResponse(msg);
        });
    }

    Future readSMS(String messageSid) {
        return apiRequest(_messages.getGetMessageResource(messageSid), _httpClient, _auth).then((msg) {
            return _validator.validateResponse(msg);
        });
    }

    Future readSMSList() {
        return apiRequest(_messages.getGetMessageListResource(), _httpClient, _auth).then((msg) {
            return _validator.validateResponse(msg);
        });
    }

    // Calls
    Future readCallsList({String from, String to, String status, String startTime, String parentCallSid}) {
        Map<String, String> _parameters;
        // this does not look good, so will need some refactoring
        if(from != null) _parameters.addAll( { 'From': from });
        if(to != null) _parameters.addAll( { 'To': to });
        if(status != null) _parameters.addAll( { 'Status': status });
        if(startTime != null) _parameters.addAll( { 'StartTime': startTime });
        if(parentCallSid != null) _parameters.addAll( { 'ParentCallSid': parentCallSid });
        
        return apiRequest(_calls.getGetCallsLogResource(), _httpClient, _auth, body: _parameters).then((msg) {
            return _validator.validateResponse(msg);
        });
    }

}
