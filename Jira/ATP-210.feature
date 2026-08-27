###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-210 - IBS/CBS - Cenario Completo de Vendas para Serviço - SOH > SIH
# - Jira: X3DEV-11987
# - Created by: Gustavo Albanus
# - Created date: 26/08/2026
# - Updated by:
# - Updated date:
# - Status: Done
# - Parametrizações:
###########################################################################

Feature: ATP-210

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. Create a Sales quote
        Given the user opens the "GESSQH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales quote ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with name: "Quote type"
        And the user writes "SQH" to the selected text field and hits tab key
        And the user selects the text field with name: "Customer"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "200" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK1ALL2_ARRAY_NBLIG"

    Scenario Outline: Add Lines SQH
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK1ALL2_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_XQSTISS"
        And the user adds the text <XQSTISS> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_XQEXISS"
        And the user adds the text <XQEXISS> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI    | XQSTISS | XQEXISS |
            | 1   | "SER001" | "1" | "2000.00" | "1"     | "1"     |

    Scenario: 003. Create and Validation of Taxes
        And the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        And the user waits 2 seconds
        When the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with name: "Base cálculo CBS"
        And the value of the selected text field is "2,000.00"
        Then the user selects the text field with name: "Valor CBS"
        And the value of the selected text field is "18.00"
        Then the user selects the text field with name: "Base cálculo IBS Est."
        And the value of the selected text field is "2,000.00"
        Then the user selects the text field with name: "Valor IBS Est."
        And the value of the selected text field is "2.00"
        And the user clicks the Close page action icon on the header panel
        And the user waits 2 seconds

    Scenario: 004. Create a Sales order
        Given the user opens the "GESSOH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRSOI" to the selected text field and hits tab key
        And the user selects the text field with name: "Sold-to"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "200" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    Scenario Outline: Add Lines SOH
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
        Then the user adds the text <XQEXISS> in selected cell and hits enter key
        Examples:
            | LIN | ITMREF   | QTY | GROPRI    | XQSTISS | XQEXISS |
            | 1   | "SER001" | "1" | "2000.00" | "1"     | "1"     |

    Scenario: 004. Create document
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        When the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with name: "Base cálculo CBS"
        And the value of the selected text field is "2,000.00"
        Then the user selects the text field with name: "Valor CBS"
        And the value of the selected text field is "18.00"
        Then the user selects the text field with name: "Base cálculo IBS Est."
        And the value of the selected text field is "2,000.00"
        Then the user selects the text field with name: "Valor IBS Est."
        And the value of the selected text field is "2.00"
        And the user clicks the Close page action icon on the header panel
        And the user waits 2 seconds

    Scenario: 005. Criar a SIH
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        #Cabeçalho
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

    Scenario: 006. Inserir Linha de Serviço SIH
        Given the user selects editable table row number: 1
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text "SER001" in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text "1" in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text "2000" in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQSTISS"
        And the user adds the text "1" in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQEXISS"
        Then the user adds the text "1" in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCODINDOP"
        Then the user adds the text "100301" in selected cell and hits enter key
        And the user clicks the "Create" main action button on the right panel

    Scenario: 007. Validar resumo de impostos
        When the user clicks the "NF-e Summary" tab selected by title
        Then the user selects the text field with name: "Base cálculo CBS"
        And the value of the selected text field is "2,000.00"
        Then the user selects the text field with name: "Valor CBS"
        And the value of the selected text field is "18.00"
        Then the user selects the text field with name: "Base cálculo IBS Est."
        And the value of the selected text field is "2,000.00"
        Then the user selects the text field with name: "Valor IBS Est."
        And the value of the selected text field is "2.00"

    Scenario: 008. Transmissão NFS-e
        And the user waits 2 seconds
        Given the user clicks the "Transmit RPS" action button on the header drop down
        When a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Código: 100 - Autorizado."
        Then the user clicks the Close page action icon on the header panel
        Given the user selects the text field with X3 field name: "WK5ALLXQ0_NUM"
        Then the user stores the value of the selected text field with the key: "SIH_NUM"
        And the user clicks the Close page action icon on the header panel

    Scenario: 009. Validação do RPS
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
        #And the user selects editable table row number: 7
        And the user opens "Request data" function on toolbox of the selected row
        And the user selects the text field with X3 field name: "XQRPSJSON_JSON"
        And the value of the selected text field contains ""ValBCIBSCBS": 2000.0"
        And the value of the selected text field contains ""ValCBS": 18.0"
        And the value of the selected text field contains ""ValIBSUF": 2.0"
        And the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel

    Scenario: 010. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system