###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:  0202A-SalesStandardFlow
# - Description:
#       1) Create a sales order.
#       2) Create a sales delivery by picking of the sales order and validate the delivery.
#       3) Create a Sales invoice by picking of the sales delivery.
# - Created date: 24/01/2020
# - Updated date: 22/02/2022
# Cenário copiado do core do ATP
###########################################################################

@SageX3AutomatedTestPlatform
Feature: ATP-82

    Scenario: 0202A0 - Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected


    Scenario: 0202A1 - Sales order creation

        #Open Sales order function
        Given the user opens the "GESSOH" function

        #Select sales order transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Sales order ALL : Full entry" screen is displayed

        #Entering in creation mode.
        When the user clicks the "New" main action button on the right panel

        #Set header information
        Then the user selects the text field with name: "Sales site"
        And the user writes "NA012" to the selected text field
        And the user selects the date field with name: "Date"
        And the user writes a generated date in the selected date field using the value "T+2"
        And the user selects the text field with name: "Sold-to"
        And the user writes "NA008" to the selected text field and hits tab key

        #Select management section
        #Verification of the Tax rule & currency used on the sales invoice.
        Then the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Tax rule"
        And the value of the selected text field is "NTX"
        And the user selects the text field with name: "Currency"
        And the value of the selected text field is "USD"

        #Set delivery information
        Then the user clicks the "Delivery" tab selected by title
        And the user selects the text field with name: "Shipment site"
        And the user writes "NA012" to the selected text field
        And the user selects the drop down list with name: "Delivery priority"
        And the user clicks on "Urgent" option of the selected drop down list

        When the user clicks the "Lines" tab selected by title

        #Set sales order lines information
        When the user selects the fixed data table of section: "Lines"
        Then the user selects last fixed cell with header: "Product"
        And the user adds the text "BMS012" in selected cell
        And the user selects last editable cell with column header: "Ordered qty."
        And the user adds the text "4" in selected cell
        And the user selects last editable cell with column header: "Gross price"
        And the user adds the text "150" in selected cell and hits tab key
        And the user hits enter

        #Create the sales order.
        #Sales order used in feature: 0304O-ScrollingDataTableManagement
        #Generated document: SONATP210002
        Then the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

        #Save the sales order reference in a stored value
        And the user selects the text field with name: "Number"
        Then the user stores the value of the selected text field with the key: "ENV_ATPSOHNUM01"

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    Scenario: 0202A2 - Delivery creation by picking of the sales order

        #Open sales delivery function
        Given the user opens the "GESSDH" function

        #Select delivery transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell

        Then the "Delivery ALL : Full entry" screen is displayed

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        #Set header information
        When the user selects the text field with name: "Shipment site"
        Then the user writes "NA012" to the selected text field
        And the user selects the text field with name: "Sales site"
        And the user writes "NA012" to the selected text field
        And the user selects the text field with name: "Ship-to"
        And the user writes "NA008" to the selected text field and hits tab key

        #Left panel: open the picking list and select the required order
        Given the user clicks the "Order selection" link on the left panel
        When the user selects the main picking list panel of the screen
        And the user clicks the "Expand all" button in the left top bar of the selected picking list
        And the user selects the item with the stored text with key "ENV_ATPSOHNUM01" and with the text containing "NA008" of the picking list panel
        And the user expands the selected picking list panel item
        And the user selects the item "BMS012 PCI E 128 Mb graphics adapter Remains to be delivered 4 UN" of the picking list panel next level
        And the user checks the selected picking list panel item

        #Create the delivery
        #Sales delivery used in feature: 0304O-ScrollingDataTableManagement
        #Generated document: SHPATP210001
        Then the user clicks the "Create" main action button on the right panel

        #Validate the delivery
        And the user clicks the "Validation" button in the header
        And the user clicks the "Ok" opinion in the alert box

        #Store the value of the sales order reference
        And the user selects the text field with name: "Delivery no."
        Then the user stores the value of the selected text field with the key: "ENV_ATPSDHNUM01"

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    Scenario: 0202A3 - Invoice creation by picking of the delivery

        #Open sales delivery function
        Given the user opens the "GESSIH" function

        #Select delivery transaction
        When the user selects the data table in the popup
        Then the user selects cell with text: "ALL Full entry invoice" and column header: ""
        And the user clicks on the selected cell

        Then the "Sales invoice ALL : Full entry invoice" screen is displayed

        #Entering in creation mode
        When the user clicks the "New" main action button on the right panel

        Then the user selects the text field with name: "Sales site"
        And the user writes "NA012" to the selected text field
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "NA008" to the selected text field and hits tab key

        #Left panel: open the picking list and select the required delivery
        Given the user clicks the "Delivery selection" link on the left panel
        When the user selects the data table of left panel
        Then the user selects search cell with header: "Delivery"
        And the user adds the stored text with key "ENV_ATPSDHNUM01" in selected cell and hits enter key
        And the user selects cell with column header: "Delivery" and row number: 1
        And the user clicks on the selected cell


        #Create the sales invoice
        # Sales invoice used in feature: 0306D-RightPanelPrintActionManagement
        #Genrated document: ATP21*INVBC000001
        Then the user clicks the "Create" main action button on the right panel

        #Close the function
        Then the user clicks the Close page action icon on the header panel


    Scenario: 0202A4 - Logout scenario
        Then the user logs-out from the system



