###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-26
# - Description: Garantir a Criação de faturas através do botão na rotina de gestão de contratos
# - Legislation: BR addon
# - Created by : Gustavo Albanus
# - Created date : 02/06/2022
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-26

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. GESCON
        Given the user opens the "GESCON" function
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Company"
        And the user writes "BR10" to the selected text field and hits tab key
        And the user selects the text field with name: "Site"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with name: "Customer"
        And the user writes "BR001" to the selected text field and hits tab key

        #General Tab
        When the user clicks the "General" tab selected by title
        Given the user selects the drop down list with name: "Category"
        When the user clicks on option that matches exact with the text "Maintenance" of the selected drop down list
        Then the value of the selected drop down list is "Maintenance"

        #Management Tab
        When the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Duration"
        And the user writes "12" to the selected text field and hits tab key
        Given the user selects the drop down list with name: "Unit"
        When the user clicks on option that matches exact with the text "months" of the selected drop down list
        Then the value of the selected drop down list is "months"

        And the user selects the text field with name: "Annual royalty base"
        And the user writes "1000" to the selected text field and hits tab key

        #Invoicing rules Tab
        When the user clicks the "Invoicing rules" tab selected by title
        And the user selects the text field with name: "Frequency"
        And the user writes "1" to the selected text field and hits tab key
        Given the user selects the drop down list with X3 field name: "CON8_INVFRYBAS"
        When the user clicks on option that matches exact with the text "months" of the selected drop down list
        Then the value of the selected drop down list is "months"

        #Invoice elements Tab
        When the user clicks the "Invoice elements" tab selected by title
        And the user selects the text field with name: "Invoicing product"
        And the user writes "SER019" to the selected text field and hits enter key
        And the user clicks the "Invoice" button in the header

    Scenario: 3. GESSIH - Editar a Linha, Transmissão e Validação
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"
        And the user selects first row of the selected data table
        Then the user opens "Popup view" function on toolbox of the selected row
        And the user selects the text field with name: "Cód. ind. operação"
        And the user writes "100301" to the selected text field and hits tab key
        And the user clicks the Close page action icon on the header panel
        Given the user clicks the "Save" main action button on the right panel
        When the user clicks the "Transmit RPS" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Código: 100 - Autorizado."
        And the user clicks the "Close page" main action button on the right panel
        And the user clicks the "Post" button in the header
        And the user clicks the "Close page" main action button on the right panel
        Then the user clicks the Close page action icon on the header panel
        #Adicionado para fechar a função de contratos antes de sair
        And the user clicks the Close page action icon on the header panel

    Scenario: 4. Logout
        And the user logs-out from the system
