###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-156
# - Description: Permitir a Alteração de Vencimento na Fatura de Venda
# - Jira: AX-1264
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 28/02/2024
# - Updated by : Gustavo Albanus
# - Updated date : 16/05/2025
# - Status : Done
# - Ajustes Efetuados: Editado a condição de pagamento para não ocorrer problema nas parcelas
###########################################################################

Feature: ATP-156

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. SIH Header
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SIH0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_SIVTYP"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_BPCINV"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSIH0_CODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    Scenario Outline: 003. SIH lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell
        And the user hits enter
        Examples:
            | LIN | ITMREF   | QTY | GROPRI   | XQCFOP | XQOICMS | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "1" | "100.00" | "6101" | "0"     | "00"      | "999"  |

    Scenario: 004. SIH Creation
        When the user selects the text field with name: "Terms"
        And the user writes "BR_AVISTA" to the selected text field and hits tab key
        And the user writes "BR_30/60DDN" to the selected text field and hits tab key
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 005. Validar os Vencimentos
        And the user clicks the "Open items" button in the header
        Given the user selects the data table in the popup
        When the user selects first row of the selected data table
        And the user selects cell with header: "Amount" of selected row
        And the value of the selected cell is "55.00"
        When the user selects editable table row number: 2
        And the user selects cell with header: "Amount" of selected row
        And the value of the selected cell is "55.00"
        Given the user clicks the Close page action icon on the header panel

    Scenario: 008. Alterar os Vencimentos
        And the user waits 5 seconds
        And the user clicks the "Open items" button in the header
        Given the user selects the data table in the popup
        When the user selects first row of the selected data table
        And the user selects cell with header: "Amount" of selected row
        And the user clicks on the selected cell
        And the user adds the text "80.00" in selected cell
        When the user selects editable table row number: 2
        And the user selects cell with header: "Amount" of selected row
        And the user adds the text "30.00" in selected cell
        Given the user clicks the Close page action icon on the header panel

    Scenario: 009. Logout
        Given the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
