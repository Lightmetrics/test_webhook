Feature:  Test V1 and V2 API in scope


  Background:  Check for all Trip related Details
	# Set the Auth credentials here
    #* configure headers = read('data/OAuth2-Vikram.js')
	# Change the environment for other API
    * def result = call read('Login.feature')
    * def Token = result.id_token
    * def TestQAURL = 'https://api-beta.lightmetrics.co/v2'
    * def DATERANGE = 'before=2023-10-06&after=2023-09-31'
    * def DEVICE = '864281042307489'
    * def ASSET = '864281042307489-4'
    * def IGNITION_ID = 'i_PWOTTMCMOMI65AAAFAIEEMDURE_89DTv'
    * java.lang.Thread.sleep(1000)
  @Violation
  Scenario:  Test Fleet Violations
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/violations'+'?'+DATERANGE
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response

  @Violation
  Scenario Outline:  Test Fleet Violations with param <Violation>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/violations'+'?eventType='+'<Violation>'+'&'+DATERANGE
    #And request  {"eventType":<Violation>}
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response
    Examples:
      | Violation                    |
      | Traffic-Speed-Violated       |
      | Cornering                    |
      | Traffic-STOP-Sign-Violated   |
      | Harsh-Braking                |
      | Harsh-Acceleration           |
      | Tail-Gating-Detected         |
      | Lane-Drift-Found             |
      | Distracted-Driving           |
      | MaxSpeedExceeded             |
      | Drowsy-Driving-Detected      |
      | Forward-Collision-Warning    |
      | Cellphone-Distracted-Driving |
      | Smoking-Distracted-Driving   |
      | Drinking-Distracted-Driving  |
      | FAILME                       |

  @Violation
  Scenario Outline:  Test Fleet Violations with param <tagSearch>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/violations'+'?tagSearch='+'<tagSearch>'+'&'+DATERANGE
    #And request  {"tagSearch":<tagSearch>}
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response
    Examples:
    Examples:
      | tagSearch          |
      | CELLPHONE          |
      | SMOKING            |
      | EATING_OR_DRINKING |
      | COLLISION          |
      | NO_SEATBELT        |
      | OTHER              |
      | FAILME             |

  @Violation
  Scenario:  Test Driver Violations
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/drivers/pushkar001/violations'+'?'+DATERANGE
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response

  @Violation
  Scenario Outline:  Test Driver Violations with param with <Violation>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/drivers/pushkar001/violations'+'?eventType='+'<Violation>'+'&'+DATERANGE
    #And request  {"eventType":<Violation>}
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response
    Examples:
      | Violation                    |
      | Traffic-Speed-Violated       |
      | Cornering                    |
      | Traffic-STOP-Sign-Violated   |
      | Harsh-Braking                |
      | Harsh-Acceleration           |
      | Tail-Gating-Detected         |
      | Lane-Drift-Found             |
      | Distracted-Driving           |
      | MaxSpeedExceeded             |
      | Drowsy-Driving-Detected      |
      | Forward-Collision-Warning    |
      | Cellphone-Distracted-Driving |
      | Smoking-Distracted-Driving   |
      | Drinking-Distracted-Driving  |
      | FAILME                       |

  @Violation
  Scenario Outline:  Test Driver Violations with param with <tagSearch>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/drivers/pushkar001/violations'+'?tagSearch='+'<tagSearch>'+'&'+DATERANGE
    #And request  {"tagSearch":<tagSearch>}
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response
    Examples:
      | tagSearch          |
      | CELLPHONE          |
      | SMOKING            |
      | EATING_OR_DRINKING |
      | COLLISION          |
      | NO_SEATBELT        |
      | OTHER              |
      | FAILME             |

  @Mounting
  Scenario:   Test incorrect mounted camera
    Given url TestQAURL+'/incorrect-camera-mounting/assets'+'?'+DATERANGE
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response

  @DVR
  Scenario:   Test Fleet DVR requests
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/uploadRequests'+'?'+DATERANGE
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response

  @DVR
  Scenario Outline: :   Test Fleet DVR requests by <tagSearch>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/uploadRequests'+'?'+DATERANGE+'&tagSearch='+'<tagSearch>'
    When method GET
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    Then status 200
    And print response
    Examples:
      | tagSearch          |
      | CELLPHONE          |
      | SMOKING            |
      | EATING_OR_DRINKING |
      | COLLISION          |
      | NO_SEATBELT        |
      | OTHER              |
      | FAILME             |

  @DVR
  Scenario:   Test DVR requests
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/drivers/pushkar001/uploadRequests'+'?'+DATERANGE
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response

  @DVR
  Scenario Outline:   Test DVR requests with Tagsearch by <tagSearch>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/drivers/pushkar001/uploadRequests'+'?'+DATERANGE+'&tagSearch='+'<tagSearch>'
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response
    Examples:
      | tagSearch          |
      | CELLPHONE          |
      | SMOKING            |
      | EATING_OR_DRINKING |
      | COLLISION          |
      | NO_SEATBELT        |
      | OTHER              |
      | FAILME             |

  @eDVR
  Scenario:   Test eDVR requests
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/edvr-requests/list'+'?'+DATERANGE
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response

  @eDVR
  Scenario Outline:   Test eDVR requests with Tagsearch by <status>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/edvr-requests/list'+'?'+DATERANGE+'&status='+'<status>'
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response
    Examples:
      | status   |
      | FINISHED |
      | FAILME   |


  @External
  Scenario:   Test External requests
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/external-events'+'?'+DATERANGE
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response

  @External
  Scenario Outline:   Test External Events with Tagsearch by <status>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/external-events'+'?'+DATERANGE+'&status='+'<status>'
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response
    Examples:
      | status   |
      | FINISHED |
      | FAILME   |


  @AggregateViolation
  Scenario Outline: test Violation Aggregates by Fleet and by <period>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/aggregate'+'?'+DATERANGE+'&groupBy='+'<period>'
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response
    Examples:
      | period |
      | week   |
      | month  |
      | day    |

  @AggregateViolation
  Scenario Outline: test Violation Aggregates by Fleet and by <period> and <duty>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/aggregate'+'?'+DATERANGE+'&groupBy='+'<period>'+'&dutyType='+'<duty>'
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response
    Examples:
      | period | duty   |
      | week   | light
      | month  | medium |
      | day    | heavy
      | day    | light
      | day    | medium |

  @AggregateDriverViolation
  Scenario Outline: test Violation Aggregates by Fleet Driver and by <period>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/drivers/pushkar001/aggregate'+'?'+DATERANGE+'&groupBy='+'<period>'
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response
    Examples:
      | period |
      | week   |
      | month  |
      | day    |

  @AggregateDriverViolation
  Scenario Outline: test Violation Aggregates by Fleet Driver and by <period> and <duty>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/drivers/pushkar001/aggregate'+'?'+DATERANGE+'&groupBy='+'<period>'+'&dutyType='+'<duty>'
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response
    Examples:
      | period | duty   |
      | week   | light
      | month  | medium |
      | day    | heavy
      | day    | light
      | day    | medium |


  @AggregateDriverViolation
  Scenario Outline: test Violation Aggregates for Asset by <period>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/assets/864281042307489-4/aggregate'+'?'+DATERANGE+'&groupBy='+'<period>'
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response
    Examples:
      | period |
      | week   |
      | month  |
      | day    |

  @AggregateDriverViolation
  Scenario Outline: test Violation Aggregates for  Asset by <period> and <duty>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/assets/864281042307489-4/aggregate'+'?'+DATERANGE+'&groupBy='+'<period>'+'&dutyType='+'<duty>'
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response
    Examples:
      | period | duty   |
      | week   | light
      | month  | medium |
      | day    | heavy
      | day    | light
      | day    | medium |

  @AssetList
  Scenario Outline: test Asset Trips  by <period> and <duty>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/assets/'+ASSET+'/trips'+'?'+DATERANGE
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response
    Examples:
      | period | duty   |
      | week   | light
      | month  | medium |
      | day    | heavy
      | day    | light
      | day    | medium |

  @DeviceList
  Scenario Outline: test Device aggregate  by <period> and <duty>
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/devices/'+DEVICE+'/aggregate/trips'+'?'+DATERANGE
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response
    Examples:
      | period | duty   |
      | month  | light
      | month  | medium |
      | month  | heavy
      | day    | light
      | day    | medium |


  @ListIgnitionId
  Scenario:   Test Ignition Trip Details
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/ignitions/'+IGNITION_ID+'/trips'+'?'+DATERANGE
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response


  @ListIgnitionId
  Scenario:   Test Ignition Trip Details
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/ignitions/'+IGNITION_ID+'?'+DATERANGE
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response

  @Assettrips
  Scenario:   Test AssetTrips -SORT
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/assets/864281042307489-4/trips'+'?'+DATERANGE+'&sort=desc'
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response

  @Assettrips
  Scenario:   Test AssetTrips - SKIP
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/assets/864281042307489-4/trips'+'?'+DATERANGE+'&limit=50&skip=0'
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response

  @Assettrips
  Scenario:   Test AssetTrips -Date Range
    Given url TestQAURL+'/fleets/lmfleet001-Pushkar/assets/864281042307489-4/trips'+'?'+DATERANGE
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response

    @externalEvents
    Scenario:   Test ExternalEvents
      Given url TestQAURL+'/fleets/lmfleet001-Pushkar/external-events'
      And header Authorization = 'Bearer ' + Token
      And headers { "x-lm-desired-account": "lmpresales",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
      When method GET
      Then status 200
      And print response