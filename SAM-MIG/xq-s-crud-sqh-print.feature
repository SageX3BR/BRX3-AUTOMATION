###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-crud-sqh-print
# - Description: CRUD verification of quote function gessqh
# - Jira: NA
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 08/07/2020
# - Updated by : Carla Cury
# - Updated date : 08/07/2020
# - Status : Completed
###########################################################################
#Global parameter intialization
###########################################################################
# Notes
# -------------------------------------------------------------------------
# For the purpose of this test:
# - Parameter  : No specific parameter is required
# SCENARIO 1: CRUD verification with print of the quote
#
# PREREQUISITES:
# N/A
#
# ###########################################################################
#As a user I want to Create , Modify , Delete a Sales quote.
# ###########################################################################
#As a user I want to Create , Modify , Delete a Sales quote.
Feature: xq-s-crud-sqh-print
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
        And the user writes "SQH" to the selected text field and hits tab key
        #And the user selects the text field with name: "Reference"
        # And the user writes "Op Triangular Al1" to the selected text field and hits tab key
        And the user selects the text field with name: "Customer"
        And the user writes "BR001" to the selected text field and hits tab key
        # And an alert box with the text containing "This reference already exists for this customer" appears
        # And the user clicks the "ok" opinion in the alert box
        And the user selects the text field with name: "Fiscal operation"
        #alert
        And the user writes "100" to the selected text field and hits tab key
        #Filling my industrialize
        When the user clicks the "Management" tab selected by title
        And the user selects the text field with X3 field name: "WK1ALL1_XQCLIFAT"
        And the user writes "BR150" to the selected text field and hits tab key
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
        # And the user waits (3) seconds
        # And an alert box appears
        # And the user clicks the "Yes" opinion in the alert box

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   | XQCFOP | XQVARCFOP | XQOICMS | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "3" | "325.68" | "6101" | "3"       | "0"     | "00"      | "999"  |
            | 2   | "BMS002" | "3" | "365.95" | "6101" | "3"       | "0"     | "00"      | "999"  |

    #Create order and store order number
    Scenario: 2.1. Create and Store Doc Number
        Given the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "SQH0_SQHNUM"
        And the user stores the value of the selected text field with the key: "SQHDocumentNo"
        Then the user clicks the Close page action icon on the header panel

    Scenario: Print the document
        Given the user opens the "AIMP" function
        When the user selects the text field with X3 field name: "AIMP1_RPTCOD"
        And the user writes "XQQUOTE" to the selected text field and hits tab key


    Scenario: Fill the grid
        And the user selects the fixed data table for x3 field name: "AIMP1_ARRAY_NBRPAR"
        And the user selects the fixed cell with X3 field name: "AIMP1_VALEUR1" and row number: (4)
        And the user adds the stored text with key "SQHDocumentNo" in selected cell and hits enter key
        And the user selects the text field with X3 field name: "AIMP1_PRT"
        And the user writes "XQPDF" to the selected text field and hits tab key
        And the user clicks the "Print" action button on the header drop down
        Then the user clicks the Close page action icon on the header panel



    Scenario: 2.2 Delete a Sales quote

        #Openning the function
        Given the user opens the "GESSQH" function
        #And the user waits 10 seconds
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales quote ALL : Full entry" screen is displayed
        When the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SQH0_SQHNUM"
        And the user writes the stored text with key "SQHDocumentNo" in the selected text field and hits tab key
        Then the user clicks the "Delete" main action button on the right panel

    Scenario: Logout

        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
