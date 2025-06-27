###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-97
# - Description: Garantir o correto rateio dos elementos de faturação em uma nota de crédito
# - Jira: X3DEV-1736
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 17/11/2022
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-97

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. SIH Creation
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WK5ALLXQ0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ0_SIVTYP"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ0_BPCINV"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQWK5ALLXQ0_CODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape

    Scenario: 3. Invoicing elements
        And the user selects the data table of section: "Invoicing elements"
        And the user selects cell with column header: "% or amount" and row number: 2
        And the user adds the text "2" in selected cell and hits tab key
        And the user selects cell with column header: "% or amount" and row number: 3
        And the user adds the text "100" in selected cell and hits tab key

        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
        And the user hits enter
        Examples:
            | LIN | ITMREF   | QTY  | GROPRI   | XQCFOP | XQVARCFOP |
            | 1   | "BMS001" | "10" | "100.00" | "6102" | ""        |

    Scenario: 4. SIH Creation
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 5. Transmission and Validation
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        #Verificar status da nota (6 = Autorizada)
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "[F:XQSIH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the "Post" button in the header
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "WK5ALLXQ0_NUM"
        And the user stores the value of the selected text field with the key: "SIHNUM"

    Scenario: 6. Validation of Information
        When the user clicks the "NF-e Summary" tab selected by title
        And the user selects the text field with name: "Total discount"
        And the value of the selected text field is "20.00"
        And the user selects the text field with name: "Freight"
        And the value of the selected text field is "100.00"
        And the user selects the text field with name: "Invoice total value"
        And the value of the selected text field is "1,190.00"
        And the user clicks the "Close page" main action button on the right panel
        And the user waits 20 seconds

    Scenario: 7. SIH Credit Creation
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "AAL Full entry credit" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice AAL : Full entry credit" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WK5ALLXQ0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ0_SIVTYP"
        And the user writes "BRNDC" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ0_BPCINV"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQWK5ALLXQ0_CODOPF"
        And the user writes "105" to the selected text field and hits tab key
        And the user hits escape

    Scenario: 8. Picking
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Credit note preloading filter" screen is displayed
        And the user selects the text field with X3 field name: "SCRITCNO_CRISIHNUM"
        And the user writes the stored text with key "SIHNUM" in the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SCRITCNO_CRISIHNUM"
        And the user stores the value of the selected text field with the key: "SIHNUM"
        And the user clicks the "OK" button in the header
        And the user clicks the "Select invoices" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SIHNUM" and with the text containing "BR011" of the picking list panel
        And the user checks the selected picking list panel item

    Scenario: 9. Edit Line
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5AAL4_ARRAY_NBLIG"
        When the user selects editable table row number: 1
        And the user opens "Popup view" function on toolbox of the selected row
        And the user selects the text field with name: "Invoiced qty."
        #And the user selects the text field with X3 field name: "WK5AAL4_QTY"
        And the user writes "5" to the selected text field and hits tab key
        And the user clicks the Close page action icon on the header panel

    Scenario: 10. Creation
        Then the user clicks the "Create" main action button on the right panel
        And  a confirmation dialog appears with the message "Record has been created"

    Scenario: 11. Validation of Information
        When the user clicks the "NF-e Summary" tab selected by title
        And the user selects the text field with name: "Total discount"
        And the value of the selected text field is "10.00"
        And the user selects the text field with name: "Freight"
        And the value of the selected text field is "50.00"
        And the user selects the text field with name: "Invoice total value"
        And the value of the selected text field is "595.00"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 12. Logout
        And the user logs-out from the system