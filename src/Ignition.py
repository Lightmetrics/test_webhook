from flask import Flask, request

app = Flask(__name__)
'''
SCHEMA_PATH = "Image.json"
IGN_SCHEMA_PATH = "Ignition.json"

def validate_response(response_data, schema_path):
    with open(schema_path) as schema_file:
        schema = json.load(schema_file)

    try:
        jsonschema.validate(response_data, schema)
        return True
    except jsonschema.ValidationError as e:
        print(f"Response validation error: {e}")
        return False


def validate_Ignresponse(response_data, schema_path):
    with open(schema_path) as schema_file:
        schema = json.load(schema_file)

    try:
        jsonschema.validate(response_data, schema)
        return True
    except jsonschema.ValidationError as e:
        print(f"Response validation error: {e}")
        return False
'''
@app.route('/IMAGE', methods=['POST'])
def IMAGE():
    data = request.get_json()
    # Process the webhook data as needed
    print("Webhook received:", data)
    '''
     # Get JSON data from the request
    request_data = request.get_json()

    # Validate the response against the schema
    if validate_response(request_data, SCHEMA_PATH):
        # Process the validated response
        # Your logic goes here
        return jsonify({"status": "success"})
    else:
        return jsonify({"status": "error", "message": "Invalid response schema"}), 400
'''
@app.route('/IGNITION', methods=['POST'])
def IGNITION():
    data = request.get_json()
    # Process the webhook data as needed
    print("Webhook received:", data)
     # Get JSON data from the request
    request_data = request.get_json()
    '''

    # Validate the response against the schema
    if validate_Ignresponse(request_data, IGN_SCHEMA_PATH):
        # Process the validated response
        # Your logic goes here
        return jsonify({"status": "success"})
    else:
        return jsonify({"status": "error", "message": "Invalid response schema"}), 400
'''

if __name__ == '__main__':
    app.run(port=5000, debug=True)
