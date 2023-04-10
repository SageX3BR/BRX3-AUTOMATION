###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-38
# - Description: Garantir que os campos e botões da legislação brasileira estão
#   desabilitados na criação de Encomenda de Compra com estabelecimento não BR
# - Created by : Gustavo Albanus
# - Created date : 03/06/2022
# - Updated by : Fausto A Neto
# - Updated date : 06/07/2022
# - Status : Done
###########################################################################

Feature:ATP-38

    Scenario: 01.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 02. GESPOH Header
        Given the user opens the "GESPOH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase order ALL : Full entry" screen is displayed
        #Cabeçalho
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Order site"
        And the user writes "NA012" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "NA054" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"

    Scenario Outline: 03. Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text <ITMREF> in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text <QTY> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY |
            | 1   | "COM914" | "2" |
            | 2   | "COM915" | "3" |

    Scenario: 04. Document Creation and BRA Add-on checks
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        Given the user clicks the "Resume" tab selected by title
        Then the value of the "Invoice total value" text field is ""
        Given the user opens the header drop down
        Then the "Auto. tax calc." action button on the header drop down is disabled
        And the "View log" action button on the header drop down is disabled
        And the "Tax detail" action button on the header drop down is disabled
        And the "Referenced docs." action button on the header drop down is disabled

    Scenario: 05. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system


