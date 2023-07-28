###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-139
# - Description: GESSIH - Regravar informação na XQTRANSPORTE
# - Jira: X3DEV-3088
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 26/07/2023
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-139

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. GESSIH
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

    Scenario Outline: 3. Add Lines GESSIH
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
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY | GROPRI  | XQCFOP |
            | 1   | "BMS001" | "1" | "50.00" | "6101" |

    Scenario: 4. Transport, Document Creation and validation
        And the user clicks the "Shipping data" tab selected by title
        And the user selects the text field with name: "Carrier"
        And the user writes "PT202" to the selected text field and hits tab key
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 5. Modify Transport and Rewrite
        And the user waits 3 seconds
        And the user clicks the "Shipping data" tab selected by title
        And the user selects the text field with name: "Carrier"
        And the user writes "" to the selected text field and hits tab key
        Given the user clicks the "Save" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been modified"

    Scenario: 6. SEFAZ
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        #Verificar status da nota (6 = Autorizada)
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "[F:XQSIH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel
        Then the user clicks the Close page action icon on the header panel

    Scenario: 7. Logout
        And the user logs-out from the system