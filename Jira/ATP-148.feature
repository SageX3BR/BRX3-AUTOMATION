##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-148
# - Description: ISS deve considerar o valor correto na Transmissão da Fatura Sem Arredondamento
# - JIRA: X3DEV-6932
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 27/01/2025
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-148

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. Create a Invoice
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "200" to the selected text field
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    Scenario Outline: Inserir Linha de Serviço
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQSTISS"
        And the user adds the text <XQSTISS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQEXISS"
        Then the user adds the text <XQEXISS> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI      | XQSTISS | XQEXISS |
            | 1   | "SER005" | "1" | "28140.99"  | "1"     | "1"     |
            | 2   | "SER005" | "1" | "37521.32"  | "1"     | "1"     |
            | 3   | "SER005" | "1" | "9380.33"   | "1"     | "1"     |
            | 4   | "SER005" | "1" | "112563.94" | "1"     | "1"     |

    Scenario: 003. Create
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 004. Verificar Cálculo de Impostos
        Given the user clicks the "NF-e Summary" tab selected by title
        And the user selects the text field with name: "ISS value"
        And the value of the selected text field is "3,752.13"

    Scenario: 005. Transmissão NFS-e
        Given the user clicks the "Transmit RPS" action button on the header drop down
        When a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Código: 100 - Autorizado."
        Then the user clicks the Close page action icon on the header panel
        Given the user selects the text field with X3 field name: "WK5INVCAXQ0_NUM"
        Then the user stores the value of the selected text field with the key: "SIH_NUM"
        And the user clicks the Close page action icon on the header panel

    Scenario: 006. Validação do RPS
        Given the user opens the "CONSXQRPS" function
        Given the user selects the radio buttons group with X3 field name: "XQRPSMT1_STATUSGRP"
        Then the radio button "Authorized/Rejected" of the selected radio buttons group is enabled
        And the user selects the text field with X3 field name: "XQRPSMT1_FCY"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQRPSMT1_NUM"
        And the user writes the stored text with key "SIH_NUM" in the selected text field and hits tab key
        Then the user clicks the "Search" button in the header
        Given the user selects the data table with x3 field name: "XQRPSMT1_ARRAY_NBLIG"
        When the user selects first row of the selected data table
        Then the user selects cell with header: "Selection" of selected row
        And the user clicks on the selected cell
        And the user opens "NFS-e Log" function on toolbox of the selected row
        And the user selects the data table of section: "NFS-e Log"
        And the user selects first row of the selected data table
        And the user opens "Request data" function on toolbox of the selected row
        And the user selects the text field with X3 field name: "XQRPSJSON_JSON"
        And the value of the selected text field contains "ValISS": "3752.13"
        And the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel

    Scenario: 007. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system