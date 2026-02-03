###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-179
# - Description: Elemento de faturação Retenção Alterado Manualmente Deve manter a Informação
# - Legislation: BR addon
# - JIRA: X3DEV-8053
# - Created by : Gustavo Albanus
# - Created date : 06/08/2025
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-179

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. PIH Product Creation
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
        And the user writes "BR008" to the selected text field and hits tab key

    Scenario: 003. General data
        Given the user clicks the "General data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "203" to the selected text field and hits tab key

    Scenario: 004. Management
        Given the user clicks the "Management" tab selected by title
        When the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "DOC01" in the selected text field and hits tab key
        And the user selects the text field with name: "Payment term"
        And the user writes "BR_AVISTA" to the selected text field
        And the user clicks the "Lines" tab selected by title

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
        And the user selects the text field with X3 field name: "WE8ALL3_VAT1"
        And the user writes <VAT1> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQEXISS"
        And the user writes <XQEXISS> to the selected text field and hits enter key
        And the user clicks the Close page action icon on the header panel

        Examples:
            | LIN | ITMREF   | QTYUOM | NETPRI | VAT1  | XQEXISS |
            | 1   | "SER006" | "1"    | "1000" | "BRL" | "1"     |

    Scenario: 006. Control
        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL3_CUMLINAMT1"
        And the user stores the value of the selected text field with the key: "CALCVALUE"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE" in the selected text field and hits tab key

    Scenario: 007. Creation
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user waits 2 seconds

    Scenario: 008. Resumo e Vencimentos
        Given the user clicks the "Resume" tab selected by title
        And the user selects the text field with X3 field name: "WE8ALLXQ_TTNFE"
        And the value of the selected text field is "1,000.00"
        And the user selects the text field with X3 field name: "WE8ALLXQ_TTIRRF"
        And the value of the selected text field is "15.00"
        And the user clicks the "Open items" button in the header
        Given the user selects the data table in the popup
        When the user selects first row of the selected data table
        And the user selects cell with header: "Amount" of selected row
        And the value of the selected cell is "985.00"
        Given the user clicks the Close page action icon on the header panel

    Scenario: 009. Alterar o valor da Retenção
        Given the user clicks the "Tax detail" action button on the header drop down
        When the "Tax detail" screen is displayed
        Then the user selects the text field with X3 field name: "WE8PTDXQ_VLIRRF"
        And the user writes "25.00" to the selected text field and hits tab key
        And the user clicks the "OK" action button on the header drop down
        Given the user clicks the "Close" main action button on the right panel

    Scenario: 010. Save
        Given the user clicks the "Save" main action button on the right panel
        Then an alert box with the text "Recalculate taxes?" appears
        And the user clicks the "No" opinion in the alert box
        Then a confirmation dialog appears with the message "Record has been modified"
        And the user waits 2 seconds

    Scenario: 011. Resumo e Vencimentos Alterados
        Given the user clicks the "Resume" tab selected by title
        And the user selects the text field with X3 field name: "WE8ALLXQ_TTNFE"
        And the value of the selected text field is "1,000.00"
        And the user selects the text field with X3 field name: "WE8ALLXQ_TTIRRF"
        And the value of the selected text field is "25.00"
        And the user clicks the "Open items" button in the header
        Given the user selects the data table in the popup
        When the user selects first row of the selected data table
        And the user selects cell with header: "Amount" of selected row
        And the value of the selected cell is "975.00"
        Given the user clicks the Close page action icon on the header panel

    Scenario: 012. Condição de Pagamento
        Given the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Payment term"
        And the user writes "BR_30/60DDN" to the selected text field
        And the user hits tab
        Given the user clicks the "Save" main action button on the right panel
        Then an alert box with the text "Recalculate taxes?" appears
        And the user clicks the "No" opinion in the alert box
        Then a confirmation dialog appears with the message "Record has been modified"
        And the user waits 2 seconds
        And the user clicks the "Open items" button in the header
        Given the user selects the data table in the popup
        When the user selects first row of the selected data table
        And the user selects cell with header: "Amount" of selected row
        And the value of the selected cell is "487.50"
        When the user selects editable table row number: 2
        And the user selects cell with header: "Amount" of selected row
        And the value of the selected cell is "487.50"
        Given the user clicks the Close page action icon on the header panel

    Scenario: 013. Logout
        Then the user clicks the Close page action icon on the header panel
        And the user logs-out from the system