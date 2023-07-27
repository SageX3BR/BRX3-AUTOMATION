###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-138
# - Description: Carregar elementos de faturação ao criar encomenda a partir do orçamento
# - (Teste realizado criando a encomenda direta e também saindo da função e retornando)
# - Jira: X3DEV-3193
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 25/07/2023
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-138

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
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK1ALL2_ARRAY_NBLIG"

    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK1ALL2_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_GROPRI"
        And the user adds the text <GROPRI> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   |
            | 1   | "BMS001" | "1" | "100.00" |

    Scenario: 3. Elementos de Faturação Desconto e Frete
        And the user selects the data table of section: "Invoicing elements"
        And the user selects cell with column header: "% or amount" and row number: 2
        And the user adds the text "2" in selected cell and hits tab key
        And the user selects cell with column header: "% or amount" and row number: 3
        And the user adds the text "100" in selected cell and hits tab key

    Scenario: 4. Criar Orçamento (GESSQH)
        And the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"

    Scenario: 5. Validação das Taxas
        When the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with name: "Freight"
        And the value of the selected text field is "100.00"
        And the user selects the text field with name: "Total discount"
        And the value of the selected text field is "2.00"

    Scenario: 6. Criar Encomenda de Venda Direto (GESSOH) e Validar Frete e Desconto
        And the user clicks the "Order" button in the header
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        When the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with name: "Freight"
        And the value of the selected text field is "100.00"
        And the user selects the text field with name: "Total discount"
        And the value of the selected text field is "2.00"
        Then the user clicks the Close page action icon on the header panel
        Then the user clicks the Close page action icon on the header panel
        And the user waits 5 seconds

    Scenario: 7. Criar Novo Orçamento (GESSQH)
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
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK1ALL2_ARRAY_NBLIG"

    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK1ALL2_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_GROPRI"
        And the user adds the text <GROPRI> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   |
            | 1   | "BMS001" | "1" | "100.00" |

    Scenario: 8. Elementos de Faturação Desconto e Frete
        And the user selects the data table of section: "Invoicing elements"
        And the user selects cell with column header: "% or amount" and row number: 2
        And the user adds the text "2" in selected cell and hits tab key
        And the user selects cell with column header: "% or amount" and row number: 3
        And the user adds the text "100" in selected cell and hits tab key

    Scenario: 9. Criar Novo Orçamento (GESSQH), Sair da Função, Retornar e criar Encomenda
        And the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "SQH0_SQHNUM"
        And the user stores the value of the selected text field with the key: "SQHNUM"
        Then the user clicks the Close page action icon on the header panel
        And the user waits 5 seconds
        Given the user opens the "GESSQH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales quote ALL : Full entry" screen is displayed
        Given the user clicks the "Quotes" link on the left panel
        When the user selects the data table of left panel
        Then the user selects search cell with header: "Quote no."
        And the user adds the stored text with key "SQHNUM" in selected cell and hits enter key
        And the user selects cell that matches exact with the stored text with the key: "SQHNUM" and column header: "Quote no."
        And the user clicks on the selected cell

    Scenario: 10. Criar Encomenda de Venda (GESSOH) e Validar Frete e Desconto
        And the user clicks the "Order" button in the header
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        When the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with name: "Freight"
        And the value of the selected text field is "100.00"
        And the user selects the text field with name: "Total discount"
        And the value of the selected text field is "2.00"
        Then the user clicks the Close page action icon on the header panel
        Then the user clicks the Close page action icon on the header panel

    Scenario: 11. Logout
        And the user logs-out from the system





