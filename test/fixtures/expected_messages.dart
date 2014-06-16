library twillio.test.fixtures.ExpectedMessages;
import 'dart:convert';

var smsWrongAccount = JSON.encode({
    "code": 20003,
    "detail": "Your AccountSid or AuthToken was incorrect.",
    "message": "Authenticate",
    "more_info": "https://www.twilio.com/docs/errors/20003",
    "status": 401
});

var smsReadResponse = JSON.encode({
    'sid': 'SMb938df8bb21a4b7faf240e5c99e6efbd',
    'date_created': 'Sat, 14 Jun 2014 22:56:51 +0000',
    'date_updated': 'Sat, 14 Jun 2014 22:56:57 +0000',
    'date_sent': 'Sat, 14 Jun 2014 22:56:52 +0000',
    'account_sid': 'AC9d3e7fbe4b0d27fa1b5c60146fcb3bea',
    "to": "+44123456789",
    "from": "+112345678",
    'body': 'this is a test',
    'status': 'delivered',
    'num_segments': '1',
    'num_media': '0',
    'direction': 'outbound-api',
    'api_version': '2010-04-01',
    'price': '-0.04000',
    'price_unit': 'USD',
    'error_code': null,
    'error_message': null,
    'uri': '/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Messages/SMb938df8bb21a4b7faf240e5c99e6efbd.json',
    'subresource_uris': {
        'media': '/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Messages/SMb938df8bb21a4b7faf240e5c99e6efbd/Media.json'
    }
});

var smsWriteResponse = JSON.encode({
    "sid": "SMb938df8bb21a4b7faf240e5c99e6efbd",
    "date_created": "Sat, 14 Jun 2014 22:56:51 +0000",
    "date_updated": "Sat, 14 Jun 2014 22:56:51 +0000",
    "date_sent": null,
    "account_sid": "AC9d3e7fbe4b0d27fa1b5c60146fcb3bea",
    "to": "+44123456789",
    "from": "+112345678",
    "body": "this is a test",
    "status": "queued",
    "num_segments": "1",
    "num_media": "0",
    "direction": "outbound-api",
    "api_version": "2010-04-01",
    "price": null,
    "price_unit": "USD",
    "error_code": null,
    "error_message": null,
    "uri": "/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Messages/SMb938df8bb21a4b7faf240e5c99e6efbd.json",
    "subresource_uris": {
        "media": "/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Messages/SMb938df8bb21a4b7faf240e5c99e6efbd/Media.json"
    }
});
