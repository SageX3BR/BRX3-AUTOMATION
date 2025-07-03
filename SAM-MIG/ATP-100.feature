##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-100
# - Description: Rateio do valor do IPI nos vencimentos conforme a parametrização da condição de pagamento
# - JIRA: X3DEV-5811
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 20/08/2024
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-100

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. SIH Creation
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WK5INVCAXQ0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5INVCAXQ0_SIVTYP"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5INVCAXQ0_BPCINV"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ3_CODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape
        And the user selects the text field with X3 field name: "WK5ALL2_PTE"
        And the user writes "5X" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
        And the user hits enter
        Examples:
            | LIN | ITMREF   | QTY | GROPRI | XQCFOP | XQVARCFOP |
            | 1   | "BMS001" | "1" | "500"  | "6102" | ""        |
            | 2   | "BMS001" | "1" | "700"  | "6102" | ""        |

    Scenario: 003. Criação do Documento
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 004. Validar Impostos
        When the user clicks the "NF-e Summary" tab selected by title
        And the user selects the text field with name: "IPI total"
        And the value of the selected text field is "120.00"

    Scenario: 005. Validar os Vencimentos
        And the user clicks the "Open items" button in the header
        Given the user selects the data table in the popup
        When the user selects first row of the selected data table
        And the user selects cell with header: "Amount" of selected row
        And the value of the selected cell is "396.00"
        When the user selects editable table row number: 2
        And the user selects cell with header: "Amount" of selected row
        And the value of the selected cell is "132.00"
        When the user selects editable table row number: 3
        And the user selects cell with header: "Amount" of selected row
        And the value of the selected cell is "396.00"
        When the user selects editable table row number: 4
        And the user selects cell with header: "Amount" of selected row
        And the value of the selected cell is "132.00"
        When the user selects editable table row number: 5
        And the user selects cell with header: "Amount" of selected row
        And the value of the selected cell is "264.00"
        Given the user clicks the Close page action icon on the header panel

    Scenario: 006. Logout
        Given the user clicks the Close page action icon on the header panel
        And the user logs-out from the system