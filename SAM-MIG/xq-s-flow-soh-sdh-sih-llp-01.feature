###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-flow-so-sd-si-llp
# - Description: Sales Order Delivery Invoice
# - Jira: NA
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 10/02/2021
# - Updated by : Carla Cury
# - Updated date : 10/02/2021
# - Status : in progress
###########################################################################
#Global parameter intialization
###########################################################################
# Notes
# -------------------------------------------------------------------------
# For the purpose of this test:
# - Parameter  : No specific parameter is required
# SCENARIO 1: Perform a triangular operation where the Supplier (A) makes a sale to the customer (B) who will industrialize the product in an Industrializer (C). Aiming at an interstadual operation.
#
# PREREQUISITES:
# CLIENTS WITH ADDRESS REGISTERED IN DIVERGENT STATES.
# REGISTER NEW VTAX WITH TAXES RESETED TO GESSDH WITH USED CFOP.
# ###########################################################################
#As a user I want to Create , Modify , Delete a Sales order.
#
# ###########################################################################
#As a user I want to Create , Modify , Delete a Sales order.

Feature: xq-s-flow-soh-sdh-sih-llp-01

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------

    Scenario: 1.Login scenario

        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Creation of the sales order FOR PICKING
    #--------------------------------------------------------------------------------

    Scenario: 2. Create a Sales order

        #Openning the function
        Given the user opens the "GESSOH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        #Filling the sales order header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRSON" to the selected text field and hits tab key
        And the user selects the text field with name: "Sold-to"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    Scenario Outline: Add Lines

        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK2ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | XQCFOP |
            | 1   | "BMS001" | "1" | "6101" |
            | 2   | "BMS002" | "2" | "6101" |

    Scenario: Create document

        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user stores the value of the selected text field with the key: "SOH_NUM"
        Then the user clicks the Close page action icon on the header panel

    # #--------------------------------------------------------------------------------
    # #Creation of the Delivery
    # #--------------------------------------------------------------------------------

    Scenario: 2. Create a Delivery

        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed
        #Filling the Invoice header information
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with name: "Ship-to"
        And the user writes "BR001" to the selected text field and hits tab key

        And the user clicks the "Selection criteria" action button on the header drop down
        And the user selects the text field with X3 field name: "SCRITSDH_CRISOHNUM"
        And the user writes the stored text with key "SOH_NUM" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel
        #Picking the order / All items
        And the user clicks the "Order selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SOH_NUM" and with the text containing "BR001" of the picking list panel
        And the user checks the selected picking list panel item
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits enter


    Scenario: Create document
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "SDH0_SDHNUM"
        And the user stores the value of the selected text field with the key: "SDH_NUM01"
        And the user clicks the "Validation" button in the header
        And a dialog box appears
        And the user clicks the "Ok" opinion in the alert box
        And the user clicks the Close page action icon on the header panel


    #--------------------------------------------------------------------------------
    #Creation of the sales invoice PICKING
    #--------------------------------------------------------------------------------
    Scenario: 2. Create a Invoice

        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        #Filling the Invoice header information
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        # And the user selects the text field with name: "Type"
        # And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR001" to the selected text field and hits tab key

    Scenario: Left List

        Given the user selects the data table of left panel
        When the user clicks the "Delivery selection" link on the left panel
        Then the user selects search cell with header: "Delivery"
        And the user adds the stored text with key "SDH_NUM01" in selected cell and hits enter key
        And the user selects cell that matches exact with the stored text with the key: "SDH_NUM01" and column header: "Delivery"
        And the user clicks on the selected cell

    Scenario: Process Id
        Given the user selects the fixed data table for x3 field name: "XQSIH0_ARRAY_NBREF"
        And the user selects last editable cell with X3 field name: "XQSIH0_IDENTPROC"
        And the user adds the text "1" in selected cell and hits tab key

    Scenario: Create document

        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        Then the user clicks the "SEFAZ" action button on the header drop down
        Then a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "SIH0_XQSTATUSNFE"
        And the value of the selected text field is "Authorized invoice"
        And the user clicks the "Post" button in the header
        Then a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "X3 validation Invoice/Credit"
        And the user clicks the Close page action icon on the header panel

    Scenario: Logout

        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system

