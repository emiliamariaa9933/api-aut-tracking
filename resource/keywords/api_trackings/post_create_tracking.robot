*** Settings ***
Resource  ${EXECDIR}/resource/main.resource

*** Variables ***
${API-KEY}  uh8fl51y-ep2l-dl49-glfe-yteazof8euox

*** Keywords ***
Dado que parametrizo informações da requisição ao endpoint "trackings/create" passando um body "${situacao_body}"
    [Documentation]  Keyword para parametrizar informações da requisição ao endpoint "trackings/create" passando um body "válido"
    # ${body}  Get File  ${INDEX_BODY.create_trackings}
    Gerar tracking number
    
    IF    '${situacao_body}' == 'válido'
        ${body_valido}=    Create Dictionary    tracking_number=${tracking_number}    courier_code=fedex
        Set Test Variable    ${body_formatado}    ${body_valido}
    ELSE
        ${body_invalido}=    Create Dictionary    tracking_number=${tracking_number}    courier_code=fedexx
        Set Test Variable    ${body_formatado}    ${body_invalido}
    END

    ${headers}=    Create Dictionary    Content-Type=application/json    Tracking-Api-Key=${API-KEY}
    Set Suite Variable    ${headers}

Quando faço uma requisição POST no endpoint "trackings/create"
    [Documentation]  Keyword para fazer uma requisição POST no endpoint "trackings/create"
    ${response}=    POST    ${AMBIENTE.base}/${API_TRACKINGS}/${ENDPOINTS_TRACKINGS.create}
    ...    json=${body_formatado}
    ...    headers=${headers}
    ...    expected_status=any
    Set Test Variable    ${response}
    Set Test Variable    ${contrato}    ${response.json()}

Dado que parametrizo informações da requisição ao endpoint "trackings/create" passando um body "${situacao_body}" sem token de autenticação
    [Documentation]  Keyword para parametrizar informações da requisição ao endpoint "trackings/create" passando um body "válido" sem token de autenticação
    Gerar tracking number
    ${body}  Get File  ${INDEX_BODY.create_trackings}
    IF    '${situacao_body}' == 'válido'
       ${body_valido}=    Create Dictionary    tracking_number=${tracking_number}    courier_code=fedex
        Set Test Variable    ${body_formatado}    ${body_valido}
    END
    ${headers}=    Create Dictionary    Content-Type=application/json    Tracking-Api-Key=""
    Set Test Variable    ${headers}