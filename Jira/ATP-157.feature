###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-157
# - Description: GESPOH com Elemento de Faturação Frete e 2 Linhas, ao alterar o Peso deve ratear o elemento de faturação corretamente
# - Legislation: BR addon
# - JIRA: X3DEV-5881
# - Created by : Gustavo Albanus
# - Created date : 22/08/2024
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-157

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. GESPOH
        Given the user opens the "GESPOH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase order ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Order site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        Then the user writes "110" to the selected text field and hits tab key

    Scenario Outline: Inserir Linha
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"
        Given the user selects editable table row number: 1
        And the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text "BMS113" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text "1" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_GROPRI"
        And the user adds the text "250.00" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYWEU"
        And the user adds the text "250.00" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCFOP"
        And the user adds the text "2102" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQVARCFOP"
        And the user adds the text "4" in selected cell and hits enter key

        Given the user selects editable table row number: 2
        And the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text "BMS113" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text "1" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_GROPRI"
        And the user adds the text "50.00" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYWEU"
        And the user adds the text "50.00" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCFOP"
        And the user adds the text "2102" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQVARCFOP"
        And the user adds the text "4" in selected cell and hits enter key

    Scenario: 003. Elemento de Faturação Frete
        And the user selects the data table of section: "Invoicing elements"
        And the user selects cell with column header: "% or amount" and row number: 12
        And the user adds the text "30" in selected cell and hits tab key

    Scenario: 004. Criar Encomenda
        And the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"

    Scenario: 005. Taxes
        And the user clicks the "Tax detail" action button on the header drop down
        Then the user selects the text field with X3 field name: "XQPTD0_CURLIG"
        And the user writes "1" to the selected text field and hits tab key
        Then the user selects the text field with name: "Freight apportionment"
        And the value of the selected text field is "25.00"
        Then the user selects the text field with X3 field name: "XQPTD0_CURLIG"
        And the user writes "2" to the selected text field and hits tab key
        Then the user selects the text field with name: "Freight apportionment"
        And the value of the selected text field is "5.00"
        And the user clicks the "Close" main action button on the right panel

    Scenario: 006. Regravar Informação das Linhas
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"
        And the user selects first row of the selected data table
        And the user opens "Popup view" function on toolbox of the selected row
        And the user selects the text field with name: "Weight"
        And the user writes "280.00" to the selected text field and hits tab key
        And the user clicks the Close page action icon on the header panel

        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"
        Given the user selects editable table row number: 2
        And the user opens "Popup view" function on toolbox of the selected row
        And the user selects the text field with name: "Weight"
        And the user writes "20.00" to the selected text field and hits tab key
        And the user clicks the Close page action icon on the header panel
        Given the user clicks the "Save" main action button on the right panel
        Then an alert box with the text containing "Recalculate taxes?" appears
        And the user clicks the "Yes" opinion in the alert box
        Then a confirmation dialog appears with the message "Record has been modified"

    Scenario: 007. Taxes
        And the user clicks the "Tax detail" action button on the header drop down
        Then the user selects the text field with X3 field name: "XQPTD0_CURLIG"
        And the user writes "1" to the selected text field and hits tab key
        Then the user selects the text field with name: "Freight apportionment"
        And the value of the selected text field is "28.00"
        Then the user selects the text field with X3 field name: "XQPTD0_CURLIG"
        And the user writes "2" to the selected text field and hits tab key
        Then the user selects the text field with name: "Freight apportionment"
        And the value of the selected text field is "2.00"
        And the user clicks the "Close" main action button on the right panel


    Scenario: 008. Logout
        And the user clicks the "Close page" main action button on the right panel
        And the user logs-out from the system