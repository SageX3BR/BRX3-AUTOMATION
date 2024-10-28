###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-68
# - Description: Garantir que gere o contrato de serviço pela função FUNAUTINVC
# - Jira: X3DEV-6355
# - Created by : Gustavo Albanus
# - Created date : 05/09/2024
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################


Feature: ATP-68

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
        And the user selects the text field with name: "Description"
        And the user writes "ATP-68" to the selected text field and hits tab key
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
        And the user writes "2000" to the selected text field and hits tab key

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
        Then a confirmation dialog appears with the message "Record has been created"
        Then the user selects the text field with X3 field name: "CON0_CONNUM"
        And the user stores the value of the selected text field with the key: "CONNUM"
        And the user clicks the "Close" main action button on the right panel

    Scenario: 5. Geração faturas contratos
        Given the user opens the "FUNAUTINVC" function
        And the user selects the text field with X3 field name: "SAUTINVC_CPY"
        And the user writes "BR10" to the selected text field
        And the user selects the text field with X3 field name: "SAUTINVC_SALFCY"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SAUTINVC_CONNUMDEB"
        And the user writes the stored text with key "CONNUM" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 7. Logout
        And the user logs-out from the system
