###########################################################################
# Header
# -------------------------------------------------------------------------
#
# - Description: Garantir a autorização de um cancelamento de uma NFS-e através da API Migrate
# - Jira: ATP-84
# - Legislation: BR addon
# - Created by : Ricardo Ribeiro
# - Created date : 24/06/2022
#
###########################################################################

Feature: atp-84
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
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "200" to the selected text field and hits tab key


    Scenario Outline: 4.Add Lines
        #Lines
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQSTISS"
        And the user adds the text <XQSTISS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQEXISS"
        And the user adds the text <XQEXISS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_VACITM1"
        And the user adds the text <VACITM1> in selected cell and hits enter key


        Examples:
            | LIN | ITMREF   | QTY | GROPRI  | XQSTISS | XQEXISS | VACITM1 |
            | 1   | "SER017" | "2" | "21.36" | "1"     | "1"     | "BRL"   |

    Scenario: 5. Document Creation and validation
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

        Then the user clicks the "Transmit RPS" action button on the header drop down
        And a log panel appears
        Then the user clicks the Close page action icon on the header panel
        And the user selects the text field with name: "Invoice no."
        And the user stores the value of the selected text field with the key: "SIHNUM"
        And the user clicks the "Post" button in the header
        And the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel

    Scenario: 6. Create a Invoice/INVCAN


        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "INVCA   invoice cancellation" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice INVCA : invoice cancellation" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user clicks the "Ok" opinion in the alert box
        And the user selects the text field with name: "Sales site"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR001" to the selected text field and hits tab key

    #Selection Criteria
    Scenario: 7. Picking

        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Credit note preloading filter" screen is displayed
        And the user selects the text field with name: "Invoice no."
        And the user writes the stored text with key "SIHNUM" in the selected text field
        And the user clicks the "OK" button in the header
        And the user clicks the "Invoices to cancel" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SIHNUM" and with the text containing "BR020" of the picking list panel
        And the user checks the selected picking list panel item

    Scenario: 8. INVCAN - Creation
        Then the user clicks the "Create" main action button on the right panel
        And  a confirmation dialog appears with the message "Record has been created"

    Scenario: 9.Invoice Cancel
        Given the user clicks the "Transmit RPS" action button on the header drop down
        Then a log panel appears
        And the "RPS Canc Justification message" screen is displayed
        And the user clicks the "OK" button in the header
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the "Post" button in the header
        And the user clicks the Close page action icon on the header panel

    Scenario: 10.Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system