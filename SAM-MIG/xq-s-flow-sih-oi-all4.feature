###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-flow-sih-oi-all4
# - Description: Open Items for Sales National invoice without incidences,
#                with invoicing elements - Service
# - Jira: NA
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 10/07/2020
# - Updated by : Fausto A Neto
# - Updated date : 07/08/2024
# - Status : Automated
###########################################################################

Feature: xq-s-flow-sih-oi-all4
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
        And the user writes "PT006" to the selected text field and hits tab key
        And the user clicks the "OK" action button on the header drop down
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "201" to the selected text field and hits tab key
        #IMPORTAÇÃO
        And the user selects the text field with X3 field name: "XQSIH0_UFEMBARQUE"
        And the user writes "SP" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSIH0_LOCEMBARQUE"
        And the user writes "Porto de Santos" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSIH0_DESLOCDESP"
        And the user writes "Santos" to the selected text field and hits tab key

        And the user clicks the "Management" tab selected by title
        And the user selects the text field with X3 field name: "WK5ALL1_BPCORD"
        And the user writes "PT006" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALL1_VACBPR"
        And the user writes "BRL" to the selected text field and hits tab key
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
            | 1   | "SER001" | "1" | "15.21" | "1"     | "1"     | "BRL"   |
            | 2   | "SER007" | "2" | "21.36" | "1"     | "1"     | "BRL"   |

    Scenario: Invoicing
        And the user clicks the "Invoicing" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL2_ARRAY_NBFAC"
        #SHO/Insurance
        And the user selects the fixed cell with X3 field name: "WK5ALL2_INVDTAAMT" and row number: (8)
        And the user adds the text "9.32" in selected cell and hits enter key
        #SHO/Discounts %
        And the user selects the fixed cell with X3 field name: "WK5ALL2_INVDTAAMT" and row number: (2)
        And the user adds the text "2.36" in selected cell and hits enter key
        #SHO-Freight
        And the user selects the fixed cell with X3 field name: "WK5ALL2_INVDTAAMT" and row number: (3)
        And the user adds the text "14.20" in selected cell and hits enter key

    Scenario: Open Items
        When the user clicks the "Create" main action button on the right panel
        And the user clicks the "Open items" action button on the header drop down
        And the user selects the fixed data table for x3 field name: "BPCDUD_ARRAY_NBECH"
        And the user selects the fixed cell with X3 field name: "BPCDUD_AMTCUR" and row number: (1)
        And the value of the selected cell is "80.08"
        Given the user clicks the "OK" action button on the header drop down

    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system

