###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-147
# - Description: GESPNH Manual, ao inserir os impostos no detalhamento, o mesmo deve reflete em dados legais
# - OBS: O Processo Original é decorrete de um ponto de entrada, e não é possível replicar este PE devido a necessidade de ter um Específico
# - Jira: X3DEV-3967
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 30/11/2023
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-147

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. Creating Purchase Return PNH
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
        And the user selects the data table with x3 field name: "WE7ALL1_ARRAY_NBLIG"

    Scenario Outline: Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE7ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last fixed cell with X3 field name: "WE7ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last fixed cell with X3 field name: "WE7ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last fixed cell with X3 field name: "WE7ALL1_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last fixed cell with X3 field name: "WE7ALL1_XQORIGEMICMS"
        And the user adds the text <XQORIGEMICMS> in selected cell
        And the user selects last fixed cell with X3 field name: "WE7ALL1_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell and hits tab key
        And the user selects last fixed cell with X3 field name: "WE7ALL1_XQCSTIPI"
        And the user adds the text <XQCSTIPI> in selected cell
        And the user selects last fixed cell with X3 field name: "WE7ALL1_XQCSTPIS"
        And the user adds the text <XQCSTPIS> in selected cell
        And the user selects last fixed cell with X3 field name: "WE7ALL1_XQCSTCOF"
        Then the user adds the text <XQCSTCOF> in selected cell
        And the user selects last fixed cell with X3 field name: "WE7ALL1_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell and hits enter key
        Given the user clicks the "Save" main action button on the right panel
        When the user clicks the "Yes" option in the alert box
        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI | XQCFOP | XQORIGEMICMS | XQCSTICMS | XQCSTIPI | XQCSTPIS | XQCSTCOF | XQCENQ |
            | "1" | "BMS001" | "5"    | "100"  | "6201" | "0"          | "00"      | "00"     | "01"     | "01"     | "999"  |

    Scenario: 003. Taxes
        And the user clicks the "Tax detail" action button on the header drop down
        Then the user selects the text field with X3 field name: "XQPTD1_VLICMSOP"
        And the user writes "100.00" to the selected text field and hits tab key
        Then the user selects the text field with X3 field name: "XQPTD1_VLIPIDEVOL"
        And the user writes "7.00" to the selected text field and hits tab key
        Then the user selects the text field with X3 field name: "XQPTD1_VLPIS"
        And the user writes "5.00" to the selected text field and hits tab key
        Then the user selects the text field with X3 field name: "XQPTD1_VLCOF"
        And the user writes "4.00" to the selected text field and hits tab key
        And the user clicks the "OK" action button on the header drop down
        And the user clicks the "Close" main action button on the right panel
        And the user waits 3 seconds

        And the user clicks the "Legal data" action button on the header drop down
        Then the user selects the text field with X3 field name: "XQPLD2_TTICMSOP"
        And the value of the selected text field is "100.00"
        Then the user selects the text field with X3 field name: "XQPLD2_TTVLIPIDEVOL"
        And the value of the selected text field is "7.00"
        Then the user selects the text field with X3 field name: "XQPLD2_TTPIS"
        And the value of the selected text field is "5.00"
        Then the user selects the text field with X3 field name: "XQPLD2_TTCOF"
        And the value of the selected text field is "4.00"
        And the user clicks the "Close" main action button on the right panel
        And the user waits 3 seconds
        And the user clicks the "Cancel" main action button on the right panel
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 004. Logout
        And the user logs-out from the system