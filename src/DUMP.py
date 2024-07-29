from flask import Flask, request
import json, jsonschema
from flask import jsonify
#from opentelemetry.instrumentation.flask import FlaskInstrumentor
#from otel_config import trace

app = Flask(__name__)

# Instrument Flask
#FlaskInstrumentor().instrument_app(app)


IMG_SCHEMA_PATH = "Image.json"
IGN_SCHEMA_PATH = "ignition.json"
IGNOFF_SCHEMA_PATH = "IGNITION2.json"
BADMOUNT_SCHEMA_PATH = "Mount.json"
#EVENTDVR_SCHEMA_PATH = "EVENTDVR.json"
EVENTUPLOAD_SCHEMA_PATH = "EVENT.json"
TRIPSTART_SCHEMA_PATH = "TRIPSTART.json"
TRIPEND_SCHEMA_PATH = "TRIPEND.json"
TRIPUPLOAD_SCHEMA_PATH = "TRIPDATA_UPLOADED.json"
DVR_SCHEMA_PATH = "DVR.json"
DVR2_SCHEMA_PATH = "DVR2.json"
DVR3_SCHEMA_PATH = "DVR3.json"
LIVESTREAM_SCHEMA_PATH = "LIVESTREAM.json"
ASYNC_SCHEMA_PATH = "ASYNC.json"

def validate_Response(response_data, schema_path):
    with open(schema_path) as schema_file:
        schema = json.load(schema_file)
    try:
        jsonschema.validate(response_data, schema)
        print(f"Schema has matched")
        return True
    except jsonschema.ValidationError as e:
        print(f"Response validation error: {e}")
        #logging.error(f"Response validation error: {e}")
        print(f"Exception")
        return False



@app.route('/IMAGE', methods=['POST'])
def image_webhook():
    data = request.get_json()
    print("Webhook received:", data)
     # Validate the response against the schema
    if validate_Response(data, IMG_SCHEMA_PATH):
        return jsonify({"status": "success"})
        print(f"Image Schema Matched!")
        #logging.info(f"Validated response: {data}")

    else:
        return jsonify({"status": "error", "message": "Invalid response schema"}), 400
        print(f"Image Schema Failed3")
        #logging.warning(f"Invalid response: {data}")
    return 'OK'

@app.route('/IGNITION', methods=['POST'])
def ignition_webhook():
    data = request.get_json()
    print("Webhook received:", data)
     # Validate the response against the schema
    if validate_Response(data, IGN_SCHEMA_PATH):
        return jsonify({"status": "success"})
        print(f"Ignition Schema Success")
    else:
        return jsonify({"status": "error", "message": "Invalid response schema"}), 400
        print(f"Ignition Schema Failed3")
    return 'OK'

""" 
@app.route('/IGNITIONOFF', methods=['POST'])
def ignitionOff_webhook():
    data = request.get_json()
    print("Webhook received:", data)
     # Validate the response against the schema
    if validate_Response(data, IGNOFF_SCHEMA_PATH):
        return jsonify({"status": "success"})
        print(f"IgnitionOFF Schema Success")
    else:
        return jsonify({"status": "error", "message": "Invalid response schema"}), 400
        print(f"IgnitionOFF Schema Failed3")
    return 'OK'
"""

@app.route('/MOUNT', methods=['POST'])
def mounting_webhook():
    data = request.get_json()
    print("Webhook received:", data)
     # Validate the response against the schema
    if validate_Response(data, BADMOUNT_SCHEMA_PATH):
        return jsonify({"status": "success"})
        print(f"Mounting Schema Success")
    else:
        return jsonify({"status": "error", "message": "Invalid response schema"}), 400
        print(f"Mounting Schema Failed4")
    return 'OK'

"""
@app.route('/EVENTDVR', methods=['POST'])
def eDVR_webhook():
    data = request.get_json()
    print("Webhook received:", data)
     # Validate the response against the schema
    if validate_Response(data, EVENTDVR_SCHEMA_PATH):
        return jsonify({"status": "success"})
        print(f"eventDVR Schema Success")
    else:
        return jsonify({"status": "error", "message": "Invalid response schema"}), 400
        print(f"eventDVR Schema Failed5")
    return 'OK'
"""

@app.route('/TRIP_START', methods=['POST'])
def tripstart_webhook():
    data = request.get_json()
    print("Webhook received:", data)
     # Validate the response against the schema
    if validate_Response(data, TRIPSTART_SCHEMA_PATH):
        return jsonify({"status": "success"})
        print(f"TripStart Schema Success")
    else:
        return jsonify({"status": "error", "message": "Invalid response schema"}), 400
        print(f"TripStart Schema Failed6")
    return 'OK'

@app.route('/TRIP_END', methods=['POST'])
def tripend_webhook():
    data = request.get_json()
    print("Webhook received:", data)
     # Validate the response against the schema
    if validate_Response(data, TRIPEND_SCHEMA_PATH):
        return jsonify({"status": "success"})
        print(f"TripEnd Schema Success")
    else:
        return jsonify({"status": "error", "message": "Invalid response schema"}), 400
        print(f"TripEnd Schema Failed7")
    return 'OK'

    
@app.route('/TRIPUPLOAD', methods=['POST'])
def tripupload_webhook():
    data = request.get_json()
    print("Webhook received:", data)
     # Validate the response against the schema
    if validate_Response(data, TRIPUPLOAD_SCHEMA_PATH):
        return jsonify({"status": "success"})
        print(f"TRIPDATA_UPLOADED Schema Success")
    else:
        return jsonify({"status": "error", "message": "Invalid response schema"}), 400
        print(f"TRIPDATA_UPLOADED Schema Failed5")
    return 'OK'


@app.route('/EVENT', methods=['POST'])
def event_webhook():
    data = request.get_json()
    print("Webhook received:", data)
     # Validate the response against the schema
    if validate_Response(data, EVENTUPLOAD_SCHEMA_PATH):
        return jsonify({"status": "success"})
        print(f"EVENTDATA_UPLOADED Schema Success")
    else:
        return jsonify({"status": "error", "message": "Invalid response schema"}), 400
        print(f"EVENTDATA_UPLOADED Schema Failed8")
    return 'OK'

@app.route('/DVR', methods=['POST'])
def DVR_webhook():
    data = request.get_json()
    print("Webhook received:", data)
     # Validate the response against the schema
    if validate_Response(data, DVR_SCHEMA_PATH):
        return jsonify({"status": "success"})
        print(f"DVR Schema Success")
    else:
        return jsonify({"status": "error", "message": "Invalid response schema"}), 400
        print(f"DVR Schema Failed9")
    return 'OK'

@app.route('/DVR2', methods=['POST'])
def DVR2_webhook():
    data = request.get_json()
    print("Webhook received:", data)
     # Validate the response against the schema
    if validate_Response(data, DVR2_SCHEMA_PATH):
        return jsonify({"status": "success"})
        print(f"DVR2 Schema Success")
    else:
        return jsonify({"status": "error", "message": "Invalid response schema"}), 400
        print(f"DVR2 Schema Failed10")
    return 'OK'


@app.route('/DVR3', methods=['POST'])
def DVR3_webhook():
    data = request.get_json()
    print("Webhook received:", data)
     # Validate the response against the schema
    if validate_Response(data, DVR3_SCHEMA_PATH):
        return jsonify({"status": "success"})
        print(f"DVR3 Schema Success")
    else:
        return jsonify({"status": "error", "message": "Invalid response schema"}), 400
        print(f"DVR3 Schema Failed11")
    return 'OK'


@app.route('/LIVESTREAM', methods=['POST'])
def LIVESTREAM_webhook():
    data = request.get_json()
    print("Webhook received:", data)
     # Validate the response against the schema
    if validate_Response(data, LIVESTREAM_SCHEMA_PATH):
        return jsonify({"status": "success"})
        print(f"LIVESTREAM Schema Success")
    else:
        return jsonify({"status": "error", "message": "Invalid response schema"}), 400
        print(f"LIVESTREAM Schema Failed11")
    return 'OK'

@app.route('/ASYNC', methods=['POST'])
def async_webhook():
    data = request.get_json()
    print("Webhook received:", data)
     # Validate the response against the schema
    if validate_Response(data, ASYNC_SCHEMA_PATH):
        return jsonify({"status": "success"})
        print(f"Async Schema Success")
    else:
        return jsonify({"status": "error", "message": "Invalid response schema"}), 400
        print(f"Async Schema Failed4")
    return 'OK'


if __name__ == '__main__':
    app.run(port=5000, debug=True)
