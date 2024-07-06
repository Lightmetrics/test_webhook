Feature: Validate Webhook Response Schema

  Background:
    * url 'https://6f15-2409-4071-d4b-727-d59f-b7c4-3473-40ce.ngrok-free.app/'

  Scenario: Verify Webhook Response Schema
    Given path 'IGNITION'
    When method GET
    Then status 200
    And match response == read('data/IgnitionSchema.json')