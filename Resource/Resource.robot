*** settings ***
library   SeleniumLibrary
library   String

*** variables ***
${BROWSER}     chrome
${URL}         http://automationpractice.com

*** keywords***
### Setup e Teardow
Abrir navegador
    Open Browser  about:blank   ${BROWSER}

Fechar navegador
    Close Browser

###  Ações
Acessar a pagina home do site
    Go To   http://automationpractice.com
    Title Should Be   My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text                       name=search_query    ${PRODUTO}

Clicar no botão pesquisar
    Click Element                    name=submit_search

Mover o mouse por cima da cadegoria "${GENERO}"
    Mouse Over                       xpath=//*[@id="block_top_menu"]/ul/li[1]/a
    Wait Until Element Is Visible    xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

Clicar no botão "${SUB_CATEGORIA}"
    Click Element                    xpath=//*[@id="block_top_menu"]/ul/li[1]/ul/li[2]/ul/li[3]/a

Clicar no botão "Add to cart"
    Click Element                    xpath=//*[@id="center_column"]/ul/li/div/div[2]/div[2]/a[1]/span
    Wait Until Element Is Visible    xpath=//*[@id="layer_cart"]/div[1]/div[1]/h2
    Click Element                    xpath=//*[@id="layer_cart"]/div[1]/div[2]/div[4]/a/span

Clicar no carrinho de compras
    Click Element                    xpath=//*[@id="header"]/div[3]/div/div/div[3]/div/a

Escluir produto do carrinho
    Click Element                    xpath=//*[@id="1_1_0_0"]

Clicar no botão "Sign in"
    Click Element                    xpath=//*[@id="header"]/div[2]/div/div/nav/div[1]/a
    Wait Until Element Is Visible    css=#center_column > h1

Inserir e-mail válido
    Wait Until Element Is Visible    id=email_create
    ${EMAIL}                         Generate Random String
    Input Text                       id=email_create    ${EMAIL}@testerobot.com


Clicar no botão "Create na account"
    Click Element                    xpath=//*[@id="SubmitCreate"]/span

Preencher os campos obrigatórios
    Wait Until Element Is Visible    xpath=//*[@id="account-creation_form"]/div[1]/h3
    Input Text                       id=customer_firstname    Conta


### Conferências
Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible    css=#center_column > h1
    Title Should Be                  Search - My Store
    Page Should Contain Image        xpath=//*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img
    Page Should Contain Link         xpath=//*[@id="center_column"]/ul/li/div/div[2]/h5/a

Conferir mensagem "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible    xpath=//*[@id="center_column"]/p[@class='alert alert-warning']
    Element Text Should Be           xpath=//*[@id="center_column"]/p[@class='alert alert-warning']    ${MENSAGEM_ALERTA}

Conferir se os produtos são exibidos na página
    Wait Until Element Is Visible    css=#center_column > h1 > span.cat-name
    Page Should Contain Image        xpath=//*[@id="center_column"]/ul/li[1]/div/div[1]/div/a[1]/img
    Page Should Contain Image        xpath=//*[@id="center_column"]/ul/li[2]/div/div[1]/div/a[1]/img
    Page Should Contain Image        xpath=//*[@id="center_column"]/ul/li[3]/div/div[1]/div/a[1]/img

Conferir se o produto "${PRODUTO}" foi listado na pesquisa
    Wait Until Element Is Visible    css=#center_column > h1
    Title Should Be                  Search - My Store
    Page Should Contain Image        xpath=//*[@id="center_column"]/ul/li/div/div[1]/div/a[1]/img

Conferir a tela do carrinho de compras
    Wait Until Element Is Visible    xpath=//*[@id="cart_title"]
    Title Should Be                  Order - My Store
    Page Should Contain Image        xpath=//*[@id="product_1_1_0_0"]/td[1]/a/img
    Page Should Contain Element      css=#total_price_container

Conferir a pagina de cadastro de cliente
    Wait Until Element Is Visible    css=#noSlide > h1
    Title Should Be                  Login - My Store
    Page Should Contain              Authentication
