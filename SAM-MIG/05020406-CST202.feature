###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:05020406-CST202
# - Description: Validate FCP_ST fields and calculation for CST 202 - PNH
# - Jira: NA
# - Legislation: BR addon
# - Created by : Jonatas Hille
# - Created date : 01/06/2020
# - Updated by : Jonatas Hille
# - Updated date : 03/01/2022
# - Status : [X]Automated []Work In Progress []Broken
###########################################################################

Feature:05020406-CST202

    Scenario: 05020406-01 Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 05020406-02 Create PTH - ICMS CST-202
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

    Scenario Outline: 05020406-03 Add Lines
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
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCSTIPI"
        And the user adds the text <XQCSTIPI> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI   | XQCFOP | XQVARCFOP | XQCSTICMS | XQCENQ | XQCSTIPI |
            | 1   | "BMS001" | "10"   | "100.20" | "1102" | "1"       | "202"     | "301"  | "02"     |
            | 2   | "BMS002" | "10"   | "135.00" | "1102" | "1"       | "202"     | "301"  | "02"     |

    Scenario: 05020406-04 Create/SEFAZ/Validation
        #Create and Send to Sefaz
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WE6ALL0_PTHNUM"
        And the user stores the value of the selected text field with the key: "DOCPTH"
        Then the user stores the value of the selected text field with the key: "CHAVENFEPTH"
        And the user clicks the "SEFAZ" action button on the header drop down
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
        #Tax Detail - Check Values
        When the user clicks the "Tax detail" action button on the header drop down
        Then the "Tax detail" screen is displayed

    Scenario Outline: 05020406-05 Tax Detail - Check Calculated Values
        Given the user selects the text field with X3 field name: "XQPTD0_CURLIG"
        When the user writes <CURLIG> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE6PTDXQ_BFCPST"
        And the value of the selected text field is <BFCPST>
        And the user selects the text field with X3 field name: "WE6PTDXQ_ALQFCPST"
        And the value of the selected text field is <ALQFCPST>
        And the user selects the text field with X3 field name: "WE6PTDXQ_VLFCPST"
        And the value of the selected text field is <VLFCPST>
        Examples:
            | CURLIG | BFCPST     | ALQFCPST | VLFCPST |
            | "1"    | "1,402.80" | "2.0000" | "28.06" |
            | "2"    | "1,890.00" | "2.0000" | "37.80" |

    Scenario: 05020406-06 Resume - Check Calculated Values
        Given the user clicks the Close page action icon on the header panel
        And the user clicks the "Resume" tab selected by title
        When the user selects the text field with X3 field name: "WE6ALLXQ_TOTBASEFCPST"
        And the value of the selected text field is "3,292.80"
        And the user selects the text field with X3 field name: "WE6ALLXQ_TOTICMSFCPST"
        And the value of the selected text field is "65.86"
        Then the user clicks the Close page action icon on the header panel

    #-------------------------------------------------------------------------------------
    #Validate FCP_ST fields and calculation - ICMS CST-202 - PNH After PTH Created
    #-------------------------------------------------------------------------------------

    Scenario: 05020406-07 Creating Purchase Return PNH
        Given the user opens the "GESPNH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase return ALL : Full entry" screen is displayed
        #Filling the Invoice header information
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Return site"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR006" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
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
        And the user selects the data table with x3 field name: "WE7ALLXQ0_ARRAY_NBLIG"

    Scenario Outline: 05020406-08 Lines
        Given the user selects row that has the text <LIN> in column with X3 field name: "WE7ALLXQ0_PTDLIN"
        And the user selects cell with X3 field name: "WE7ALLXQ0_XQCFOP" of selected row
        And the user adds the text <XQCFOP> in selected cell
        And the user selects cell with X3 field name: "WE7ALLXQ0_XQVARCFOP" of selected row
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects cell with X3 field name: "WE7ALLXQ0_XQORIGEMICMS" of selected row
        And the user adds the text <XQORIGEMICMS> in selected cell
        And the user selects cell with X3 field name: "WE7ALLXQ0_XQCSTICMS" of selected row
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects cell with X3 field name: "WE7ALLXQ0_XQCSTIPI" of selected row
        And the user adds the text <XQCSTIPI> in selected cell
        And the user selects cell with X3 field name: "WE7ALLXQ0_XQCSTPIS" of selected row
        And the user adds the text <XQCSTPIS> in selected cell
        And the user selects cell with X3 field name: "WE7ALLXQ0_XQCSTCOF" of selected row
        Then the user adds the text <XQCSTCOF> in selected cell
        And the user selects cell with X3 field name: "WE7ALLXQ0_XQCENQ" of selected row
        And the user adds the text <XQCENQ> in selected cell and hits enter key
        Examples:
            | LIN    | XQCFOP | XQVARCFOP | XQORIGEMICMS | XQCSTICMS | XQCSTIPI | XQCSTPIS | XQCSTCOF | XQCENQ |
            | "1000" | "5202" | "1"       | "0"          | "202"     | "52"     | "50"     | "50"     | "301"  |
            | "2000" | "5202" | "1"       | "0"          | "202"     | "52"     | "50"     | "50"     | "301"  |

    Scenario: 05020406-09 Create return
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        #Tax Detail - Check Values
        When the user clicks the "Tax detail" action button on the header drop down
        Then the "Tax detail" screen is displayed

    Scenario Outline: 05020406-10 Tax Detail - Check Calculated Values
        Given the user selects the text field with X3 field name: "XQPTD0_CURLIG"
        When the user writes <CURLIG> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE7PTDXQ_BFCPST"
        And the value of the selected text field is <BFCPST>
        And the user selects the text field with X3 field name: "WE7PTDXQ_ALQFCPST"
        And the value of the selected text field is <ALQFCPST>
        And the user selects the text field with X3 field name: "WE7PTDXQ_VLFCPST"
        And the value of the selected text field is <VLFCPST>
        Examples:
            | CURLIG | BFCPST     | ALQFCPST | VLFCPST |
            | "1"    | "1,402.80" | "2.0000" | "28.06" |
            | "2"    | "1,890.00" | "2.0000" | "37.80" |

    Scenario: 05020406-11 Resume - Check Calculated Values / Transmit to Sefaz and Validation
        Given the user clicks the Close page action icon on the header panel
        And the user waits 2 seconds
        Given the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with name: "FCP Calc. base"
        And the value of the selected text field is "3,292.80"
        Then the user selects the text field with name: "ICMS FCP-ST value"
        And the value of the selected text field is "65.86"
        #Sefaz
        When the user clicks the "Transmit SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        #Verificar status da nota (6 = Autorizada)
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "[F:XQPNH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel
        #Validation
        When the user clicks the "Validation" button in the header
        And the user clicks the "Ok" opinion in the alert box
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Return Validation End"
        And the user clicks the "Close page" main action button on the right panel


    Scenario: 05020406-12 Logout
        Then the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system