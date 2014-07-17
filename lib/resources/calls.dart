library twilio.Voice; 
import 'package:twilio_dart/resources/accounts.dart';

class Calls extends Accounts{
    String _resource;
    final String extension = ".json";
    Calls(String accountSid){
        final String account = super.resource;
        _resource = "$account/$accountSid/Calls";
    }
    
    String getGetCallsLogResource(){
        return this._resource + "/" + extension;
    }
    
    /*
    String getPostResource(){
      return this._resource + extension;
    }
    
    String getGetMessageResource(String messageSid){
      return this._resource + "/" + messageSid + extension;
    }
    
    String getGetMessageListResource(){
        return this._resource + extension;
    }
    */
}