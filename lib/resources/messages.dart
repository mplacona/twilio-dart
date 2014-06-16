library twillio.Messages;
import 'package:twillio_dart/resources/accounts.dart';

class Messages extends Accounts{
    String _resource;
    final String extension = ".json";
    Messages(String accountSid){
        final String account = super.resource;
        _resource = "$account/$accountSid/Messages";
    }
    
    String getPostResource(){
      return this._resource + extension;
    }
    
    String getGetResource(String messageSid){
      return this._resource + "/" + messageSid + extension;
    }
}