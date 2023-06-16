###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-118
# - Description: Cenário Completo Originado em Pedido de Compras até Fatura de Compras
# - Jira:
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 24/02/2023
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-118

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. GESPSH
        Given the user opens the "GESPSH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase request ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Request site"
        And the user writes "BR011" to the selected text field and hits tab key

    Scenario Outline: 3. Add Lines
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE2ALL1_ARRAY_NBLIG"
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE2ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell and hits tab key
        When the user selects last editable cell with column header: "Requested date"
        Then the user enters todays date in the selected cell
        And the user hits tab
        And the user selects last editable cell with X3 field name: "WE2ALL1_QTYPUU"
        And the user adds the text <QTYPUU> in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE2ALL1_BPSNUM"
        And the user adds the text <BPSNUM> in selected cell and hits tab key
        And the user clicks the "Yes" opinion in the alert box
        And the user selects last editable cell with X3 field name: "WE2ALL1_NETPRI"
        And the user adds the text <NETPRI> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYPUU | BPSNUM  | NETPRI    |
            | 1   | "BMS001" | "1"    | "BR006" | "1000.00" |

    Scenario: 4. Document Creation and validation
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "Order" button in the header
        Then an alert box appears
        And the user clicks the "Ok" opinion in the alert box
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Generate Orders End"
        Given the user clicks the Close page action icon on the header panel

    Scenario: 5. View PR Orders - Num. GESPOH
        Given the user clicks the "View PR orders" action button on the header drop down
        And the user selects the fixed data table in the popup
        When the user selects first row of the selected data table
        And the user opens "Popup view" function on toolbox of the selected row
        And the user selects the text field with name: "Order no."
        And the user stores the value of the selected text field with the key: "NUMGESPOH"
        Then the user clicks the Close page action icon on the header panel
        And the user waits 3 seconds
        Then the user clicks the Close page action icon on the header panel
        And the user waits 3 seconds
        Then the user clicks the Close page action icon on the header panel

    Scenario: 6. GESPTH2
        Given the user opens the "GESPTH2" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR006" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key


    Scenario: 7. Picking PTH
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Preloading Criteria" screen is displayed
        And the user selects the text field with name: "Order no."
        And the user writes the stored text with key "NUMGESPOH" in the selected text field
        And the user clicks the "OK" button in the header
        And the user clicks the "Order selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "NUMGESPOH" and with the text containing "BR01" of the picking list panel
        And the user checks the selected picking list panel item
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "No" opinion in the alert box

    Scenario: 8. Lines
        And the user clicks the "Lines" tab selected by title
        Given the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        And the user selects first row of the selected data table
        And the user opens "Popup view" function on toolbox of the selected row
        And the user selects the text field with name: "CFOP"
        And the user writes "1101" to the selected text field and hits tab key
        And the user clicks the Close page action icon on the header panel

    Scenario: 9. Create GESPTH2
        Given the user clicks the "Create" main action button on the right panel
        #Given the user clicks the Close page action icon on the header panel
        And a confirmation dialog appears with the message "Record has been created"
        #And the user selects the text field with X3 field name: "WE6ALL0_PTHNUM"
        When the user selects the text field with name: "Receipt"
        And the user stores the value of the selected text field with the key: "PTHNUM"
        Then the user clicks the Close page action icon on the header panel
        And the user waits 5 seconds

    Scenario: 8. GESPIH
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        #Then the "Purchase invoice BRA :" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR006" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL0_BPRSAC"
        And the user writes "FORN" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key

    Scenario: 9. Picking PIH
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

    Scenario: 10. Control
        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL4_CLCLINAMT"
        And the user stores the value of the selected text field with the key: "CALCVALUE"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE" in the selected text field and hits tab key

    Scenario: 11. Create PIH
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        Given the user clicks the "SEFAZ" action button on the header drop down
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
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 12. Logout
        And the user logs-out from the system