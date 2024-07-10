###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-153
# - Description: Sistema disponibiliza a opção do usuário inserir os dados de transporte no Orçamento de Venda
# - OBS: Teste efetuado pelo picking do Orçamento na Encomenda
# - Jira: X3DEV-4429
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 08/02/2024
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-153

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. TESTE 01 - Orçamento Pelo Header
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
        And the user writes "BR150" to the selected text field and hits tab key
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

    Scenario: 3. Dados de Transporte
        Given the user clicks the "Shipping data" tab selected by title
        And the user selects the drop down list with name: "Paid freight"
        And the user clicks on "0 - Contratação do Frete por conta do Remetente (CIF)" option of the selected drop down list
        When the user selects the text field with name: "Carrier"
        And the user writes "AO201" to the selected text field and hits tab key
        When the user selects the text field with name: "Shipment method"
        And the user writes "ES03" to the selected text field and hits tab key
        When the user selects the text field with name: "License plate"
        And the user writes "ABC33313" to the selected text field and hits tab key
        When the user selects the text field with name: "License plate state"
        And the user writes "SP" to the selected text field and hits tab key

    Scenario: 4. Create Orçamento (GESSQH)
        And the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "SQH0_SQHNUM"
        And the user stores the value of the selected text field with the key: "SQHNUM"
        Then the user clicks the Close page action icon on the header panel


    Scenario: 5. Create Encomenda (GESSOH)
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
        And the user writes "BR150" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key
        And the user clicks the "Quote selection" link on the left panel
        And the user selects the main picking list panel of the screen

        And the user selects the item with the stored text with key "SQHNUM" and with the text containing "BR150" of the picking list panel
        And the user checks the selected picking list panel item
        And the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        And the user waits 5 seconds
        Given the user clicks the "Shipping data" tab selected by title
        Then the user selects the drop down list with name: "Paid freight"
        And the value of the selected drop down list is "0 - Contratação do Frete por conta do Remetente (CIF)"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 6. Logout
        And the user logs-out from the system