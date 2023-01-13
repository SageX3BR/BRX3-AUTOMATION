###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-47
# - Description: Garantir que a encomenda de venda criada automaticamente por Inter-estab. tenha os impostos calculados
# - Jira: X3DEV-711
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 21/06/2022
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-47

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. Create GESPOH
        Given the user opens the "GESPOH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase order ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Order site"
        And the user writes "BR012" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        Then the user writes "500" to the selected text field and hits tab key

    Scenario Outline: 3. Lines
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"
        And the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI    | XQCFOP |
            | 1   | "BMS001" | "1"    | "2000.00" | "1102" |

    Scenario: 4. Creation
        Given the user clicks the "Create" main action button on the right panel
        When a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Automatic generation of sales order"
        And the user clicks the Close page action icon on the header panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 5. Tax Detail
        Given the user clicks the "Tax detail" action button on the header drop down
        Then the "Tax detail" screen is displayed
        And the user selects the text field with X3 field name: "XQPTD1_VLICMSOP"
        And the value of the selected text field is "360.00"
        And the user selects the text field with X3 field name: "XQPTD1_VLIPI"
        And the value of the selected text field is "200.00"
        And the user selects the text field with X3 field name: "XQPTD1_VLCOF"
        And the value of the selected text field is "49.20"
        And the user selects the text field with X3 field name: "XQPTD1_VLPIS"
        And the value of the selected text field is "10.66"
        Then the user clicks the Close page action icon on the header panel
        And the user selects the text field with X3 field name: "WE3ALL3_OCNNUM"
        And the user stores the value of the selected text field with the key: "DOCSOH"
        And the user clicks the Close page action icon on the header panel

    Scenario: 6. Sales Order
        Given the user opens the "GESSOH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed

        Given the user selects the data table of left panel
        When the user clicks the "Orders" link on the left panel
        Then the user selects search cell with header: "Order no."
        And the user adds the stored text with key "DOCSOH" in selected cell and hits tab key
        And the user selects cell with column header: "Order no." and row number: 1
        And the user clicks on the selected cell

    Scenario: 7. Modified Line
        Given the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"
        And the user selects first row of the selected data table
        And the user opens "Popup view" function on toolbox of the selected row
        And the user selects the text field with name: "Gross price"
        And the user writes "2000.00" to the selected text field and hits tab key
        And the user clicks the Close page action icon on the header panel

    Scenario: 8. Modified GESSOH
        Given the user clicks the "Save" main action button on the right panel
        Then the user clicks the "Ok" opinion in the alert box
        Then the user clicks the "Yes" opinion in the alert box

    Scenario: 9. Tax Summary
        Given the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with name: "Operation ICMS value"
        And the value of the selected text field is "360.00"
        Then the user selects the text field with name: "IPI total"
        And the value of the selected text field is "200.00"
        Then the user selects the text field with name: "PIS value"
        And the value of the selected text field is "10.66"
        Then the user selects the text field with name: "COFINS value"
        And the value of the selected text field is "49.20"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 10. Logout
        And the user logs-out from the system