###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-p-flow-pth-crud
# - Description:
# - Jira: NA
# - Legislation: BRA
# - Created by :
# - Created date :
# - Updated by :
# - Updated date
# - Status :
###########################################################################

Feature: xq-p-flow-pth-crud

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #National Receipt (with transmission)
    #--------------------------------------------------------------------------------
    Scenario: 2. Header
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR012" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR005" to the selected text field and hits tab key
        And the user selects the text field with name: "Warehouse"
        And the user writes "BR012" to the selected text field and hits tab key

    Scenario: 3. General Data
        Given the user clicks the "General Data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "52" to the selected text field and hits tab key

    Scenario Outline: 4. Add Lines
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        And the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE6ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQORIGEMICMS"
        And the user adds the text <XQORIGEMICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCSTIPI"
        And the user adds the text <XQCSTIPI> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCSTPIS"
        And the user adds the text <XQCSTPIS> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCSTCOF"
        And the user adds the text <XQCSTCOF> in selected cell
        #Retirado a gestão de stock
        #And the "Enter receipts ALL : Full entry" screen is displayed
        #Then the user clicks the "Save" main action button on the right panel

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI  | XQCFOP | XQORIGEMICMS | XQCSTICMS | XQCENQ | XQCSTIPI | XQCSTPIS | XQCSTCOF |
            | 1   | "BMS001" | "23"   | "32.95" | "1101" | "0"          | "10"      | "999"  | "49"     | "01"     | "01"     |
            | 2   | "BMS002" | "15"   | "25.32" | "1101" | "0"          | "10"      | "999"  | "49"     | "01"     | "01"     |

    Scenario: 5. Creation
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"


    Scenario: 6. Tax Detail
        Given the user clicks the "Tax detail" action button on the header drop down
        Then the "Tax detail" screen is displayed

    Scenario Outline: 7. Tax Detail
        Given the user selects the text field with X3 field name: "XQPTD0_CURLIG"
        And the user writes <CURLIG> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQPTD1_VLICMSST"
        And the value of the selected text field is <VLICMSST>
        And the user selects the text field with X3 field name: "XQPTD0_CURLIG"
        And the user writes <CURLIG> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQPTD1_VLICMSST"
        And the value of the selected text field is <VLICMSST>

        Examples:
            | CURLIG | VLICMSST |
            | "1"    | "141.72" |
            | "2"    | "71.02"  |

    Scenario: 8. Resume
        Given the user clicks the Close page action icon on the header panel
        And the user clicks the "Resume" tab selected by title
        And the user selects the text field with X3 field name: "XQPTH2_TTICMSST"
        And the value of the selected text field is "212.74"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 9. Logout
        And the user logs-out from the system