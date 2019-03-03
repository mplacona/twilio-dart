library twilio.utils.utils;

import 'dart:async';

import 'package:http/http.dart' as http;

import 'http_headers.dart';

Future apiRequest(
  String resource,
  http.Client httpClient,
  Map<String, String> auth, {
  String verb = 'GET',
  Map<String, String> body,
}) {
  final url = buildAuthUrl(resource, auth).toString();
  final request = http.Request(verb, Uri.parse(url));
  request.headers[HttpHeaders.userAgent] = 'twilio-dart';
  if (body != null && body.isNotEmpty) {
    request.bodyFields = body;
  }
  print(url);
  return httpClient.send(request).then((response) =>
      response.stream.bytesToString().then((value) => value.toString()));
}

String buildAuthUrl(
  String resource,
  Map<String, String> auth,
) {
  return 'https://${auth['accountSid']}:${auth['authToken']}@'
      '${auth['baseUri']}/${auth['apiVersion']}/$resource';
}
