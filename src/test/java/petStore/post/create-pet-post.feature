Feature: Pet creation in the pet store
# Este feature permite la creación de una mascota en la tienda Petstore
  Background:
    * url "https://petstore.swagger.io/v2"
    * path "/pet"
    * def var = { "id": #(petId), "name": #(petName), "category": { "id": 1234567, "name": "string" }, "photoUrls": ["string"], "tags": [{ "id": 1234567, "name": "string" }], "status": #(petStatus) }

    ## Este escenario permite agregar una nueva mascota a la API, verifica que la solicitud se ejecute correctamente y valida que los campos de respuesta sean del tipo esperado.
  @Create
  Scenario Outline: Add a pet
    Given request var
    When method post
    Then status 200
    And def IdPet = $.id
    And def petStatus = $.status
    And match $.id == "#number"
    And match $.status == "#string"

    Examples:
      | petId    | petName | petStatus |
      | 1001     | dog     | available |
      | 1002     | cat     | pending   |
