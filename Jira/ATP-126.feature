###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-126
# - Description: Operação fiscal permitindo um documento fiscal que não seja do mesmo estab. da operação
# - Jira: X3DEV-2753
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 22/05/2023
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-126

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. GESXQOPF
        Given the user opens the "GESXQOPF" function
        Then the "Fiscal operation" screen is displayed
        Given the user clicks the "New" main action button on the right panel
        Then the user selects the text field with name: "Code"
        And the user writes "199" to the selected text field and hits tab key
        And the user selects the text field with name: "Description"
        And the user writes "Teste ATP-126" to the selected text field and hits tab key
        Then the user selects the text field with name: "Site"
        And the user writes "BR011" to the selected text field and hits tab key
        Then the user selects the text field with name: "Fiscal document"
        And the user writes "50" to the selected text field and hits tab key
        Then an alert box with the text "Documento fiscal não condiz com o estabelecimento" appears
        And the user clicks the "Ok" option in the alert box
        Then the user selects the text field with name: "Fiscal document"
        And the user writes "100" to the selected text field and hits tab key
        Then the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user waits 5 seconds
        Then the user clicks the "Delete" main action button on the right panel
        When the user clicks the "OK" button in the header
        And the user clicks the "Ok" opinion in the alert box
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 3. Logout
        Then the user logs-out from the system


