library twilio.test.fixtures.ExpectedMessages;
import 'dart:convert';

var smsWrongAccount = JSON.encode({
    "code": 20003,
    "detail": "Your AccountSid or AuthToken was incorrect.",
    "message": "Authenticate",
    "more_info": "https://www.twilio.com/docs/errors/20003",
    "status": 401
});

var smsWrongFrom = JSON.encode({
    "code": 21212,
    "message": "The 'From' number +112345678 is not a valid phone number or shortcode.",
    "more_info": "https://www.twilio.com/docs/errors/21212",
    "status": 400
});

var smsReadWrongAccount = JSON.encode({
    "code": 20404,
    "message": "The requested resource /2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3be/Messages/SMd9390361a08a9138b256a73804f233e9.json was not found",
    "more_info": "https://www.twilio.com/docs/errors/20404",
    "status": 404
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

var smsReadListResponse = JSON.encode({
    'first_page_uri': '/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Messages.json?PageSize=50&Page=0',
    'last_page_uri': '/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Messages.json?PageSize=50&Page=0',
    'previous_page_uri': null,
    'end': 1,
    'messages': [{
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
        }, {
            'sid': 'SMa3a5b04a6bac47be8c972ead9dfe3235',
            'date_created': 'Thu, 12 Jun 2014 15:42:13 +0000',
            'date_updated': 'Thu, 12 Jun 2014 15:42:16 +0000',
            'date_sent': 'Thu, 12 Jun 2014 15:42:13 +0000',
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
            'uri': '/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Messages/SMa3a5b04a6bac47be8c972ead9dfe3235.json',
            'subresource_uris': {
                'media': '/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Messages/SMa3a5b04a6bac47be8c972ead9dfe3235/Media.json'
            }
        }],
    'uri': '/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Messages.json?PageSize=50&Page=0',
    'page_size': 50,
    'start': 0,
    'next_page_uri': null,
    'num_pages': 1,
    'total': 2,
    'page': 0
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

var callListResponse = JSON.encode({
    "first_page_uri": "/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Calls/.json?PageSize=50&Page=0",
    "last_page_uri": "/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Calls/.json?PageSize=50&Page=0",
    "calls": [{
            "sid": "CAcb3d7a3ad6c4195aaaeb882e98eaea31",
            "date_created": "Sun, 08 Jun 2014 21:15:06 +0000",
            "date_updated": "Sun, 08 Jun 2014 21:15:30 +0000",
            "parent_call_sid": null,
            "account_sid": "AC9d3e7fbe4b0d27fa1b5c60146fcb3bea",
            "to": "+447590566866",
            "to_formatted": "+447590566866",
            "from": "+441276300056",
            "from_formatted": "+441276300056",
            "phone_number_sid": "",
            "status": "completed",
            "start_time": "Sun, 08 Jun 2014 21:15:13 +0000",
            "end_time": "Sun, 08 Jun 2014 21:15:30 +0000",
            "duration": "17",
            "price": "-0.05000",
            "price_unit": "USD",
            "direction": "outbound-api",
            "answered_by": null,
            "annotation": null,
            "api_version": "2010-04-01",
            "forwarded_from": null,
            "group_sid": null,
            "caller_name": "",
            "uri": "/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Calls/CAcb3d7a3ad6c4195aaaeb882e98eaea31.json",
            "subresource_uris": {
                "notifications": "/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Calls/CAcb3d7a3ad6c4195aaaeb882e98eaea31/Notifications.json",
                "recordings": "/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Calls/CAcb3d7a3ad6c4195aaaeb882e98eaea31/Recordings.json"
            }
        }, {
            "sid": "CAe4d9a20aeac207007624ecaca226637c",
            "date_created": "Fri, 09 May 2014 17:05:55 +0000",
            "date_updated": "Fri, 09 May 2014 17:06:59 +0000",
            "parent_call_sid": null,
            "account_sid": "AC9d3e7fbe4b0d27fa1b5c60146fcb3bea",
            "to": "+447590566866",
            "to_formatted": "+447590566866",
            "from": "+14157234000",
            "from_formatted": "(415) 723-4000",
            "phone_number_sid": "",
            "status": "completed",
            "start_time": "Fri, 09 May 2014 17:06:06 +0000",
            "end_time": "Fri, 09 May 2014 17:06:59 +0000",
            "duration": "53",
            "price": "-0.05000",
            "price_unit": "USD",
            "direction": "outbound-api",
            "answered_by": null,
            "annotation": null,
            "api_version": "2010-04-01",
            "forwarded_from": null,
            "group_sid": null,
            "caller_name": "",
            "uri": "/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Calls/CAe4d9a20aeac207007624ecaca226637c.json",
            "subresource_uris": {
                "notifications": "/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Calls/CAe4d9a20aeac207007624ecaca226637c/Notifications.json",
                "recordings": "/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Calls/CAe4d9a20aeac207007624ecaca226637c/Recordings.json"
            }
        }, {
            "sid": "CAe12f956aefb19b87887d192307986d7d",
            "date_created": "Fri, 09 May 2014 17:03:07 +0000",
            "date_updated": "Fri, 09 May 2014 17:04:08 +0000",
            "parent_call_sid": null,
            "account_sid": "AC9d3e7fbe4b0d27fa1b5c60146fcb3bea",
            "to": "+447590566866",
            "to_formatted": "+447590566866",
            "from": "+14157234000",
            "from_formatted": "(415) 723-4000",
            "phone_number_sid": "",
            "status": "completed",
            "start_time": "Fri, 09 May 2014 17:03:19 +0000",
            "end_time": "Fri, 09 May 2014 17:04:08 +0000",
            "duration": "49",
            "price": "-0.05000",
            "price_unit": "USD",
            "direction": "outbound-api",
            "answered_by": null,
            "annotation": null,
            "api_version": "2010-04-01",
            "forwarded_from": null,
            "group_sid": null,
            "caller_name": "",
            "uri": "/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Calls/CAe12f956aefb19b87887d192307986d7d.json",
            "subresource_uris": {
                "notifications": "/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Calls/CAe12f956aefb19b87887d192307986d7d/Notifications.json",
                "recordings": "/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Calls/CAe12f956aefb19b87887d192307986d7d/Recordings.json"
            }
        }],
    "previous_page_uri": null,
    "end": 2,
    "uri": "/2010-04-01/Accounts/AC9d3e7fbe4b0d27fa1b5c60146fcb3bea/Calls/.json?PageSize=50&Page=0",
    "page_size": 50,
    "start": 0,
    "next_page_uri": null,
    "num_pages": 1,
    "total": 3,
    "page": 0
});
