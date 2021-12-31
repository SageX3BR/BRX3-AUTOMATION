###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-flow-sih-cfop-sug6
# - Description: Sugerir CFOP na segunda linha pela Operação Fiscal - SIH
# - Jira: NA
# - Created by : Carla Cury
# - Created date : 10/07/2020
# - Updated by : Jonatas Hille
# - Updated date : 31/12/2021
# - Status : [X]Automated []Work In Progress []Broken
###########################################################################

Feature: xq-s-flow-sih-cfop-sug6

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. Create Invoice

        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR013" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR005" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "65" to the selected text field and hits tab key

    Scenario: 3. Skip Process Id and Focus on Grid
        Given the user hits escape
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    Scenario Outline: Add Lines with CFOP
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

    Scenario Outline: Add Lines without CFOP
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY | GROPRI  |
            | 2   | "BMS002" | "6" | "23.65" |

    Scenario: 4. Check the CFOP
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"
        And the user selects row that has the text "BMS002" in column with X3 field name: "WK5ALL4_ITMREF"
        And the user selects cell with X3 field name: "WK5ALL4_XQCFOP" of selected row
        And the value of the selected cell is "5113"

    Scenario: 5. Logout
        And the user clicks the Close page action icon on the header panel
        And an alert box with the text "Continue and cancel the creation?" appears
        And the user clicks the "Yes" opinion in the alert box
        And the user logs-out from the system

