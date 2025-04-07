###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-flow-sdh-tos2
# - Description: CRUD verification of delivey function gessdh
# - Jira: NA
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 19/06/2020
# - Updated by : Gustavo Albanus
# - Updated date : 07/04/2025
# - Status : Done
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
# ###########################################################################
#As a user I want to Create , Modify , Delete a Sales order.
Feature: xq-s-flow-sqh-sdh-tos2
    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------

    Scenario: 1.Login scenario

        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
    #--------------------------------------------------------------------------------
    #Creation of the sales quote
    #--------------------------------------------------------------------------------

    Scenario: 2. Create a Sales quote

        #Openning the function
        Given the user opens the "GESSQH" function
        ##And the user waits 10 seconds
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales quote ALL : Full entry" screen is displayed
        #Filling the sales quote header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Quote type"
        And the user writes "SQD" to the selected text field and hits tab key
        #And the user selects the text field with name: "Reference"
        # And the user writes "Op Triangular Al1" to the selected text field and hits tab key
        And the user selects the text field with name: "Customer"
        And the user writes "BR001" to the selected text field and hits tab key
        # And an alert box with the text containing "This reference already exists for this customer" appears
        # And the user clicks the "ok" opinion in the alert box
        And the user selects the text field with name: "Fiscal operation"
        #alert
        And the user writes "134" to the selected text field and hits tab key
        #Filling my industrialize
        When the user clicks the "Management" tab selected by title
        And the user selects the text field with X3 field name: "WK1ALL1_XQCLIFAT"
        And the user writes "BR150" to the selected text field and hits tab key
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK1ALL2_ARRAY_NBLIG"
    #Filling Lines

    Scenario Outline: 3.Add Lines

        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK1ALL2_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell and hits enter key
        # #And the user waits (3) seconds
        # And an alert box appears
        # And the user clicks the "Yes" opinion in the alert box

        Examples:
            | LIN | ITMREF   | QTY | GROPRI  | XQCFOP | XQVARCFOP |
            | 1   | "BMS001" | "3" | "21.25" | "6118" | "1"       |
            | 2   | "BMS002" | "3" | "35.32" | "6118" | "1"       |

    Scenario: 4.Create document

        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 5.Create Order

        And the user clicks the "Order" action button on the header drop down
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user stores the value of the selected text field with the key: "SOH_NUM"
    #--------------------------------------------------------------------------------
    #Creation of the invoice
    #--------------------------------------------------------------------------------

    Scenario: 6.Create Invoice

        And the user clicks the "Invoice" action button on the header drop down
        # ##And the user waits 10 seconds
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed

    Scenario: 7.Create and Store Doc Number

        Given the user selects the text field with X3 field name: "SIH0_NUM"
        And the user stores the value of the selected text field with the key: "SIHDocumentNo"
        #Send to Sefaz and verify if authorized
        Then the user clicks the "SEFAZ" action button on the header drop down
        ##And the user waits 10 seconds
        Then a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "SIH0_XQSTATUSNFE"
        And the value of the selected text field is "Authorized invoice"
    Scenario: 8. Create and Store Doc Number

        Given the user clicks the "Post" action button on the header drop down
        # #And the user waits 2 seconds
        Then a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "X3 validation Invoice/Credit memo"
        And the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel

    #--------------------------------------------------------------------------------
    #Creation of the delivery
    #--------------------------------------------------------------------------------

    Scenario: 9. Create delivery

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
        And the user selects the text field with name: "Ship-to"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR150" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "134" to the selected text field and hits tab key
        When the user clicks the "Management" tab selected by title
        And the user selects the date field with X3 field name: "WK4ALL1_SHIDAT"
        And the user writes today to the selected date field
        And the user selects the text field with name: "Pay-by"
        And the user writes "BR150" to the selected text field and hits tab key
        And the user selects the text field with name: "Group customer"
        And the user writes "BR150" to the selected text field and hits tab key
        #Picking the Invoice / All items
        When the user clicks the "Invoices" link on the left panel
        And the user selects the data table of left panel
        And the user selects search cell with header: "Invoice"
        And the user adds the stored text with key "SIHDocumentNo" in selected cell and hits enter key
        And the user selects cell that matches exact with the stored text with the key: "SIHDocumentNo" and column header: "Invoice"
        And the user clicks on the selected cell
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario Outline: Alter Lines

        Given the user selects editable table row number: <LIN>
        And the user selects cell with X3 field name: "WK4ALL1_XQCFOP" of selected row
        And the user adds the text <XQCFOP> in selected cell
        And the user selects cell with X3 field name: "WK4ALL1_XQVARCFOP" of selected row
        And the user adds the text <XQVARCFOP> in selected cell and hits tab key

        Examples:
            | LIN | XQCFOP | XQVARCFOP |
            | 1   | "6923" | "1"       |
            | 2   | "6923" | "1"       |

    Scenario: 2.1. Create and Store Doc Number

        Given the user clicks the "Create" main action button on the right panel
        #Send to Sefaz and verify if authorized
        Then the user clicks the "SEFAZ" action button on the header drop down
        ##And the user waits 10 seconds
        Then a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "XQSDH0_NFESTATUS"
        And the value of the selected text field is "Authorized invoice"
        And the user clicks the "Validation" button in the header
        And a dialog box appears
        And the user clicks the "Ok" opinion in the alert box
        And the user clicks the Close page action icon on the header panel

    Scenario: Logout

        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
