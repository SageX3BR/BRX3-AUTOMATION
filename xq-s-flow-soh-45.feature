###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-flow-soh-ot
# - Description: CRUD verification of delivey function gessdh
# - Jira: NA
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 30/06/2020
# - Updated by : Carla Cury
# - Updated date : 30/06/2020
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

Feature: xq-s-flow-soh-ot

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------

    Scenario: 1.Login scenario

        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
    #--------------------------------------------------------------------------------
    #Creation of the sales order
    #--------------------------------------------------------------------------------

    Scenario: 2. Create a Sales order

        #Openning the function
        Given the user opens the "GESSOH" function
        #And the user waits 10 seconds
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        #Filling the sales order header
        When the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes "SOIBR0200170" to the selected text field and hits tab key



    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Create document

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box


    Scenario: Logout

        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system

