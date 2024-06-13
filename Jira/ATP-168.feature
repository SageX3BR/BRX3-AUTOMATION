###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-168
# - Description: Ao fazer Picking de mais de 1 Encomenda de Vendas (SOH) na Expedição de Vendas não carrega todas as observações
# - Jira: X3DEV-5265
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 16/05/2024
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-168

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. GESSOH
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
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK2ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   |
            | 1   | "BMS001" | "1" | "100.00" |

    Scenario: 003. Create SOH
        When the user clicks the "Tax Summary" tab selected by title
        Given the user selects the text field with X3 field name: "WK2ALLXQ_OBSADIC"
        Then the user writes "TESTE DE CONCATENAR AS OBSERVAÇÕES CONFORME O TICKET X3DEV-5434" to the selected text area
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WK2ALL1_ALLSTA"
        And the value of the selected text field is "Allocated"

        #And the user clicks the "Allocation" action button on the header drop down
        #And the "Order allocations" screen is displayed
        #And the user clicks the Close page action icon on the header panel
        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user stores the value of the selected text field with the key: "DOC01"
        And the user waits 3 seconds

    Scenario: 004. GESSOH COPY
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRSON" to the selected text field and hits tab key
        And the user selects the text field with name: "Sold-to"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK2ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   |
            | 1   | "BMS001" | "1" | "100.00" |

    Scenario: 005. Create SOH COPY
        When the user clicks the "Tax Summary" tab selected by title
        Given the user selects the text field with X3 field name: "WK2ALLXQ_OBSADIC"
        Then the user writes "X3 É UM SISTEMA BEM LEGAL" to the selected text area
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WK2ALL1_ALLSTA"
        And the value of the selected text field is "Allocated"
        #And the user clicks the "Allocation" action button on the header drop down
        #And the "Order allocations" screen is displayed
        #And the user clicks the Close page action icon on the header panel

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user stores the value of the selected text field with the key: "DOC02"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 006. Create a Delivery
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Ship-to"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key

        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Delivery preloading filter" screen is displayed
        And the user selects the text field with X3 field name: "SCRITSDH_CRISOHNUM"
        And the user writes the stored text with key "DOC01" in the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        And the user clicks the "Order selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "DOC01" and with the text containing "BR011" of the picking list panel
        And the user checks the selected picking list panel item

        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user waits 10 seconds

        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Delivery preloading filter" screen is displayed
        And the user selects the text field with X3 field name: "SCRITSDH_CRISOHNUM"
        And the user writes the stored text with key "DOC02" in the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        And the user clicks the "Order selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "DOC02" and with the text containing "BR011" of the picking list panel
        And the user checks the selected picking list panel item
        When the user clicks the "Save" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been modified"

    Scenario: 007. Validation of Taxes
        When the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with name: "Additional Observations"
        Then the value of the selected text area contains
            """
            TESTE DE CONCATENAR AS OBSERVAÇÕES CONFORME O TICKET X3DEV-5434
            X3 É UM SISTEMA BEM LEGAL
            """
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 008. Logout
        And the user logs-out from the system




