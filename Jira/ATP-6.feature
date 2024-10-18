###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-6
# - Description: Calculo de ICMS Diferido e Redução de Base ao mesmo tempo
# - Legislation: BR addon
# - JIRA: X3DEV-6277
# - Created by : Gustavo Albanus
# - Created date : 21/08/2024
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-6

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. SIH Header
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

    Scenario Outline: 3. SIH lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user hits enter
        Examples:
            | LIN | ITMREF   | QTY | GROPRI     | XQCFOP |
            | 1   | "BMS012" | "1" | "76000.00" | "6102" |

    Scenario: 4. SIH Creation
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 5. Validation of Taxes
        When the user clicks the "NF-e Summary" tab selected by title
        And the user selects the text field with name: "ICMS base total"
        And the value of the selected text field is "50,669.20"
        And the user selects the text field with name: "Operation ICMS value"
        And the value of the selected text field is "9,120.46"
        And the user selects the text field with name: "Deferred ICMS value"
        And the value of the selected text field is "4,334.04"
        And the user selects the text field with name: "ICMS payable value"
        And the value of the selected text field is "4,786.42"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 6. Logout
        And the user logs-out from the system