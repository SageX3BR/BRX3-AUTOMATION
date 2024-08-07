##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-161
# - Description: Validar se uma fatura de venda com retenções, gera o vencimento abatendo
# - o valor da retenções, com mais vencimentos
# - Jira: X3DEV-4958
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 07/03/2024
# - Updated by : Gustavo Albanus
# - Updated date : 17/07/2024
# - Status : Done
# - Os elementos que devem ser deduzidos são PIS/COFIS/CSLL/IRRF/INSS/ISS. Apenas o IRPJ fica de fora.
###########################################################################

Feature: ATP-161

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
        When the user selects the text field with name: "Terms"
        And the user writes "BR_30/60/90" to the selected text field and hits tab key
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
        And the user selects last editable cell with X3 field name: "WK5ALL4_VACITM1"
        And the user adds the text <VACITM1> in selected cell
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY | GROPRI    | XQSTISS | XQEXISS | VACITM1 |
            | 1   | "SER001" | "1" | "2000.00" | "1"     | "1"     | "BRL"   |

    Scenario: 3. Create
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 4. Verificar Cálculo de Impostos
        Given the user clicks the "NF-e Summary" tab selected by title
        When the user selects the text field with name: "PIS RF value"
        And the value of the selected text field is "135.00"
        And the user selects the text field with name: "COFINS RF value"
        And the value of the selected text field is "160.00"
        And the user selects the text field with name: "CSLL value"
        And the value of the selected text field is "200.00"
        And the user selects the text field with name: "IRRF value"
        And the value of the selected text field is "46.00"
        And the user selects the text field with name: "IRPJ value"
        And the value of the selected text field is "33.00"
        And the user selects the text field with name: "INSS value"
        And the value of the selected text field is "173.00"
        And the user selects the text field with name: "ISS RF value"
        And the value of the selected text field is "100.00"

    Scenario: 005. Validar os Vencimentos
        And the user clicks the "Open items" button in the header
        Given the user selects the data table in the popup
        When the user selects first row of the selected data table
        And the user selects cell with header: "Amount" of selected row
        And the user clicks on the selected cell
        And the value of the selected cell is "395.29"
        When the user selects editable table row number: 2
        And the user selects cell with header: "Amount" of selected row
        And the value of the selected cell is "395.30"
        When the user selects editable table row number: 3
        And the user selects cell with header: "Amount" of selected row
        And the value of the selected cell is "395.41"
        Given the user clicks the Close page action icon on the header panel

    Scenario: 009. Logout
        Given the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
