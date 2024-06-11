###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-155
# - Description: Permitir a Alteração de Vencimento na Fatura de Compra
# - Jira: AX-1264
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 28/02/2024
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-155

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. GESPIH
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key

    Scenario: 003. General data
        Given the user clicks the "General data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key

    Scenario: 004. Management
        Given the user clicks the "Management" tab selected by title
        And the user stores the generated value with length 5 with the key "ALEATORIO"
        And the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "ALEATORIO" in the selected text field
        When the user selects the text field with name: "Payment term"
        And the user writes "BR_30/60DDN" to the selected text field and hits tab key

    Scenario Outline: 005. Add Lines
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
        And the user writes <XQCFOP> to the selected text field and hits enter key
        And the user clicks the Close page action icon on the header panel

        Examples:
            | LIN | ITMREF   | QTYUOM | NETPRI   | XQCFOP |
            | 1   | "BMS001" | "1"    | "100.00" | "2101" |

    Scenario: 006. Control and Cration
        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL3_CUMLINAMT1"
        And the user stores the value of the selected text field with the key: "CALCVALUE"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE" in the selected text field and hits tab key
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 007. Validar os Vencimentos
        And the user clicks the "Open items" button in the header
        Given the user selects the data table in the popup
        When the user selects first row of the selected data table
        And the user selects cell with header: "Amount" of selected row
        And the value of the selected cell is "55.00"
        When the user selects editable table row number: 2
        And the user selects cell with header: "Amount" of selected row
        And the value of the selected cell is "55.00"
        Given the user clicks the Close page action icon on the header panel

    Scenario: 008. Alterar os Vencimentos
        And the user waits 5 seconds
        And the user clicks the "Open items" button in the header
        Given the user selects the data table in the popup
        When the user selects first row of the selected data table
        And the user selects cell with header: "Amount" of selected row
        And the user clicks on the selected cell
        And the user adds the text "60.00" in selected cell
        When the user selects editable table row number: 2
        And the user selects cell with header: "Amount" of selected row
        And the user adds the text "50.00" in selected cell
        Given the user clicks the Close page action icon on the header panel

    Scenario: 009. Logout
        Given the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
