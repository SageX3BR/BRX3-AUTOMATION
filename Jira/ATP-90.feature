###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-90
# - Description: Criar Carta de Correção Selecionando Fatura de Venda
# - Jira:
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 24/10/2024
# - Updated by :
# - Updated date :
# - Status : Done
##########################################################################

Feature: ATP-90

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. GESSIH
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

    Scenario Outline: 003. Add Lines
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   |
            | 1   | "BMS001" | "1" | "100.00" |

    Scenario: 004. Document Creation and validation
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        Then the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        Then the user clicks the Close page action icon on the header panel
        And the user selects the text field with name: "Invoice no."
        And the user stores the value of the selected text field with the key: "SIHNUM"
        And the user clicks the Close page action icon on the header panel

    Scenario: 005. GESXQAMEND Carta de Correção
        Given the user opens the "GESXQAMEND" function
        Then the "Invoice amendment" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "XQAMEND0_CPY"
        And the user writes "BR10" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQAMEND0_FCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the drop down list with X3 field name: "XQAMEND0_DOCTYP"
        When the user clicks on "Sales Invoice (SIH)" option of the selected drop down list
        Then the value of the selected drop down list is "Sales Invoice (SIH)"
        And the user selects the text field with X3 field name: "XQAMEND0_DOCNUM"
        And the user writes the stored text with key "SIHNUM" in the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQAMEND1_AMENDTEXT"
        And the user writes "TESTE DE TRANSMISSÃO DA CARTA DE CORREÇÃO SELECIONANDO FATURA DE VENDA" to the selected text area

    Scenario: 010. XQAMEND Criado
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 011. Transmissão Carta de Correção
        Given the user clicks the "SEFAZ Communication" button in the header
        And an alert box with the text containing "Warning! This request cannot be reverted! Confirm the invoice amendment of the invoice:" appears
        And the user clicks the "Yes" opinion in the alert box
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Invoice Amendment processed"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 012. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system