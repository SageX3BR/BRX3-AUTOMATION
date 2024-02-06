##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-150
# - Description: Sugestão CST de IPI nos orçamentos GESSQH
# - Jira: X3DEV-4318
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 05/02/2024
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-150

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. Orçamento (GESSQH)
        Given the user opens the "GESSQH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales quote ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Quote type"
        And the user writes "SQH" to the selected text field and hits tab key
        And the user selects the text field with name: "Customer"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK1ALL2_ARRAY_NBLIG"

    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK1ALL2_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_GROPRI"
        And the user adds the text <GROPRI> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   |
            | 1   | "BMS007" | "1" | "100.00" |

    Scenario: 003. Create SQH document
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user waits 5 seconds
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK1ALL2_ARRAY_NBLIG"
        And the user selects editable table row number: 1
        And the user selects cell with header: "Tax Det." of selected row
        And the user clicks on the icon contained in the selected cell
        And the user selects the text field with X3 field name: "XQDTIMP1_CSTIPI"
        And the value of the selected text field is "52"
        Then the user clicks the Close page action icon on the header panel
        Then the user clicks the Close page action icon on the header panel
        Then an alert box with the text "Continue and cancel the modifications?" appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: 004. Logout
        And the user logs-out from the system

