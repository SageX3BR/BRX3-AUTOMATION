###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-39
# - Description: Garantir que os campos da legislação brasileira estão desabilitados na criação de Recepção de Compra com estabelecimento não BR
# - Jira: X3DEV-654
# - Legislation:
# - Created by : Gustavo Albanus
# - Created date : 08/06/2022
# - Status : Done
###########################################################################


Feature:ATP-39

    Scenario: 01.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 02. GESSOH Header
        Given the user opens the "GESPTH2" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        #Cabeçalho
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "NA012" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "NA052" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"

    Scenario Outline: 03. Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE6ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_VAT1"
        And the user adds the text <VAT1> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI  | VAT1 |
            | 1   | "BMS001" | "1"    | "50.75" | "NT" |

    Scenario: 04. Document Creation
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 05. Check Fiscal Operation field disabled
        Given the user clicks the "General Data" tab selected by title
        Given the user selects the text field with name: "Fiscal operation"
        Then the selected text field should be disabled

    Scenario: 06. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
