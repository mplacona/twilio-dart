library twilio_dart;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'resources/messages.dart';
import 'dart:io'; 

class Twilio {
    final _baseUri = "api.twilio.com";
    String _accountSid;
    String _authToken;
    String _apiVersion;
    http.Client _httpClient;
    Messages _messages;

    Twilio(String key, String authToken, String version, [http.Client httpClient = null]) {
        this._accountSid = key;
        this._authToken = authToken;
        this._apiVersion = version;
        _httpClient = (httpClient == null) ? new http.Client() : httpClient; 
        _messages = new Messages(_accountSid);
    }

    Future sendSMS(String from, String to, String body, [String mediaUrl = null]) {
        Map<String, String> _parameters;
        _parameters = {
            'From': from,
            'To': to,
            'Body': body
        };
        return _apiRequest(_messages.getPostResource(), 'POST', _parameters).then((msg) => msg);
    }
    
    Future readSMS(String messageSid){
        return _apiRequest(_messages.getGetMessageResource(messageSid)).then((msg) => msg);
    }
    
    Future readSMSList(){
        return _apiRequest(_messages.getGetMessageListResource()).then((msg) => msg);
    }


    Future _apiRequest(String resource, [String verb = 'GET', Map<String, String> body = null]) {
        var url = _buildBaseUrl(resource).toString();
        var request = new http.Request(verb, Uri.parse(url));
        request.headers[HttpHeaders.USER_AGENT] = 'twilio-dart';
        if(body != null){
            request.bodyFields = body;
        }
        return this._httpClient.send(request).then((response) => response.stream.bytesToString().then((value) => value.toString()));
    }

    String _buildBaseUrl(String resource) {
        return 'https://' + this._accountSid + ':' + this._authToken + '@' + this._baseUri + '/' + this._apiVersion + '/' + resource;
    }
}
