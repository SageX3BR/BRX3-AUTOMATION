###########################################################################
# - Test code:xq-p-flow-pih-FCPST-10
###########################################################################

Feature:error_checkcellvalue_menulist

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. Create PIH
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        #Create string basead on datetime$ + 5 Random
        When the user opens the header drop down
        When the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "val(ctrans(num$(datetime$),"-:TZ","")+ num$(int(rnd(99999))))" to the selected text field and hits enter key
        And the user selects the text field with name: "Result"
        And the user stores the value of the selected text field with the key: "DOCSUP009"
        Then the user clicks the Close page action icon on the header panel
        #End of String criation
        And the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "GB011" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "INV" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "GB015" to the selected text field and hits tab key
        #And the user selects the text field with X3 field name: "WE8ALL0_BPRSAC"
        #Then the user writes "FORN" to the selected text field and hits tab key
        #When the user clicks the "General data" tab selected by title
        #And the user selects the text field with name: "Fiscal operation"
        #And the user writes "51" to the selected text field and hits tab key
        When the user clicks the "Management" tab selected by title
        And the user selects the text field with X3 field name: "WE8ALL1_BPRVCR"
        And the user writes the stored text with key "DOCSUP009" in the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"

    Scenario Outline: 4. Lines
        Given the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        And the user selects last fixed cell with X3 field name: "WE8ALL3_TYPORI"
        And the user selects the choice "Miscellaneous" of the selected cell
        And the user hits tab key in the selected cell
        And the choice selected of the selected cell is "Miscellaneous"
        And the user selects last editable cell with X3 field name: "WE8ALL3_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_NETPRI"
        And the user adds the text <NETPRI> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | NETPRI  |
            | 1   | "ASS001" | "1"    | "42.01" |
            | 2   | "ASS001" | "2"    | "23.05" |
            | 3   | "ASS001" | "1"    | "42.01" |
            | 4   | "ASS001" | "2"    | "23.05" |
            | 5   | "ASS001" | "1"    | "42.01" |
            | 6   | "ASS001" | "2"    | "23.05" |
            | 7   | "ASS001" | "1"    | "42.01" |
            | 8   | "ASS001" | "2"    | "23.05" |
            | 9   | "ASS001" | "1"    | "42.01" |
            | 10  | "ASS001" | "2"    | "23.05" |
            | 11  | "ASS001" | "1"    | "42.01" |
            | 12  | "ASS001" | "2"    | "23.05" |
            | 13  | "ASS001" | "1"    | "42.01" |
            | 14  | "ASS001" | "2"    | "23.05" |
            | 15  | "ASS001" | "1"    | "42.01" |
            | 16  | "ASS001" | "2"    | "23.05" |
            | 17  | "ASS001" | "1"    | "42.01" |
            | 18  | "ASS001" | "2"    | "23.05" |
            | 19  | "ASS001" | "1"    | "42.01" |
            | 20  | "ASS001" | "2"    | "23.05" |
            | 21  | "ASS001" | "1"    | "42.01" |
            | 22  | "ASS001" | "2"    | "23.05" |
            | 23  | "ASS001" | "1"    | "42.01" |
            | 24  | "ASS001" | "2"    | "23.05" |
            | 25  | "ASS001" | "1"    | "42.01" |
            | 26  | "ASS001" | "2"    | "23.05" |
            | 27  | "ASS001" | "1"    | "42.01" |
            | 28  | "ASS001" | "2"    | "23.05" |
            | 29  | "ASS001" | "1"    | "42.01" |
            | 30  | "ASS001" | "2"    | "23.05" |

    Scenario: 5. Creation
        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 6. Logout
        And the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system