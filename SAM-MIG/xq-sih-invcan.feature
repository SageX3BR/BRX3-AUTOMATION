Feature:xq-sih-invcan

    Scenario: 1. Login
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. SIH Header
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

    Scenario Outline: 3. SIH lines
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
            | LIN | ITMREF   | QTY  | GROPRI  | XQCFOP | XQOICMS | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "10" | "10.54" | "6101" | "0"     | "00"      | "999"  |

    Scenario: 4. SIH Creation
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 5. SIH Transmission and Validation
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "WK5INVCAXQ0_XQSTATUSNFE"
        And the value of the selected text field is "Authorized invoice"
        And the user clicks the "Post" button in the header
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "WK5INVCAXQ0_NUM"
        And the user stores the value of the selected text field with the key: "SIHNUM"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 6. SIH - INVCAN
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "INVCA   invoice cancellation" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice INVCA : invoice cancellation" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user clicks the "Ok" opinion in the alert box
        And the user selects the text field with X3 field name: "WK5INVCAXQ0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5INVCAXQ0_BPCINV"
        And the user writes "BR001" to the selected text field and hits tab key

    Scenario: 7. Picking

        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Credit note preloading filter" screen is displayed
        And the user selects the text field with X3 field name: "SCRITCNO_CRISIHNUM"
        And the user writes the stored text with key "SIHNUM" in the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        And the user clicks the "Invoices to cancel" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SIHNUM" and with the text containing "BR011" of the picking list panel
        And the user checks the selected picking list panel item

    Scenario: 8. INVCAN - Creation
        Then the user clicks the "Create" main action button on the right panel
        And  a confirmation dialog appears with the message "Record has been created"

    Scenario: 9. INVCAN - transmission
        Given the user clicks the "SEFAZ" action button on the header drop down
        And an alert box with the text containing "Warning! This request can not be reverted! Are you sure you want to cancel:" appears
        And the user clicks the "Yes" opinion in the alert box
        Then the "Confirm" screen is displayed
        And the user selects the text field with X3 field name: "XQINPUT_XQINPTEXTO"
        And the user writes "TESTE DE CANCELAMENTO DE NF-E VIA ATP" to the selected text field
        And the user clicks the "OK" button in the header
        Then a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Invoice Cancelled"
        And the user clicks the "Close page" main action button on the right panel
        Then the user clicks the Close page action icon on the header panel


    Scenario: 10. Logout
        And the user logs-out from the system
