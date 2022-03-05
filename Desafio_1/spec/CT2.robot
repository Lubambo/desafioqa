*** Settings ***
Documentation  Especificação dos testes do CT2.

Resource  ./CT1.robot

*** Keywords ***
Os itens da lista de resultados ate a pagina ${pagina} nao devem conter o local ${localIndesejado}
    FOR  ${pageIndex}  IN RANGE  0  ${pagina}
        FOR  ${listIndex}  IN RANGE  1  21  20
            ${descProp}  Get Item Description Property  ${listIndex}
            Element Should Not Contain  ${descProp}  ${localIndesejado}
        END

        Click Button  ${showMoreBtn}
    END

CT2 BDD Spec
    [Arguments]  ${url}  ${browser}  ${estado}  ${especialidade}  ${localIndesejado}  ${pagina}
    Given estou no portal da Unimed  ${url}  ${browser}
    And acesso o Guia Medico
    When pesquiso medicos do estado ${estado} com especialidade em ${especialidade}
    Then o contador de resultado informa quantos medicos foram encontrados
    And os itens da lista de resultados ate a pagina ${pagina} nao devem conter o local ${localIndesejado}