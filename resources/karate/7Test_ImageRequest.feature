Feature: Test Image Request
  karate.configure('readTimeout', 5000);

  Background:  Test ImageRequest
    # Set the Auth credentials here
    * def result = call read('Login.feature')
    * def Token = result.id_token
    * def URL = 'https://api-beta.lightmetrics.co/v2'
      #* def DEVICE = '864281042307489'      # Pushkar Dashcam
          #* configure headers = read('data/headers.js')
      #* configure headers = read('data/OAuth2-DVR.js')
      # Change the environment for other API
    * def VIKDEVICE = '862798050189600'
    * java.lang.Thread.sleep(2000)

  @image
  Scenario Outline:  Test for all Image request formats at IMAGE: <imageType> with MAIN: <imageTypeMainFrame> and Resol: <imageResolution> at Q: <imagequality>
    Given url URL+'/dvr/create-capture-image-request'
#And request  {"deviceId":"353436105011125","imageQuality":<imagequality>,"imageTypeMainFrame":<imageTypeMainFrame>,"imageType":<imageType>,"imageResolution":<imageResolution>,"driverCameraImageQuality":10,"driverCameraImageResolution":"640x360"}
    And request  {"deviceId":"862798050189600","imageQuality":<imagequality>,"imageTypeMainFrame":<imageTypeMainFrame>,"imageType":<imageType>,"imageResolution":<imageResolution>,"driverCameraImageQuality":10,"driverCameraImageResolution":"640x360"}
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lightmetrics_qa",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method POST
    Then status 200
    And print response.uploadRequestId
    * def UploadRequestID = response.uploadRequestId
    And print UploadRequestID
    And print response
    * def sleep = function(millis){ java.lang.Thread.sleep(millis) }
    * sleep(50000)
 #* def result = call ('Test_ImageRequest.feature@getImage') UploadRequestID
    Given url URL+'/device-management/devices/'+VIKDEVICE+'/image-upload-requests/'+UploadRequestID
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lightmetrics_qa",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response.response.link
#And match response.mediaFiles.imageDetails.imageQuality == <imagequality>
    Examples:
      | imagequality | imageType        | imageTypeMainFrame | imageResolution |
      | 1            | road             | road               | 1280x720        |
      | 10           | road             | driver             | 1280x720        |
      | 1            | separate         | road               | 640x360         |
      | 10           | separate         | driver             | 320x180         |
      | 1            | separate         | road               | 1280x720        |
      | 10           | pictureInPicture | driver             | 640x360         |
      | 1            | pictureInPicture | road               | 320x180         |
      | 10           | pictureInPicture | driver             | 320x180         |
      | 1            | pictureInPicture | road               | 1280x720        |
      | 10           | pictureInPicture | driver             | 1280x720        |
      | 1            | pictureInPicture | road               | 320x180         |
      | 10           | pictureInPicture | driver             | 640x360         |
      | 1            | pictureInPicture | road               | 1920x1080       |
      | 10           | pictureInPicture | driver             | 1920x1080       |
      | 10           | sideBySide       | driver             | 640x360         |
      | 1            | sideBySide       | road               | 320x180         |
      | 10           | sideBySide       | driver             | 320x180         |
      | 1            | sideBySide       | road               | 1280x720        |
      | 10           | sideBySide       | driver             | 1280x720        |
      | 1            | sideBySide       | road               | 320x180         |
      | 10           | sideBySide       | driver             | 640x360         |
      | 1            | sideBySide       | road               | 1920x1080       |
      | 10           | sideBySide       | driver             | 1920x1080       |

  Scenario:  Get Device Configuration at time of Test
    Given url URL+'/fleets/qatest001/configuration/'+VIKDEVICE
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lightmetrics_qa",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response


  @Multiimage
  Scenario Outline:  Test for all Image request formats at COLLAGE: <collage> with MAIN Source: <sources> and Resol: <resolution> at  Q: <quality>
    Given url URL+'/dvr/create-capture-image-request'
    And request  {"deviceId":"862798050189600","dvrImageTypes":[{"collage":<collage>,"quality":<quality>,"sources":[<sources>],"resolution":<resolution>}]}
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lightmetrics_qa",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method POST
    Then status 200
    And print response.uploadRequestId
    * def UploadRequestID = response.uploadRequestId
    And print UploadRequestID
    And print response
    * def sleep = function(millis){ java.lang.Thread.sleep(millis) }
    * sleep(100000)
 #* def result = call ('Test_ImageRequest.feature@getImage') UploadRequestID
    Given url URL+'/device-management/devices/'+VIKDEVICE+'/image-upload-requests/'+UploadRequestID
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lightmetrics_qa",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response.response.link
    Examples:
      | collage | sources         | resolution | quality |
      | C1x1    | ROAD            | 320x180    | 1       |
      | C1x1    | ROAD            | 320x180    | 10      |
      | C1x1    | DRIVER          | 320x180    | 1       |
      | C1x1    | DRIVER          | 320x180    | 10      |
      | C1x2    | "ROAD","DRIVER" | 640x180    | 1       |
      | C1x2    | "ROAD","DRIVER" | 640x180    | 10      |
      | C1x2    | "DRIVER","ROAD" | 640x180    | 1       |
      | C1x2    | "DRIVER","ROAD" | 640x180    | 10      |
      | C1x2    | "ROAD","DRIVER" | 1280x360   | 1       |
      | C1x2    | "ROAD","DRIVER" | 1280x360   | 10      |
      | C1x2    | "DRIVER","ROAD" | 1280x360   | 1       |
      | C1x2    | "DRIVER","ROAD" | 1280x360   | 10      |
      | C1x2    | "ROAD","DRIVER" | 2560x720   | 1       |
      | C1x2    | "ROAD","DRIVER" | 2560x720   | 10      |
      | C1x2    | "DRIVER","ROAD" | 2560x720   | 1       |
      | C1x2    | "DRIVER","ROAD" | 2560x720   | 10      |


  Scenario Outline:  This will Call mDVR image request followed by UploadImage Request for <collage> at <resolution> with View: <source>
    Given url URL+'/dvr/create-image-upload-request'
    And request {"fleetId":"qatest001","driverId":"vikramqa","assetId":"862798050189600","tripId":"t_2DMP5UGQP4I65AAA4ILLU2LMEQ_KrjeG","captureTimestampUTC":"2024-02-21T08:45","dvrImageTypes": [{"collage":<collage>,"quality":<quality>,"sources":[<source>],"resolution":<resolution>}] }
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lightmetrics_qa",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method POST
    Then status 200
    And print response.uploadRequestId
    * def UploadRequestID = response.uploadRequestId
    And print UploadRequestID
    And print response
    And status 200
    * def sleep = function(millis){ java.lang.Thread.sleep(millis) }
    * sleep(60000)
    Given url URL+'/device-management/devices/'+VIKDEVICE+'/dvr-image-upload-request/'+UploadRequestID
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lightmetrics_qa",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response.response.link
    Examples:
      | collage           | quality | source                                             | resolution |
      | C1x1              | 5       | "DRIVER"                                           | 320x180    |
      | C1x1              | 5       | "DRIVER"                                           | 640x360    |
      | C1x1              | 5       | "DRIVER"                                           | 1280x720   |
      | C1x2              | 5       | "DRIVER","ROAD"                                    | 640x180    |
      | C1x2              | 5       | "DRIVER","ROAD"                                    | 1280x360   |
      | C1x2              | 5       | "DRIVER","ROAD"                                    | 2560x720   |
      | CPIP_TOP_LEFT     | 5       | "DRIVER","ROAD"                                    | 320x180    |
      | CPIP_TOP_LEFT     | 5       | "DRIVER","ROAD"                                    | 640x360    |
      | CPIP_TOP_LEFT     | 5       | "DRIVER","ROAD"                                    | 1280x720   |
      | CPIP_TOP_RIGHT    | 5       | "DRIVER","ROAD"                                    | 320x180    |
      | CPIP_TOP_RIGHT    | 5       | "DRIVER","ROAD"                                    | 640x360    |
      | CPIP_TOP_RIGHT    | 5       | "DRIVER","ROAD"                                    | 1280x720   |
      | CPIP_BOTTOM_LEFT  | 5       | "TVI2","ROAD"                                      | 320x180    |
      | CPIP_BOTTOM_LEFT  | 5       | "TVI2","TVI3"                                      | 640x360    |
      | CPIP_BOTTOM_LEFT  | 5       | "DRIVER","ROAD"                                    | 1280x720   |
      | CPIP_BOTTOM_RIGHT | 5       | "DRIVER","ROAD"                                    | 320x180    |
      | CPIP_BOTTOM_RIGHT | 5       | "DRIVER","ROAD"                                    | 640x360    |
      | CPIP_BOTTOM_RIGHT | 5       | "DRIVER","ROAD"                                    | 1280x720   |
      | C2x2              | 5       | "DRIVER","ROAD","TVI1","TVI3"                      | 640x360    |
      | C2x2              | 5       | "DRIVER","ROAD","TVI2","TVI3"                      | 1280x720   |
      | C2x2              | 5       | "DRIVER","ROAD","TVI3","TVI4"                      | 2560x1440  |
      | C3_1              | 5       | "DRIVER","ROAD","TVI4",                            | 960x360    |
      | C3_1              | 5       | "DRIVER","ROAD","TVI4",                            | 1920x720   |
      | C5_1              | 5       | "DRIVER","ROAD","TVI1", "TVI2","TVI3"              | 1280x360   |
      | C5_1              | 5       | "DRIVER","ROAD","TVI1", "TVI2","TVI3"              | 2560x720   |
      | C6_1              | 5       | "DRIVER","ROAD","TVI1", "TVI2","TVI3","TVI4"       | 960x540    |
      | C6_1              | 5       | "DRIVER","ROAD","TVI1", "TVI2","TVI3","TVI4"       | 1920x1080  |
      | C2x3              | 5       | "DRIVER","ROAD","TVI1", "TVI2","TVI3","TVI4"       | 960x360    |
      | C2x3              | 5       | "DRIVER","ROAD","TVI1", "TVI2","TVI3","TVI4"       | 1920x720   |
      | C7_1              | 5       | "DRIVER","ROAD","TVI1", "TVI2","TVI3","TVI4","UVC" | 1280x720   |
      | C7_1              | 5       | "DRIVER","ROAD","TVI1","TVI2","TVI3","TVI4","UVC"  | 2560x1440  |
