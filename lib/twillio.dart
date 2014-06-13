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
    var _httpClient;

    Twillio(String key, String authToken, String version, [http.Client httpClient = null]) {
        this._accountSid = key;
        this._authToken = authToken;
        this._apiVersion = version;
        print(httpClient.toString());
        _httpClient = (httpClient == null) ? new http.Client() : httpClient;
    }

    Future sendSMS(String body, String from, String to, [String mediaUrl = ""]) {
        var messages = new Messages(this._accountSid);
        Map<String, String> _parameters;
        _parameters = {
            'From': from,
            'To': to,
            'Body': body,
            'MediaUrl': mediaUrl
        };
        return _apiRequest(messages.resource, _parameters).then((msg) => msg);
    }


    Future _apiRequest(String resource, [Map<String, String> body]) {
        //return http.post(buildBaseUrl(resource).toString(), body: body).then((response) => response.body);
        var url = buildBaseUrl(resource).toString();
        //var url = "http://httpbin.org/post";
        var request = new http.Request('POST', Uri.parse(url));
        //var body = {'Body':'this is a test', 'To':'447590566866', 'From':'441276300056', 'MediaUrl':'http://www.example.com/hearts.png'};
        request.headers[HttpHeaders.USER_AGENT] = 'twilio-dart';
        request.bodyFields = body;
        //print(new http.Client().toString());
        //print(_httpClient.toString());
        //return new http.Client().send(request).then((response) => response.request).catchError((error)=>print(error.toString()));
        return this._httpClient.send(request).then((response) => response.request).catchError((error)=>print(error.toString()));
        //return client.send(request).then((response) => response.stream.bytesToString().then((value) => value.toString())).catchError((error) => error.toString());
    }

    String buildBaseUrl(String resource) {
        return 'https://' + this._accountSid + ':' + this._authToken + '@' + this._baseUri + '/' + this._apiVersion + '/' + resource;
    }
}
