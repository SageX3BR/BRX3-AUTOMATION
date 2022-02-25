###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-p-flow-pih
# - Description: CRUD verification of purchase invoice
# - Jira: NA
# - Legislation: BRA
# - Created by : Daniela Anile
# - Created date : 02/02/2021
# - Updated by : Daniela Anile
# - Updated date : 02/02/2021
# - Status : Automated
###########################################################################

Feature: fast-run-fail

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Foreign Invoice
    #--------------------------------------------------------------------------------
    Scenario: 2. Header
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        #Criar string baseada em datetime$ + 5 Random
        When the user opens the header drop down
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "1=1" to the selected text field and hits enter key
        And the user selects the text field with name: "Result"
        And the value of the selected text field is "5"
        Then the user clicks the Close page action icon on the header panel
        Then the user clicks the Close page action icon on the header panel

    Scenario: 12. Logout
        And the user logs-out from the system