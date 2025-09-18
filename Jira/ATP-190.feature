###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-190 - Reforma Tributaria - Cenario Completo de Compras - POH > PTH > PIH
# - OBS: Este cenário está considerando a tributação integral e informado elementos de faturação Frete e Desconto
# - Jira: X3DEV-8318
# - Created by: Gustavo Albanus
# - Created date: 16/09/2025
# - Updated by:
# - Updated date:
# - Status: Done
# - Parametrizações: RTAX 1022 / Cliente BR016
###########################################################################

Feature: ATP-190

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. ENCOMENDA DE COMPRA POH
        Given the user opens the "GESPOH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase order ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Order site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR016" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        Then the user writes "110" to the selected text field and hits tab key


    Scenario Outline: 003. Inserir Linha
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"
        Given the user selects editable table row number: 1
        And the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text "BMS001" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text "1" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_GROPRI"
        And the user adds the text "600.00" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCFOP"
        And the user adds the text "2102" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQVARCFOP"
        And the user adds the text "5" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCSTIS"
        And the user adds the text "000" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCCTIS"
        And the user adds the text "000001" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCSTCBS"
        And the user adds the text "000" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCCTCBS"
        And the user adds the text "000001" in selected cell and hits enter key

        Given the user selects editable table row number: 2
        And the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text "BMS001" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text "1" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_GROPRI"
        And the user adds the text "400.00" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCFOP"
        And the user adds the text "2102" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQVARCFOP"
        And the user adds the text "5" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCSTIS"
        And the user adds the text "000" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCCTIS"
        And the user adds the text "000001" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCSTCBS"
        And the user adds the text "000" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCCTCBS"
        And the user adds the text "000001" in selected cell and hits enter key

    Scenario: 004. Elementos de Faturação e Criar POH
        And the user selects the data table of section: "Invoicing elements"
        And the user selects cell with column header: "% or amount" and row number: 1
        And the user adds the text "1" in selected cell and hits tab key
        And the user selects cell with column header: "% or amount" and row number: 2
        And the user adds the text "200" in selected cell and hits tab key
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 005. Validação Impostos Encomenda POH
        When the user clicks the "Resume" tab selected by title
        Then the user selects the text field with name: "Products total value"
        And the value of the selected text field is "1,000.00"
        Then the user selects the text field with name: "Discount total value"
        And the value of the selected text field is "10.00"
        Then the user selects the text field with name: "Freight"
        And the value of the selected text field is "200.00"
        Then the user selects the text field with name: "Base cálculo IS"
        And the value of the selected text field is "1,190.00"
        Then the user selects the text field with name: "Valor IS"
        And the value of the selected text field is "5.95"
        And the user selects the text field with name: "Base cálculo CBS"
        And the value of the selected text field is "1,190.00"
        And the user selects the text field with name: "Valor CBS"
        And the value of the selected text field is "10.71"
        And the user selects the text field with name: "Base cálculo IBS Mun."
        And the value of the selected text field is "1,190.00"
        And the user selects the text field with name: "Valor IBS Mun."
        And the value of the selected text field is "1.19"
        And the user selects the text field with name: "Base cálculo IBS Est."
        And the value of the selected text field is "1,190.00"
        And the user selects the text field with name: "Valor IBS Est."
        And the value of the selected text field is "2.38"
        And the user selects the text field with X3 field name: "WE3ALLXQ0_POHNUM"
        And the user stores the value of the selected text field with the key: "POHNUM"
        Then the user clicks the Close page action icon on the header panel
        And the user waits 2 seconds

    Scenario: 006. RECEPÇÃO DE COMPRA PTH
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR016" to the selected text field and hits tab key
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key

    Scenario: 007. Picking POH > PTH
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Preloading Criteria" screen is displayed
        And the user selects the text field with name: "Order no."
        And the user writes the stored text with key "POHNUM" in the selected text field
        And the user clicks the "OK" button in the header
        And the user clicks the "Order selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "POHNUM" and with the text containing "BR01" of the picking list panel
        And the user checks the selected picking list panel item
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "No" opinion in the alert box
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 008. Validação Impostos Recepção PTH
        When the user clicks the "Resume" tab selected by title
        Then the user selects the text field with name: "Products total value"
        And the value of the selected text field is "1,000.00"
        Then the user selects the text field with name: "Discount total value"
        And the value of the selected text field is "10.00"
        Then the user selects the text field with name: "Freight"
        And the value of the selected text field is "200.00"
        Then the user selects the text field with name: "Base cálculo IS"
        And the value of the selected text field is "1,190.00"
        Then the user selects the text field with name: "Valor IS"
        And the value of the selected text field is "5.95"
        And the user selects the text field with name: "Base cálculo CBS"
        And the value of the selected text field is "1,190.00"
        And the user selects the text field with name: "Valor CBS"
        And the value of the selected text field is "10.71"
        And the user selects the text field with name: "Base cálculo IBS Mun."
        And the value of the selected text field is "1,190.00"
        And the user selects the text field with name: "Valor IBS Mun."
        And the value of the selected text field is "1.19"
        And the user selects the text field with name: "Base cálculo IBS Est."
        And the value of the selected text field is "1,190.00"
        And the user selects the text field with name: "Valor IBS Est."
        And the value of the selected text field is "2.38"
        And the user selects the text field with X3 field name: "WE6ALL0_PTHNUM"
        And the user stores the value of the selected text field with the key: "PTHNUM"
        Then the user clicks the Close page action icon on the header panel
        And the user waits 2 seconds

    Scenario: 009. FATURA DE COMPRA GESPIH
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR016" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL0_BPRSAC"
        And the user writes "FORN" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key

    Scenario: 010. Picking PTH > PIH
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Enter selection criteria" screen is displayed
        And the user selects the text field with name: "Receipt no."
        And the user writes the stored text with key "PTHNUM" in the selected text field
        And the user clicks the "OK" button in the header
        And the user clicks the "Receipt selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "PTHNUM" and with the text containing "BR01" of the picking list panel
        And the user checks the selected picking list panel item
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "No" opinion in the alert box
        And the user stores the generated value with length 6 with the key "ALEATORIO"
        And the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "ALEATORIO" in the selected text field

    Scenario: 011. Controle, Elementos de Faturação PIH e Criar
        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL3_CUMLINAMT1"
        And the user stores the value of the selected text field with the key: "CALCVALUE"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE" in the selected text field and hits tab key
        Given the user selects the fixed data table for x3 field name: "WE8ALL4_ARRAY_NBFAC"
        When the user selects cell with column header: "Entry amount" and row number: (1)
        And the user adds the text "10.00" in selected cell and hits tab key
        When the user selects cell with column header: "Entry amount" and row number: (2)
        And the user adds the text "200.00" in selected cell and hits tab key
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user waits 2 seconds

    Scenario: 012. Validação Impostos Fatura PIH
        When the user clicks the "Resume" tab selected by title
        Then the user selects the text field with name: "Products total value"
        And the value of the selected text field is "1,000.00"
        Then the user selects the text field with name: "Discount total value"
        And the value of the selected text field is "10.00"
        Then the user selects the text field with name: "Freight"
        And the value of the selected text field is "200.00"
        Then the user selects the text field with name: "Base cálculo IS"
        And the value of the selected text field is "1,190.00"
        Then the user selects the text field with name: "Valor IS"
        And the value of the selected text field is "5.95"
        And the user selects the text field with name: "Base cálculo CBS"
        And the value of the selected text field is "1,190.00"
        And the user selects the text field with name: "Valor CBS"
        And the value of the selected text field is "10.71"
        And the user selects the text field with name: "Base cálculo IBS Mun."
        And the value of the selected text field is "1,190.00"
        And the user selects the text field with name: "Valor IBS Mun."
        And the value of the selected text field is "1.19"
        And the user selects the text field with name: "Base cálculo IBS Est."
        And the value of the selected text field is "1,190.00"
        And the user selects the text field with name: "Valor IBS Est."
        And the value of the selected text field is "2.38"
        And the user waits 2 seconds

    Scenario: 013. Transmissão Fatura de Compra PIH
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        #Verificar status da nota (6 = Autorizada)
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "[F:XQPIH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the "Post" button in the header
        And the user clicks the "Ok" opinion in the alert box
        And the user clicks the "Ok" opinion in the alert box
        And the user selects the text field with X3 field name: "WE8ALL0_NUM"
        And the user stores the value of the selected text field with the key: "PIHNUM"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 014. Validar Tags no XML
        Given the user opens the "XQCONSNFE" function
        And the "NF-e Monitoring" screen is displayed
        When the user selects the text field with X3 field name: "XQNFEMNT0_NUMDOC"
        And the user writes the stored text with key "PIHNUM" in the selected text field and hits tab key
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
        And the value of the selected text field contains "<vIS>5.95</vIS>"
        And the value of the selected text field contains "<vIBSUF>2.38</vIBSUF>"
        And the value of the selected text field contains "<vIBSMun>1.19</vIBSMun>"
        And the value of the selected text field contains "<vCBS>10.71</vCBS>"

    Scenario: 015. Logout
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system