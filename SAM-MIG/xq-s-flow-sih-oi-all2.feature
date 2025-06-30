###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-flow-sih-oi-all2
# - Description: Open Items for Sales National invoice without incidences - Product
# - Jira: NA
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 10/07/2020
# - Updated by : Fausto A Neto
# - Updated date : 06/08/2024
# - Status : Automated
###########################################################################

Feature: xq-s-flow-sih-oi-all2

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
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "PT006" to the selected text field and hits tab key
        And the user clicks the "OK" action button on the header drop down
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "102" to the selected text field and hits tab key
        #Exportação
        And the user selects the text field with X3 field name: "WK5ALLXQ3_UFEMBARQUE"
        And the user writes "PR" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ3_LOCEMBARQUE"
        And the user writes "Porto de Paranagua" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ3_DESLOCDESP"
        And the user writes "Parangua" to the selected text field and hits tab key

    Scenario: Process Id
        Given the user selects the fixed data table for x3 field name: "WK5ALLXQ3_ARRAY_NBREF"
        And the user selects last editable cell with X3 field name: "WK5ALLXQ3_IDENTPROC"
        And the user adds the text "1" in selected cell and hits tab key


    Scenario: Fill Management
        When the user clicks the "Management" tab selected by title
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
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCENQ"
        Then the user adds the text <XQCENQ> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY  | GROPRI  | XQCFOP | XQOICMS | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "20" | "21.36" | "7101" | "0"     | "00"      | "999"  |
            | 2   | "BMS002" | "19" | "15.98" | "7101" | "0"     | "00"      | "999"  |

    Scenario: Invoicing
        And the user clicks the "Invoicing" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL2_ARRAY_NBFAC"
        #SHO/Insurance
        And the user selects the fixed cell with X3 field name: "WK5ALL2_INVDTAAMT" and row number: (8)
        And the user adds the text "26.51" in selected cell and hits enter key
        #SHO/Discounts %
        And the user selects the fixed cell with X3 field name: "WK5ALL2_INVDTAAMT" and row number: (2)
        And the user adds the text "14.99" in selected cell and hits enter key
        #SHO-Freight
        And the user selects the fixed cell with X3 field name: "WK5ALL2_INVDTAAMT" and row number: (3)
        And the user adds the text "19.25" in selected cell and hits enter key

    Scenario: Open Items
        When the user clicks the "Create" main action button on the right panel
        And the user clicks the "Open items" action button on the header drop down
        And the user selects the fixed data table for x3 field name: "BPCDUD_ARRAY_NBECH"
        And the user selects the fixed cell with X3 field name: "BPCDUD_AMTCUR" and row number: (1)
        And the value of the selected cell is "744.69"
        Given the user clicks the "OK" action button on the header drop down

    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system

