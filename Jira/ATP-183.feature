###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-183
# - Description: Custo de Compras com conversão de Unidades - T>KG- POH > PTH > PIH - Com elementos de Faturação Frete e Desconto
# - Jira: X3DEV-8674
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 29/08/2025
# - Updated by :
# - Updated date :
# - Status : Done
# - Parametrizações: BMS118
###########################################################################

Feature: ATP-183

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. GESPOH
        Given the user opens the "GESPOH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase order ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Order site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        Then the user writes "110" to the selected text field and hits tab key

    Scenario Outline: 003. Linhas GESPOH
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"
        Given the user selects editable table row number: 1
        And the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text "BMS118" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text "4" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_GROPRI"
        And the user adds the text "165.00" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCFOP"
        And the user adds the text "2102" in selected cell and hits enter key

        Given the user selects editable table row number: 2
        And the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text "BMS118" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text "8" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_GROPRI"
        And the user adds the text "289.00" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCFOP"
        And the user adds the text "2102" in selected cell and hits enter key

        Given the user selects editable table row number: 3
        And the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text "BMS118" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text "3" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_GROPRI"
        And the user adds the text "449.83" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCFOP"
        And the user adds the text "2102" in selected cell and hits enter key

    Scenario: 004. Elementos de Faturação Frete + Desconto
        And the user selects the data table of section: "Invoicing elements"
        And the user selects cell with column header: "% or amount" and row number: 1
        And the user adds the text "2" in selected cell and hits tab key
        And the user selects cell with column header: "% or amount" and row number: 2
        And the user adds the text "20" in selected cell and hits tab key

    Scenario: 005. Create POH
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WE3ALLXQ0_POHNUM"
        And the user stores the value of the selected text field with the key: "DOCPOH"
        And the user clicks the Close page action icon on the header panel

    Scenario: 006. Sair e Voltar a Função POH
        Given the user opens the "GESPOH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase order ALL : Full entry" screen is displayed
        Given the user selects the data table of left panel
        When the user clicks the "Last read" link on the left panel
        Then the user selects search cell with header: "Order no."
        And the user selects cell with column header: "Order no." and row number: 1
        And the user clicks on the selected cell

    Scenario: 007. Validação Custos POH
        #No Card ATP-181 do JIRA tem a lógica do que o X3 está considerando para composição do Custo Stock
        Given the user clicks the "Lines" tab selected by title
        Given the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"
        And the user selects first row of the selected data table
        Then the user selects cell with X3 field name: "WE3ALL2_CSTPUR" of selected row
        And the value of the selected cell is "0.1625"
        Then the user selects cell with X3 field name: "WE3ALL2_LINCSTPUR" of selected row
        And the value of the selected cell is "649.8500"
        Then the user selects cell with X3 field name: "WE3ALL2_CPR" of selected row
        And the value of the selected cell is "0.1625"
        Then the user selects cell with X3 field name: "WE3ALL2_LINAMTCPR" of selected row
        And the value of the selected cell is "650.0000"
        #Linha 2
        Given the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"
        Given the user selects editable table row number: 2
        Then the user selects cell with X3 field name: "WE3ALL2_CSTPUR" of selected row
        And the value of the selected cell is "0.2846"
        Then the user selects cell with X3 field name: "WE3ALL2_LINCSTPUR" of selected row
        And the value of the selected cell is "2276.4600"
        Then the user selects cell with X3 field name: "WE3ALL2_CPR" of selected row
        And the value of the selected cell is "0.2846"
        Then the user selects cell with X3 field name: "WE3ALL2_LINAMTCPR" of selected row
        And the value of the selected cell is "2276.8000"
        #Linha 3
        Given the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"
        Given the user selects editable table row number: 3
        Then the user selects cell with X3 field name: "WE3ALL2_CSTPUR" of selected row
        And the value of the selected cell is "0.4429"
        Then the user selects cell with X3 field name: "WE3ALL2_LINCSTPUR" of selected row
        And the value of the selected cell is "1328.7500"
        Then the user selects cell with X3 field name: "WE3ALL2_CPR" of selected row
        And the value of the selected cell is "0.4429"
        Then the user selects cell with X3 field name: "WE3ALL2_LINAMTCPR" of selected row
        And the value of the selected cell is "1328.7000"
        And the user clicks the Close page action icon on the header panel

    Scenario: 008. GESPTH
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key

    Scenario: 009. Picking POH>PTH
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Preloading Criteria" screen is displayed
        And the user selects the text field with name: "Order no."
        And the user writes the stored text with key "DOCPOH" in the selected text field
        And the user clicks the "OK" button in the header
        And the user clicks the "Order selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "DOCPOH" and with the text containing "BR01" of the picking list panel
        And the user checks the selected picking list panel item
        And the user clicks the "Yes" opinion in the alert box
        And the user clicks the "Yes" opinion in the alert box
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WE6ALL0_PTHNUM"
        And the user stores the value of the selected text field with the key: "DOCPTH"
        And the user waits 2 seconds

    Scenario: 010. Validação Custos PTH
        Given the user clicks the "Lines" tab selected by title
        Given the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        And the user selects first row of the selected data table
        Then the user selects cell with X3 field name: "WE6ALL1_CSTPUR" of selected row
        And the value of the selected cell is "0.1625"
        Then the user selects cell with X3 field name: "WE6ALL1_LINCSTPUR" of selected row
        And the value of the selected cell is "649.8500"
        Then the user selects cell with X3 field name: "WE6ALL1_CPR" of selected row
        And the value of the selected cell is "0.1790"
        Then the user selects cell with X3 field name: "WE6ALL1_LINAMTCPR" of selected row
        And the value of the selected cell is "716.3100"
        #LINHA 2
        Given the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        Given the user selects editable table row number: 2
        Then the user selects cell with X3 field name: "WE6ALL1_CSTPUR" of selected row
        And the value of the selected cell is "0.2846"
        Then the user selects cell with X3 field name: "WE6ALL1_LINCSTPUR" of selected row
        And the value of the selected cell is "2276.4600"
        Then the user selects cell with X3 field name: "WE6ALL1_CPR" of selected row
        And the value of the selected cell is "0.3136"
        Then the user selects cell with X3 field name: "WE6ALL1_LINAMTCPR" of selected row
        And the value of the selected cell is "2509.0700"
        #LINHA 3
        Given the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        Given the user selects editable table row number: 3
        Then the user selects cell with X3 field name: "WE6ALL1_CSTPUR" of selected row
        And the value of the selected cell is "0.4429"
        Then the user selects cell with X3 field name: "WE6ALL1_LINCSTPUR" of selected row
        And the value of the selected cell is "1328.7500"
        Then the user selects cell with X3 field name: "WE6ALL1_CPR" of selected row
        And the value of the selected cell is "0.4880"
        Then the user selects cell with X3 field name: "WE6ALL1_LINAMTCPR" of selected row
        And the value of the selected cell is "1464.2700"
        And the user clicks the Close page action icon on the header panel

    Scenario: 011. GESPIH
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
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key

    Scenario: 012. Picking PTH>PIH
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Enter selection criteria" screen is displayed
        And the user selects the text field with name: "Receipt no."
        And the user writes the stored text with key "DOCPTH" in the selected text field
        And the user clicks the "OK" button in the header
        And the user clicks the "Receipt selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "DOCPTH" and with the text containing "BR01" of the picking list panel
        And the user checks the selected picking list panel item
        And the user clicks the "Yes" opinion in the alert box
        And the user clicks the "Yes" opinion in the alert box
        And the user stores the generated value with length 6 with the key "ALEATORIO"
        And the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "ALEATORIO" in the selected text field

    Scenario: 013. Controle, Elementos de Faturação PIH e Criar
        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL3_CUMLINAMT1"
        And the user stores the value of the selected text field with the key: "CALCVALUE"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE" in the selected text field and hits tab key
        Given the user selects the fixed data table for x3 field name: "WE8ALL4_ARRAY_NBFAC"
        When the user selects cell with column header: "Entry amount" and row number: (1)
        And the user adds the text "86.43" in selected cell and hits tab key
        When the user selects cell with column header: "Entry amount" and row number: (2)
        And the user adds the text "20" in selected cell and hits tab key
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user waits 1 seconds

    Scenario: 014. Validação Custos PIH
        Given the user clicks the "Lines" tab selected by title
        Given the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        And the user selects first row of the selected data table
        Then the user selects cell with X3 field name: "WE8ALL3_CSTPUR" of selected row
        And the value of the selected cell is "0.1625"
        Then the user selects cell with X3 field name: "WE8ALL3_LINCSTPUR" of selected row
        And the value of the selected cell is "650.0000"
        Then the user selects cell with X3 field name: "WE8ALL3_CPR" of selected row
        And the value of the selected cell is "0.17907750"
        Then the user selects cell with X3 field name: "WE8ALL3_LINAMTCPR" of selected row
        And the value of the selected cell is "716.3100"
        #LINHA 2
        Given the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        Given the user selects editable table row number: 2
        Then the user selects cell with X3 field name: "WE8ALL3_CSTPUR" of selected row
        And the value of the selected cell is "0.2846"
        Then the user selects cell with X3 field name: "WE8ALL3_LINCSTPUR" of selected row
        And the value of the selected cell is "2276.8000"
        Then the user selects cell with X3 field name: "WE8ALL3_CPR" of selected row
        And the value of the selected cell is "0.31363375"
        Then the user selects cell with X3 field name: "WE8ALL3_LINAMTCPR" of selected row
        And the value of the selected cell is "2509.0700"
        #LINHA 3
        Given the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        Given the user selects editable table row number: 3
        Then the user selects cell with X3 field name: "WE8ALL3_CSTPUR" of selected row
        And the value of the selected cell is "0.4429"
        Then the user selects cell with X3 field name: "WE8ALL3_LINCSTPUR" of selected row
        And the value of the selected cell is "1328.7000"
        Then the user selects cell with X3 field name: "WE8ALL3_CPR" of selected row
        And the value of the selected cell is "0.48809000"
        Then the user selects cell with X3 field name: "WE8ALL3_LINAMTCPR" of selected row
        And the value of the selected cell is "1464.2700"
        And the user clicks the Close page action icon on the header panel

    Scenario: 015. Logout
        And the user logs-out from the system