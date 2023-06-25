*** Settings ***
Resource  ../main.robot

*** Keywords ***


# Validação funcionamento basico AMEPS - Home
Dado que acesso a home do site
    Wait Element    xpath=//img[@alt='Ameps']
    Wait Element    xpath=//a[contains(text(),'Home')]
    Wait Element    xpath=//*/text()[normalize-space(.)='Encontre um especialista agora!']/parent::*

Então os elementos da home devera ser carregados com sucesso
    Wait Element    xpath=//a[contains(text(),'Home')]
    Wait Element    xpath=//*/text()[normalize-space(.)='Encontre um especialista agora!']/parent::*
    Wait Element    xpath=(.//*[normalize-space(text()) and normalize-space(.)='categoria'])[1]/following::span[1]
    Wait Element    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Cidade'])[1]/following::span[1]
    Wait Element    xpath=//*/text()[normalize-space(.)='Login']/parent::*
    Wait Element    xpath=//*/text()[normalize-space(.)='Inscrever-se']/parent::*
    Wait Element    xpath=//*/text()[normalize-space(.)='Pesquisar']/parent::*



#Validação funcionamento basico AMEPS - Pesquisa com filtro
# Dado que acesso a home do site
E realizo uma pesquisa com filtro
    Click    xpath=//*/text()[normalize-space(.)='Pesquisar']/parent::*
    

Então a pesquisa devera ser realizada com sucesso
    Wait Element    id=srhendpagenum
    Sleep    5
    ${qtd_results}    Get Text    id=srhendpagenum
    Log To Console   Resultados da pesquisa é ${qtd_results}

    Should Not Be Equal As Numbers    ${qtd_results}    0    Falha: Foi apresentado 0 registros na pagina de consulta



# #Validação funcionamento basico AMEPS - Pesquisa sem filtro
# Dado que acesso a home do site
# E realizo uma pesquisa sem filtro
# Então a pesquisa devera ser realizada com sucesso

# #Validação funcionamento basico AMEPS - Lista de prestadores
# Dado que acesso a home do site
# E realizo uma pesquisa com filtro
# Então a pesquisa devera ser realizada com sucesso
# E a lista de prestadores ser apresentadas com todos os elementos com sucesso

# #Validação funcionamento basico AMEPS - Abertura de perfil de profissionais
# Dado que acesso a home do site
# E realizo uma pesquisa com filtro
# E abro o perfil de prestadores
# Então o perfil devera ser carregado com sucesso contento todos os elementos