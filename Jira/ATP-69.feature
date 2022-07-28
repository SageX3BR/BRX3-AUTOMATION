###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-69
# - Description: Garantir cálculo de ICMS-ST para recepção de compra (GESPTH)
# - Jira: X3-179494
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 28/06/2022
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-69

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. Header
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key

    Scenario Outline: 3. Add Lines
        Given the user clicks the "Lines" tab selected by title
        When the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        And the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE6ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCFOP"
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCFOP"
        Then the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQVARCFOP"
        Then the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCSTICMS"
        Then the user adds the text <XQCSTICMS> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI    | XQCFOP | XQVARCFOP | XQCSTICMS |
            | 1   | "BMS001" | "10"   | "1000.00" | "2101" | "11"      | "10"      |


    Scenario: 5. Creation
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 6. Transmission
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        #Verificar status da nota (6 = Autorizada)
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "[F:XQPTH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 7. Tax Detail
        Given the user clicks the "Tax detail" action button on the header drop down
        Then the "Tax detail" screen is displayed
        And the user selects the text field with X3 field name: "XQPTD1_BCICMSST"
        And the value of the selected text field is "15024.3900"
        And the user selects the text field with X3 field name: "XQPTD1_VLICMSST"
        And the value of the selected text field is "2,704.39"
        And the user selects the text field with X3 field name: "XQPTD1_VLFINICMS"
        And the value of the selected text field is "1,504.39"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 8. Logout
        Given the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system