###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:  ATP-119
# - Description:
#       1) Cria e valida uma fatura tercieros Forncedor (GESBIS).
#       2) Informa os dados de cobrança - titulo com código de barras.
#       2) Gera remessa SISPAG e filtar por itens ja gerados.
#
###########################################################################


Feature: ATP-119

    Scenario: Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        And the user changes the main language code to "en-US"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected

    Scenario: Supplier invoice creation

        Given the user opens the "GESBIS" function
        Then the "Supplier BP invoice" screen is displayed
        Given the user clicks the "New" main action button on the right panel

        #Main Header fields definition
        Then the user selects the text field with name: "Site"
        And the user writes "BR011" to the selected text field
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key

        #Header Tab fields definition
        And the user clicks the "Header" tab selected by title
        And the user stores the generated value with length 5 with the key "ALEATORIO"
        And the user selects the text field with name: "Source document"
        And the user writes "SISPAG[ALEATORIO]" to the selected text field

        And the user selects the text field with name: "Currency"
        And the user writes "BRL" to the selected text field
        And the user selects the text field with name: "Amount - tax"
        And the user writes "1000.00" to the selected text field
        And the user selects the text field with name: "Amount + tax"
        And the user writes "1000.00" to the selected text field
        And the user selects the text field with name: "Payment term"
        And the user writes "BR_AVISTA" to the selected text field
        And the user selects the text field with name: "Discount/Late charge"
        And the user writes "" to the selected text field

        #Lines Tab fields definition
        Then the user clicks the "Lines" tab selected by title
        And the user selects the data table of section: "Details"
        And the user selects last editable cell with column header: "Site"
        And the user clicks on the selected cell
        And the user selects last editable cell with column header: "Legal"
        And the user adds the text "1102010008" in selected cell
        And the user selects last editable cell with column header: "Amount - tax"
        And the user adds the text "1000.00" in selected cell
        #Dados Cobrança
        Then the user selects the drop down list with name: "Payment type"
        When the user clicks on "Títulos com código de barras" option of the selected drop down list
        Then the user selects the drop down list with name: "Forma de Pagamento"
        When the user clicks on "11-Tributos com código de barras" option of the selected drop down list

        #Invoice Creation & Posting
        Then the user clicks the "Create" main action button on the right panel
        And the user selects the text field with name: "Document no."
        And the user stores the value of the selected text field with the key: "VENCIMENTO"
        And the user clicks the "Post" button in the header
        And the user clicks the "Yes" opinion in the alert box
        #Invoice Including bardcode field
        Given the user clicks the "Open items" button in the header
        Given the user selects the data table in the popup
        When the user selects first row of the selected data table
        And the user selects cell with X3 field name: "BPSDUD_XQBARCODE" of selected row
        And the user clicks on the selected cell
        And the user adds the text "34193808200000001011090000366261234123451000" in selected cell
        Then the user clicks the "OK" button in the header
        And the user clicks the Close page action icon on the header panel

    Scenario: Geração de remessa SISPAG
        Given the user opens the "CONSXQP" function
        Then the "Remessa Pagamento Bancário" screen is displayed
        And the user selects the text field with name: "Site"
        And the user writes "BR011" to the selected text field
        And the user selects the text field with name: "Invoice number"
        And the user writes the stored text with key "VENCIMENTO" in the selected text field
        And the user selects the text field with name: "Bank"
        And the user writes "BR999" to the selected text field
        And the user selects the text field with name: "Book"
        And the user writes "PAG341" to the selected text field
        Then the user clicks the "Search" button in the header

        Given the user selects the main data table of the page
        And the user selects first row of the selected data table
        And the user selects cell with X3 field name: "XQREMPAG1_SELECAO" of selected row
        And the user clicks on the selected cell
        And the user clicks the "Processar Seleção" button in the header
        And the user waits 3 seconds
        #Filtra já gerados
        And the user selects the check box with name: "Sent open itens"
        Then the user sets the check box to ticked
        Then the user clicks the "Search" button in the header
        #Valida se foi listado nos já gerados
        And the user selects the main data table of the page
        And the user selects first row of the selected data table
        And the user selects cell with X3 field name: "XQREMPAG1_NUM" of selected row
        And the value of the selected cell matches the stored text with key "VENCIMENTO"
        And the user clicks the Close page action icon on the header panel

    Scenario: Logout
        And the user logs-out from the system






