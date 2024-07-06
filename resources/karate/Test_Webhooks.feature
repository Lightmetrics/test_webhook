	Feature: Test Webhooks
	#@report=false

	Background:  Test Webhooks
	# Set the Auth credentials here
	* configure headers = read('data/headers.js')
	#* configure headers = read('data/OAuth2-Vikram.js')  // Uncomment this when V2 is implemented
	# Change the environment for other API
	* def TestQAURL = 'https://api-beta.lightmetrics.co/v1'

	Scenario Outline: Register and Unregister Webhooks -LIST_WEBHOOK for <Webhook>
	Given url TestQAURL+'/webhooks/unsubscribe'+'?trigger='+'<Webhook>'
	When method POST
	Then status 200
	And print response
	Examples:
	| Webhook                    |
	| BAD_CAMERA_MOUNTING        |
	| DEBUG_EVENT_CREATED        |
	| DEBUG_EVENT_VIDEO_UPLOADED |
	| DVR_EXECUTED               |
	| DVR_IMAGE_UPLOAD_EXECUTED  |
	| DVR_UPLOADED               |
	| EVENT_CREATED              |
	| EVENT_DVR_EXECUTED         |
	| EVENT_DVR_UPLOADED         |
	| EVENT_VIDEO_UPLOADED       |
	| IMAGE_UPLOAD_EXECUTED      |
	| LIVESTREAM_STATUS_UPDATE   |
	| TRIP_DATA_UPLOADED         |
	| TRIP_DATA_UPLOADED         |
	| TRIP_ENDED                 |
	| VEHICLE_IGNITION_OFF       |
	| VEHICLE_IGNITION_ON        |

	Scenario Outline: Register and Unregister Webhooks -LIST_WEBHOOK: <Webhook>
	Given url TestQAURL+'/webhooks/register'
	And request {"trigger":<Webhook>,"url":'https://ea43-2409-4071-d4b-727-d59f-b7c4-3473-40ce.ngrok-free.app/'+'<NAME>',"authorization":""}
	When method POST
	Then status 200
	And print response
	Given url 'https://api.lightmetrics.co'+'/v1/webhooks/'
	When method GET
	Then status 200
	And print response
	#And match response.rows.trigger[0] == "<Webhook>"
	Examples:
	| Webhook                    |NAME|
	| VEHICLE_IGNITION_OFF       |IGNITION|
	| VEHICLE_IGNITION_ON        |IGNITION|
	| BAD_CAMERA_MOUNTING        |CAMERA|
	| DEBUG_EVENT_CREATED        |EVENT|
	| DEBUG_EVENT_VIDEO_UPLOADED |EVENT|
	| DVR_EXECUTED               |DVR|
	| DVR_IMAGE_UPLOAD_EXECUTED  |DVR|
	| DVR_UPLOADED               |DVR|
	| EVENT_CREATED              |EVENT|
	| EVENT_DVR_EXECUTED         |EVENT|
	| EVENT_DVR_UPLOADED         |EVENT|
	| EVENT_VIDEO_UPLOADED       |EVENT|
	| IMAGE_UPLOAD_EXECUTED      |IMAGE|
	| LIVESTREAM_STATUS_UPDATE   |LIVE|
	| TRIP_DATA_UPLOADED         |TRIP|
	| TRIP_DATA_UPLOADED         |TRIP|
	| TRIP_ENDED                 |TRIP|
