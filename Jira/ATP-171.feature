###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-171
# - Description: Fatura de Crédito PIH com Picking da PNH os campos “Valor total NF-e” e “Valor IPI+ICMS ST“ no Resumo devem apresentar o valor de IPI corretamente
# - Processo: PTH > PIH > PNH > PIH Credit
# - Jira: X3DEV-5413
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 19/06/2024
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-171

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #PROCESSO RECEPÇÃO DE COMPRA PTH
    Scenario: 002. PTH Creation
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key

    Scenario: 003. General Data PTH
        Given the user clicks the "General Data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key

    Scenario Outline: 004. Add Lines PTH
        Given the user clicks the "Lines" tab selected by title
        When the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        And the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE6ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_VAT1"
        And the user adds the text <VAT1> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI   | VAT1  |
            | 1   | "BMS001" | "1"    | "200.00" | "BRL" |

    Scenario: 005. Creation PTH
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WE6ALL0_PTHNUM"
        And the user stores the value of the selected text field with the key: "PTH_NUMBER"
        Then the user clicks the Close page action icon on the header panel

    #PROCESSO FATURA DE COMPRA PIH
    Scenario: 006. PIH Creation
        Given the user opens the "GESPIH" function
        And the user selects the data table in the popup
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
        And the user hits escape

    Scenario: 007. Picking
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Enter selection criteria" screen is displayed
        And the user selects the text field with X3 field name: "PCRITINV_WNUMRCP"
        And the user writes the stored text with key "PTH_NUMBER" in the selected text field and hits tab key
        And the user selects the text field with X3 field name: "PCRITINV_WNUMRCP"
        And the user stores the value of the selected text field with the key: "PTH_NUMBER"
        And the user clicks the "OK" button in the header
        And the user clicks the "Receipt selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "PTH_NUMBER" and with the text containing "BR001" of the picking list panel
        And the user checks the selected picking list panel item
        And the user clicks the "No" opinion in the alert box
        And the user clicks the "No" opinion in the alert box

    Scenario: 008. Control and Creation
        And the user stores the generated value with length 5 with the key "ALEATORIO"
        And the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "ALEATORIO" in the selected text field
        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL3_CUMLINAMT1"
        And the user stores the value of the selected text field with the key: "CALCVALUE"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE" in the selected text field and hits tab key
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 009. Transmission
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
        And the user waits 3 seconds
        #And the user selects the text field with X3 field name: "WE8ALLXQ_CHAVENFE"
        And the user selects the text field with name: "NF-e Access key"
        And the user stores the value of the selected text field with the key: "CHAVE"
        And the user clicks the "Close page" main action button on the right panel

    #PROCESSO DA DEVOLUÇÃO PNH
    Scenario: 010. Picking GESPTH on GESPNH
        Given the user opens the "GESPNH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase return ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WE7ALL1_PNHFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE7ALL1_BPSNUM"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE7ALL1_XQCODOPF"
        And the user writes "130" to the selected text field
        Then the user hits tab
        When the user clicks the "Selection criteria" action button on the header drop down
        And the "Preloading Criteria" screen is displayed
        And the user selects the text field with X3 field name: "PCRITRCP_WNUMRCP"
        And the user writes the stored text with key "PTH_NUMBER" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel
        When the user clicks the "Receipt selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "PTH_NUMBER" and with the text containing "BR011" of the picking list panel
        Then the user checks the selected picking list panel item
        And the user selects the data table with x3 field name: "WE7ALL1_ARRAY_NBLIG"

    Scenario Outline: 011. Lines
        Given the user selects row that has the text <LIN> in column with X3 field name: "WE7ALL1_PTDLIN"
        And the user selects cell with X3 field name: "WE7ALL1_XQCFOP" of selected row
        And the user adds the text <XQCFOP> in selected cell and hits enter key
        Examples:
            | LIN    | XQCFOP |
            | "1000" | "6201" |


    Scenario: 012. Create / Transmit to Sefaz and Validation
        And the user clicks the "Referenced docs." action button on the header drop down
        And the user selects the data table in the popup
        When the user selects last editable cell with column header: "Reference type"
        Then the user selects the choice "NF-e" of the selected cell
        And the user selects last fixed cell with X3 field name: "XQIREF1_CHAVENFE"
        And the user adds the stored text with key "CHAVE" in selected cell and hits tab key
        And the user hits escape
        And the user clicks the "OK" button in the popup header
        Given the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "Transmit SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        #Verificar status da nota (6 = Autorizada)
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "[F:XQPNH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 013. Legal Data
        Given the user clicks the "Legal data" action button on the header drop down
        When the "Purchasing Legal data" screen is displayed
        #Then the user selects the text field with X3 field name: "XQPLD2_TTBCIPI"
        Then the user selects the text field with name: "IPI base calc"
        And the value of the selected text field is "200.00"
        #Then the user selects the text field with X3 field name: "XQPLD2_TTVLIPIDEVOL"
        Then the user selects the text field with name: "Total IPI devolução"
        And the value of the selected text field is "20.00"
        #O Valor final precisa ser alterado para 50.00
        Given the user clicks the "Close" main action button on the right panel
        Given the user clicks the "Cancel" main action button on the right panel

    Scenario: 014. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system