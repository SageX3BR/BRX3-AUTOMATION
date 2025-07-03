Feature:xq-xqnfemonit-sih

    Scenario: 1.Login scenario
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
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ3_CODOPF"
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
        And the user selects the text field with X3 field name: "WK5INVCAXQ0_NUM"
        And the user stores the value of the selected text field with the key: "FATURA"
        Then the user clicks the Close page action icon on the header panel

    Scenario: NF-e monitoring Filter

        Given the user opens the "XQCONSNFE" function
        Then the user clicks the "NF-e monitoring" tab selected by title
        And the user selects the radio buttons group with X3 field name: "XQNFEMNT0_STATUSNFE"
        And the user clicks on "Pending" radio button of the selected radio buttons group
        And the user selects the text field with name: "Site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Document number"
        And the user writes the stored text with key "FATURA" in the selected text field and hits tab key
        And the user clicks the "Search" button in the header

    Scenario: Selection
        Given the user selects the main data table of the page
        And the user selects first row of the selected data table
        And the user selects cell with X3 field name: "XQNFEMNT1_SELECAO" of selected row
        And the user clicks on the selected cell
        And the user clicks the "SEFAZ Communication" button in the header
        Then a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the radio buttons group with X3 field name: "XQNFEMNT0_STATUSNFE"
        And the user clicks on "Authorized/Rejected" radio button of the selected radio buttons group
        And the user clicks the "Search" button in the header
        And the user selects the main data table of the page
        And the user selects first row of the selected data table
        And the user selects cell with X3 field name: "XQNFEMNT1_STATUSPROC" of selected row
        And the value of the selected cell is "Authorized"
        And the user clicks the Close page action icon on the header panel

    Scenario: Logout
        And the user logs-out from the system