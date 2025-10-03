*** Settings ***
Resource  ${EXECDIR}/resource/main.resource

*** Test Cases ***
TC0001: Retornar 200 ao Criar tracking válido
  [Tags]  TC0001  API_tracking  EP_tracking
  [Documentation]  Teste responsável por validar a criação de um tracking válido na api, com body válido, deve retornar status code 200.
  Dado que parametrizo informações da requisição ao endpoint "trackings/create" passando um body "válido"
  Quando faço uma requisição POST no endpoint "trackings/create"
  Então deve retornar o status code "200"

TC0002: Retornar 400 ao Criar tracking com body inválido
  [Tags]  TC0002  API_tracking  EP_tracking
  [Documentation]  Teste responsável por validar a criação de um tracking inválido na api, com body inválido, deve retornar status code 400.
  Dado que parametrizo informações da requisição ao endpoint "trackings/create" passando um body "inválido"
  Quando faço uma requisição POST no endpoint "trackings/create"
  Então deve retornar o status code "400"

TC0003: Retornar 401 ao Criar tracking sem token de autenticação
  [Tags]  TC0003  API_tracking  EP_tracking
  [Documentation]  Teste responsável por validar a criação de um tracking sem token de autenticação, deve retornar status code 401.
  Dado que parametrizo informações da requisição ao endpoint "trackings/create" passando um body "válido" sem token de autenticação
  Quando faço uma requisição POST no endpoint "trackings/create"
  Então deve retornar o status code "401"