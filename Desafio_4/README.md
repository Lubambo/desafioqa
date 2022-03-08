# Desafio 4

## Descrição do Projeto

O projeto está dividido em:

- `app`: diretório que armazena a `apk` que será testada;

- `data`: contém os dados de teste dentro de arquivos `.csv`;

- `pageObjects`: possui o mapeamento dos elementos `XML` das telas que envolvem os testes;

- `resource`: contém os arquivos que auxiliam a escrita dos testes;

- `tests`: contém as especificações dos testes;
  - Cada arquivo utiliza a lib [`DataDriver`](https://github.com/Snooz82/robotframework-datadriver) para associar o arquivo aos dados de testes (`.csv`);

- `project.properties`: reúne as variáveis de projeto;
  - O arquivo está dividido em seções:
    - `[prop]`: reúne as informações necessárias para o `Appium` iniciar a aplicação que será testada;
    - `[user]`: contém o usuário válido, podendo assim ser acessado por toda a aplicação;
    - `[customVariable]`: contém nomes definidos de variáveis que podem ser tratadas em todo o teste sem risco de erro de escrita.

- `locators.py`: utiliza a lib `Config Parser` para que as variáveis do projeto possam ser chamadas nos arquivos de teste;

- `output`: pasta gerada pelo `Robot Framework` contendo o relatório dos testes.

## Requerimentos

Para executar os testes, é requerido:

- [Python v3+](https://www.python.org/downloads/);

- [Robot Framework](https://robotframework.org/?tab=1#getting-started);

- [Robot Framework - Appium Library](https://github.com/serhatbolsu/robotframework-appiumlibrary);

- [Robot Framework - DataDriver](https://github.com/Snooz82/robotframework-datadriver#installation);

- [Android Studio](https://developer.android.com/studio?hl=pt&gclid=Cj0KCQiA95aRBhCsARIsAC2xvfyikQ6-SDyDQsVqXp2oOUMk7pe_cVHFUmvkpgpAKAGwsPyrxZ9NZBMaAk5fEALw_wcB&gclsrc=aw.ds#downloads): o emulador de dispositivos móveis permite que o appium o utilize para execeutar os scripts de teste);

- [Appium Inspector](https://github.com/appium/appium-inspector): permite visualizar a estrutura `XML` das telas do app para rastrear os elementos de interação com dos testes.

## Execução dos Testes

Para executar os testes é necessário antes pereparar o ambiente para os testes seguindo os passos abaixo:

1. Inicie o emulador android da sua escolha;

2. Espere o emulador iniciar por completo, abra o console e execute o comando `adb devices` para visualizar a id do emulador, utilizada na propriedade `udid` requerida para iniciar a aplicação no servidor local do `Appium`;

3. Abra o `Appium Inspector`:
    1. Na aba `Appium Server`, insira no input `Remote Path` o valor `/wd/hub`;
    2. Insira as `Desired Capabilities` para que forme o `json` abaixo na seção `Android`

    ```json
    {
      "automationName": "UiAutomator2",
      "platformName": "Android",
      "deviceName": "Pixel2",
      "app": "diretório_do_orojeto\\app\\NoesisQuaChallenge.apk",
      "udid": "udid_adquirida_no_passo_2"
    }
    ```

4. Inicie o servidor local do `Appium` utilizando o comando `appium --base-path /wd/hub`:

5. No `Appium Inspector`, clique no botão `Start Session`;

6. Abra um console, acesse o diretório do projeto e utilize a tabela abaixo para execturar os testes:

| Validação | Nome do arquivo | Comando |
| --- | --- | --- |
| Login de acesso | `loginTest` | `robot -i login -d ./output ./tests` |
| Lista de registros | `listaTest` | `robot -i lista -d ./output ./tests` |
| Formulário | `formTest` | `robot -i form -d ./output ./tests` |
| Todos os testes | - | `robot -i all -d ./output ./tests` |

> **Obs.:** é aconselhável executar um teste por vez, pois, quando executados todos de uma vez, pode acontecer timeout na execução do app no emulador, causando falha nos testes.

## Relatório de Testes e Evidências

O `Robot Framework` gera um relatório ao final da execução dos testes, nele é possível visualizar os passos e seus resultados de cada teste. As imagens para evidências podem ser visualizadas no próprio relatório.

É possível encontrá-lo na pasta `output`. Para visualizar basta abrir o arquivo `log.html` no navegador.
