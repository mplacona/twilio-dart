library twilio.voice;

import 'accounts.dart';

class Calls extends Accounts {
  Calls(String accountSid) {
    final String account = super.resource;
    _resource = "$account/$accountSid/Calls";
  }

  String _resource;
  final String extension = ".json";

  String getGetCallsLogResource() {
    return "$_resource/$extension";
  }

  String getPostMakeCallResource() {
    return "$_resource/$extension";
  }
}
