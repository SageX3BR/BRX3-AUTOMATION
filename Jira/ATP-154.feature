##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-154
# - Description: Expedição Parcial deve trazer valores parciais no resumo
# - Jira: X3DEV-4518
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 19/02/2024
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-154

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. GESSOH
        Given the user opens the "GESSOH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRSON" to the selected text field and hits tab key
        And the user selects the text field with name: "Sold-to"
        And the user writes "BR005" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR011" to the selected text field and hits tab key
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
            | LIN | ITMREF   | QTY | GROPRI   |
            | 1   | "BMS001" | "1" | "500.00" |
            | 2   | "BMS002" | "2" | "300.00" |

    Scenario: 003. Create SOH and Validation of Taxes
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        When the user clicks the "Tax Summary" tab selected by title
        And the user selects the text field with name: "Products total value"
        And the value of the selected text field is "1,100.00"
        And the user selects the text field with X3 field name: "WK2ALLXQ0_SOHNUM"
        And the user stores the value of the selected text field with the key: "SOHNUM"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 004. SDH Creation
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SDH0_STOFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_SDHTYP"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_BPCORD"
        And the user writes "BR005" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_BPCINV"
        And the user writes "BR005" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key
        When the user clicks the "Selection criteria" action button on the header drop down
        And the "Delivery preloading filter" screen is displayed
        And the user selects the text field with X3 field name: "SCRITSDH_CRISOHNUM"
        And the user writes the stored text with key "SOHNUM" in the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        Given the user clicks the "Order selection" link on the left panel
        When the user selects the main picking list panel of the screen
        When the user clicks the "Expand all" button in the left top bar of the selected picking list
        And the user selects the item "BMS001 3 Sprockets Remains to be delivered 1 UN" of the level 1 on the picking list panel
        And the user checks the selected picking list panel item
        And the user waits 3 seconds
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        When the user clicks the "Tax Summary" tab selected by title
        And the user selects the text field with X3 field name: "WK4ALLXQ_TOTMERCA"
        And the value of the selected text field is "500.00"

    Scenario: 005. Logout
        And the user clicks the "Close" main action button on the right panel
        And the user logs-out from the system
