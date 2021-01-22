###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-flow-sih-oi
# - Description: Open Items for Sales National invoice without incidences - Product
# - Jira: NA
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 10/07/2020
# - Updated by : Carla Cury
# - Updated date : 10/07/2020
# - Status : in progress
###########################################################################

#Global parameter intialization
###########################################################################
# Notes
# -------------------------------------------------------------------------
# For the purpose of this test:
#
#
# ###########################################################################
#
#
# ###########################################################################

Feature: xq-s-flow-sih-oi

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Creation of the sales order
    #--------------------------------------------------------------------------------
    Scenario: 2. Create a Invoice

        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        #Filling the Invoice header information
        Given the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes "NFCBR01120/00001215" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes " " to the selected text field and hits tab key
        And the user clicks the "Create" main action button on the right panel
        And the user clicks the "Create" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box


    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system

