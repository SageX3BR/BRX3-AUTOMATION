###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:xq-p-flow-poh-fcpst-202
# - Description: Validate FCP_ST fields and calculation for CST 202 - POH
# - Jira: NA
# - Legislation: BR addon
# - Created by : Jonatas Hille
# - Created date : 01/06/2020
# - Updated by : Jonatas Hille
# - Updated date : 03/01/2022
# - Status : [X]Automated []Work In Progress []Broken
###########################################################################

Feature:xq-p-flow-poh-fcpst-202

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. FCP_ST fields and calculation - ICMS CST 202
        Given the user opens the "GESPOH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase order ALL : Full entry" screen is displayed
        #Header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "POH0_POHFCY"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "POH0_BPSNUM"
        And the user writes "BR006" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "POH0_XQCODOPF"
        And the user writes "1" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"

    #Lines
    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
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
            | LIN | ITMREF   | QTYUOM | GROPRI  | XQCFOP | XQVARCFOP | XQORIGEMICMS | XQCSTICMS | XQCENQ | XQCSTIPI | XQCSTPIS | XQCSTCOF |
            | 1   | "BMS001" | "15"   | "12.50" | "1102" | "1"       | "0"          | "202"     | "301"  | "02"     | "01"     | "01"     |
            | 2   | "BMS002" | "15"   | "13.85" | "1102" | "1"       | "0"          | "202"     | "301"  | "02"     | "01"     | "01"     |

    Scenario: 3. Create/SEFAZ
        #Create and Send to Sefaz
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        #Tax Detail - Check Values
        When the user clicks the "Tax detail" action button on the header drop down
        Then the "Tax detail" screen is displayed

    Scenario Outline: Tax Detail - Check Calculated Values
        Given the user selects the text field with X3 field name: "XQPTD0_CURLIG"
        When the user writes <CURLIG> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQPTD1_BFCPST"
        And the value of the selected text field is <BFCPST>
        And the user selects the text field with X3 field name: "XQPTD1_ALQFCPST"
        And the value of the selected text field is <ALQFCPST>
        And the user selects the text field with X3 field name: "XQPTD1_VLFCPST"
        And the value of the selected text field is <VLFCPST>
        Examples:
            | CURLIG | BFCPST   | ALQFCPST | VLFCPST |
            | "1"    | "262.50" | "2.0000" | "5.25"  |
            | "2"    | "290.85" | "2.0000" | "5.82"  |

    Scenario: 4. Resume - Check Calculated Values
        Given the user clicks the Close page action icon on the header panel
        And the user clicks the "Resume" tab selected by title
        When the user selects the text field with X3 field name: "XQPOH2_TOTBASEFCPST"
        And the value of the selected text field is "553.35"
        And the user selects the text field with X3 field name: "XQPOH2_TOTICMSFCPST"
        And the value of the selected text field is "11.07"

    Scenario: 5. Logout
        Then the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system