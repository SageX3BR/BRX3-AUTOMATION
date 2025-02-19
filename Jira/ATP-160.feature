##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-160
# - Description: Deduzir da Base de PIS/COFINS o ICMS + DIFAL
# - JIRA: X3DEV-7083
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date :06/02/2025
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-160

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. GESSIH
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape

    Scenario Outline: 003. Add Lines
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"
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
        And the user adds the text <XQVARCFOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI    | XQCFOP | XQVARCFOP |
            | 1   | "BMS001" | "1" | "1000.00" | "6102" | "6"       |

    Scenario: 004. Document Creation and validation
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 005. Verificar Cálculo de Impostos
        Given the user clicks the "NF-e Summary" tab selected by title
        And the user selects the text field with name: "ICMS payable value"
        And the value of the selected text field is "70.00"
        And the user selects the text field with name: "ICMS DIFAL value"
        And the value of the selected text field is "50.00"
        And the user selects the text field with name: "PIS base (R$)"
        #And the value of the selected text field is "930.00"
        And the value of the selected text field is "880.00"
        And the user selects the text field with name: "COFINS base (R$)"
        #And the value of the selected text field is "930.00"
        And the value of the selected text field is "880.00"


    Scenario: 006. Logout
        Given the user clicks the Close page action icon on the header panel
        And the user logs-out from the system