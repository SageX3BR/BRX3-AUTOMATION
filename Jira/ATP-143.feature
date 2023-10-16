##########################################################################
#Header
#-------------------------------------------------------------------------
#- Test code: ATP-143
#- Description: Remover duplicidade entre Descrição e Dados Adicionais da NFSe
#- Jira: X3DEV-3723
#- Legislation: BRA
#- Created by : Gustavo Albanus
#- Created date : 16/10/2023
#- Updated by :
#- Updated date :
#- Status : Done
##########################################################################

Feature: ATP-143

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. Create a Invoice
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "200" to the selected text field
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    Scenario Outline: Inserir Linha de Serviço
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQSTISS"
        And the user adds the text <XQSTISS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQEXISS"
        Then the user adds the text <XQEXISS> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI    | XQSTISS | XQEXISS |
            | 1   | "SER001" | "1" | "1000.00" | "1"     | "1"     |

    Scenario: 3. Informações Adicionais
        When the user clicks the "NF-e Summary" tab selected by title
        Then the user selects the text field with name: "Additional Observations"
        Then the user writes "TESTE DE CONCATENAR AS OBSERVAÇÕES ADICIONAIS CONFORME O TICKET X3DEV-3723" to the selected text area
        Given the user clicks the "Create" main action button on the right panel

    Scenario: 4. Transmissão NFS-e
        Given the user clicks the "Transmit RPS" action button on the header drop down
        When a log panel appears
        #And the user selects the main log panel of the page
        #And the selected log panel includes the message "Código: 100 - Autorizado."
        Then the user clicks the Close page action icon on the header panel
        Given the user selects the text field with X3 field name: "SIH0_NUM"
        Then the user stores the value of the selected text field with the key: "SIH_NUM"
        #Fechando SIH antes de ir para outra função
        Then the user clicks the Close page action icon on the header panel

    Scenario: 5. Validação do RPS
        Given the user opens the "CONSXQRPS" function
        And the user selects the text field with X3 field name: "XQRPSMT1_NUM"
        And the user writes the stored text with key "SIH_NUM" in the selected text field and hits tab key
        Then the user clicks the "Search" button in the header
        Given the user selects the data table with x3 field name: "XQRPSMT1_ARRAY_NBLIG"
        When the user selects first row of the selected data table
        Then the user selects cell with header: "Selection" of selected row
        And the user clicks on the selected cell
        And the user opens "NFS-e Log" function on toolbox of the selected row
        And the user selects the data table of section: "NFS-e Log"
        And the user selects first row of the selected data table
        And the user opens "Request data" function on toolbox of the selected row
        And the user selects the text field with X3 field name: "XQRPSJSON_JSON"
        And the value of the selected text field contains "Discriminacao": "Instalação software Office "
        And the value of the selected text field contains "NFSOutrasinformacoes": " | TESTE DE CONCATENAR AS OBSERVAÇÕES ADICIONAIS CONFORME O TICKET X3DEV-3723"
        And the user clicks the Close page action icon on the header panel
        #Fechando janela aberta antes do log.
        And the user clicks the Close page action icon on the header panel

    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
