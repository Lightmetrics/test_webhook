import requests
import json


webhook_url = "https://ce0e-117-230-186-142.ngrok-free.app/IGNITION"  # Update with your Ngrok or local endpoint

# Sample payload
payload = {
	"fleetId": "qatest001",
	"powerState": "POWER_IGNITION",
	"ignitionId": "i_YWP2TYGLBYI65AAA4ILLU2LMEQ_vjLWz",
	"networkType": "WIFI",
	"networkSubtype": "Jiofi92073",
	"softwareId": "LM_RIDEVIEW",
	"firmware0Semver": "2.2.0",
	"voltage": 11.897,
	"distanceFromIgnitionOffInMetres": 0,
	"signalStrength": 4,
	"cpuTemperature": 36,
	"gpuTemperature": 35,
	"boardTemperature": 28,
	"assetId": "862798050189600",
	"deviceModel": "jimi-jc400p",
	"uploadedAt": "2024-02-19T06:54:31.242Z",
	"sdkVersion": "4.13.0",
	"eventId": "1707897480932-862798050189600-39-4KBTQO0QOS",
	"eventType": "IgnitionON",
	"timestampUTC": "2024-02-14T07:58:00.932Z",
	"bootId": "236",
	"lmSessionId": "23621707887249718",
	"runtimeDeviceModel": "jimi-jc400p",
	"rideviewAppVersion": "1.16.0",
	"firmwareVersion": "KMC28_JC400_WABA_LM_V2.2_220124.1110",
	"timezoneOffset": -360,
	"timeZoneId": "Asia/Kolkata",
	"gpsData": {
		"longitude": 0,
		"latitude": 0,
		"altitude": 0,
		"bearing": 0,
		"accuracy": 0,
		"speed": -1,
		"gpsTimestampUTC": "1970-01-01T00:00:00.000Z"
	},
	"longitude": 0,
	"latitude": 0
}

# Send a POST request to the webhook URL
response = requests.post(webhook_url, json=payload)

# Print the response
print("Response from webhook:")
print(response.status_code)
print(response.text)
