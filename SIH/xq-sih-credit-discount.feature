
###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-sih-credit-discount
# - Description: Criação Nota de credito com valores de desconto
# - Jira: X3DEV-388
# - Updated date : 05/02/2022
# - Status : Automated
###########################################################################


Feature: xq-sih-credit-discount

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. SIH Creation
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SIH0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_SIVTYP"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_BPCINV"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSIH0_CODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape
        And the user selects the data table of section: "Invoicing elements"
        And the user selects cell with column header: "% or amount" and row number: 2
        And the user adds the text "5" in selected cell and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell
        And the user hits enter
        Examples:
            | LIN | ITMREF   | QTY | GROPRI   | XQCFOP | XQVARCFOP | XQOICMS | XQCSTICMS | XQCENQ |
            | 1   | "BMS002" | "1" | "100.00" | "6101" | ""        | "0"     | "00"      | "999"  |

    Scenario: Create
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: Resume - Transmission and Validation
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Rejected            : 000"
        And the selected log panel includes the message "    Number of NF-e Pending return      : 000"
        And the user clicks the "Close page" main action button on the right panel
        And the user clicks the "Post" button in the header
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user stores the value of the selected text field with the key: "SIHNUM"
        Then the user clicks the Close page action icon on the header panel


    Scenario: 3. SIH Credit Creation
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "AAL Full entry credit" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice AAL : Full entry credit" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SIH0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_SIVTYP"
        And the user writes "BRNDC" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_BPCINV"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSIH0_CODOPF"
        And the user writes "105" to the selected text field and hits tab key
        And the user hits escape

    Scenario: 4. Picking
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Credit note preloading filter" screen is displayed
        And the user selects the text field with X3 field name: "SCRITCNO_CRISIHNUM"
        And the user writes the stored text with key "SIHNUM" in the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SCRITCNO_CRISIHNUM"
        And the user stores the value of the selected text field with the key: "SIHNUM"
        And the user clicks the "OK" button in the header
        And the user clicks the "Select invoices" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SIHNUM" and with the text containing "BR011" of the picking list panel
        And the user checks the selected picking list panel item

    Scenario: 5. Creation
        Then the user clicks the "Create" main action button on the right panel
        And  a confirmation dialog appears with the message "Record has been created"

    Scenario: 6. transmission
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Rejected            : 000"
        And the selected log panel includes the message "    Number of NF-e Pending return      : 000"
        And the user clicks the "Close page" main action button on the right panel
        And the user clicks the "Post" button in the header
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 7. Logout
        And the user logs-out from the system