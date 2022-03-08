# Desafio 2

## Descrição do Projeto

O projeto está dividido em:

- `data`: contém os dados de teste e validação dentro das suas respectivas pastas
  - `jsonSchemas`: contém esquemas de json para validar o payload das response recebidas;
  - `testData`: contém os dados de testes, consumidos pela lib [`DataDriver`](https://github.com/Snooz82/robotframework-datadriver);

- `resource`: contém os arquivos que auxiliam a escrita dos testes;

- `spec`: contém as especificações dos testes. Os arquivos são nomeados da mesma forma do respectivo arquivo responsável pela chamada do teste (encontrado na pasta `tests`);

- `tests`: contém os arquivos de chamada dos testes;
  - Cada arquivo utiliza a lib [`DataDriver`](https://github.com/Snooz82/robotframework-datadriver) para associar o arquivo aos dados de testes (`.csv`);

- `project.properties`: reúne as variáveis de projeto (no caso deste projeto, contém apenas a `url` padrão da API, a `ID_DO_FILME` e `API_KEY`);

- `locators.py`: utiliza a lib `Config Parser` para que as variáveis do projeto possam ser chamadas nos arquivos de teste;

- `output`: pasta gerada pelo `Robot Framework` contendo o relatório dos testes.

## Requerimentos

Para executar os testes, é requerido:

- [Python v3+](https://www.python.org/downloads/);

- [Python lib - JsonSchema](https://pypi.org/project/jsonschema/);

- [Robot Framework](https://robotframework.org/?tab=1#getting-started);

- [Robot Framework - DataDriver](https://github.com/Snooz82/robotframework-datadriver#installation);

- [Robot Framework - Request Library](https://github.com/MarketSquare/robotframework-requests#readme).

## Execução dos Testes

Para executar os testes é necessário antes pereparar o ambiente para os testes seguindo os passos abaixo:

1. Acesse o diretório do projeto e utilize a tabela abaixo para execturar os testes:

| Validação | Nome do arquivo | Comando |
| --- | --- | --- |
| Verifica se o filme obtido pelo endpoint possui os valores esperados para título, ano e idioma | `CT1` | `robot -i ct1 -d ./output ./tests` |
| Verifica se a response obtida pelo endpoint de filme inválido corresponde às propriedades esperadas | `CT2` | `robot -i ct2 -d ./output ./tests` |
| Todos os testes | - | `robot -i all -d ./output ./tests` |

## Relatório de Testes

O `Robot Framework` gera um relatório ao final da execução dos testes, nele é possível visualizar os passos e seus resultados de cada teste.

É possível encontrá-lo na pasta `output`. Para visualizar basta abrir o arquivo `log.html` no navegador.
