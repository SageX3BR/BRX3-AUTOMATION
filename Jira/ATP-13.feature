###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-13
# - Description: Criação de um Orçamento de Venda, com cálculo de PIS/COFINS Retido + PIS/COFINS Faturamento
# - Jira: X3DEV-518
# - Created by : Gustavo Albanus
# - Created date : 02/05/2022
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################


Feature: ATP-13

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
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "SOI" to the selected text field and hits tab key
        And the user selects the text field with name: "Sold-to"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "200" to the selected text field and hits tab key
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR020" to the selected text field and hits tab key
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
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQSTISS"
        And the user adds the text <XQSTISS> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQEXISS"
        And the user adds the text <XQEXISS> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI    | XQSTISS | XQEXISS |
            | 1   | "SER017" | "2" | "2000.00" | "1"     | "1"     |


    Scenario: 3. Enable Calculation Memory and Document Creation
        Given the user clicks the "Calc. memory On/Off" action button on the header drop down
        Then an alert box appears
        And the user clicks the "Ok" opinion in the alert box
        And the user hits tab key in the selected cell
        And the user clicks the "Create" main action button on the right panel
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Foram retidos os impostos PIS/COFINS"
        And the selected log panel includes the message "Cálculo do PIS/COFINS por alíquota"
        Then the user clicks the Close page action icon on the header panel
        When a confirmation dialog appears with the message "Record has been created"

    Scenario: 4. Validation of Taxes
        When the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with X3 field name: "XQSOH1_VALPIS"
        And the value of the selected text field is "66.00"
        And the user selects the text field with X3 field name: "XQSOH1_VALCOF"
        And the value of the selected text field is "304.00"
        And the user selects the text field with X3 field name: "XQSOH1_VALPISRF"
        And the value of the selected text field is "270.00"
        And the user selects the text field with X3 field name: "XQSOH1_VALCOFRF"
        And the value of the selected text field is "320.00"
        And the user selects the text field with X3 field name: "XQSOH1_VALCSLLRF"
        And the value of the selected text field is "400.00"
        And the user selects the text field with X3 field name: "XQSOH1_VALISSRF"
        And the value of the selected text field is "200.00"
        And the user selects the text field with X3 field name: "XQSOH1_VALINSS"
        And the value of the selected text field is "200.00"
        Then the user clicks the Close page action icon on the header panel

    Scenario: Logout
        And the user logs-out from the system