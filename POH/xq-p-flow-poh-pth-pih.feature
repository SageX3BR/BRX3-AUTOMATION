###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:xq-p-flow-poh-pth-pih
# - Description: Test a full process od purchasing, including SEFAZ transmission and trace result
# - Jira: NA
# - Legislation: BR addon
# - Created by : Edivaldo Monteiro
# - Created date : 19/03/2020
# - Updated by : Jonatas Hille
# - Updated date : 08/06/2020
# - Status : Automated
###########################################################################

Feature:xq-p-flow-poh-pth-pih

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Creation of the order
    #--------------------------------------------------------------------------------

    Scenario: 2.0. Create purchase order
        Given the user opens the "GESPOH" function
        # #And the user waits (3) seconds
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase order ALL : Full entry" screen is displayed
        #Filling the Invoice header information
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Order site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "112" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"

    #Lines
    Scenario Outline: Include 2 products
        Given the user selects editable table row number: <LIN>
        When the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCFOP"
        Then the user adds the text <XQCFOP> in selected cell and hits enter key
        Examples:
            | LIN | ITMREF   | QTYUOM | XQCFOP |
            | 1   | "BMS001" | "1"    | "2101" |
            | 2   | "BMS002" | "2"    | "2101" |
            | 3   | "BMS001" | "1"    | "2101" |
            | 4   | "BMS002" | "2"    | "2101" |
            | 5   | "BMS001" | "1"    | "2101" |
            | 6   | "BMS002" | "2"    | "2101" |
            | 7   | "BMS001" | "1"    | "2101" |
            | 8   | "BMS002" | "2"    | "2101" |
            | 9   | "BMS001" | "1"    | "2101" |
            | 10  | "BMS002" | "2"    | "2101" |
            | 11  | "BMS001" | "1"    | "2101" |
            | 12  | "BMS002" | "2"    | "2101" |


    #Create order and store order number
    Scenario: 2.1. Create and Store Doc Number
        Given the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "POH0_POHNUM"
        And the user stores the value of the selected text field with the key: "PoDocumentNo"
        Then the user clicks the Close page action icon on the header panel

    #--------------------------------------------------------------------------------
    #Creation of the receipt
    #--------------------------------------------------------------------------------
    Scenario: 3. Create purchase receipt
        Given the user opens the "GESPTH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        #Filling the Invoice header information
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key
        #Filter with the order created above
        Then the user clicks the "Selection criteria" action button on the header drop down
        And the "Preloading Criteria" screen is displayed
        And the user selects the text field with X3 field name: "PCRITORD_WPOHNUM"
        And the user writes the stored text with key "PoDocumentNo" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel
        #Picking the order / All items
        And the user clicks the "Order selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "PoDocumentNo" and with the text containing "BR001" of the picking list panel
        And the user checks the selected picking list panel item
        Then an alert box with the text containing "Replace data from the General Data tab?" appears
        And the user clicks the "Yes" opinion in the alert box
        Then an alert box with the text containing "Replace data from the Shipping data tab?" appears
        And the user clicks the "Yes" opinion in the alert box
        #Create receipt and store receipt number
        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WE6ALL0_PTHNUM"
        And the user stores the value of the selected text field with the key: "RecDocumentNo"
        And the user clicks the Close page action icon on the header panel

    #--------------------------------------------------------------------------------
    #Creation of the invoice
    #--------------------------------------------------------------------------------
    Scenario: 4. Create and transmit purchase Invoice
        Given the user opens the "GESPIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        #Filling the Invoice header information
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL0_BPRSAC"
        And the user writes "FORN" to the selected text field and hits tab key
        #Filter with stored receipt number
        And the user clicks the "Selection criteria" action button on the header drop down
        And the "Enter selection criteria" screen is displayed
        And the user selects the text field with X3 field name: "PCRITINV_WNUMRCP"
        And the user writes the stored text with key "RecDocumentNo" in the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        #Picking the receipt number
        And the user clicks the "Receipt selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "RecDocumentNo" and with the text containing "BR001" of the picking list panel
        And the user checks the selected picking list panel item
        Then an alert box with the text containing "Replace data from the 'General data' tab?" appears
        And the user clicks the "Yes" opinion in the alert box
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box
        #Add Supplier doc no with stored receipt number
        And the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "RecDocumentNo" in the selected text field and hits tab key
        #Create Invoice
        And the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        #Control Tab
        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL4_CLCLINAMT"
        And the user stores the value of the selected text field with the key: "CALCVALUE"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE" in the selected text field and hits tab key
        #Save and recalculate taxes
        And the user clicks the "Save" main action button on the right panel
        Then an alert box with the text containing "Recalculate taxes?" appears
        And the user clicks the "Yes" opinion in the alert box
        #And a confirmation dialog appears with the message "Record has been modified"
        #Send to Sefaz and verify if authorized
        Then the user clicks the "SEFAZ" action button on the header drop down
        ##And the user waits 10 seconds
        Then a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Rejected            : 000"
        And the selected log panel includes the message "    Number of NF-e Pending return      : 000"
        And the user clicks the Close page action icon on the header panel
        #Post Invoice
        When the user clicks the "Post" button in the header
        And an alert box with the text "The document will be validated! You will no longer be able to Modify or Delete it. Continue?" appears
        And the user clicks the "Ok" option in the alert box
        And a dialog box appears
        And the user clicks the "Ok" opinion in the alert box
        #End scenario and close
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system