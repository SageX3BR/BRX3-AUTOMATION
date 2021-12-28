###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-flow-sih-cfop-sug6
# - Description: SDH CFOP Suggestion5
# - Jira: NA
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 10/07/2020
# - Updated by : Daniela Anile
# - Updated date : 25/01/2021
# - Status : in progress
###########################################################################

#Global parameter intialization
###########################################################################
# Notes
# -------------------------------------------------------------------------
# For the purpose of this test:
# - Parameter  : No specific parameter is required
# SCENARIO 1: Sales Order without CFOP suggestion - First product
#
# PREREQUISITES:
#
# ###########################################################################
#
#
# ###########################################################################

Feature: xq-s-flow-sih-cfop-sug6

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"


    #--------------------------------------------------------------------------------
    #Creation of the sales order
    #--------------------------------------------------------------------------------
    Scenario: 2. Create a Delivery

        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        #Filling the Invoice header information
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR013" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR005" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "65" to the selected text field and hits tab key


    Scenario: Process Id
        Given the user selects the fixed data table for x3 field name: "XQSIH0_ARRAY_NBREF"
        And the user selects last editable cell with X3 field name: "XQSIH0_IDENTPROC"
        And the user adds the text "1" in selected cell and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    #Lines
    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY  | GROPRI  | XQCFOP |
            | 1   | "BMS001" | "10" | "12.95" | "5101" |
            | 2   | "BMS002" | "6"  | "23.65" | ""     |



    Scenario: Check the CFOP
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"
        And the user selects row that has the text "BMS002" in column with X3 field name: "WK5ALL4_ITMREF"
        And the user selects cell with X3 field name: "WK5ALL4_XQCFOP" of selected row
        And the value of the selected cell is "5113"



    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And an alert box with the text "Continue and cancel the creation?" appears
        And the user clicks the "Yes" opinion in the alert box
        And the user logs-out from the system

