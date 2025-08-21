###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-181
# - Description: Custo Compra Nacional - UN>UN - PTH > PIH - Com elementos de Faturação Frete e Desconto
# - Jira: X3DEV-8284
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 19/08/2025
# - Updated by :
# - Updated date :
# - Status : Done
# - Parametrizações: Artigo BMS117
###########################################################################

Feature: ATP-181

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. GESPTH
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

    Scenario Outline: 003. Inserir Linha
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        Given the user selects editable table row number: 1
        And the user selects last fixed cell with X3 field name: "WE6ALL1_ITMREF"
        And the user adds the text "BMS117" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE6ALL1_QTYUOM"
        And the user adds the text "2" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE6ALL1_GROPRI"
        And the user adds the text "7.9231" in selected cell
        And the user hits enter

        Given the user selects editable table row number: 2
        And the user selects last fixed cell with X3 field name: "WE6ALL1_ITMREF"
        And the user adds the text "BMS117" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE6ALL1_QTYUOM"
        And the user adds the text "3" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE6ALL1_GROPRI"
        And the user adds the text "12.5393" in selected cell
        And the user hits enter

        Given the user selects editable table row number: 3
        And the user selects last fixed cell with X3 field name: "WE6ALL1_ITMREF"
        And the user adds the text "BMS117" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE6ALL1_QTYUOM"
        And the user adds the text "4" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE6ALL1_GROPRI"
        And the user adds the text "3.8126" in selected cell
        And the user hits enter

    Scenario: 004. Elementos de Faturação Frete + Desconto
        And the user selects the data table of section: "Invoicing elements"
        And the user selects cell with column header: "Amount" and row number: 1
        And the user adds the text "10" in selected cell and hits tab key
        And the user selects cell with column header: "Amount" and row number: 2
        And the user adds the text "20" in selected cell and hits tab key

    Scenario: 005. Creation
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WE6ALL0_PTHNUM"
        And the user stores the value of the selected text field with the key: "DOCPTH"
        And the user waits 2 seconds

    Scenario: 005. Validação Custos PTH
        #No Card ATP-181 do JIRA tem a lógica do que o X3 está considerando para composição do Custo Stock
        Given the user clicks the "Lines" tab selected by title
        Given the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        And the user selects first row of the selected data table
        Then the user selects cell with X3 field name: "WE6ALL1_CSTPUR" of selected row
        And the value of the selected cell is "9.0700"
        Then the user selects cell with X3 field name: "WE6ALL1_LINCSTPUR" of selected row
        And the value of the selected cell is "18.1400"
        Then the user selects cell with X3 field name: "WE6ALL1_CPR" of selected row
        And the value of the selected cell is "10.1000"
        Then the user selects cell with X3 field name: "WE6ALL1_LINAMTCPR" of selected row
        And the value of the selected cell is "20.2000"

        Given the user clicks the "Lines" tab selected by title
        Given the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        Given the user selects editable table row number: 2
        Then the user selects cell with X3 field name: "WE6ALL1_CSTPUR" of selected row
        And the value of the selected cell is "14.3633"
        Then the user selects cell with X3 field name: "WE6ALL1_LINCSTPUR" of selected row
        And the value of the selected cell is "43.0900"
        Then the user selects cell with X3 field name: "WE6ALL1_CPR" of selected row
        And the value of the selected cell is "15.9833"
        Then the user selects cell with X3 field name: "WE6ALL1_LINAMTCPR" of selected row
        And the value of the selected cell is "47.9499"

        Given the user clicks the "Lines" tab selected by title
        Given the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        Given the user selects editable table row number: 3
        Then the user selects cell with X3 field name: "WE6ALL1_CSTPUR" of selected row
        And the value of the selected cell is "4.3675"
        Then the user selects cell with X3 field name: "WE6ALL1_LINCSTPUR" of selected row
        And the value of the selected cell is "17.4700"
        Then the user selects cell with X3 field name: "WE6ALL1_CPR" of selected row
        And the value of the selected cell is "4.8575"
        Then the user selects cell with X3 field name: "WE6ALL1_LINAMTCPR" of selected row
        And the value of the selected cell is "19.4300"
        And the user clicks the Close page action icon on the header panel

    Scenario: 006. GESPIH
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        #Then the "Purchase invoice BRA :" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key

    Scenario: 007. Picking PTH>PIH
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

    Scenario: 008. Controle, Elementos de Faturação PIH e Criar
        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL3_CUMLINAMT1"
        And the user stores the value of the selected text field with the key: "CALCVALUE"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE" in the selected text field and hits tab key
        Given the user selects the fixed data table for x3 field name: "WE8ALL4_ARRAY_NBFAC"
        When the user selects cell with column header: "Entry amount" and row number: (1)
        And the user adds the text "10" in selected cell and hits tab key
        When the user selects cell with column header: "Entry amount" and row number: (2)
        And the user adds the text "20" in selected cell and hits tab key
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user waits 1 seconds

    Scenario: 009. Validação Custos PIH
        Given the user clicks the "Lines" tab selected by title
        Given the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        And the user selects first row of the selected data table
        Then the user selects cell with X3 field name: "WE8ALL3_CSTPUR" of selected row
        And the value of the selected cell is "9.0700"
        Then the user selects cell with X3 field name: "WE8ALL3_LINCSTPUR" of selected row
        And the value of the selected cell is "18.1400"
        Then the user selects cell with X3 field name: "WE8ALL3_CPR" of selected row
        And the value of the selected cell is "10.10000000"
        Then the user selects cell with X3 field name: "WE8ALL3_LINAMTCPR" of selected row
        And the value of the selected cell is "20.2000"

        Given the user clicks the "Lines" tab selected by title
        Given the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        Given the user selects editable table row number: 2
        Then the user selects cell with X3 field name: "WE8ALL3_CSTPUR" of selected row
        And the value of the selected cell is "14.3633"
        Then the user selects cell with X3 field name: "WE8ALL3_LINCSTPUR" of selected row
        And the value of the selected cell is "43.0900"
        #Linha 2, o Stock por Unidade e o Custo Stock pode ter um problema de arredondamento quando tem elemento de faturação
        Then the user selects cell with X3 field name: "WE8ALL3_CPR" of selected row
        And the value of the selected cell is "15.98333333"
        Then the user selects cell with X3 field name: "WE8ALL3_LINAMTCPR" of selected row
        And the value of the selected cell is "47.9500"

        Given the user clicks the "Lines" tab selected by title
        Given the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        Given the user selects editable table row number: 3
        Then the user selects cell with X3 field name: "WE8ALL3_CSTPUR" of selected row
        And the value of the selected cell is "4.3675"
        Then the user selects cell with X3 field name: "WE8ALL3_LINCSTPUR" of selected row
        And the value of the selected cell is "17.4700"
        Then the user selects cell with X3 field name: "WE8ALL3_CPR" of selected row
        And the value of the selected cell is "4.85750000"
        Then the user selects cell with X3 field name: "WE8ALL3_LINAMTCPR" of selected row
        And the value of the selected cell is "19.4300"
        And the user clicks the Close page action icon on the header panel

    Scenario: 011. Logout
        And the user logs-out from the system