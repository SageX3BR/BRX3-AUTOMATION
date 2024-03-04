##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-159
# - Description: Processo de Fluxo de Caixa
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 04/03/2024
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-159

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. GESPOH
        Given the user opens the "GESPOH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase order ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Order site"
        And the user writes "FCBR1" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        Then the user writes "991" to the selected text field and hits tab key
        When the user selects the text field with name: "Payment term"
        And the user writes "CH30NET" to the selected text field and hits tab key

    Scenario Outline: 003. Lines GESPOH
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"
        And the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        When the user selects last editable cell with column header: "Product type"
        Then the user selects the choice "Service" of the selected cell
        And the user hits tab
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        When the user selects last editable cell with column header: "Expected rcpt. date"
        Then the user enters todays date in the selected cell
        And the user hits tab
        And the user selects last editable cell with X3 field name: "WE3ALL2_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_VAT1"
        And the user adds the text <VAT1> in selected cell
        And the user hits tab
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQFINACC"
        And the user adds the text <XQFINACC> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI    | VAT1  | XQFINACC   |
            | 1   | "SER001" | "1"    | "1000.00" | "BRL" | "51102004" |

    Scenario: 004. GESPOH Creation
        When the user clicks the "Create" main action button on the right panel
        Given the user clicks the Close page action icon on the header panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "POH0_POHNUM"
        And the user stores the value of the selected text field with the key: "POHNUM"
        Given the user clicks the Close page action icon on the header panel

    Scenario: 005. FUNTRTCFO
        Given the user opens the "FUNTRTCFO" function
        Then the "Cash forecast generation" screen is displayed
        And the user selects the text field with name: "Company"
        And the user writes "FCBR" to the selected text field and hits tab key
        And the user selects the text field with name: "Site"
        And the user writes "FCBR1" to the selected text field and hits tab key
        And the user selects the date field with name: "End date"
        And the user writes "12/31/24" to the selected date field
        Given the user selects the check box with name: "Traceability detail"
        When the user sets the check box to ticked
        When the selected check box is checked
        When the user clicks the "OK" button in the header
        And a log panel appears
        And the user selects the main log panel of the page
        #Log panel: check the confirmation message is retuned in the log using both Text and stored value
        Then the selected log panel includes the confirmation message "Purchase Order: [POHNUM]"
        Given the user clicks the Close page action icon on the header panel

    Scenario: 006. GESCFO
        Given the user opens the "GESCFO" function
        Then the "Cash forecast management" screen is displayed
        #Left list selection
        Given the user selects the data table of left panel
        When the user clicks the "Cash forecast" link on the left panel
        Then the user selects search cell with header: "Document no."
        And the user adds the stored text with key "POHNUM" in selected cell and hits enter key
        And the user selects cell with column header: "Document no." and row number: 1
        And the user clicks on the selected cell

        And the user selects the text field with name: "Accounting code"
        And the value of the selected text field is "51102004"

        Given the user selects the fixed data table of section: "Open items"
        When the user selects editable table row number: 1
        And the user opens "Popup view" function on toolbox of the selected row
        And the user selects the text field with name: "Amount"
        And the user clicks on the selected cell
        And the value of the selected text field is "1000.00"
        And the user selects the date field with name: "Due date"
        Then the value of the selected date field is a generated date using value "T+38"
        Given the user clicks the Close page action icon on the header panel
        When the user clicks the "Cancel" main action button on the right panel
        Given the user clicks the Close page action icon on the header panel


    Scenario: 007. Logout
        And the user logs-out from the system
