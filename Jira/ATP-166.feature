###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-166
# - Description: Elementos de faturação Desconto % e R$ e frete preenchido na Encomenda, Expedição e Fatura de Venda
# - Jira: X3DEV-5369
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 10/06/2024
# - Updated by : Gustavo Albanus
# - Updated date : 07/08/2024
# - Status : Done
# - Ajustes Efetuados: Ajustado a Variação da CFOP
###########################################################################

Feature: ATP-166

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. GESSOH Creation
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
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    Scenario Outline: Add Lines GESSOH
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK2ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI    | XQCFOP |
            | 1   | "BMS001" | "1" | "1000.00" | "6102" |

    Scenario: 3. Document Creation
        And the user selects the data table of section: "Invoicing elements"
        And the user selects cell with column header: "% or amount" and row number: 2
        And the user adds the text "20" in selected cell and hits tab key
        And the user selects cell with column header: "% or amount" and row number: 3
        And the user adds the text "10.00" in selected cell and hits tab key
        And the user selects cell with column header: "% or amount" and row number: 9
        And the user adds the text "5.00" in selected cell and hits tab key
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 4. Validation of Taxes
        When the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with name: "Total discount"
        And the value of the selected text field is "205.00"
        Then the user selects the text field with name: "Freight"
        And the value of the selected text field is "10.00"
        And the user clicks the Close page action icon on the header panel

    Scenario: 5. GESSDH Creation
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed

        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WK4ALLXQ0__STOFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SDHTYP"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_BPCORD"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQWK4ALLXQ0_CODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape
        When the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario Outline: 6. Add Lines GESSDH
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
            | LIN | ITMREF   | QTY | GROPRI  | XQCFOP |
            | 1   | "BMS001" | "1" | "50.00" | "6102" |

    Scenario: 7. Discount and Create GESSDH
        And the user selects the data table of section: "Invoicing elements"
        And the user selects cell with column header: "% or amount" and row number: 2
        And the user adds the text "20" in selected cell and hits tab key
        And the user selects cell with column header: "% or amount" and row number: 3
        And the user adds the text "10.00" in selected cell and hits tab key
        And the user selects cell with column header: "% or amount" and row number: 9
        And the user adds the text "5.00" in selected cell and hits tab key
        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 8. Validation of Taxes
        When the user clicks the "Tax Summary" tab selected by title
        #Then the user selects the text field with name: "Total discount"
        #And the value of the selected text field is "205.00"
        Then the user selects the text field with name: "Freight"
        And the value of the selected text field is "10.00"
        And the user clicks the Close page action icon on the header panel

    Scenario: 9. GESSIH
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape
        And the user selects the data table of section: "Invoicing elements"
        And the user selects cell with column header: "% or amount" and row number: 2
        And the user adds the text "20" in selected cell and hits tab key
        And the user selects cell with column header: "% or amount" and row number: 3
        And the user adds the text "10.00" in selected cell and hits tab key
        And the user selects cell with column header: "% or amount" and row number: 9
        And the user adds the text "5.00" in selected cell and hits tab key

    Scenario Outline: 10. Add Lines GESSIH
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY | GROPRI    | XQCFOP | XQVARCFOP |
            | 1   | "BMS001" | "1" | "1000.00" | "6102" | ""        |

    Scenario: 11. Document Creation and validation
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 12. Validation of Taxes
        Given the user clicks the "NF-e Summary" tab selected by title
        Then the user selects the text field with name: "Total discount"
        And the value of the selected text field is "205.00"
        Then the user selects the text field with name: "Freight"
        And the value of the selected text field is "10.00"

    Scenario: 13. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system