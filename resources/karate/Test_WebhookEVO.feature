Feature: Test Webhooks
  #@report=false

  Background:  Test Webhooks
    # Set the Auth credentials here
    * configure headers = read('data/headers.js')
    * def TestQAURL = 'https://api.lightmetrics.co/v2'

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
    And request {"trigger":<Webhook>,"url":'https://304d-117-230-186-115.ngrok-free.app' ,"authorization":""}
    When method POST
    Then status 200
    And print response
    Given url 'https://api.lightmetrics.co'+'/v1/webhooks'
    When method GET
    Then status 200
    And print response
    #And match response.rows.trigger[0] == "<Webhook>"
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