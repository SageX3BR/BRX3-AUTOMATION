###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-flow-sqh-soh-sdhot
# - Description: CRUD verification of delivey function gessdh
# - Jira: NA
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 06/07/2020
# - Updated by : Carla Cury
# - Updated date : 06/07/2020
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
Feature: xq-s-flow-sqh-soh-sdh-to
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
        And the user writes "SQN" to the selected text field and hits tab key
        And the user selects the text field with name: "Customer"
        And the user writes "BR001" to the selected text field and hits tab key
        # And an alert box with the text containing "This reference already exists for this customer" appears
        # And the user clicks the "ok" opinion in the alert box
        And the user selects the text field with name: "Fiscal operation"
        #alert
        And the user writes "156" to the selected text field and hits tab key
        #Filling my industrialize
        When the user clicks the "Management" tab selected by title
        And the user selects the text field with X3 field name: "WK1ALL1_XQCLIFAT"
        And the user writes "BR004" to the selected text field and hits tab key
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK1ALL2_ARRAY_NBLIG"
    #Filling Lines

    Scenario Outline: Add Lines

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

        Examples:
            | LIN | ITMREF   | QTY | GROPRI  | XQCFOP | XQVARCFOP | XQOICMS | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "6" | "12.36" | "6102" | "1"       | "0"     | "00"      | "999"  |
            | 2   | "BMS002" | "3" | "3.98"  | "6102" | "1"       | "0"     | "00"      | "999"  |

    Scenario: Create document

        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: Create Order

        And the user clicks the "Order" action button on the header drop down
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
    # #And the user waits (3) seconds

    Scenario: Check the costumers

        Given the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Bill-to customer"
        And the value of the selected text field is "BR004"
        And the user selects the text field with name: "Pay-by"
        And the value of the selected text field is "BR001"
        And the user selects the text field with name: "Group customer"
        And the value of the selected text field is "BR001"


    #--------------------------------------------------------------------------------
    #Creation of the Delivery
    #--------------------------------------------------------------------------------

    Scenario: Create Delivery

        And the user clicks the "Delivery" action button on the header drop down
        # ##And the user waits 10 seconds
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed
    # #And the user waits (3) seconds


    Scenario: Check the data in the Management

        Given the user clicks the "Management" tab selected by title
        And the user selects the text field with X3 field name: "WK4ALLXQ0_BPCINV"
        And the value of the selected text field is "BR004"

    Scenario: SEFAZ
        Given the user clicks the "SEFAZ" action button on the header drop down
        ##And the user waits 10 seconds
        Then a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "XQWK4ALLXQ0_NFESTATUS"
        And the value of the selected text field is "Authorized invoice"
        And the user clicks the "Close page" main action button on the right panel
        #Fechando SOH para conseguir fazer Logout
        And the user clicks the "Close page" main action button on the right panel


    Scenario: Logout

        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system