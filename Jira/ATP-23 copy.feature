###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:  ATP-23
# - Description: Garantir cadastro com mesmo CNPJ e IE para Terceiro
# - Created by : Diogo Nascimento
# - Created date : 20/05/2022
# - Updated by :
# - Updated date :
# - Status :
###########################################################################

Feature: ATP-23

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected

    Scenario: 2.BP
        Given the user opens the "GESBPR" function
        And the user selects the text field with name: "Category"
        And the user writes "BR" to the selected text field
        And the user hits tab
        And the user selects the data table in the popup
        And the user selects cell with text: "Customer" and column header: ""
        And the user clicks on the selected cell
        And the user selects the text field with name: "BP"
        And the user writes "ATP-23" to the selected text field and hits enter key

    Scenario: 3.Delete Address code
        Given the user selects the fixed data table for x3 field name: "BPABPR_ARRAY_NBADR"
        When the user selects editable row that has the text "DD" in column with X3 field name: "BPABPR_CODADR"
        Then the user opens "Delete" function on toolbox of the selected row
        And the user clicks the "Save" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been modified"

    Scenario: 3. Logout scenario
        Then the user logs-out from the system