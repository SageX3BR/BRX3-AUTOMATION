
###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-relbank-ofx
# - Description: Teste de importação de extrato bancário via arquivo .OFX
# - Created by : Juliano Konjunski
# - Created date : 22/04/2022
# - Status :
###########################################################################

Feature:xq-relbank-ofx

  Scenario: 1.Login scenario
    Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

  Scenario: 2. Open RELBANK function
    Given the user opens the "RELBANK" function
    And the "Bank statement import" screen is displayed
    And the user selects the radio buttons group with X3 field name: "RELBAN_TYPEXP"
    And the user selects the text field with X3 field name: "RELBAN_VOLFIL"
    And the user writes "[ATP]/xq-relbank-ofx.ofx" to the selected text field
    And the user selects the check box with X3 field name: "RELBAN_ALLBAN"
    And the user sets the check box to ticked
    And the user selects the text field with X3 field name: "RELBAN_LEG"
    And the user writes "BRA" to the selected text field
    And the user clicks the "OK" button in the header
    And a log panel appears
    And the user selects the main log panel of the page
    And the selected log panel includes the message "1100 Statement import lines"
    And the user clicks the "Close page" main action button on the right panel

  Scenario: 3. Logout
    And the user logs-out from the system


