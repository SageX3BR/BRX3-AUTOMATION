###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-55
# - Description: Desconto de vendas na base de cálculo do IPI na GESSOH
# - Jira:
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 01/07/2022
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-55

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. Create a Sales quote
        Given the user opens the "GESSOH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRSON" to the selected text field and hits tab key
        And the user selects the text field with name: "Sold-to"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape
        And the user selects the data table of section: "Invoicing elements"
        And the user selects cell with column header: "% or amount" and row number: 2
        And the user adds the text "10" in selected cell and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK2ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI    | XQCFOP | XQVARCFOP |
            | 1   | "BMS001" | "1" | "1000.00" | "6102" | "2"       |

    Scenario: 3. Enable Calculation Memory and Document Creation
        Given the user clicks the "Calc. memory On/Off" action button on the header drop down
        Then an alert box appears
        And the user clicks the "Ok" opinion in the alert box
        And the user hits tab key in the selected cell
        And the user clicks the "Create" main action button on the right panel
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Cálculo do IPI configurado"
        Then the user clicks the Close page action icon on the header panel
        When a confirmation dialog appears with the message "Record has been created"

    Scenario: 4. Validation of Taxes
        When the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with name: "Total discount"
        #Then the user selects the text field with X3 field name: "WK2ALLXQ_TOTDESC"
        And the value of the selected text field is "100.00"
        Then the user selects the text field with name: "IPI base total"
        #Then the user selects the text field with X3 field name: "WK2ALLXQ_TOTBASEIPI"
        And the value of the selected text field is "900.00"
        And the user selects the text field with name: "IPI total"
        #And the user selects the text field with X3 field name: "WK2ALLXQ_TOTIPI"
        And the value of the selected text field is "90.00"
        Then the user clicks the Close page action icon on the header panel

    Scenario: Logout
        And the user logs-out from the system