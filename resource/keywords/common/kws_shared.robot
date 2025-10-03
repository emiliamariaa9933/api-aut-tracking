*** Settings ***
Resource  ${EXECDIR}/resource/main.resource

*** Keywords ***
Então deve retornar o status code "${status_code}"
    [Documentation]  Verifica se o status code da resposta é esperado conforme teste.
    Status Should Be  ${status_code}


Gerar tracking number
    [Documentation]  Gera um número de rastreamento (tracking number) aleatório com 10 dígitos numéricos.
    ${tracking_number}=    Generate Random String    10    [NUMBERS]
    [Return]    ${tracking_number}
    Set Test Variable    ${tracking_number}