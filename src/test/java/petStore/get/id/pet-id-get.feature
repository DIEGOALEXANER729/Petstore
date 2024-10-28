Feature: Find pet with ID

  Background:
    * url "https://petstore.swagger.io/v2"

  Scenario: Successfully find pet by ID
    # Crea una mascota y recupera los detalles de ID y estado para la verificación
    * def petCreation = call read("../../post/create-pet-post.feature@Create")
    * def IdPet = petCreation.IdPet
    * def petStatus = petCreation.petStatus

    # Llama a la API para obtener la mascota creada
    * path "/pet/" + IdPet
    When method get
    Then status 200
    And match $.id == IdPet
    And match $.status == petStatus
