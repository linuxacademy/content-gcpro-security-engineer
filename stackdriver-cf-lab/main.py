import base64
import json

def respond_log_entry(data, context):
    data_buffer = base64.b64decode(data['data'])
    log_entry = json.loads(data_buffer)['protoPayload']

    print(f"Method: {log_entry['methodName']}")
    print(f"Resource: {log_entry['resourceName']}")
    print(f"Initiator: {log_entry['authenticationInfo']['principalEmail']}")