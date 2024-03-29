###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-35
# - Description: Garantir que os campos e botões da legislação brasileira estão
#   desabilitados na criação de Devolução de Venda com estabelecimento não BR
# - Created by : Fausto A Neto
# - Created date : 27/05/2022
# - Updated by : Fausto A Neto
# - Updated date : 06/07/2022
# - Status : Done
###########################################################################

Feature:ATP-35

    Scenario: 01.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 02. New Delivery
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed

        Given the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Shipment site"
        And the user writes "FR011" to the selected text field
        And the user selects the text field with name: "Sales site"
        And the user writes "FR011" to the selected text field
        And the user selects the text field with name: "Ship-to"
        And the user writes "FR001" to the selected text field and hits tab key
        When the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario Outline: 03. Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI  |
            | 1   | "BMS057" | "1" | "13.33" |
            | 2   | "DIS012" | "3" | "249.5" |

    Scenario: 04. SDH Creation and validation
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        When the user clicks the "Validation" button in the header
        And the user clicks the "Ok" option in the alert box
        Then the user selects the text field with X3 field name: "SDH0_SDHNUM"
        And the user stores the value of the selected text field with the key: "SDHNUM"
        And the user clicks the Close page action icon on the header panel

    Scenario: 05. New Customer Return
        Given the user opens the "GESSRH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Customer return ALL : Full entry" screen is displayed
        #Header
        Given the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SRH0_STOFCY"
        And the user writes "FR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SRH0_BPCORD"
        And the user writes "FR001" to the selected text field and hits tab key

        When the user clicks the "Selection criteria" action button on the header drop down
        And the user selects the text field with X3 field name: "SCRITSRH_CRISDHNUM"
        And the user writes the stored text with key "SDHNUM" in the selected text field and hits tab key
        Then the user clicks the "OK" main action button on the right panel
        #Picking the delivery / All items
        Given the user clicks the "Delivery selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SDHNUM" and with the text containing "FR001" of the picking list panel
        And the user checks the selected picking list panel item
        When the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 06. Check Fiscal Operation field and buttons disabled
        Given the user clicks the "General data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        Then the selected text field should be disabled
        And the "Calc. memory On/Off" action button on the header drop down is disabled
        Given the user opens the header drop down
        Then the "FS-DA (Contingency)" action button on the header drop down is disabled
        And the "SEFAZ" action button on the header drop down is disabled
        And the "Invoice amendment" action button on the header drop down is disabled
        And the "Preview Danfe" action button on the header drop down is disabled
        And the "Referenced docs." action button on the header drop down is disabled
        And the "Posting" action button on the header drop down is disabled

    Scenario: 07. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system