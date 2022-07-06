###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-37
# - Description: Garantir que os campos e botões da legislação brasileira estão
#   desabilitados na criação de Expedição com estabelecimento não BR
# - Created by : Ricardo Ribeiro
# - Created date : 16/05/2022
# - Updated by : Fausto A Neto
# - Updated date : 06/07/2022
# - Status : Done
###########################################################################

Feature: ATP-37

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. SDH Creation
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed
        Given the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Shipment site"
        Then the user writes "FR011" to the selected text field
        And the user selects the text field with name: "Sales site"
        And the user writes "FR011" to the selected text field
        And the user selects the text field with name: "Ship-to"
        And the user writes "FR001" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario Outline: 3. Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user hits enter
        Examples:
            | LIN | ITMREF   | QTY | GROPRI  |
            | 1   | "BMS057" | "1" | "73.33" |
            | 2   | "DIS012" | "3" | "249.5" |

    Scenario: 04. SDH Creation
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 05. Check Fiscal Operation field and buttons disabled
        Given the user clicks the "Tax summary" tab selected by title
        Then the value of the "Total shipment value" text field is ""
        Given the user opens the header drop down
        Then the "Calc. memory On/Off" secondary action button is disabled
        And the "SEFAZ" secondary action button is disabled
        And the "Preview Danfe" secondary action button is disabled

    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system