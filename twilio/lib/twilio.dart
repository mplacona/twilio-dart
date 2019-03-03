library twilio_dart_cli;

import 'dart:async';

import 'package:http/http.dart' as http;

import 'resources/calls.dart';
import 'resources/messages.dart';
import 'src/validator.dart';
import 'utils/utils.dart';

class Twilio {
  Twilio(
    String accountSid,
    String authToken,
    String version, [
    http.Client httpClient,
  ]) {
    _auth['accountSid'] = accountSid;
    _auth['authToken'] = authToken;
    _auth['apiVersion'] = version;
    _auth['baseUri'] = _baseUri;
    _httpClient = (httpClient == null) ? http.Client() : httpClient;
    _messages = Messages(accountSid);
    _calls = Calls(accountSid);
  }

  static const String _baseUri = "api.twilio.com";
  http.Client _httpClient;
  Messages _messages;
  Calls _calls;
  final Map<String, String> _auth = <String, String>{};
  final IValidator _validator = Validator();

  // Messages
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

  // Calls
  Future readCallsList({
    String from,
    String to,
    String status,
    String startTime,
    String parentCallSid,
  }) {
    Map<String, String> _parameters;
    // this does not look good, so will need some refactoring
    if (from != null) {
      _parameters.addAll({'From': from});
    }
    if (to != null) {
      _parameters.addAll({'To': to});
    }
    if (status != null) {
      _parameters.addAll({'Status': status});
    }
    if (startTime != null) {
      _parameters.addAll({'StartTime': startTime});
    }
    if (parentCallSid != null) {
      _parameters.addAll({'ParentCallSid': parentCallSid});
    }

    return apiRequest(_calls.getGetCallsLogResource(), _httpClient, _auth,
            body: _parameters)
        .then(_validator.validateResponse);
  }
}
