library twilio_dart_browser;
import 'package:http/browser_client.dart' as http;
import 'dart:async';
import 'resources/messages.dart';
import 'utils/utils.dart';

class Twilio {
    final _baseUri = "api.twilio.com";
    http.BrowserClient _httpClient;
    Messages _messages;
    Map<String, String> _auth = new Map<String, String>();

    Twilio(String key, String authToken, String version, [http.BrowserClient httpClient = null]) {
        _auth['accountSid'] = key;
        _auth['authToken'] = authToken;
        _auth['apiVersion'] = version;
        _auth['baseUri'] = _baseUri;
        this._httpClient = (httpClient == null) ? new http.BrowserClient() : httpClient;
        this._messages = new Messages(key);


    }

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
        return apiRequest(_messages.getPostResource(), _httpClient, _auth, 'POST', _parameters).then((msg) => msg);
    }

    Future readSMS(String messageSid) {
        return apiRequest(_messages.getGetMessageResource(messageSid), _httpClient, _auth).then((msg) => msg);
    }

    Future readSMSList() {
        return apiRequest(_messages.getGetMessageListResource(), _httpClient, _auth).then((msg) => msg);
    }
}
