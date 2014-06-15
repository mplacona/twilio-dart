library twillio_dart;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'resources/messages.dart';
import 'dart:io';

class Twillio {
    final _baseUri = "api.twilio.com";
    String _accountSid;
    String _authToken;
    String _apiVersion;
    http.Client _httpClient;

    Twillio(String key, String authToken, String version, [http.Client httpClient = null]) {
        this._accountSid = key;
        this._authToken = authToken;
        this._apiVersion = version;
        _httpClient = (httpClient == null) ? new http.Client() : httpClient; 
    }

    Future sendSMS(String from, String to, String body, [String mediaUrl = null]) {
        var messages = new Messages(this._accountSid);
        Map<String, String> _parameters;
        _parameters = {
            'From': from,
            'To': to,
            'Body': body
        };
        return _apiRequest(messages.resource, _parameters).then((msg) => msg);
    }


    Future _apiRequest(String resource, [Map<String, String> body]) {
        var url = buildBaseUrl(resource).toString();
        var request = new http.Request('POST', Uri.parse(url));
        request.headers[HttpHeaders.USER_AGENT] = 'twilio-dart';
        request.bodyFields = body;
        return this._httpClient.send(request).then((response) => response.stream.bytesToString().then((value) => value.toString()));
    }

    String buildBaseUrl(String resource) {
        return 'https://' + this._accountSid + ':' + this._authToken + '@' + this._baseUri + '/' + this._apiVersion + '/' + resource;
    }
}
