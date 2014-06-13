import 'package:twillio_dart/resources/accounts.dart';

class Messages extends Accounts{
    String resource;
    Messages(String accountSid){
        final String account = super.resource;
        resource = "$account/$accountSid/Messages.json";
    }
}