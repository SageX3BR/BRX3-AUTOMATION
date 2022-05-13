###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:
# - Description:
# - Created by : Juliano Konjunski
# - Created date :
# - Status :
###########################################################################

Feature:xq-relbank-ofx

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. Open GIMPOBJ function
        Given the user opens the "GIMPOBJ" function
        Then the "Imports" screen is displayed
        And the user selects the text field with name: "Template"
        And the user writes "SIH" to the selected text field
        And the user selects the radio buttons group with X3 field name: "IMPOBJ_TYPEXP"
        And the user clicks on "Server" radio button of the selected radio buttons group
        And the user selects the text field with X3 field name: "IMPOBJ_VOLFIL"
        And the user writes "[ATP]/atp-32-sih-import.txt" to the selected text field
        Then the user clicks the "OK" button in the header

        And the user clicks the "OK" opinion in the alert box
        Then a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "1 records created"
        And the user clicks the "Close page" main action button on the right panel