Feature:xq-s-flow-sih-xqamend-gespay

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
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell
        And the user hits enter
        Examples:
            | LIN | ITMREF   | QTY | GROPRI | XQCFOP | XQOICMS | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "1" | "1000" | "6101" | "0"     | "00"      | "999"  |

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

    Scenario: Accounting Task Temporization
        #MAccounting task run every 60s, minimum time to wait until the previous document is posted in accounting
        And the user waits 70 seconds

    Scenario: GESPAY creation
        Given the user opens the "GESPAY" function
        And the user selects the data table in the popup
        And the user selects cell with text: "RDDI    BRA     Customer - Direct Debit" and column header: ""
        And the user clicks on the selected cell
        Then the "Customer - Direct Debit" screen is displayed
        Then the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WMP1RDDIBRA_FCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WMP1RDDIBRA_BPR"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user hits tab
        And the user selects the text field with X3 field name: "WMP1RDDIBRA_BAN"
        And the user writes "BR999" to the selected text field and hits tab key

    Scenario: Left List
        Given the user clicks the "Open items" link on the left panel
        When the user selects the data table of left panel
        Then the user selects search cell with header: "Number"
        And the user adds the stored text with key "SIHNUM" in selected cell and hits enter key
        And the user selects cell with column header: "Number" and row number: 1
        And the user clicks on the selected cell

        Then the user clicks the "Create" main action button on the right panel
        And the "Unbalanced payment" screen is displayed
        And the user clicks the "OK" button in the header
        And a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "Post" button in the header
        And the "Posting" screen is displayed
        And the user clicks the "OK" button in the header
        And the user clicks the "Close page" main action button on the right panel
        Then the user clicks the Close page action icon on the header panel

    Scenario: Logout
        And the user logs-out from the system