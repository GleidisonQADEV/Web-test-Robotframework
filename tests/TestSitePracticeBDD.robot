*** settings  ***
Resource          ../resource/Resource.robot
Test Setup        Abrir navegador
Test Teardown     Fechar navegador


*** Test case ***
Cenário 01: Pesquisar produto existente
    Dado que estou na página home do site
    Quando pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado de busca

Cenário 02: Pesquisar produto não existente
    Dado que estou na página home do site
    Quando pesquisar pelo produto "ItemNãoExistente"
    Então a página deve exibir a mensagem "No results were found for your search "ItemNãoExistente""

Cenário 03: Listar produtos
    Dado que estou na página home do site
    Quando passar o mouse por cima da categoria "Women" no menu principal superior de categorias
    E clicar na sub categoria "Summer Dresses"
    Então uma página com os produtos da categoria selecionada deve ser exibida

Cenário 04: Adicionar produtos no carrinho
    Dado que estou na página home do site
    Quando pesquiar pelo produto "t-shirt" no campo de pesquisa
    E adicionar o produto carrinho
    Então A tela do carrinho de compras deve ser exibido, juntamente com os dados do produto adicionado e os devidos valores

Cenário 05: Remover produtos do carrinho
     Dado que estou na página home do site
     E existe o produto "t-shirt" adicionado no carrinho
     Quando excluir o produto do carrinho
     Então a página deve exibir a mensagem "Your shopping cart is empty."

#Cenário 06: Adicionar cliente
    #Quando faço o cadastro novo de cliente
    #Então a página de gerenciamento da conta deve ser exibida

*** Keywords ***
Dado que estou na página home do site
    Acessar a pagina home do site

Quando pesquisar pelo produto "${PRODUTO}"
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar

Então o produto "${PRODUTO}" deve ser listado na página de resultado de busca
    Conferir se o produto "${PRODUTO}" foi listado no site

Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
    Conferir mensagem "${MENSAGEM_ALERTA}"

Quando passar o mouse por cima da categoria "${GENERO}" no menu principal superior de categorias
    Mover o mouse por cima da cadegoria "${GENERO}"

E clicar na sub categoria "${SUB_CATEGORIA}"
    Clicar no botão "${SUB_CATEGORIA}"

Então uma página com os produtos da categoria selecionada deve ser exibida
    Conferir se os produtos são exibidos na página
    Conferir se os produtos são exibidos na página

Quando pesquiar pelo produto "${PRODUTO}" no campo de pesquisa
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto "${PRODUTO}" foi listado na pesquisa

E adicionar o produto carrinho
    Clicar no botão "Add to cart"

Então A tela do carrinho de compras deve ser exibido, juntamente com os dados do produto adicionado e os devidos valores
    Conferir a tela do carrinho de compras

E existe o produto "${PRODUTO}" adicionado no carrinho
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar
    Clicar no botão "Add to cart"

Quando excluir o produto do carrinho
    Clicar no carrinho de compras
    Escluir produto do carrinho


Quando faço o cadastro novo de cliente
    Clicar no botão "Sign in"
    Inserir e-mail válido
    Clicar no botão "Create na account"
    Conferir a pagina de cadastro de cliente
    Preencher os campos obrigatórios
###
