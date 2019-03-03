library twilio.messages;

import 'accounts.dart';

class Messages extends Accounts {
  Messages(String accountSid) {
    final String account = super.resource;
    _resource = "$account/$accountSid/Messages";
  }

  String _resource;
  final String extension = ".json";

  String getPostResource() {
    return _resource + extension;
  }

  String getGetMessageResource(String messageSid) {
    return "$_resource/$messageSid$extension";
  }

  String getGetMessageListResource() {
    return "$_resource$extension";
  }
}
