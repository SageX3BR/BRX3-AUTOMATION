###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-21
# - Description: Garantir cadastro com mesmo CNPJ e IE para Cliente
# - Jira: X3DEV-358
# - Created by : Diego Oliveira
# - Created date : 11/05/2022
# - Updated by :
# - Updated date :
# - Status : In Progress
###########################################################################


Feature: ATP-21

    Scenario: 1.Login
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2.Criação de Cadastro de Cliente com o mesmo CNPJ e IE
        Given the user opens the "GESBPC" function
        And the user selects the text field with name: "Category"
        And the user writes "BR" to the selected text field and hits tab key
        And the user selects the text field with name: "Customer"
        And the user writes "TE001" to the selected text field and hits tab key

    Scenario: 3.Address code
        Given the user selects the fixed data table for x3 field name: "BPABPC_ARRAY_NBADR"
        And the user selects last editable cell with X3 field name: "BPABPC_CODADR"
        And the user adds the text "RJ" in selected cell and hits tab key
        And the user selects the text field with name: "Description"
        And the user writes "Rio de Janeiro" to the selected text field and hits tab key
        And the user selects the text field with name: "Logradouro"
        And the user writes "Rua Um" to the selected text field and hits tab key
        And the user selects the text field with name: "Complemento"
        And the user writes "Galpão" to the selected text field and hits tab key
        And the user selects the text field with name: "Bairro"
        And the user writes "Vila Rio" to the selected text field and hits tab key
        And the user selects the text field with name: "Number"
        And the user writes "2000" to the selected text field and hits tab key
        And the user selects the text field with name: "Postal code"
        And the user writes "20050000" to the selected text field and hits tab key
        And the user selects the text field with name: "CNPJ/CPF"
        And the user writes "64555626000147" to the selected text field and hits tab key
        And the user selects the text field with name: "Website"
        And the user writes "www.sage.com" to the selected text field and hits tab key
        And the user selects the text field with name: "State inscription"
        And the user writes "122612125111" to the selected text field and hits tab key
        And the user selects the text field with name: "Mobile"
        And the user writes "55011913245678" to the selected text field and hits tab key
        And the user selects the text field with name: "Email"
        And the user writes "email@axisx3.com" to the selected text field and hits tab key
        And the user selects the text field with name: "Other email 5"
        And the user writes "email@axisx3.com" to the selected text field and hits tab key
        And the user selects the text field with name: "Receives DANFE"
        And the user writes "" to the selected text field and hits tab key
        And the user selects the text field with name: "Receives XML"
        And the user writes "" to the selected text field and hits tab key
        And the user hits escape
        And the user selects the text field with name: "Receives Bankslip"
        And the user writes "" to the selected text field

    Scenario: 4.Save
        Given the user clicks the "Save" main action button on the right panel
        And the user clicks the Close page action icon on the header panel

    Scenario: 5. Delete Address code
        Given the user opens the "GESBPC" function
        And the user selects the text field with name: "Category"
        And the user writes "BR" to the selected text field and hits tab key
        And the user selects the text field with name: "Customer"
        And the user writes "TE001" to the selected text field and hits tab key
        Given the user selects the fixed data table for x3 field name: "BPABPC_ARRAY_NBADR"
        And the user selects last editable cell with X3 field name: "BPABPC_CODADR"
        And the user selects the data table of section: "Addresses"
        And the user selects row that has the text "RJ" in column with header: "Address code"
        And the user opens "Delete" function on toolbox of the selected row
        And the user clicks the "Save" main action button on the right panel


    Scenario: 6.Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
