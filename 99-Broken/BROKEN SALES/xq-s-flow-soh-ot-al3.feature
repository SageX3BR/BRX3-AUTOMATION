###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-p-flow-soh-it-al3
# - Description: Operation Triangular SOH Average Load OP3
# - Jira: NA
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 02/06/2020
# - Updated by : Carla Cury
# - Updated date : 02/06/2020
# - Status : in progress
###########################################################################

#Global parameter intialization
###########################################################################
# Notes
# -------------------------------------------------------------------------
# For the purpose of this test:
# - Parameter  : No specific parameter is required
# SCENARIO 1: Perform a triangular operation where the Supplier (A) makes a sale to the customer (B) who will industrialize the product in an Industrializer (C). Aiming at an interstadual operation with state MT.
#
# PREREQUISITES:
# CLIENTS WITH ADDRESS REGISTERED IN DIVERGENT STATES.
# REGISTER NEW VTAX WITH TAXES RESETED TO GESSDH WITH USED CFOP.
# ###########################################################################
#As a user I want to Create , Modify , Delete a Sales order.
#
# ###########################################################################
#As a user I want to Create , Modify , Delete a Sales order.
Feature: xq-p-flow-sog-ot-al3

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
    #   When the user selects the "param:endPointName1" entry on endpoint panel
    #   Then the "param:endPointName1" endpoint is selected

    #--------------------------------------------------------------------------------
    #Creation of the sales order
    #--------------------------------------------------------------------------------
    Scenario: 2. Create a Sales order
        #Openning the function
        Given the user opens the "GESSOH" function
        ##And the user waits 10 seconds
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        #Filling the sales order header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRSOI" to the selected text field and hits tab key
        #And the user selects the text field with name: "Reference"
        #And the user writes "Op Triangular Al3" to the selected text field and hits tab key
        And the user selects the text field with name: "Sold-to"
        And the user writes "BR004" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "107" to the selected text field and hits tab key
        When the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "br005" to the selected text field and hits tab key
        And the user selects the text field with name: "Pay-by"
        And the user writes "Br005" to the selected text field and hits tab key
        And the user selects the text field with name: "Group customer"
        And the user writes "BR005" to the selected text field and hits tab key
        And the user selects the text field with name: "Delivery address"
        And the user writes "PR" to the selected text field and hits tab key
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR011" to the selected text field and hits tab key


        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    #Lines
    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK2ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCENQ"
        Then the user adds the text <XQCENQ> in selected cell and hits enter key
        # #And the user waits (2) seconds
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box

        Examples:
            | LIN | ITMREF   | QTY  | GROPRI  | XQCFOP | XQOICMS | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "23" | "32.65" | "6118" | "0"     | "10"      | "999"  |
            | 2   | "BMS002" | "15" | "19.87" | "6118" | "0"     | "10"      | "999"  |



    Scenario: Create document
        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"


    Scenario: Resume - Check Calculated Values
        Given the user clicks the "Tax Summary" tab selected by title
        When the user selects the text field with X3 field name: "XQSOH1_TOTBSICMSOP"
        And the value of the selected text field is "1,049.00"
        And the user selects the text field with X3 field name: "XQSOH1_TOTVALFINST"
        And the value of the selected text field is "184.63"


    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system

#CHECK IMPOSTO
#vALUE 184.6300"