###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-33
# - Description: Garantir que os campos e botões da legislação brasileira estão
#   desabilitados na criação de fatura de venda com estabelecimento não BR
# - Created by : Fausto A Neto
# - Created date : 24/05/2022
# - Updated by : Fausto A Neto
# - Updated date : 06/07/2022
# - Status : Done
###########################################################################

Feature:ATP-33

    Scenario: 01.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 02. GESSIH Header
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        #Cabeçalho
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "NA011" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "NA001" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    Scenario Outline: 03. Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_VACITM1"
        And the user adds the text <VACITM1> in selected cell
        And the user hits tab
        #Alert box: Question
        Then an alert box with the text "Recalculate prices/discounts?" appears
        And the user clicks the "No" opinion in the alert box
        And the user hits enter
        Examples:
            | LIN | ITMREF   | QTY | GROPRI  | VACITM1 |
            | 1   | "BMS001" | "2" | "45.75" | "STD"   |
            | 2   | "BMS002" | "3" | "53.73" | "STD"   |

    Scenario: 04. Document Creation
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 05. Check Fiscal Operation and buttons field disabled
        Given the user clicks the "General data" tab selected by title
        And the user selects the text field with name: "Fiscal operation"
        Then the selected text field should be disabled
        Given the user opens the header drop down
        Then the "Calc. memory On/Off" action button on the header drop down is disabled
        And the "FS-DA (Contingency)" action button on the header drop down is disabled
        And the "SEFAZ" action button on the header drop down is disabled
        And the "Invoice amendment" action button on the header drop down is disabled
        And the "Preview Danfe" action button on the header drop down is disabled
        And the "Export information" action button on the header drop down is disabled
        And the "Transmit RPS" action button on the header drop down is disabled
        And the "Validate NFS-e" action button on the header drop down is disabled
        And the "Legal data" action button on the header drop down is disabled
        And the "Referenced docs." action button on the header drop down is disabled
        And the "Accounting reversal" action button on the header drop down is disabled

    Scenario: 06. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system


