###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:05020303-CST70
# - Description: Validate FCP_ST fields and calculation for CST 70
# - Jira: NA
# - Legislation: BR addon
# - Created by : Jonatas Hille
# - Created date : 01/06/2020
# - Updated by : Jonatas Hille
# - Updated date : 31/12/2021
# - Status : [X]Automated []Work In Progress []Broken
###########################################################################

Feature:05020303-CST70

    Scenario: 05020303-01 Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 05020303-02 Create PIH - ICMS CST-70
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        #Criar string baseada em datetime$ + 5 Random
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "val(ctrans(num$(datetime$),"-:TZ","")+ num$(int(rnd(99999))))" to the selected text field and hits enter key
        And the user selects the text field with name: "Result"
        And the user stores the value of the selected text field with the key: "DOCSUP011"
        Then the user clicks the Close page action icon on the header panel
        #Fim da criação da String
        And the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR050" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR006" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL0_BPRSAC"
        Then the user writes "FORN" to the selected text field and hits tab key
        When the user clicks the "General data" tab selected by title
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "51" to the selected text field and hits tab key
        When the user clicks the "Management" tab selected by title
        And the user selects the text field with X3 field name: "WE8ALL1_BPRVCR"
        And the user writes the stored text with key "DOCSUP011" in the selected text field and hits tab key


    Scenario Outline: 05020303-03 Add Lines
        Given the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        And the user selects last row of the selected data table
        And the user opens "Popup view" function on toolbox of the selected row
        And the user selects the drop down list with name: "Source"
        And the user clicks on "Miscellaneous" option of the selected drop down list
        And the user hits tab
        And the user selects the text field with X3 field name: "WE8ALL3_ITMREF"
        And the user writes <ITMREF> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_QTYUOM"
        And the user writes <QTYUOM> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_NETPRI"
        And the user writes <NETPRI> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQCFOP"
        And the user writes <XQCFOP> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQVARCFOP"
        And the user writes <XQVARCFOP> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQCSTICMS"
        And the user writes <XQCSTICMS> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQCENQ"
        And the user writes <XQCENQ> to the selected text field and hits enter key
        And the user clicks the Close page action icon on the header panel

        Examples:
            | ITMREF   | QTYUOM | NETPRI  | XQCFOP | XQVARCFOP | XQCSTICMS | XQCENQ |
            | "BMS001" | "12"   | "17.58" | "1102" | "1"       | "70"      | "999"  |
            | "BMS002" | "15"   | "19.85" | "1102" | "1"       | "70"      | "999"  |

    Scenario: 05020303-04 Create/SEFAZ/Validation
        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL3_CUMLINAMT1"
        And the user stores the value of the selected text field with the key: "CALCVALUE"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE" in the selected text field and hits tab key
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
        And the user writes "[F:XQPIH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel
        #Post Invoice
        When the user clicks the "Post" button in the header
        And an alert box with the text "The document will be validated! You will no longer be able to Modify or Delete it. Continue?" appears
        And the user clicks the "Ok" option in the alert box
        And a dialog box appears
        And the user clicks the "Ok" opinion in the alert box
        #Tax Detail - Check Values
        When the user clicks the "Tax detail" action button on the header drop down
        Then the "Tax detail" screen is displayed

    Scenario Outline: 05020303-05 Tax Detail - Check Calculated Values
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
            | "1"    | "295.34" | "2.0000" | "5.91"  |
            | "2"    | "416.85" | "2.0000" | "8.34"  |

    Scenario: 05020303-06 Resume - Check Calculated Values
        Given the user clicks the Close page action icon on the header panel
        And the user clicks the "Resume" tab selected by title
        When the user selects the text field with X3 field name: "XQPIH2_TOTBASEFCPST"
        And the value of the selected text field is "712.19"
        And the user selects the text field with X3 field name: "XQPIH2_TOTICMSFCPST"
        And the value of the selected text field is "14.25"

    Scenario: 05020303-07 Logout
        And the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system