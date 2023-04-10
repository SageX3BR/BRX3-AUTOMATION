###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-117
# - Description: Sugerir o CFOP em encomendas originadas de pedidos de compras
# - Jira: X3DEV-2242
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 06/03/2023
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-117

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. GESPSH
        Given the user opens the "GESPSH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase request ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Request site"
        And the user writes "BR011" to the selected text field and hits tab key

    Scenario Outline: 3. Add Lines
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE2ALL1_ARRAY_NBLIG"
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE2ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell and hits tab key
        When the user selects last editable cell with column header: "Requested date"
        Then the user enters todays date in the selected cell
        And the user hits tab
        And the user selects last editable cell with X3 field name: "WE2ALL1_QTYPUU"
        And the user adds the text <QTYPUU> in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE2ALL1_BPSNUM"
        And the user adds the text <BPSNUM> in selected cell and hits tab key
        And the user clicks the "Yes" opinion in the alert box
        And the user selects last editable cell with X3 field name: "WE2ALL1_NETPRI"
        And the user adds the text <NETPRI> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYPUU | BPSNUM  | NETPRI    |
            | 1   | "BMS001" | "1"    | "BR006" | "1000.00" |

    Scenario: 4. Document Creation and validation
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "Order" button in the header
        Then an alert box appears
        And the user clicks the "Ok" opinion in the alert box
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Generate Orders End"
        Given the user clicks the Close page action icon on the header panel

    Scenario: 5. View PR Orders - Num. GESPOH
        Then the user clicks the "View PR orders" action button on the header drop down
        Given the user selects the fixed data table in the popup
        When the user selects first row of the selected data table
        And the user opens "Popup view" function on toolbox of the selected row
        And the user selects the text field with name: "Order no."
        And the user stores the value of the selected text field with the key: "NUMGESPOH"
        And the user clicks the Close page action icon on the header panel
        Given the user clicks the Close page action icon on the header panel
        Given the user clicks the Close page action icon on the header panel

    Scenario: 6. GESPOH
        Given the user opens the "GESPOH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase order ALL : Full entry" screen is displayed
        Given the user selects the data table of left panel
        When the user clicks the "Purchase orders" link on the left panel
        Then the user selects search cell with header: "Order no."
        And the user adds the stored text with key "NUMGESPOH" in selected cell and hits enter key
        And the user selects cell with column header: "Order no." and row number: 1
        And the user clicks on the selected cell

    Scenario: 7. Lines - Verificar CFOP
        And the user clicks the "Lines" tab selected by title
        Given the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"
        And the user selects editable table row number: 1
        And the user selects cell with X3 field name: "WE3ALL2_XQCFOP" of selected row
        And the value of the selected cell is "1101"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 8. Logout
        And the user logs-out from the system