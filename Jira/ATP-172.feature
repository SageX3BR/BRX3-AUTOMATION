###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-72
# - Description: Recepção com casas decimais, na fatura não pode ter desvio (-0.00) no Controlo
# - Jira: X3DEV-6063
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 29/08/2024
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-172

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. Header
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key

    Scenario Outline: 3. Add Lines
        Given the user clicks the "Lines" tab selected by title
        When the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        And the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE6ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCFOP"
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCFOP"
        Then the user adds the text <XQCFOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM  | GROPRI  | XQCFOP |
            | 1   | "BMS113" | "56.56" | "14.98" | "2102" |


    Scenario: 5. Creation
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        When the user selects the text field with name: "Receipt"
        And the user stores the value of the selected text field with the key: "PTHNUM"
        Then the user clicks the Close page action icon on the header panel
        And the user waits 5 seconds

    Scenario: 6. GESPIH
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
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key

    Scenario: 7. Picking PIH
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Enter selection criteria" screen is displayed
        And the user selects the text field with name: "Receipt no."
        And the user writes the stored text with key "PTHNUM" in the selected text field
        And the user clicks the "OK" button in the header
        And the user clicks the "Receipt selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "PTHNUM" and with the text containing "BR01" of the picking list panel
        And the user checks the selected picking list panel item
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "No" opinion in the alert box
        And the user stores the generated value with length 5 with the key "ALEATORIO"
        And the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "ALEATORIO" in the selected text field

    Scenario: 8. Control
        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL3_CUMLINAMT1"
        And the user stores the value of the selected text field with the key: "CALCVALUE"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE" in the selected text field and hits tab key

    Scenario: 9. Create PIH
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 10. Valited Control
        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL4_DIFLINAMT"
        And the value of the selected text field is ""
    #And the value of the selected text field is "-0.00"

    Scenario: 11. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system

