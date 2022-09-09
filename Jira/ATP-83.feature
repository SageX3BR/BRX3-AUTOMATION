###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:  0202B-PurchasesStandardFlow
# - Description:
#       1) Create a purchases order.
#       2) Reconnect with purchase order approver
#       3) Purchase order approbation
#       4) Reconnect with main user
#       5) Create a purchase receipt by picking of the purchases order.
#       6) Create a purchases invoice by picking of the receipt.
# - Created date: 24/01/2020
# - Updated date: 22/02/2022
###########################################################################

@SageX3AutomatedTestPlatform
Feature: ATP-83

    Scenario: 020BB0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
    # And the user changes the main language code to "en-US"
    # When the user selects the "param:endPointName1" entry on endpoint panel
    # Then the "param:endPointName1" endpoint is selected


    Scenario: 0202B1 - Purchases order creation

        #Open purchase order function
        Given the user opens the "GESPOH" function

        #Select purchase order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Purchase order ALL : Full entry" screen is displayed

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        #Set header information
        Then the user selects the text field with name: "Order site"
        And the user writes "NA012" to the selected text field
        And the user selects the text field with name: "Supplier"
        And the user writes "NA052" to the selected text field

        # Then the user clicks the "Lines" tab selected by title
        # #Set purchases order lines information
        # Then the user selects the fixed data table of section: "Lines"
        # And the user selects last fixed cell with header: "Product"

        When the user clicks the "Lines" tab selected by title
        When the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"
        And the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        When the user clicks the "Selection" action button of the selected cell
        Then the user selects the data table in the popup
        And the user selects search cell with header: "Description 1"
        And the user adds the text "PCI E 128 Mb graphics adapter" in selected cell and hits enter key
        And the user selects cell with column header: "Description 1" and row number: 1
        And the user clicks on the selected cell
        And the user selects the data table of section: "Lines"
        And the user selects last editable cell with column header: "Ordered qty."
        And the user adds the text "4" in selected cell
        And the user selects last editable cell with column header: "Gross price"
        And the user adds the text "100" in selected cell

        #Create the purchases order
        When the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

        #Save the purchase order reference in a stored value
        And the user selects the text field with name: "Order"
        Then the user stores the value of the selected text field with the key: "ENV_ATPPOHNUM01"

        #Close the function
        Then the user clicks the "Close" main action button on the right panel


    Scenario: 020BB2 - Reconnect with Purchase order approver
        And the user logs-out from the system

        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserRootName" and password "param:loginUserRootPassword"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0202B3 - Purchases order approbation

        #Open Workflow monitor function
        Given the user opens the "SAIWRKPLN" function

        #Select purchase signatures transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "Purchase signatures" and column header: "Title"
        And the user clicks on the selected cell

        Then the "Purchase signatures (PUR)" screen is displayed

        And the user selects the date field with name: "Start date"
        And the user writes a generated date in the selected date field using the value "T-2"
        And the user selects the date field with name: "End date"
        And the user writes a generated date in the selected date field using the value "T+2"

        And the user clicks the "Search" button in the header

        #Sign the Purchase order information
        When the user clicks the "Order sig." tab selected by title
        And the user selects the fixed data table for x3 field name: "WMIPUR3_ARRAY_NBLIG"

        #Approve the purchase order previously created thanks to reference saved in the stored value
        And the user selects row that has stored text with the key: "ENV_ATPPOHNUM01" in column with header: "Order no."
        And the user opens "Signature" function on toolbox of the selected row
        And the modal dialog "Answer selection" is displayed
        When the user selects the data table in the popup
        And the user selects cell with text: "VAL Validation" and column header: ""
        And the user clicks on the selected cell


        #Close the function
        Then the user clicks the "Close" main action button on the right panel


    Scenario: 020BB4 - Reconnect with main user
        And the user logs-out from the system

        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0202B5 - Create receipt with purchase order picking

        #Open purchases receipts function
        Given the user opens the "GESPTH" function

        #Select receipt transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Purchase receipt ALL : Full entry" screen is displayed

        #Enter in creation mode and define header values
        When the user clicks the "New" main action button on the right panel

        #Set header information
        Then the user selects the text field with name: "Receiving site"
        And the user writes "NA012" to the selected text field
        And the user selects the text field with name: "Supplier"
        And the user writes "NA052" to the selected text field and hits tab key

        #Left panel: open the picking list and select the required order
        Given the user clicks the "Order selection" link on the left panel
        When the user selects the main picking list panel of the screen
        And the user clicks the "Expand all" button in the left top bar of the selected picking list
        And the user selects the item with the stored text with key "ENV_ATPPOHNUM01" and with the text containing "NA052" of the picking list panel
        # And the user expands the selected picking list panel item
        # And the user selects the item "BMS001 _ Ord Qty 4 UN To be received 4" of the picking list panel next level
        And the user checks the selected picking list panel item

        #Create the purchases receipt
        Then the user clicks the "Create" main action button on the right panel

        #Save the purchase receipt reference in a stored value
        And the user selects the text field with name: "Receipt"
        Then the user stores the value of the selected text field with the key: "ENV_ATPPTHNUM01"

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    Scenario: 0202B6 - Create purchase invoice with purchase receipt picking

        #Open purchases receipts function
        Given the user opens the "GESPIH" function

        #Select receipt transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Purchase invoice ALL : Full entry" screen is displayed

        #Enter in creation mode and define header values
        When the user clicks the "New" main action button on the right panel

        #Set header information
        Then the user selects the text field with name: "Invoicing site"
        And the user writes "NA012" to the selected text field
        And the user selects the text field with name: "Invoice type"
        And the user writes "INV" to the selected text field
        And the user selects the date field with name: "Accounting date"
        And the user writes today to the selected date field
        And the user selects the text field with name: "Supplier"
        And the user writes "NA052" to the selected text field


        #Generate a dynamic value and assigned it to the spplier document no. field
        And the user stores the generated value with length 6 with the key "ENV_PIHREF01"
        And the user selects the text field with name: "Supplier doc no."
        And the user writes "ATP-[ENV_PIHREF01]" to the selected text field and hits tab key

        #Left panel: open the picking list and select the required receipt
        Given the user clicks the "Receipt selection" link on the left panel
        When the user selects the main picking list panel of the screen
        Then the user clicks the "Expand all" button in the left top bar of the selected picking list
        And the user selects the item with the stored text with key "ENV_ATPPTHNUM01" and with the text containing "NA052" of the picking list panel
        # And the user expands the selected picking list panel item
        # And the user selects the item "BMS001 _ Rec Qty 4 UN To be invoiced 4" of the picking list panel next level
        And the user checks the selected picking list panel item

        Then the user clicks the "Control" tab selected by title
        And the user selects the text field with name: "Invoice - tax"
        And the user writes "400" to the selected text field


        #Create the purchases invoice
        #Used in feature: 0313B-WaitsManagement
        Then the user clicks the "Create" main action button on the right panel

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    Scenario: 0202B7 - Logout scenario
        Then the user logs-out from the system



