###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-34
# - Description: Garantir que os campos e botões da legislação brasileira estão
#   desabilitados na criação de Nota de Crédito com estabelecimento não BR
# - Created by : Fausto A Neto
# - Created date : 24/05/2022
# - Updated by : Fausto A Neto
# - Updated date : 06/07/2022
# - Status : Done
###########################################################################

Feature:ATP-34

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
        And the user writes "PT032" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "FTC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "PT002" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    Scenario Outline: 03. Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        Then the user hits enter
        Examples:
            | LIN | ITMREF   | QTY |
            | 1   | "FIN002" | "2" |
            | 2   | "FIN003" | "3" |

    Scenario: 04. Document Creation and validation
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "Post" button in the header
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user stores the value of the selected text field with the key: "SIHNUM"


    Scenario: 05. Change transaction and selection criteria
        Given the user opens the header drop down
        And the user opens the "Utilities" section on the right panel
        And the user clicks the "Select transaction..." secondary action button on the right panel
        When the user selects the data table in the popup
        And the user selects cell with text: "AAL     Full entry credit" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice AAL : Full entry credit" screen is displayed
        Given the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "PT032" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "NCC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        When the user writes "PT002" to the selected text field and hits tab key
        And the user opens the header drop down
        And the user opens the "Option" section on the right panel
        Then the user clicks the "Selection criteria" secondary action button on the right panel
        And the user selects the text field with X3 field name: "SCRITCNO_CRISIHNUM"
        And the user writes the stored text with key "SIHNUM" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel

    Scenario: 06. Credit Note Creation
        Given the user clicks the "Select invoices" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SIHNUM" and with the text containing "PT002" of the picking list panel
        And the user checks the selected picking list panel item
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 07. Check Fiscal Operation field and buttons disabled
        Given the user clicks the "General data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
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

    Scenario: 08. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
