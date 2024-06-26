###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-170
# - Description: Carta de correção deve habilitar a exclusão quando não estiver validada
# - Jira: X3DEV-5511
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 17/06/2024
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-170

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. Fatura de Venda
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SIH0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_SIVTYP"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_BPCINV"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSIH0_CODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell
        And the user hits enter
        Examples:
            | LIN | ITMREF   | QTY | GROPRI   | XQCFOP | XQOICMS | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "1" | "100.00" | "6101" | "0"     | "00"      | "999"  |

    Scenario: 003. Criar Documento
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 004.Resume - Transmission and Validation
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "SIH0_XQSTATUSNFE"
        #And the value of the selected text field is "Autorizado o uso da nota"
        And the value of the selected text field is "Authorized invoice"
        And the user clicks the "Post" button in the header
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user stores the value of the selected text field with the key: "SIHNUM"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 005. GESXQAMEND Carta de Correção
        Given the user opens the "GESXQAMEND" function
        Then the "Invoice amendment" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "XQAMEND0_CPY"
        And the user writes "BR10" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQAMEND0_FCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the drop down list with X3 field name: "XQAMEND0_DOCTYP"
        #When the user clicks on "Sales invoices (SIH)" option of the selected drop down list
        #Then the value of the selected drop down list is "Sales invoices (SIH)"
        #Para o ambiente ATP-QA o drop down está no Plural
        When the user clicks on "Sales Invoice (SIH)" option of the selected drop down list
        Then the value of the selected drop down list is "Sales Invoice (SIH)"
        And the user selects the text field with X3 field name: "XQAMEND0_DOCNUM"
        And the user writes the stored text with key "SIHNUM" in the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQAMEND1_AMENDTEXT"
        And the user writes "TESTE DE CARTA DE CORREÇÃO NÃO PERMITIR EXCLUIR APÓS VALIDAR" to the selected text area

    Scenario: 006. XQAMEND Criado
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 007. Transmissão Carta de Correção e Não permitir Deletar
        Given the user clicks the "SEFAZ Communication" button in the header
        And an alert box with the text containing "Warning! This request cannot be reverted! Confirm the invoice amendment of the invoice:" appears
        And the user clicks the "Yes" opinion in the alert box
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Invoice Amendment processed"
        And the user clicks the "Close page" main action button on the right panel
        And the user waits 3 seconds
        And the "Delete" main action button on the right panel is disabled

    Scenario: 008. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system