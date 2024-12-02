########################################################################################################
#Header
#-------------------------------------------------------------------------
#- Test code: ATP-137
#- Description: Não Duplicar as Observações Adicionais nos Documentos Encomenda, Recepção e Fatura de Compra
#- Jira: X3DEV-2946
#- Legislation: BRA
#- Created by : Gustavo Albanus
#- Created date : 22/06/2023
#- Updated by : Gustavo Albanus
#- Updated date : 24/07/2024
#- Status : Done
#- Ajustes: Campo DTSAIENT / Preenchimento das Linhas
########################################################################################################

Feature: ATP-137

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


    Scenario Outline: Inserir Linha
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"
        Given the user selects editable table row number: 1
        And the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text "BMS001" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text "1" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_GROPRI"
        And the user adds the text "100.00" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCFOP"
        And the user adds the text "2102" in selected cell and hits enter key

        Given the user selects editable table row number: 2
        And the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text "BMS001" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text "1" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_GROPRI"
        And the user adds the text "100.00" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCFOP"
        And the user adds the text "2102" in selected cell and hits enter key

        Given the user selects editable table row number: 3
        And the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text "BMS001" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text "1" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_GROPRI"
        And the user adds the text "100.00" in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCFOP"
        And the user adds the text "2102" in selected cell and hits enter key

    Scenario: 003. Informações Adicionais e Criar
        Given the user clicks the "Resume" tab selected by title
        Given the user selects the text field with X3 field name: "WE3ALLXQ_OBSADIC"
        Then the user writes "123" to the selected text area
        Given the user selects the text field with X3 field name: "WE3ALLXQ_OBSADIC"
        Then the user writes "TESTE DE DUPLICACAO DAS OBSERVACOES ADICIONAIS CONFORME O TICKET X3DEV-2946" to the selected text area
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        #And the user selects the text field with X3 field name: "WE3ALL3_OCNNUM"
        And the user selects the text field with name: "Order"
        And the user stores the value of the selected text field with the key: "DOCPOH"
        And the user clicks the Close page action icon on the header panel

    Scenario: 004. GESPTH2
        Given the user opens the "GESPTH2" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key


    Scenario: 005. Picking PTH
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Preloading Criteria" screen is displayed
        And the user selects the text field with name: "Order no."
        And the user writes the stored text with key "DOCPOH" in the selected text field
        And the user clicks the "OK" button in the header
        And the user clicks the "Order selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "DOCPOH" and with the text containing "BR01" of the picking list panel
        And the user checks the selected picking list panel item
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "No" opinion in the alert box
        And the user waits 3 seconds
        And the user selects the date field with X3 field name: "WE6ALLXQ_DTSAIENT"
        And the user writes today to the selected date field
        And the user hits tab
        And the user hits tab
        And the user hits tab

    Scenario: 006. Create GESPTH2
        Given the user clicks the "Create" main action button on the right panel
        #Given the user clicks the Close page action icon on the header panel
        And a confirmation dialog appears with the message "Record has been created"
        #And the user selects the text field with X3 field name: "WE6ALL0_PTHNUM"
        When the user selects the text field with name: "Receipt"
        And the user stores the value of the selected text field with the key: "PTHNUM"
        Given the user clicks the "Resume" tab selected by title
        Then the user selects the text field with name: "Additional Observations"
        Then the value of the selected text area contains
            """
            TESTE DE DUPLICACAO DAS OBSERVACOES ADICIONAIS CONFORME O TICKET X3DEV-2946
            """
        Then the user clicks the Close page action icon on the header panel
        And the user waits 5 seconds

    Scenario: 007. GESPIH
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
        #And the user selects the text field with X3 field name: "WE8ALL0_BPRSAC"
        #And the user writes "FORN" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key

    Scenario: 008. Picking PIH
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
        And the user stores the generated value with length 5 with the key "ALEATORIO"
        And the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "ALEATORIO" in the selected text field

    Scenario: 009. Control
        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL3_CUMLINAMT1"
        And the user stores the value of the selected text field with the key: "CALCVALUE"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE" in the selected text field and hits tab key

    Scenario: 010. Create PIH
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        Given the user clicks the "Resume" tab selected by title
        Then the user selects the text field with name: "Additional Observations"
        Then the value of the selected text area contains
            """
            TESTE DE DUPLICACAO DAS OBSERVACOES ADICIONAIS CONFORME O TICKET X3DEV-2946
            """
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 011. Logout
        And the user logs-out from the system
