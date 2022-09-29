###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-92
# - Description: VTAX utilizando a coluna LC116
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 23/09/2022
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-92

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. PIH Product Creation
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "val(ctrans(num$(datetime$),"-:TZ","")+ num$(int(rnd(99999))))" to the selected text field and hits enter key
        And the user selects the text field with name: "Result"
        And the user stores the value of the selected text field with the key: "DOC01"
        Then the user clicks the Close page action icon on the header panel
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key

    Scenario: 3. General data
        Given the user clicks the "General data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "203" to the selected text field and hits tab key

    Scenario: 4. Management
        Given the user clicks the "Management" tab selected by title
        When the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "DOC01" in the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title

    Scenario Outline: 5. Add Lines
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
        And the user selects the text field with X3 field name: "WE8ALL3_XQEXISS"
        And the user writes <XQEXISS> to the selected text field and hits enter key
        And the user clicks the Close page action icon on the header panel

        Examples:
            | LIN | ITMREF   | QTYUOM | NETPRI | XQEXISS |
            | 1   | "SER020" | "1"    | "1000" | "1"     |

    Scenario: 6. Control
        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL4_CLCLINAMT"
        And the user stores the value of the selected text field with the key: "CALCVALUE"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE" in the selected text field and hits tab key

    Scenario: 7. Creation
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 8. Log Tax
        Given the user clicks the "View log" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Regra encontrada, RTAX: 7"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 9. Logout
        Then the user clicks the Close page action icon on the header panel
        And the user logs-out from the system