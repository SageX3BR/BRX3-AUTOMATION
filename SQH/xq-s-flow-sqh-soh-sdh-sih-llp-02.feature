###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-flow-sq-so-sd-si
# - Description: Sales Quote -> Order -> Delivery -> Invoice through the Left List picking.
# - Jira: NA
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 10/02/2021
# - Updated by : Carla Cury
# - Updated date : 10/02/2021
# - Status : in progress
###########################################################################
#Global parameter intialization
###########################################################################
# Notes
# -------------------------------------------------------------------------
# For the purpose of this test:
# - Parameter  : No specific parameter is required
# SCENARIO 1: Sales Quote -> Order -> Delivery -> Invoice through the Left List picking.
# PREREQUISITES:

# ###########################################################################
#
#
# ###########################################################################


Feature: xq-s-flow-sqh-soh-sdh-sih-llp-02

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------

    Scenario: 1.Login scenario

        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Creation of the sales quote EXPORT
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
        And the user writes "SQN" to the selected text field and hits tab key
        And the user selects the text field with name: "Reference"
        And the user selects the text field with name: "Customer"
        And the user writes "PT006" to the selected text field and hits tab key
        And the user clicks the Close page action icon on the header panel
        And the user selects the text field with name: "Fiscal operation"
        #alert
        And the user writes "102" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSQH0_UFEMBARQUE"
        And the user writes "PR" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSQH0_LOCEMBARQUE"
        And the user writes "Paranaguá" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSQH0_DESLOCDESP"
        And the user writes "Port" to the selected text field and hits tab key
        And the user clicks the "Management" tab selected by title
        And the user selects the text field with X3 field name: "WK1ALL1_VACBPR"
        And the user writes "BRL" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK1ALL2_ARRAY_NBLIG"
    #Filling Lines

    Scenario Outline: 3. Add Lines

        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK1ALL2_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell and hits enter key


        Examples:
            | LIN | ITMREF   | QTY | XQCFOP | XQCSTICMS |
            | 1   | "BMS001" | "1" | "7101" | "41"      |
            | 2   | "BMS002" | "2" | "7101" | "41"      |


    Scenario: 4. Create document

        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "SQH0_SQHNUM"
        And the user stores the value of the selected text field with the key: "SQH_NUM"
        Then the user clicks the Close page action icon on the header panel

        #--------------------------------------------------------------------------------
        #Creation of the document EXPORT
        #--------------------------------------------------------------------------------

        #Openning the function
        Given the user opens the "GESSOH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        #Filling the sales order header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRSON" to the selected text field and hits tab key
        And the user selects the text field with name: "Reference"
        And the user selects the text field with name: "Sold-to"
        And the user writes "PT006" to the selected text field and hits tab key
        And the user clicks the Close page action icon on the header panel
        #SELECT QUOTE
        And the user clicks the "Quote selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SQH_NUM" and with the text containing "PT006" of the picking list panel
        And the user checks the selected picking list panel item

        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: 5. Create document

        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user stores the value of the selected text field with the key: "SOH_NUM"
        And the user clicks the Close page action icon on the header panel

    # #--------------------------------------------------------------------------------
    # #Creation of the Delivery EXPORT
    # #--------------------------------------------------------------------------------

    Scenario: 6. Create a Delivery

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
        And the user clicks the "Selection criteria" action button on the header drop down
        And the user selects the text field with X3 field name: "SCRITSDH_CRISOHNUM"
        And the user writes the stored text with key "SOH_NUM" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel
        #Picking the order / All items
        And the user clicks the "Order selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SOH_NUM" and with the text containing "PT006" of the picking list panel
        And the user checks the selected picking list panel item
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "102" to the selected text field and hits tab key
        And the user hits enter

    Scenario: 7. Create document

        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "SDH0_SDHNUM"
        And the user stores the value of the selected text field with the key: "SDH_NUM"
        And the user clicks the "Validation" button in the header
        And a dialog box appears
        And the user clicks the "Ok" opinion in the alert box
        And the user clicks the Close page action icon on the header panel

    #--------------------------------------------------------------------------------
    #Creation of the sales invoice EXPORT
    #--------------------------------------------------------------------------------
    Scenario: 8. Create a Invoice

        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell

        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        #Filling the Invoice header information
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "PT006" to the selected text field and hits tab key
        And the user clicks the Close page action icon on the header panel

    Scenario: 9. Left List

        Given the user selects the data table of left panel
        When the user clicks the "Delivery selection" link on the left panel
        Then the user selects search cell with header: "Delivery"
        And the user adds the stored text with key "SDH_NUM" in selected cell and hits enter key
        And the user selects cell that matches exact with the stored text with the key: "SDH_NUM" and column header: "Delivery"
        And the user clicks on the selected cell
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: 10. Process Id
        Given the user selects the fixed data table for x3 field name: "XQSIH0_ARRAY_NBREF"
        And the user selects last editable cell with X3 field name: "XQSIH0_IDENTPROC"
        And the user adds the text "1" in selected cell and hits tab key

    Scenario: 11. Create document

        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        #Send to Sefaz and verify if authorized
        Then the user clicks the "SEFAZ" action button on the header drop down
        And the user waits 10 seconds
        Then a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Authorized          : 001"
        And the user clicks the Close page action icon on the header panel
        And the user clicks the "Post" button in the header
        Then a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "X3 validation Invoice/Credit"
        And the user clicks the Close page action icon on the header panel

    Scenario: 12. Logout

        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system

