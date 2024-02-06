###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-122
# - Description: Nota de Crédito de Fatura de Compra Serviço - Não exigir documento referenciado
# - Jira: X3DEV-2288
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 08/03/2023
# - Updated by : Gustavo Albanus
# - Updated date : 05/02/2024
# - Status : Done
###########################################################################

Feature: ATP-122

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. PIH Creation
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR003" to the selected text field and hits tab key

    Scenario: 3. General data
        Given the user clicks the "General data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "901" to the selected text field and hits tab key
        And the user stores the generated value with length 5 with the key "ALEATORIO_NF"
        When the user selects the text field with X3 field name: "WE8ALLXQ_NUMNFE"
        And the user writes the stored text with key "ALEATORIO_NF" in the selected text field
        When the user selects the text field with X3 field name: "WE8ALLXQ_SERNFE"
        And the user writes "1" to the selected text field and hits tab key

    Scenario: 4. Management
        Given the user clicks the "Management" tab selected by title
        And the user stores the generated value with length 5 with the key "ALEATORIO"
        And the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "ALEATORIO" in the selected text field
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
        And the user selects the text field with X3 field name: "WE8ALL3_VAT1"
        And the user writes <VAT1> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQEXISS"
        And the user writes <XQEXISS> to the selected text field and hits enter key
        And the user clicks the Close page action icon on the header panel

        Examples:
            | LIN | ITMREF   | QTYUOM | NETPRI | VAT1  | XQEXISS |
            | 1   | "SER006" | "1"    | "1000" | "BRL" | "1"     |

    Scenario: 6. Control
        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL4_CLCLINAMT"
        And the user stores the value of the selected text field with the key: "CALCVALUE"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE" in the selected text field and hits tab key

    Scenario: 7. Creation
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "Post" button in the header
        #And the user clicks the Close page action icon on the header panel
        Then an alert box appears
        And the user clicks the "Ok" opinion in the alert box
        And the user clicks the "Ok" opinion in the alert box
        And the user waits 5 seconds
        And the user selects the text field with name: "Entry number"
        And the user stores the value of the selected text field with the key: "NUM_PIH"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 8. PIH Credit Creation
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNCF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR003" to the selected text field and hits tab key

    Scenario: 9. Picking
        Given the user clicks the "Invoice selection" link on the left panel
        When the user selects the main picking list panel of the screen
        #Then the user clicks the "Expand all" button in the left top bar of the selected picking list
        When the user clicks the "Maximize" button in the right top bar of the selected picking list
        And the user selects the item with the stored text with key "NUM_PIH" and with the text containing "BR003" of the picking list panel
        And the user checks the selected picking list panel item
        And the user clicks the "Yes" opinion in the alert box
        And the user clicks the "Yes" opinion in the alert box


    Scenario: 10. General data - Credit
        Given the user clicks the "General data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "99" to the selected text field and hits tab key
    #And the user stores the generated value with length 5 with the key "ALEATORIO_NF"
    #When the user selects the text field with X3 field name: "WE8ALLXQ_NUMNFE"
    #And the user writes the stored text with key "ALEATORIO_NF" in the selected text field
    #When the user selects the text field with X3 field name: "WE8ALLXQ_SERNFE"
    #And the user writes "1" to the selected text field and hits tab key

    Scenario: 11. Management - Credit
        Given the user clicks the "Management" tab selected by title
        And the user stores the generated value with length 5 with the key "ALEATORIO"
        And the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "ALEATORIO" in the selected text field

    Scenario: 12. Control - Credit
        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL4_CLCLINAMT"
        And the user stores the value of the selected text field with the key: "CALCVALUE"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE" in the selected text field and hits tab key

    Scenario: 12. Creation - Credit
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 13. Logout
        And the user clicks the "Close page" main action button on the right panel
        And the user logs-out from the system