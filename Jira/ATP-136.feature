########################################################################################################
#Header
#-------------------------------------------------------------------------
#- Test code: ATP-136
#- Description: Cenário de Geração dos Arquivos de Integração - Cenário 7 - Inventário
#- Jira:
#- Legislation: BRA
#- Created by : Gustavo Albanus
#- Created date : 07/06/2023
#- Updated by :
#- Updated date :
#- Status :
########################################################################################################

Feature: ATP-136

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. XQECRD
        Given the user opens the "XQECRD" function
        Then the "EFD Tax and Contributions" screen is displayed
        And the user selects the text field with name: "Company"
        And the user writes "BR10" to the selected text field and hits tab key
        And the user selects the text field with name: "Site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the date field with name: "Start date"
        And the user writes "05/30/23" to the selected date field
        And the user selects the date field with name: "End date"
        And the user writes "05/30/23" to the selected date field

    Scenario: 003. Arquivos - Sales (txt)
        Given the user selects the check box with name: "Sales (txt)"
        When the user sets the check box to unticked
        Then the selected check box is not checked
        Given the user selects the check box with name: "Sales (xml)"
        When the user sets the check box to unticked
        Then the selected check box is not checked
        Given the user selects the check box with name: "Purchase doc."
        When the user sets the check box to unticked
        Then the selected check box is not checked
        Given the user selects the check box with name: "Products"
        When the user sets the check box to unticked
        Then the selected check box is not checked
        Given the user selects the check box with name: "K Block"
        When the user sets the check box to unticked
        Then the selected check box is not checked
        Given the user selects the check box with name: "All products"
        When the user sets the check box to unticked
        Then the selected check box is not checked
        Given the user selects the check box with name: "Count"
        When the user sets the check box to ticked
        When the selected check box is checked
        When the user clicks the "OK" button in the header
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Estoque.txt file has been sucessfully created"

    Scenario: 004. Logout
        And the user clicks the "Close" main action button on the right panel
        And the user logs-out from the system