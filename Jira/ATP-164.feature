###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-164
# - Description: GESSQH-GESSOH - Dados Exportação
# - Jira: X3DEV-4817
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 02/04/2024
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-164

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. Criar Orçamento (GESSQH)
        Given the user opens the "GESSQH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales quote ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Quote type"
        And the user writes "SQH" to the selected text field and hits tab key
        And the user selects the text field with name: "Customer"
        And the user writes "NA012" to the selected text field and hits tab key
        #When the user clicks the "OK" button in the header
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "102" to the selected text field and hits tab key
        And the user selects the text field with name: "Departure state"
        And the user writes "EX" to the selected text field and hits tab key
        And the user selects the text field with name: "Departure location"
        And the user writes "EX" to the selected text field and hits tab key
        And the user selects the text field with name: "Departure loc. description"
        And the user writes "EX" to the selected text field and hits tab key
        And the user waits 2 seconds
        And the user selects the text field with name: "Delivery address"
        And the user writes "AD1" to the selected text field and hits tab key
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Tax rule"
        And the user writes "BRL" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK1ALL2_ARRAY_NBLIG"

    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK1ALL2_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user hits tab
        And the user selects last editable cell with X3 field name: "WK1ALL2_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_GROPRI"
        And the user adds the text <GROPRI> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   |
            | 1   | "BMS001" | "1" | "100.00" |

    Scenario: 3. Export Information
        And the user clicks the "Export information" action button on the header drop down

    Scenario Outline: 4. Inform Export Informations
        Given the user selects the text field with X3 field name: "XQEXPQ0_CURLIG"
        And the user writes <CURLIG> to the selected text field and hits tab key
        And the user selects the fixed data table for x3 field name: "XQEXPQ1_ARRAY_NBEXP"
        And the user selects last fixed cell with X3 field name: "XQEXPQ1_NUMDRWBCK"
        And the user adds the text <NUMDRWBCK> in selected cell
        And the user selects last fixed cell with X3 field name: "XQEXPQ1_NUMREGEXP"
        And the user adds the text <NUMREGEXP> in selected cell
        And the user selects last fixed cell with X3 field name: "XQEXPQ1_CHAVENFEEXP"
        And the user adds the text <CHAVENFEEXP> in selected cell
        And the user selects last fixed cell with X3 field name: "XQEXPQ1_QTDEEXP"
        And the user adds the text <QTDEEXP> in selected cell
        When the user clicks the "OK" button in the header
        And the user clicks the "Close" main action button on the right panel

        Examples:
            | CURLIG | NUMDRWBCK    | NUMREGEXP | CHAVENFEEXP                                    | QTDEEXP |
            | "1"    | "1234567890" | "1111"    | "22222222222222222222222222222222222222222222" | "1"     |

    Scenario: 5. Create
        Then the user clicks the "Create" main action button on the right panel
        And the user waits 5 seconds
        And the user clicks the "Order" button in the header
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then an alert box with the text "Replace data of the Exports block?" appears
        And the user clicks the "Yes" opinion in the alert box
        Then the "Sales order ALL : Full entry" screen is displayed
        And the user waits 5 seconds
        Given the user clicks the "Export information" action button on the header drop down
        And the user selects the fixed data table for x3 field name: "XQEXPO1_ARRAY_NBEXP"
        And the user selects editable table row number: 1
        And the user selects cell with X3 field name: "XQEXPO1_NUMDRWBCK" of selected row
        And the value of the selected cell is "1234567890"
        And the user selects editable table row number: 2
        And the user selects cell with X3 field name: "XQEXPO1_NUMDRWBCK" of selected row
        And the value of the selected cell is ""
        And the user clicks the "Close" main action button on the right panel
        And the user clicks the "Close" main action button on the right panel

    Scenario: 6. Logout
        And the user clicks the "Close" main action button on the right panel
        And the user logs-out from the system
