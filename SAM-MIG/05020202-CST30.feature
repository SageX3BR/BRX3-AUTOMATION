###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:05020202-CST30
# - Description: Validate FCP_ST fields and calculation for CST 30 - PTH
# - Jira: NA
# - Legislation: BR addon
# - Created by : Jonatas Hille
# - Created date : 01/06/2020
# - Updated by : Jonatas Hille
# - Updated date : 03/01/2022
# - Status : [X]Automated []Work In Progress []Broken
###########################################################################

Feature:05020202-CST30

    Scenario: 05020202-01 Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 05020202-02 Create PTH - ICMS CST-30
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        #Header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR050" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR006" to the selected text field and hits tab key
        #General Tab
        When the user clicks the "General Data" tab selected by title
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "51" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"

    #Lines
    Scenario Outline: 05020202-03 Add Lines
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
        And the user adds the text <XQCENQ> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI   | XQCFOP | XQVARCFOP | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "10"   | "100.20" | "1102" | "1"       | "30"      | "999"  |
            | 2   | "BMS002" | "10"   | "135.00" | "1102" | "1"       | "30"      | "999"  |

    Scenario: 05020202-04 Create/Sefaz/Validation
        #Create and Send to Sefaz
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
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

    Scenario Outline: 05020202-05 Tax Detail - Check Calculated Values
        Given the user selects the text field with X3 field name: "XQPTD0_CURLIG"
        When the user writes <CURLIG> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE3PTDXQ_BFCPST"
        And the value of the selected text field is <BFCPST>
        And the user selects the text field with X3 field name: "WE3PTDXQ_ALQFCPST"
        And the value of the selected text field is <ALQFCPST>
        And the user selects the text field with X3 field name: "WE3PTDXQ_VLFCPST"
        And the value of the selected text field is <VLFCPST>
        Examples:
            | CURLIG | BFCPST     | ALQFCPST | VLFCPST |
            | "1"    | "1,402.80" | "2.0000" | "28.06" |
            | "2"    | "1,890.00" | "2.0000" | "37.80" |

    Scenario: 05020202-06 Resume - Check Calculated Values
        Given the user clicks the Close page action icon on the header panel
        And the user clicks the "Resume" tab selected by title
        When the user selects the text field with X3 field name: "XQPTH2_TOTBASEFCPST"
        And the value of the selected text field is "3,292.80"
        And the user selects the text field with X3 field name: "XQPTH2_TOTICMSFCPST"
        And the value of the selected text field is "65.86"

    Scenario: 05020202-07 Logout
        Then the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system