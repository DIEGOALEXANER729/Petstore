Feature: Update name and status pet

  Background:
    * url "https://petstore.swagger.io/v2"
    * call read("classpath:petStore/post/create-pet-post.feature@Create")


  @Update
  Scenario: Update name and Status
    * def var =  { "id": #(IdPet), "name": "Alex", "category": { "id": 1001, "name": "string" }, "photoUrls": ["string"], "tags": [{ "id": 1001, "name": "string" }], "status": "sold" }
    * path "/pet"
    Given request var
    When method put
    Then status 200
    And def petStatus = $.status
    And def response = response
    And match $.name == "Alex"
    And match $.status == "sold"

