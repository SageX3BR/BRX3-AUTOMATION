###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:xq-p-flow-poh-FCPST
# - Description: Validate FCP_ST fields and calculation for CST 10-30-70-90
# - Jira: NA
# - Legislation: BR addon
# - Created by : Jonatas Hille
# - Created date : 01/06/2020
# - Updated by : Jonatas Hille
# - Updated date : 01/06/2020
# - Status : Automated
###########################################################################

Feature:xq-p-flow-poh-fcpst

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Validate FCP_ST fields and calculation - ICMS CST-10-30-70-90
    #--------------------------------------------------------------------------------
    Scenario: 2. FCP_ST fields and calculation - ICMS CST-10-30-70-90
        Given the user opens the "GESPOH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase order ALL : Full entry" screen is displayed
        #Header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "POH0_POHFCY"
        And the user writes "BR050" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "POH0_BPSNUM"
        And the user writes "BR006" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "POH0_XQCODOPF"
        And the user writes "51" to the selected text field and hits tab key
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
            | LIN | ITMREF   | QTYUOM | GROPRI   | XQCFOP | XQVARCFOP | XQORIGEMICMS | XQCSTICMS | XQCENQ | XQCSTIPI | XQCSTPIS | XQCSTCOF |
            | 1   | "BMS001" | "10"   | "78.50"  | "1102" | "1"       | "0"          | "10"      | "999"  | "01"     | "01"     | "01"     |
            | 2   | "BMS002" | "10"   | "85.60"  | "1102" | "1"       | "0"          | "10"      | "999"  | "01"     | "01"     | "01"     |
            | 3   | "BMS001" | "10"   | "100.20" | "1102" | "1"       | "0"          | "30"      | "999"  | "01"     | "01"     | "01"     |
            | 4   | "BMS002" | "10"   | "135.00" | "1102" | "1"       | "0"          | "30"      | "999"  | "01"     | "01"     | "01"     |
            | 5   | "BMS001" | "5"    | "100.20" | "1102" | "1"       | "0"          | "70"      | "999"  | "01"     | "01"     | "01"     |
            | 6   | "BMS002" | "5"    | "135.00" | "1102" | "1"       | "0"          | "70"      | "999"  | "01"     | "01"     | "01"     |
            | 7   | "BMS001" | "5"    | "115.25" | "1102" | "1"       | "0"          | "90"      | "999"  | "01"     | "01"     | "01"     |
            | 8   | "BMS002" | "5"    | "125.50" | "1102" | "1"       | "0"          | "90"      | "999"  | "01"     | "01"     | "01"     |

    Scenario: Create
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
            | CURLIG | BFCPST       | ALQFCPST | VLFCPST   |
            | "1"    | "1,099.0000" | "2.0000" | "21.9800" |
            | "2"    | "1,198.4000" | "2.0000" | "23.9700" |
            | "3"    | "1,402.8000" | "2.0000" | "28.0600" |
            | "4"    | "1,890.0000" | "2.0000" | "37.8000" |
            | "5"    | "701.4000"   | "2.0000" | "14.0300" |
            | "6"    | "945.0000"   | "2.0000" | "18.9000" |
            | "7"    | "766.4100"   | "2.0000" | "15.3300" |
            | "8"    | "834.5800"   | "2.0000" | "16.6900" |

    Scenario: Resume - Check Calculated Values
        Given the user clicks the Close page action icon on the header panel
        And the user clicks the "Resume" tab selected by title
        When the user selects the text field with X3 field name: "XQPOH2_TOTBASEFCPST"
        And the value of the selected text field is "8,837.5900"
        And the user selects the text field with X3 field name: "XQPOH2_TOTICMSFCPST"
        And the value of the selected text field is "176.7600"

        And the user clicks the Close page action icon on the header panel
        #Logout
        Then the user logs-out from the system