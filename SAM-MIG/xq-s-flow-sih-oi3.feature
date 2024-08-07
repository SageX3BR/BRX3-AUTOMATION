###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-flow-sih-oi3
# - Description: Open Items for Sales National invoice with retention,
#                without other invoicing elements - Service
# - Jira: NA
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 10/07/2020
# - Updated by : Fausto A Neto
# - Updated date : 08/07/2024
# - Status : In progress
###########################################################################

Feature: xq-s-flow-sih-oi3
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
        # And the user clicks the "OK" action button on the header drop down
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "200" to the selected text field
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    Scenario Outline: Add Lines
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
            | 1   | "SER001" | "2" | "21.36" | "1"     | "1"     | "BRL"   |
            | 2   | "SER007" | "3" | "16.25" | "1"     | "1"     | "BRL"   |

    Scenario: Open Items
        When the user clicks the "Create" main action button on the right panel
        And the user clicks the "Open items" action button on the header drop down
        And the user selects the fixed data table for x3 field name: "BPCDUD_ARRAY_NBECH"
        And the user selects the fixed cell with X3 field name: "BPCDUD_AMTCUR" and row number: (1)
        And the value of the selected cell is "54.23"
        Given the user clicks the "OK" action button on the header drop down

    Scenario: Check Calculated Values
        Given the user clicks the "Valuation" tab selected by title
        And the user selects the fixed data table for x3 field name: "SIHV_ARRAY_NBFOOT"
        When the user selects the fixed cell with X3 field name: "SIHV_XFATI" and row number: (1)
        Then the value of the selected cell is "-37.24"
        Given the user clicks the "NF-e Summary" tab selected by title
        And the user selects the text field with name: "Invoice total value"
        And the value of the selected text field is "91.47"


    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system

