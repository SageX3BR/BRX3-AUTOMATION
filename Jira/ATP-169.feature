###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-169
# - Description: PNH com picking da PTH, Quando inserido o IPI no detalhamento de impostos, o mesmo não reflete em dados legais
# - Jira: X3DEV-5434
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 11/06/2024
# - Updated by : Gustavo Albanus
# - Updated date : 03/09/2024
# - Status : Done
# - Ajustes Efetuados: Parametrizado o Ponto de Entrada PNHEDIT e ajustado o Taxa BRL
###########################################################################

Feature: ATP-169

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. PTH Creation
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key

    Scenario: 3. General Data
        Given the user clicks the "General Data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key

    Scenario Outline: 4. Add Lines
        Given the user clicks the "Lines" tab selected by title
        When the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        And the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE6ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_VAT1"
        And the user adds the text <VAT1> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI   | VAT1  |
            | 1   | "BMS001" | "1"    | "200.00" | "BRL" |

    Scenario: 5. Creation
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

        And the user selects the text field with X3 field name: "WE6ALL0_PTHNUM"
        And the user stores the value of the selected text field with the key: "PTH_NUMBER"
        And the user clicks the Close page action icon on the header panel

    Scenario: 06 .Picking GESPTH on GESPNH
        Given the user opens the "GESPNH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase return ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WE7ALL1_PNHFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE7ALL1_BPSNUM"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE7ALL1_XQCODOPF"
        And the user writes "130" to the selected text field
        Then the user hits tab
        When the user clicks the "Selection criteria" action button on the header drop down
        And the "Preloading Criteria" screen is displayed
        And the user selects the text field with X3 field name: "PCRITRCP_WNUMRCP"
        And the user writes the stored text with key "PTH_NUMBER" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel
        When the user clicks the "Receipt selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "PTH_NUMBER" and with the text containing "BR011" of the picking list panel
        Then the user checks the selected picking list panel item

    Scenario: 07. Tax Detail
        Given the user clicks the "Tax detail" action button on the header drop down
        When the "Tax detail" screen is displayed
        Then the user selects the text field with X3 field name: "XQPTD1_BCIPI"
        And the user writes "500.00" to the selected text field and hits tab key
        Then the user selects the text field with X3 field name: "XQPTD1_VLIPIDEVOL"
        And the user writes "51.00" to the selected text field and hits tab key
        And the user clicks the "OK" action button on the header drop down
        Given the user clicks the "Close" main action button on the right panel
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user waits 3 seconds
        Given the user clicks the "Tax detail" action button on the header drop down
        When the "Tax detail" screen is displayed
        Then the user selects the text field with X3 field name: "XQPTD1_BCIPI"
        And the user writes "500.00" to the selected text field and hits tab key
        Then the user selects the text field with X3 field name: "XQPTD1_VLIPIDEVOL"
        And the user writes "50.00" to the selected text field and hits tab key
        And the user clicks the "OK" action button on the header drop down
        Given the user clicks the "Close" main action button on the right panel
        Given the user clicks the "Save" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been modified"

    Scenario: 08. Legal Data
        Given the user clicks the "Legal data" action button on the header drop down
        When the "Purchasing Legal data" screen is displayed
        #Then the user selects the text field with X3 field name: "XQPLD2_TTBCIPI"
        Then the user selects the text field with name: "IPI base calc"
        And the value of the selected text field is "500.00"
        #Then the user selects the text field with X3 field name: "XQPLD2_TTVLIPIDEVOL"
        Then the user selects the text field with name: "Total IPI devolução"
        And the value of the selected text field is "50.00"
        #O Valor final precisa ser alterado para 50.00
        Given the user clicks the "Close" main action button on the right panel
        Given the user clicks the "Save" main action button on the right panel

    Scenario: 09. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system