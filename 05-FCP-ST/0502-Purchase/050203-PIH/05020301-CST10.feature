###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:05020301-CST10
# - Description: Validate FCP_ST fields and calculation for CST 10
# - Jira: NA
# - Legislation: BR addon
# - Created by : Jonatas Hille
# - Created date : 01/06/2020
# - Updated by : Jonatas Hille
# - Updated date : 31/12/2021
# - Status : [X]Automated []Work In Progress []Broken
###########################################################################

Feature:05020301-CST10

    Scenario: 05020301-01 Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 05020301-02 Create PIH - ICMS CST-10
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        #Criar string baseada em datetime$ + 5 Random
        When the user opens the header drop down
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "val(ctrans(num$(datetime$),"-:TZ","")+ num$(int(rnd(99999))))" to the selected text field and hits enter key
        And the user selects the text field with name: "Result"
        And the user stores the value of the selected text field with the key: "DOCSUP009"
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
        And the user writes the stored text with key "DOCSUP009" in the selected text field and hits tab key


    Scenario Outline: 05020301-03 Add Lines
        Given the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        And the user selects the fixed cell with X3 field name: "WE8ALL3_TYPORI" and row number: <LIN>
        And the user selects the choice "Miscellaneous" of the selected cell
        And the user hits tab
        And the user selects the fixed cell with X3 field name: "WE8ALL3_TYPORI" and row number: <LIN>
        And the choice selected of the selected cell is "Miscellaneous"
        And the user selects last editable cell with X3 field name: "WE8ALL3_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_NETPRI"
        And the user adds the text <NETPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | NETPRI  | XQCFOP | XQVARCFOP | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "5"    | "17.58" | "1102" | "1"       | "10"      | "999"  |
            | 2   | "BMS002" | "7"    | "19.85" | "1102" | "1"       | "10"      | "999"  |

    Scenario: 05020301-04 Create/Sefaz/Validation
        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL4_CLCLINAMT"
        And the user stores the value of the selected text field with the key: "CALCVALUE"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE" in the selected text field and hits tab key
        #Create and Send to Sefaz
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Rejected            : 000"
        And the selected log panel includes the message "    Number of NF-e Pending return      : 000"
        Then the user clicks the "Close page" main action button on the right panel
        #Post Invoice
        When the user clicks the "Post" button in the header
        And an alert box with the text "The document will be validated! You will no longer be able to Modify or Delete it. Continue?" appears
        And the user clicks the "Ok" option in the alert box
        And a dialog box appears
        And the user clicks the "Ok" opinion in the alert box
        #Tax Detail - Check Values
        When the user clicks the "Tax detail" action button on the header drop down
        Then the "Tax detail" screen is displayed

    Scenario Outline: 05020301-05 Tax Detail - Check Calculated Values
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
            | "1"    | "123.06" | "2.0000" | "2.46"  |
            | "2"    | "194.53" | "2.0000" | "3.89"  |

    Scenario: 05020301-06 Resume - Check Calculated Values
        Given the user clicks the Close page action icon on the header panel
        And the user clicks the "Resume" tab selected by title
        When the user selects the text field with X3 field name: "XQPIH2_TOTBASEFCPST"
        And the value of the selected text field is "317.59"
        And the user selects the text field with X3 field name: "XQPIH2_TOTICMSFCPST"
        And the value of the selected text field is "6.35"

    Scenario: 05020301-07 Logout
        And the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system