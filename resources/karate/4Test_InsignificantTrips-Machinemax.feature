Feature:  Test Vx API in scope
  #@report=true

  Background:  Check all V2 API
	# Set the Auth credentials here
    #* configure headers = read('data/OAuth2-Machinemax.js')
	# Change the environment for other API
    * def result = call read('Login.feature')
    * def Token = result.id_token
    * def TestQAURL = 'https://api-qa.lightmetrics.co/v2'
    * def DATERANGE = 'before=2023-08-15&after=2023-06-14'
    * java.lang.Thread.sleep(1000)

  @FleetAggregate
  Scenario Outline:  Test Fleet Aggregate -dutyType with <dutyType> and <insignificant>
    Given url TestQAURL+'/fleets/'+'<fleetId>'+'/aggregate?'+'dutyType='+'<dutyType>&'+DATERANGE+'&insignificant=<insignificant>'
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "machinemax",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response
    Examples:
      | dutyType | insignificant | fleetId |
      | light    | true          | UAETSJ  |
      | light    | false         | UAETSJ  |
      | heavy    | true          | UAETSJ  |
      | heavy    | false         | UAETSJ  |
      | light    | true          | SAP-TSJ |
      | light    | false         | SAP-TSJ |
      | heavy    | true          | SAP-TSJ |
      | heavy    | false         | SAP-TSJ |

  @FleetlatestTrips
  Scenario Outline: Test Fleet Latest trips by <fleetId> and TripSignificance: <insignificant>
    Given url TestQAURL+'/fleets/'+'<fleetId>'+'/latest-trips-by-asset-id?includeInsignificantTrips='+'<insignificant>'
    And header Authorization = 'Bearer ' + Token
    And headers { "x-lm-desired-account": "machinemax",  "Content-Type": "application/json",  "Authorization": "Basic bGlnaHRtZXRyaWNzX3FhOjhOd1BxUUVBZzA0TExKZmV0UWJvZ1d5M2pkSmxkbnB3bjFrYUI5UHhseHVEbjhrUEkyMjdyMmZwcExWRExJY0Q="}
    When method GET
    Then status 200
    And print response
    Examples:
      | fleetId   | insignificant |
      | UAETSJ    | true          |
      | UAETSJ    | false         |
      | SAP-TSJ   | true          |
      | SAP-TSJ   | false         |
      | PMCC-TSJ  | true          |
      | PMCC-TJ   | false         |
      | NKCPL-TSJ | true          |
      | NKCPL-TSJ | false         |
