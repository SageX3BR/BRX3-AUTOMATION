###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-flow-sdh-al3
# - Description: GESSDH Average Load OP3
# - Jira: NA
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 10/07/2020
# - Updated by : Carla Cury
# - Updated date : 29/01/2021
# - Status : completed
###########################################################################

#Global parameter intialization
###########################################################################
# Notes
# -------------------------------------------------------------------------
# For the purpose of this test:
# - Parameter  : No specific parameter is required
# SCENARIO 1: Creation Deliveries with Average load and the same client - Sumary
#
# PREREQUISITES:
# CLIENTS WITH ADDRESS REGISTERED IN STATES WITH RULES OF THE AVERAGE LOAD OP3.
# https://confluence.sage.com/display/XWOLOLO/Update+on+tax+calculation+engine+in+order+to+make+the+specific+calculation+rule+to+ICMS-ST+to+Triangular+Operation+Sales
# ###########################################################################
#
#
# ###########################################################################

Feature: xq-s-flow-sdh-al3

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"


    #--------------------------------------------------------------------------------
    #Creation of the sales order
    #--------------------------------------------------------------------------------
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
        And the user writes "BR003" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        #alert
        And the user writes "100" to the selected text field and hits tab key
        #Filling my industrialize
        When the user clicks the "Lines" tab selected by title
        And the user selects the date field with name: "Shipment"
        And the user writes today to the selected date field
        And the user hits tab
        When the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "br003" to the selected text field and hits tab key
        And the user selects the text field with name: "Pay-by"
        And the user writes "Br003" to the selected text field and hits tab key
        And the user selects the text field with name: "Group customer"
        And the user writes "BR003" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario Outline: Add Lines

        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCENQ"
        Then the user adds the text <XQCENQ> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY  | GROPRI  | XQCFOP | XQOICMS | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "23" | "36.48" | "6101" | "0"     | "10"      | "999"  |
            | 2   | "BMS002" | "14" | "42.36" | "6101" | "0"     | "10"      | "999"  |

    Scenario: Create document

        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario: Check Calculated Values

        Given the user clicks the "Tax Summary" tab selected by title
        And the user selects the text field with name: "ICMS ST value"
        And the value of the selected text field is "267.80"



    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system

