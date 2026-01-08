###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-186 - Reforma Tributaria - Cenario Completo de Vendas - SOH > SDH > SIH
# - OBS: Este cenário está considerando a tributação integral e não informado elementos de faturação
# - Jira: X3DEV-8402
# - Created by: Gustavo Albanus
# - Created date: 16/09/2025
# - Updated by:
# - Updated date:
# - Status: Done
# - Parametrizações: RTAX 1020 / Cliente BR016
###########################################################################

Feature: ATP-186

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. ENCOMENDA DE VENDA GESSOH
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
        And the user writes "BR016" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    Scenario Outline: 003. Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK2ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCSTIS"
        And the user adds the text <XQCSTIS> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCCTIS"
        And the user adds the text <XQCCTIS> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCSTCBS"
        And the user adds the text <XQCSTCBS> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCCTCBS"
        And the user adds the text <XQCCTCBS> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI    | XQCFOP | XQCSTIS | XQCCTIS  | XQCSTCBS | XQCCTCBS |
            | 1   | "BMS001" | "1" | "1000.00" | "6102" | "000"   | "000001" | "000"    | "000001" |

    Scenario: 004. CRIAR ENCOMENDA DE VENDA
        And the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        And the user waits 2 seconds

    Scenario: 005. Validação Impostos Encomenda SOH
        When the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with name: "Base cálculo IS"
        And the value of the selected text field is "1,000.00"
        Then the user selects the text field with name: "Valor IS"
        And the value of the selected text field is "10.00"
        And the user selects the text field with name: "Base cálculo CBS"
        And the value of the selected text field is "1,000.00"
        And the user selects the text field with name: "Valor CBS"
        And the value of the selected text field is "9.00"
        And the user selects the text field with name: "Base cálculo IBS Mun."
        And the value of the selected text field is ""
        And the user selects the text field with name: "Valor IBS Mun."
        And the value of the selected text field is ""
        And the user selects the text field with name: "Base cálculo IBS Est."
        And the value of the selected text field is "1,000.00"
        And the user selects the text field with name: "Valor IBS Est."
        And the value of the selected text field is "1.00"
        And the user selects the text field with X3 field name: "WK2ALLXQ0_SOHNUM"
        And the user stores the value of the selected text field with the key: "SOHNUM"
        Then the user clicks the Close page action icon on the header panel
        And the user waits 2 seconds

    Scenario: 006. EXPEDIÇÃO DE VENDA GESSDH
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WK4ALLXQ0_STOFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SDHTYP"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_BPCORD"
        And the user writes "BR016" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ3_CODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape

    Scenario: 007. Picking SOH>SDH
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Delivery preloading filter" screen is displayed
        And the user selects the text field with X3 field name: "SCRITSDH_CRISOHNUM"
        And the user writes the stored text with key "SOHNUM" in the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        And the user clicks the "Order selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SOHNUM" and with the text containing "BR016" of the picking list panel
        And the user checks the selected picking list panel item

    Scenario: 008. Criar Expedição
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 009. Validação Impostos Expedição SDH
        When the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with name: "Base cálculo IS"
        And the value of the selected text field is "1,000.00"
        Then the user selects the text field with name: "Valor IS"
        And the value of the selected text field is "10.00"
        And the user selects the text field with name: "Base cálculo CBS"
        And the value of the selected text field is "1,000.00"
        And the user selects the text field with name: "Valor CBS"
        And the value of the selected text field is "9.00"
        And the user selects the text field with name: "Base cálculo IBS Mun."
        And the value of the selected text field is ""
        And the user selects the text field with name: "Valor IBS Mun."
        And the value of the selected text field is ""
        And the user selects the text field with name: "Base cálculo IBS Est."
        And the value of the selected text field is "1,000.00"
        And the user selects the text field with name: "Valor IBS Est."
        And the value of the selected text field is "1.00"
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SDHNUM"
        And the user stores the value of the selected text field with the key: "SDHNUM"
        Then the user clicks the "Validation" button in the header
        And a dialog box appears
        And the user clicks the "Ok" opinion in the alert box
        Then the user clicks the Close page action icon on the header panel
        And the user waits 2 seconds

    Scenario: 010. FATURA DE VENDA SIH
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WK5ALLXQ0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ0_SIVTYP"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ0_BPCINV"
        And the user writes "BR016" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ3_CODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape

    Scenario: 011. Picking SDH>SIH
        Given the user selects the data table of left panel
        When the user clicks the "Delivery selection" link on the left panel
        Then the user selects search cell with header: "Delivery"
        And the user adds the stored text with key "SDHNUM" in selected cell and hits enter key
        And the user selects cell that matches exact with the stored text with the key: "SDHNUM" and column header: "Delivery"
        And the user clicks on the selected cell

    Scenario: 012. Criar Fatura
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 013. Validação Impostos Fatura de Venda SIH
        When the user clicks the "NF-e Summary" tab selected by title
        Then the user selects the text field with name: "Base cálculo IS"
        And the value of the selected text field is "1,000.00"
        Then the user selects the text field with name: "Valor IS"
        And the value of the selected text field is "10.00"
        And the user selects the text field with name: "Base cálculo CBS"
        And the value of the selected text field is "1,000.00"
        And the user selects the text field with name: "Valor CBS"
        And the value of the selected text field is "9.00"
        And the user selects the text field with name: "Base cálculo IBS Mun."
        And the value of the selected text field is ""
        And the user selects the text field with name: "Valor IBS Mun."
        And the value of the selected text field is ""
        And the user selects the text field with name: "Base cálculo IBS Est."
        And the value of the selected text field is "1,000.00"
        And the user selects the text field with name: "Valor IBS Est."
        And the value of the selected text field is "1.00"

    Scenario: 014. Transmissão SEFAZ
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "WK5ALLXQ0_XQSTATUSNFE"
        And the value of the selected text field is "Authorized invoice"
        And the user selects the text field with X3 field name: "WK5ALLXQ0_NUM"
        And the user stores the value of the selected text field with the key: "SIH_NUM"
        Then the user clicks the Close page action icon on the header panel
        And the user waits 2 seconds

    Scenario: 015. Validar Tags no XML
        Given the user opens the "XQCONSNFE" function
        And the "NF-e Monitoring" screen is displayed
        When the user selects the text field with X3 field name: "XQNFEMNT0_NUMDOC"
        And the user writes the stored text with key "SIH_NUM" in the selected text field and hits tab key
        And the user clicks the "Search" button in the header
        And the user waits 3 seconds
        Then the user selects the data table with x3 field name: "XQNFEMNT1_ARRAY_NBLIG"
        And the user selects first row of the selected data table
        Given the user opens "NF-e log" function on toolbox of the selected row
        When the user selects the data table with x3 field name: "XQNFELOG1_ARRAY_NBLIG"
        #And the user selects row by multiple criteria that has the text "NFe Authorization" in column with header: "Event" and the text "104" in column with header: "SEFAZ Ret. Code"
        Then the user selects row that has the text "104" in column with header: "SEFAZ Ret. Code"
        And the user selects cell with header: "Event" of selected row
        And the user clicks on the selected cell
        And the user selects the text field with X3 field name: "XQNFELOG1_NFEXMLT"
        And the value of the selected text field contains "<vBCIS>1000.00</vBCIS>"
        And the value of the selected text field contains "<vIS>10.00</vIS>"
        And the value of the selected text field contains "<CST>000</CST>"
        And the value of the selected text field contains "<cClassTrib>000001</cClassTrib>"
        And the value of the selected text field contains "<vIBSUF>1.00</vIBSUF>"
        And the value of the selected text field contains "<vCBS>9.00</vCBS>"
        And the value of the selected text field contains "<vBCIBSCBS>1000.00</vBCIBSCBS>"

    Scenario: 016. Logout
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
