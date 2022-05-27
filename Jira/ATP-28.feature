###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-28
# - Description: Garantir a criação de faturas através do botão na rotina de gestão de contratos
# - Jira: X3DEV-732
# - Created by : Diego Oliveira
# - Created date : 24/05/2022
# - Updated by :
# - Updated date :
# - Status : In Progress
###########################################################################


Feature: ATP-28

    Scenario: 1.Login
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2.Criação de Contrato de Serviço
        Given the user opens the "GESCON" function
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Company"
        And the user writes "BR10" to the selected text field and hits tab key
        And the user selects the text field with name: "Site"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with name: "Reference"
        And the user writes "" to the selected text field and hits tab key
        And the user selects the text field with name: "Customer"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Currency"
        And the user writes "BRL" to the selected text field and hits tab key
        And the user selects the text field with name: "Contact (relationship)"
        And the user writes "" to the selected text field and hits tab key
        And the user selects the text field with name: "Description"
        And the user writes "Mão de Obra" to the selected text field and hits tab key
        And the user selects the text field with name: "Contract group no. 1"
        And the user writes "C1" to the selected text field and hits tab key
        And the user selects the text field with name: "Contract group no. 2"
        And the user writes "A1" to the selected text field and hits tab key
        And the user selects the text field with name: "Contract group no. 3"
        And the user writes "A1" to the selected text field and hits tab key
        Given the user selects the drop down list with name: "Category"
        When the user clicks on "Main" option of the selected drop down list
        Then the value of the selected drop down list is "Maintenance"
        And the user selects the text field with name: "All skills"
        And the user writes "" to the selected text field and hits tab key
        And the user selects the text field with name: "Duration"
        And the user writes "12" to the selected text field and hits tab key
        Given the user selects the drop down list with name: "Unit"
        When the user clicks on "months" option of the selected drop down list
        And the user selects the text field with name: "Automatic renewal"
        And the user writes "" to the selected text field and hits tab key
        And the user selects the text field with name: "Annual royalty base"
        And the user writes "5000.00" to the selected text field and hits tab key
        And the user selects the text field with name: "Advance notice of cancellation"
        And the user writes "30" to the selected text field and hits tab key
        And the user selects the text field with name: "Frequency"
        And the user writes "12" to the selected text field and hits tab key
        Given the user selects the drop down list with name: "Unit"
        When the user clicks on "months" option of the selected drop down list
        And the user selects the text field with name: "Payment term"
        And the user writes "BR_AVISTA" to the selected text field
        And the user selects the text field with name: "Invoicing product"
        And the user writes "SER001" to the selected text field and hits tab key

    Scenario: 3.Create
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    ##And the user waits 5 seconds
    Scenario: 4.Invoice
        Then the user clicks the "Invoice" button in the header
        #Send to RPS and verify if authorized
        Then the user clicks the "Transmit" action button on the header drop down
        ##And the user waits 30 seconds
        Then a log panel appears
        And the user selects the main log panel of the page

    ##And the user waits 5 seconds
    Scenario: 5.Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system