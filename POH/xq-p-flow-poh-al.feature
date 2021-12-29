###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-p-flow-poh-al
# - Description: National Purchase Order with Average load
# - Jira: NA
# - Legislation: BRA
# - Created by : Daniela Anile
# - Created date : 08/02/2021
# - Updated by : Daniela Anile
# - Updated date : 08/02/2021
# - Status : Automated
###########################################################################

Feature: xq-p-flow-poh-al

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    # #--------------------------------------------------------------------------------
    # #Check values of produts and summary
    # #--------------------------------------------------------------------------------
    Scenario: 2. Header
        Given the user opens the "GESPOH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase order ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Order site"
        And the user writes "BR012" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR005" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        Then the user writes "52" to the selected text field and hits tab key

    Scenario Outline: 3. Lines
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"
        And the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQORIGEMICMS"
        And the user adds the text <XQORIGEMICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCSTIPI"
        And the user adds the text <XQCSTIPI> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCSTPIS"
        And the user adds the text <XQCSTPIS> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCSTCOF"
        Then the user adds the text <XQCSTCOF> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI  | XQCFOP | XQORIGEMICMS | XQCSTICMS | XQCENQ | XQCSTIPI | XQCSTPIS | XQCSTCOF |
            | 1   | "BMS001" | "23"   | "32.47" | "1101" | "0"          | "10"      | "999"  | "49"     | "01"     | "01"     |
            | 2   | "BMS002" | "25"   | "19.62" | "1101" | "0"          | "10"      | "999"  | "49"     | "01"     | "01"     |

    Scenario: 4. Creation
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 5. Tax Detail
        Given the user clicks the "Tax detail" action button on the header drop down
        Then the "Tax detail" screen is displayed

    Scenario Outline: 6. Tax Detail
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
            | "1"    | "139.65" |
            | "2"    | "91.72"  |

    Scenario: 7. Resume
        Given the user clicks the Close page action icon on the header panel
        And the user clicks the "Resume" tab selected by title
        And the user selects the text field with X3 field name: "XQPOH2_TTICMSST"
        And the value of the selected text field is "231.37"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 8. Logout
        And the user logs-out from the system