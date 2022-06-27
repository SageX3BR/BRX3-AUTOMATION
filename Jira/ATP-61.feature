###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-61
# - Description: Garantir que XML de distribuição seja anexado junto ao documento de origem ao transmitir uma GESSIH
# - Jira: ATP-61
# - Created by : Douglas Duarte
# - Created date : 24/06/2022
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################


Feature: ATP-61

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
            | LIN | ITMREF   | QTY | GROPRI | XQCFOP | XQVARCFOP | XQOICMS | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "1" | "100"  | "6102" | ""        | "0"     | "00"      | "999"  |

    Scenario: 4. Document Creation
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user stores the value of the selected text field with the key: "NFE_NUM2"
        And the user clicks the "Close" main action button on the right panel

    Scenario: 5. Transmission and Validation
        Given the user opens the "XQNFEAUT" function
        And the user selects the text field with X3 field name: "XQRPSAUT1_FCY"
        And the user writes "BR011" to the selected text field
        And the user selects the date field with X3 field name: "XQRPSAUT1_DATDOCINI"
        And the user writes today to the selected date field
        And the user selects the date field with X3 field name: "XQRPSAUT1_DATDOCFIN"
        And the user writes today to the selected date field
        And the user selects the text field with X3 field name: "XQRPSAUT1_SENDLIMIT"
        And the user writes "1" to the selected text field and hits enter key
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Rejected            : 000"
        And the selected log panel includes the message "    Number of NF-e Pending return      : 000"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 6. Back to last document invoice created
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        And the user selects the text field with X3 field name: "SIH0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_SIVTYP"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes the stored text with key "NFE_NUM2" in the selected text field and hits enter key
        And the user selects the text field with X3 field name: "SIH0_XQNUMNFE"
        And the user stores the value of the selected text field with the key: "NFE_NUM"


    Scenario: 7. Attachments
        Given the user clicks the "Attachments" main action button on the right panel
        And the user selects the fixed data table of section: "Attachments"
        And the user selects first row of the selected data table
        And the user selects the fixed cell with X3 field name: "AOBJTXT_NAM" and row number: 1
        And the value of the selected cell has string pattern "*[NFE_NUM]*.XML"
        And the user clicks the "Close" main action button on the right panel

    Scenario: 7. Logout
        And the user logs-out from the system