###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-144
# - Description: Cálculo de impostos Expedição [GESSDH]
# - Jira: X3DEV-3814
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 09/11/2023
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-144

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. SDH Creation
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed

        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WK4ALLXQ0_STOFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SDHTYP"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_BPCORD"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ3_CODOPF"
        And the user writes "125" to the selected text field and hits tab key
        And the user hits escape
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
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY | GROPRI    | XQCFOP |
            | 1   | "BMS001" | "2" | "2000.00" | "6110" |

    Scenario: 003.Create SDH
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 004.Tax Summary
        And the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with name: "Products total value"
        And the value of the selected text field is "4,000.00"
        And the user selects the text field with name: "Total shipment value"
        And the value of the selected text field is "4,400.00"
        And the user selects the text field with name: "Operation ICMS value"
        And the value of the selected text field is "280.00"
        And the user selects the text field with name: "IPI total"
        And the value of the selected text field is "400.00"
        And the user selects the text field with name: "PIS value"
        And the value of the selected text field is "24.18"
        And the user selects the text field with name: "COFINS value"
        And the value of the selected text field is "111.60"

    Scenario: 005. Logout
        And the user clicks the "Close" main action button on the right panel
        And the user logs-out from the system