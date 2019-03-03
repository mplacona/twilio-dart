library twilio_dart_browser;

import 'dart:async';

import 'package:http/browser_client.dart' as http;

import 'resources/messages.dart';
import 'src/validator.dart';
import 'utils/utils.dart';

class Twilio {
  Twilio(
    String key,
    String authToken,
    String version, [
    http.BrowserClient httpClient,
  ]) {
    _auth['accountSid'] = key;
    _auth['authToken'] = authToken;
    _auth['apiVersion'] = version;
    _auth['baseUri'] = _baseUri;
    _httpClient = httpClient ?? http.BrowserClient();
    _messages = Messages(key);
  }

  final _baseUri = "api.twilio.com";
  http.BrowserClient _httpClient;
  Messages _messages;
  final Map<String, String> _auth = <String, String>{};
  final IValidator _validator = Validator();

  Future sendSMS(
    String from,
    String to,
    String body, [
    String mediaUrl,
  ]) {
    Map<String, String> _parameters;
    _parameters = {'From': from, 'To': to, 'Body': body};
    // If we're trying to send an MMS
    if (mediaUrl != null) {
      _parameters.addAll({'media_url': mediaUrl});
    }
    return apiRequest(_messages.getPostResource(), _httpClient, _auth,
            verb: 'POST', body: _parameters)
        .then(_validator.validateResponse);
  }

  Future readSMS(String messageSid) {
    return apiRequest(
            _messages.getGetMessageResource(messageSid), _httpClient, _auth)
        .then(_validator.validateResponse);
  }

  Future readSMSList() {
    return apiRequest(_messages.getGetMessageListResource(), _httpClient, _auth)
        .then(_validator.validateResponse);
  }
}
