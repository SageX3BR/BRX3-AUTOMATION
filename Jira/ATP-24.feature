###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-24
# - Description: Garantir transmissão de simples remessa para cliente que possui CNPJ e IE igual ao estabelecimento
# - Jira: X3DEV-643
# - Created by : Diego Oliveira
# - Created date : 25/05/2022
# - Updated by :
# - Updated date :
# - Status : In Progress
###########################################################################


Feature: ATP-24

    Scenario: 1.Login
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. SIH Creation
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WK5INVCAXQ0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5INVCAXQ0_SIVTYP"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5INVCAXQ0_BPCINV"
        And the user writes "TE001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ3_CODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape
        Then the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    Scenario Outline: 3. Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell
        And the user hits enter
        Examples:
            | LIN | ITMREF   | QTY  | GROPRI | XQCFOP | XQOICMS | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "10" | "100"  | "5101" | "0"     | "00"      | "999"  |

    Scenario: 4. Create
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 5. Resume - Transmission and Validation
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "WK5INVCAXQ0_XQSTATUSNFE"
        And the value of the selected text field is "Authorized invoice"

    Scenario: 6. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
