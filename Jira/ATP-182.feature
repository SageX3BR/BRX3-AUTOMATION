###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-182 - Dedução do ICMS + DIFAL da BC PIS COFINS Em Todos os Docs de Vendas - SQH > SOH > SDH > SIH
# - OBS: Teste através de Picking, com Elementos de Faturação Frete e Desconto, Com Transmissão e Validação da Tag vBC para o PIS/COFINS
# - Jira: X3DEV-8593
# - Created by: Gustavo Albanus
# - Created date: 22/08/2025
# - Updated by:
# - Updated date:
# - Status: Done
# - Parametrizações: RTAX 1019 / CFOP 6102 Variação 8 /
###########################################################################

Feature: ATP-182

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. Criar Orçamento (GESSQH)
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
        And the user writes "BR004" to the selected text field and hits tab key
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
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK1ALL2_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI    | XQCFOP | XQVARCFOP | XQCSTICMS |
            | 1   | "BMS001" | "1" | "1000.00" | "6102" | "8"       | "00"      |

    Scenario: 003. Elementos de Faturação Desconto e Frete
        And the user selects the data table of section: "Invoicing elements"
        And the user selects cell with column header: "% or amount" and row number: 2
        And the user adds the text "2" in selected cell and hits tab key
        And the user selects cell with column header: "% or amount" and row number: 3
        And the user adds the text "100" in selected cell and hits tab key

    Scenario: 004. Criar Orçamento (GESSQH)
        And the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"

    Scenario: 005. Validação Impostos Orçamento SQH
        When the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with name: "Products total value"
        And the value of the selected text field is "1,000.00"
        Then the user selects the text field with name: "Freight"
        And the value of the selected text field is "100.00"
        And the user selects the text field with name: "Total discount"
        And the value of the selected text field is "20.00"
        And the user selects the text field with name: "Invoice total value"
        And the value of the selected text field is "1,080.00"
        And the user selects the text field with name: "ICMS base total"
        And the value of the selected text field is "1,080.00"
        And the user selects the text field with name: "Operation ICMS value"
        And the value of the selected text field is "129.60"
        And the user selects the text field with name: "ICMS DIFAL value"
        And the value of the selected text field is "64.80"
        And the user selects the text field with name: "PIS base (R$)"
        And the value of the selected text field is "885.60"
        And the user selects the text field with name: "COFINS base (R$)"
        And the value of the selected text field is "885.60"

        And the user selects the text field with X3 field name: "WK1ALLXQ0_SQHNUM"
        And the user stores the value of the selected text field with the key: "SQHNUM"
        Then the user clicks the Close page action icon on the header panel
        And the user waits 2 seconds

    Scenario: 006. GESSOH
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
        And the user writes "BR004" to the selected text field and hits tab key
        And the user clicks the "Quote selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SQHNUM" and with the text containing "BR004" of the picking list panel
        And the user checks the selected picking list panel item
        And the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        And the user waits 2 seconds

    Scenario: 007. Validação Impostos Encomenda SOH
        When the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with name: "Products total value"
        And the value of the selected text field is "1,000.00"
        Then the user selects the text field with name: "Freight"
        And the value of the selected text field is "100.00"
        And the user selects the text field with name: "Total discount"
        And the value of the selected text field is "20.00"
        And the user selects the text field with name: "Total value of the order"
        And the value of the selected text field is "1,080.00"
        And the user selects the text field with name: "ICMS base total"
        And the value of the selected text field is "1,080.00"
        And the user selects the text field with name: "Operation ICMS value"
        And the value of the selected text field is "129.60"
        And the user selects the text field with name: "ICMS DIFAL value"
        And the value of the selected text field is "64.80"
        And the user selects the text field with name: "PIS base (R$)"
        And the value of the selected text field is "885.60"
        And the user selects the text field with name: "COFINS base (R$)"
        And the value of the selected text field is "885.60"

        And the user selects the text field with X3 field name: "WK2ALLXQ0_SOHNUM"
        And the user stores the value of the selected text field with the key: "SOHNUM"
        Then the user clicks the Close page action icon on the header panel
        And the user waits 2 seconds

    Scenario: 008. Criar GESSDH
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
        And the user writes "BR004" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ3_CODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape

    Scenario: 009. Picking SOH>SDH
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Delivery preloading filter" screen is displayed
        And the user selects the text field with X3 field name: "SCRITSDH_CRISOHNUM"
        And the user writes the stored text with key "SOHNUM" in the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        And the user clicks the "Order selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SOHNUM" and with the text containing "BR004" of the picking list panel
        And the user checks the selected picking list panel item

    Scenario: 010. Criar Expedição
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 011. Validação Impostos Expedição SDH
        When the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with name: "Products total value"
        And the value of the selected text field is "1,000.00"
        Then the user selects the text field with name: "Freight"
        And the value of the selected text field is "100.00"
        And the user selects the text field with name: "Total discount"
        And the value of the selected text field is "20.00"
        And the user selects the text field with name: "Total shipment value"
        And the value of the selected text field is "1,080.00"
        And the user selects the text field with name: "ICMS base total"
        And the value of the selected text field is "1,080.00"
        And the user selects the text field with name: "Operation ICMS value"
        And the value of the selected text field is "129.60"
        And the user selects the text field with name: "ICMS DIFAL value"
        And the value of the selected text field is "64.80"
        And the user selects the text field with name: "PIS base (R$)"
        And the value of the selected text field is "885.60"
        And the user selects the text field with name: "COFINS base (R$)"
        And the value of the selected text field is "885.60"

        And the user selects the text field with X3 field name: "WK4ALLXQ0_SDHNUM"
        And the user stores the value of the selected text field with the key: "SDHNUM"
        Then the user clicks the "Validation" button in the header
        And a dialog box appears
        And the user clicks the "Ok" opinion in the alert box
        Then the user clicks the Close page action icon on the header panel
        And the user waits 2 seconds

    Scenario: 012. Fatura de Venda SIH
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
        And the user writes "BR004" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ3_CODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape

    Scenario: 013. Picking SDH>SIH
        Given the user selects the data table of left panel
        When the user clicks the "Delivery selection" link on the left panel
        Then the user selects search cell with header: "Delivery"
        And the user adds the stored text with key "SDHNUM" in selected cell and hits enter key
        And the user selects cell that matches exact with the stored text with the key: "SDHNUM" and column header: "Delivery"
        And the user clicks on the selected cell

    Scenario: 014. Criar Fatura
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 015. Validação Impostos Fatura de Venda SIH
        When the user clicks the "NF-e Summary" tab selected by title
        Then the user selects the text field with name: "Products total value"
        And the value of the selected text field is "1,000.00"
        Then the user selects the text field with name: "Freight"
        And the value of the selected text field is "100.00"
        And the user selects the text field with name: "Total discount"
        And the value of the selected text field is "20.00"
        And the user selects the text field with name: "Invoice total value"
        And the value of the selected text field is "1,080.00"
        And the user selects the text field with name: "ICMS base total"
        And the value of the selected text field is "1,080.00"
        And the user selects the text field with name: "Operation ICMS value"
        And the value of the selected text field is "129.60"
        And the user selects the text field with name: "ICMS DIFAL value"
        And the value of the selected text field is "64.80"
        And the user selects the text field with name: "PIS base (R$)"
        And the value of the selected text field is "885.60"
        And the user selects the text field with name: "COFINS base (R$)"
        And the value of the selected text field is "885.60"

    Scenario: 016. Transmissão SEFAZ
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        #Verificar status da nota (6 = Autorizada)
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "[F:XQSIH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel
        And the user selects the text field with X3 field name: "WK5ALLXQ0_NUM"
        And the user stores the value of the selected text field with the key: "SIH_NUM"
        Then the user clicks the Close page action icon on the header panel
        And the user waits 2 seconds

    Scenario: 017. Validar Tags no XML
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
        And the value of the selected text field contains "<vBC>885.60</vBC>"

    Scenario: 018. Logout
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
