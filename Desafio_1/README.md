# Desafio 1

## Descrição do Projeto

O projeto está dividido em:

- `data`: contém os dados de teste dentro de arquivos `.csv`;

- `pageObjects`: possui o mapeamento dos elementos `HTML` das páginas que envolvem os testes;

- `spec`: contém as especificações dos testes, cada arquivo de especificação é nomeado da mesma forma que o arquivo de chamada do teste (encontrado na pasta `tests`);
  - O arquivos de especificação seguem o mesmo padrão de escrita, contendo as `keywords` responsáveis pelos comportamentos do usuário e por último, uma `keyword` principal que chama as outras e descreve o teste utilizando a técnica `BDD`, esta é nomeada seguindo o padrão `nome do teste` + `BDD Spec`, apenas para facilitar o entendimento e localização do teste.

- `tests`: os arquivos de testes que serão chamados encontram-se nesta pasta. Cada arquivo utiliza a lib [`DataDriver`](https://github.com/Snooz82/robotframework-datadriver) para associar o arquivo aos dados de testes (`.csv`);

- `project.properties`: reúne as variáveis de projeto (no caso deste projeto, contém apenas a `url` padrão utilizada durante os testes);

- `locators.py`: utiliza a lib `Config Parser` para que as variáveis do projeto possam ser chamadas nos arquivos de teste;

- `output`: pasta gerada pelo `Robot Framework` contendo o relatório dos testes.

## Requerimentos

Para executar os testes, é requerido:

- [Python v3+](https://www.python.org/downloads/);

- [Robot Framework](https://robotframework.org/?tab=1#getting-started);

- [Robot Framework - Selenium Library](https://github.com/robotframework/SeleniumLibrary/#installation);

- [Robot Framework - DataDriver](https://github.com/Snooz82/robotframework-datadriver#installation);

## Execução dos Testes

No console, utilize:

- Para executar a validação 1 do desafio: `robot -i ct1 -d ./output ./tests`;
- Para executar a validação 2 do desafio: `robot -i ct2 -d ./output ./tests`;
- Para executar todas as validações do desafio: `robot -i all -d ./output ./tests`.
