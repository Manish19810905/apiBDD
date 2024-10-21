Feature: get all product from the api

  Scenario: verify the get call from the api
    Given I hit the url of get product api
    When I pass the url in the request
    Then I received the response code as 200
    
