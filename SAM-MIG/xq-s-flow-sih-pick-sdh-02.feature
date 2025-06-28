###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-flow-sih-pick-sdh
# - Description: GESSIH
# - Jira: NA
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 01/02/2021
# - Updated by : Carla Cury
# - Updated date : 01/02/2021
# - Status : in progress
###########################################################################

#Global parameter intialization
###########################################################################
# Notes
# -------------------------------------------------------------------------
# For the purpose of this test:
# - Parameter  : No specific parameter is required
# SCENARIO 1:
# PREREQUISITES:
#
# ###########################################################################

Feature:  xq-s-flow-sih-pick-sdh-02

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Creation of the Delivery IMPORTATION
    #--------------------------------------------------------------------------------
    Scenario: 2. Create a new delivery for import

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
        And the user writes "PT006" to the selected text field and hits tab key
        And the user clicks the Close page action icon on the header panel
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "102" to the selected text field
        #And the user clicks the "General Data" tab selected by title
        And the user selects the text field with X3 field name: "XQWK4ALLXQ0_UFEMBARQUE"
        And the user writes "PR" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQWK4ALLXQ0_LOCEMBARQUE"
        And the user writes "Paranaguá" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQWK4ALLXQ0_DESLOCDESP"
        And the user writes "Port" to the selected text field and hits tab key
        And the user hits tab
        And the user hits tab
        And the user clicks the "Management" tab selected by title
        And the user selects the text field with X3 field name: "WK4ALL2_VACBPR"
        And the user writes "BRL" to the selected text field and hits tab key


        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario Outline: Add Lines

        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCENQ"
        Then the user adds the text <XQCENQ> in selected cell and hits enter key
        # #And the user waits (3) seconds

        Examples:
            | LIN | ITMREF   | QTY | XQCFOP | XQVARCFOP | XQOICMS | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "1" | "7101" | ""        | "0"     | "41"      | "999"  |
            | 2   | "BMS002" | "2" | "7101" | ""        | "0"     | "41"      | "999"  |

    Scenario: Create document

        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SDHNUM"
        And the user stores the value of the selected text field with the key: "SDH_NUM03"
        And the user clicks the "Validation" button in the header
        And a dialog box appears
        And the user clicks the "Ok" opinion in the alert box
        And the user clicks the Close page action icon on the header panel

    #--------------------------------------------------------------------------------
    #Creation of the sales invoice IMPORT
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
        And the user writes "PT006" to the selected text field and hits tab key
        And the user clicks the Close page action icon on the header panel

    Scenario: Left List

        Given the user selects the data table of left panel
        When the user clicks the "Delivery selection" link on the left panel
        Then the user selects search cell with header: "Delivery"
        And the user adds the stored text with key "SDH_NUM03" in selected cell and hits enter key
        And the user selects cell that matches exact with the stored text with the key: "SDH_NUM03" and column header: "Delivery"
        And the user clicks on the selected cell
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: Create document

        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        #Send to Sefaz and verify if authorized
        Then the user clicks the "SEFAZ" action button on the header drop down
        ##And the user waits 10 seconds
        Then a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "SIH0_XQSTATUSNFE"
        And the value of the selected text field is "Authorized invoice"
        And the user clicks the "Post" button in the header
        Then a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "X3 validation Invoice/Credit"
        And the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel

    Scenario: Logout
        And the user logs-out from the system

