###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:xq-p-flow-pnh-fcpst-201-202-900
# - Description: Validate FCP_ST fields and calculation for CST 201-202-900
# - Jira: NA
# - Legislation: BR addon
# - Created by : Jonatas Hille
# - Created date : 01/06/2020
# - Updated by : Jonatas Hille
# - Updated date : 01/06/2020
# - Status : Automated
###########################################################################

Feature:xq-p-flow-pnh-fcpst-201-202-900

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Validate FCP_ST fields and calculation - ICMS CST-201-202-900 - PTH First
    #--------------------------------------------------------------------------------
    Scenario: 2. FCP_ST fields and calculation - ICMS CST-201-202-900
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        #Header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR006" to the selected text field and hits tab key
        #General Tab
        When the user clicks the "General Data" tab selected by title
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "1" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"

    #Lines
    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE6ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
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
        Then the user adds the text <XQCSTCOF> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI   | XQCFOP | XQVARCFOP | XQORIGEMICMS | XQCSTICMS | XQCENQ | XQCSTIPI | XQCSTPIS | XQCSTCOF |
            | 1   | "BMS001" | "10"   | "78.50"  | "1102" | "1"       | "0"          | "201"     | "301"  | "02"     | "01"     | "01"     |
            | 2   | "BMS002" | "10"   | "85.60"  | "1102" | "1"       | "0"          | "201"     | "301"  | "02"     | "01"     | "01"     |
            | 3   | "BMS001" | "10"   | "100.20" | "1102" | "1"       | "0"          | "202"     | "301"  | "02"     | "01"     | "01"     |
            | 4   | "BMS002" | "10"   | "135.00" | "1102" | "1"       | "0"          | "202"     | "301"  | "02"     | "01"     | "01"     |
            | 5   | "BMS001" | "5"    | "100.20" | "1102" | "1"       | "0"          | "900"     | "301"  | "02"     | "01"     | "01"     |
            | 6   | "BMS002" | "5"    | "135.00" | "1102" | "1"       | "0"          | "900"     | "301"  | "02"     | "01"     | "01"     |

    Scenario: Create/Sefas/Validation
        #Create and Send to Sefaz
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WE6ALL0_PTHNUM"
        And the user stores the value of the selected text field with the key: "DOCPTH"
        And the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Authorized          : 001"
        And the user clicks the "Close page" main action button on the right panel
        Then the user stores the value of the selected text field with the key: "CHAVENFEPTH"

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
            | "5"    | "666.3300"   | "2.0000" | "13.3300" |
            | "6"    | "897.7500"   | "2.0000" | "17.9600" |

    Scenario: Resume - Check Calculated Values
        Given the user clicks the Close page action icon on the header panel
        And the user clicks the "Resume" tab selected by title
        When the user selects the text field with X3 field name: "XQPTH2_TOTBASEFCPST"
        And the value of the selected text field is "7,154.2800"
        And the user selects the text field with X3 field name: "XQPTH2_TOTICMSFCPST"
        And the value of the selected text field is "143.1000"
        Then the user clicks the Close page action icon on the header panel

    #-------------------------------------------------------------------------------------
    #Validate FCP_ST fields and calculation - ICMS CST-201-202-900 - PNH After PTH Created
    #-------------------------------------------------------------------------------------

    Scenario: Creating Purchase Return PNH
        Given the user opens the "GESPNH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase return ALL : Full entry" screen is displayed
        #Filling the Invoice header information
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WE7ALL1_PNHFCY"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE7ALL1_BPSNUM"
        And the user writes "BR006" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE7ALL1_XQCODOPF"
        And the user writes "60" to the selected text field
        Then the user hits tab
        #Filter with the order created above
        When the user clicks the "Selection criteria" action button on the header drop down
        And the "Preloading Criteria" screen is displayed
        And the user selects the text field with X3 field name: "PCRITRCP_WNUMRCP"
        And the user writes the stored text with key "DOCPTH" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel
        #Picking the receipt number
        When the user clicks the "Receipt selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "DOCPTH" and with the text containing "BR006" of the picking list panel
        Then the user checks the selected picking list panel item

        And the user selects the data table with x3 field name: "WE7ALL1_ARRAY_NBLIG"

    Scenario Outline: Lines
        Given the user selects row that has the text <LIN> in column with X3 field name: "WE7ALL1_PTDLIN"
        And the user selects cell with X3 field name: "WE7ALL1_XQCFOP" of selected row
        And the user adds the text <XQCFOP> in selected cell
        And the user selects cell with X3 field name: "WE7ALL1_XQVARCFOP" of selected row
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects cell with X3 field name: "WE7ALL1_XQORIGEMICMS" of selected row
        And the user adds the text <XQORIGEMICMS> in selected cell
        And the user selects cell with X3 field name: "WE7ALL1_XQCSTICMS" of selected row
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects cell with X3 field name: "WE7ALL1_XQCSTIPI" of selected row
        And the user adds the text <XQCSTIPI> in selected cell
        And the user selects cell with X3 field name: "WE7ALL1_XQCSTPIS" of selected row
        And the user adds the text <XQCSTPIS> in selected cell
        And the user selects cell with X3 field name: "WE7ALL1_XQCSTCOF" of selected row
        Then the user adds the text <XQCSTCOF> in selected cell
        And the user selects cell with X3 field name: "WE7ALL1_XQCENQ" of selected row
        And the user adds the text <XQCENQ> in selected cell and hits enter key
        Examples:
            | LIN    | XQCFOP | XQVARCFOP | XQORIGEMICMS | XQCSTICMS | XQCSTIPI | XQCSTPIS | XQCSTCOF | XQCENQ |
            | "1000" | "5202" | "1"       | "0"          | "201"     | "52"     | "50"     | "50"     | "301"  |
            | "2000" | "5202" | "1"       | "0"          | "201"     | "52"     | "50"     | "50"     | "301"  |
            | "3000" | "5202" | "1"       | "0"          | "202"     | "52"     | "50"     | "50"     | "301"  |
            | "4000" | "5202" | "1"       | "0"          | "202"     | "52"     | "50"     | "50"     | "301"  |
            | "5000" | "5202" | "1"       | "0"          | "900"     | "52"     | "50"     | "50"     | "301"  |
            | "6000" | "5202" | "1"       | "0"          | "900"     | "52"     | "50"     | "50"     | "301"  |

    #Create return
    Scenario: Create return
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

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
            | "5"    | "666.3300"   | "2.0000" | "13.3300" |
            | "6"    | "897.7500"   | "2.0000" | "17.9600" |

    Scenario: Resume - Check Calculated Values / Transmit to Sefaz and Validation
        Given the user clicks the Close page action icon on the header panel
        When the user clicks the "Legal data" action button on the header drop down
        Then the "Purchasing Legal data" screen is displayed
        When the user selects the text field with X3 field name: "XQPLD2_TOTBASEFCPST"
        And the value of the selected text field is "7,154.2800"
        And the user selects the text field with X3 field name: "XQPLD2_TOTICMSFCPST"
        And the value of the selected text field is "143.1000"
        Then the user clicks the Close page action icon on the header panel
        #Sefaz
        When the user clicks the "Transmit SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Authorized          : 001"
        Then the user clicks the "Close page" main action button on the right panel
        #Validation
        When the user clicks the "Validation" button in the header
        And the user clicks the "Ok" opinion in the alert box
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Return Validation End"
        And the user clicks the "Close page" main action button on the right panel
        Then the user clicks the Close page action icon on the header panel
        #Logout
        Then the user logs-out from the system