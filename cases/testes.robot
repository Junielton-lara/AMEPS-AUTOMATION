*** Settings ***
Resource  ../resource/main.robot

Suite Setup  Open App        ${link}
Test Teardown  Evidênciar teste


*** Test Cases ***


Validação funcionamento basico AMEPS - Home
    Dado que acesso a home do site
    Então os elemntos da home devera ser carregados com sucesso



# Validação funcionamento basico AMEPS - Pesquisa com filtro
#     Dado que acesso a home do site
#     E realizo uma pesquisa com filtro
#     Então a pesquisa devera ser realizada com sucesso

# Validação funcionamento basico AMEPS - Pesquisa sem filtro
#     Dado que acesso a home do site
#     E realizo uma pesquisa sem filtro
#     Então a pesquisa devera ser realizada com sucesso

# Validação funcionamento basico AMEPS - Lista de prestadores
#     Dado que acesso a home do site
#     E realizo uma pesquisa com filtro
#     Então a pesquisa devera ser realizada com sucesso
#     E a lista de prestadores ser apresentadas com todos os elementos com sucesso

# Validação funcionamento basico AMEPS - Abertura de perfil de profissionais
#     Dado que acesso a home do site
#     E realizo uma pesquisa com filtro
#     E abro o perfil de prestadores
#     Então o perfil devera ser carregado com sucesso contento todos os elementos