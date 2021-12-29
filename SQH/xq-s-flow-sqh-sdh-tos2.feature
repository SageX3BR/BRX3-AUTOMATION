###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-flow-sdh-tos2
# - Description: CRUD verification of delivey function gessdh
# - Jira: NA
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 19/06/2020
# - Updated by : Carla Cury
# - Updated date : 19/06/2020
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
        #And the user waits 10 seconds
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
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_XQCENQ"
        Then the user adds the text <XQCENQ> in selected cell and hits enter key
        # And the user waits (3) seconds
        # And an alert box appears
        # And the user clicks the "Yes" opinion in the alert box

        Examples:
            | LIN | ITMREF   | QTY | GROPRI  | XQCFOP | XQVARCFOP | XQOICMS | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "3" | "21.25" | "6118" | "1"       | "0"     | "00"      | "999"  |
            | 2   | "BMS002" | "3" | "35,32" | "6118" | "1"       | "0"     | "00"      | "999"  |

    Scenario: 4.Create document

        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 5.Create Order

        And the user clicks the "Order" action button on the header drop down
        And the user waits 10 seconds
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        And the user waits (1) seconds
    #--------------------------------------------------------------------------------
    #Creation of the invoice
    #--------------------------------------------------------------------------------

    Scenario: 6.Create Invoice

        And the user clicks the "Invoice" action button on the header drop down
        And the user waits 10 seconds
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed

    Scenario: 7.Create and Store Doc Number

        Given the user selects the text field with X3 field name: "SIH0_NUM"
        And the user stores the value of the selected text field with the key: "SIHDocumentNo"
        #Send to Sefaz and verify if authorized
        Then the user clicks the "SEFAZ" action button on the header drop down
        And the user waits 10 seconds
        Then a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Authorized          : 001"
        And the user clicks the Close page action icon on the header panel
    Scenario: 8. Create and Store Doc Number

        Given the user clicks the "Post" action button on the header drop down
        And the user waits 2 seconds
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
        #Filter with the order created above
        Then the user clicks the "Selection criteria" action button on the header drop down
        And the "Delivery preloading filter" screen is displayed
        And the user selects the text field with X3 field name: "PCRITORD_WSIHNUM"
        And the user writes the stored text with key "SIHDocumentNo" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel
        #Picking the order / All items
        And the user clicks the "Invoices" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SIHDocumentNo" and with the text containing "BR001" of the picking list panel
        And the user checks the selected picking list panel item
        Then an alert box with the text containing "Replace data from the General Data tab?" appears
        And the user clicks the "Yes" opinion in the alert box
        Then an alert box with the text containing "Replace data from the Shipping data tab?" appears
        And the user clicks the "Yes" opinion in the alert box
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario Outline: Alter Lines

        Given the user selects row that has the text <ITMREF> in column with X3 field name: "WK4ALL1_ITMREF"
        And the user selects cell with X3 field name: "WK4ALL1_XQCFOP" of selected row
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell

        Examples:
            | ITMREF   | XQCFOP | XQVARCFOP | XQOICMS | XQCSTICMS |
            | "BMS001" | "6923" | "1"       | "0"     | "00"      |
            | "BMS002" | "6923" | "1"       | "0"     | "00"      |

    Scenario: 2.1. Create and Store Doc Number

        Given the user clicks the "Save" main action button on the right panel
        #When a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "SDH0_NUM"
        And the user stores the value of the selected text field with the key: "SDHDocumentNo"
        #Send to Sefaz and verify if authorized
        Then the user clicks the "SEFAZ" action button on the header drop down
        And the user waits 10 seconds
        Then a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Authorized          : 001"
        And the user clicks the Close page action icon on the header panel

    Scenario: Logout

        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system