*** settings  ***
Resource           ../resource/Resource.robot
Test Setup        Abrir navegador
Test Teardown     Fechar navegador
### SETUP ele roda a keyword antes da suite ou antes de um Teste
### TEARDOW  ele roda a keyword depois da suite ou de Teste


*** Test case ***
Caso de test 01: Pesquisar produto existente
   Acessar a pagina home do site
   Digitar o nome do produto "Blouse" no campo de pesquisa
   Clicar no botão pesquisar
   Conferir se o produto "Blouse" foi listado no site
Caso de test 02: Pesquisar produto não existente
   Acessar a pagina home do site
   Digitar o nome do produto "ItemNãoExistente" no campo de pesquisa
   Clicar no botão pesquisar
   Conferir mensagen de erro "No results were found for your search "ItemNãoExistente""
