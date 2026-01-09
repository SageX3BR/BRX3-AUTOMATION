###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-7
# - Description: Realizar transmissão de NFS-e que seja aprovada por estabelecimento que utiliza o token Migrate
# - Legislation: BR addon
# - Created by : Diogo Nascimento
# - Created date : 23/05/2022
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-7

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. Create a Invoice

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
        Then the user adds the text <XQEXISS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCODINDOP"
        Then the user adds the text <XQCODINDOP> in selected cell and hits enter key


        Examples:
            | LIN | ITMREF   | QTY | GROPRI    | XQSTISS | XQEXISS | XQCODINDOP |
            | 1   | "SER017" | "1" | "2000.00" | "1"     | "1"     | "100301"   |

    Scenario: 3. Create
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 4. Verificar Cálculo de Impostos
        Given the user clicks the "NF-e Summary" tab selected by title
        When the user selects the text field with name: "PIS value"
        And the value of the selected text field is "33.00"
        And the user selects the text field with name: "COFINS value"
        And the value of the selected text field is "152.00"
        And the user selects the text field with name: "PIS RF value"
        And the value of the selected text field is "13.00"
        And the user selects the text field with name: "COFINS RF value"
        And the value of the selected text field is "60.00"
        And the user selects the text field with name: "CSLL value"
        And the value of the selected text field is "20.00"
        And the user selects the text field with name: "IRRF value"
        And the value of the selected text field is "300.00"
        And the user selects the text field with name: "IRPJ value"
        And the value of the selected text field is "200.00"
        And the user selects the text field with name: "INSS value"
        And the value of the selected text field is "100.00"
        And the user selects the text field with name: "ISS RF value"
        And the value of the selected text field is "58.00"

    Scenario: 4. Transmissão NFS-e
        Given the user clicks the "Transmit RPS" action button on the header drop down
        When a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Código: 100 - Autorizado."
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the "Post" button in the header
        Then the user clicks the Close page action icon on the header panel

    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system

