###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-flow-soh-cfop-sug3
# - Description: Sugerir CFOP na primeira linha - SOH
# - Jira: NA
# - Created by : Carla Cury
# - Created date : 10/07/2020
# - Updated by : Jonatas Hille
# - Updated date : 31/12/2021
# - Status : [X]Automated []Work In Progress []Broken
###########################################################################

Feature: xq-s-flow-soh-cfop-sug3

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. Create Sales order
        Given the user opens the "GESSOH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR014" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRSOI" to the selected text field and hits tab key
        And the user selects the text field with name: "Sold-to"
        And the user writes "BR005" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "64" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK2ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell and hits enter key
        Examples:
            | LIN | ITMREF   | QTY | GROPRI  |
            | 1   | "BMS001" | "6" | "24.98" |

    Scenario: 3. Check the CFOP
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"
        And the user selects row that has the text "BMS001" in column with X3 field name: "WK2ALL4_ITMREF"
        And the user selects cell with X3 field name: "WK2ALL4_XQCFOP" of selected row
        And the value of the selected cell is "5102"



    Scenario: 4. Logout
        And the user clicks the Close page action icon on the header panel
        And an alert box with the text "Continue and cancel the creation?" appears
        And the user clicks the "Yes" opinion in the alert box
        And the user logs-out from the system

