Feature: Find pet with Status
  # Este feature verifica la funcionalidad de búsqueda de mascotas por estado en la API de Petstore.
  Background:
    * url "https://petstore.swagger.io/v2"
    * call read("../../put/update-pet-put.feature@Update")
    * call read("../../post/create-pet-post.feature@Create")
    * path "/pet/findByStatus"
    #Este escenario busca una mascota específica según su estado.
  Scenario: Find pet
    * params {"status": #(petStatus)}
    When method get
    Then status 200
    And match $[*].status contains petStatus
    And match $[*].id contains IdPet
    #  Este escenario permite buscar múltiples estados de mascotas.
  Scenario Outline: Find pets by status
    # Define el parámetro para el estado específico.
    * def specificStatus = "<statusPet>"
    # Se asigna el estado específico como parámetro.
    * params {"status": #(specificStatus)}
    When method get
    # Verifica el código de estado esperado según el ejemplo.
    Then status <status>
    # Asegura que el estado devuelto contiene specificStatus.
    And match $[*].status contains specificStatus
    # Proporciona ejemplos de estados de mascotas y los códigos de estado esperados.
    Examples:
      | statusPet | status |
      | available | 200    |
      | sold   | 200    |