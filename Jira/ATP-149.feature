##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-149
# - Description: Contabilização Nota Complementar Sem Editar Vencimentos
# - Jira: X3DEV-4184
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 05/02/2024
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-149

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. SIH Creation
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WK5ALLXQ0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ0_SIVTYP"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ0_BPCINV"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ3_CODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape
        And the user selects the text field with X3 field name: "WK5ALL2_PTE"
        And the user writes "BR_30/60/90" to the selected text field and hits tab key
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
            | LIN | ITMREF   | QTY | GROPRI  | XQCFOP | XQVARCFOP | XQOICMS | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "1" | "10.00" | "6102" | ""        | "0"     | "90"      | "999"  |

    Scenario: 003. Document Creation
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 004.Resume - Transmission and Validation
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        #Verificar status da nota (6 = Autorizada)
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "[F:XQSIH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the "Post" button in the header
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "WK5ALLXQ0_NUM"
        And the user stores the value of the selected text field with the key: "SIHNUM"
        Given the user clicks the Close page action icon on the header panel

    Scenario: 005.GESXQSADD Creation
        Given the user opens the "GESXQSADD" function
        Then the "Additional Invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "XQSADDI0_CPY"
        And the user writes "BR10" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSADDI0_FCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the drop down list with X3 field name: "XQSADDI0_DOCTYP"
        And the user clicks on "Sales Invoice (SIH)" option of the selected drop down list
        Then the value of the selected drop down list is "Sales Invoice (SIH)"
        And the user selects the text field with X3 field name: "XQSADDI0_ORIDOCNUM"
        And the user writes the stored text with key "SIHNUM" in the selected text field and hits tab key
        And the user hits escape
        And the user selects the fixed data table for x3 field name: "XQSADDI2_ARRAY_NBLIG"
        Then the user selects first row of the selected data table

    Scenario: 006.Editing Lines
        Given the user selects cell with X3 field name: "XQSADDI2_GROPRI" of selected row
        And the user adds the text "5" in selected cell
        And the user hits enter
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 007. Vencimentos
        And the user clicks the "Open items" button in the header
        Given the user selects the data table in the popup
        When the user selects first row of the selected data table
        And the user selects cell with header: "Amount" of selected row
        And the value of the selected cell is "1.67"
        When the user selects editable table row number: 2
        And the user selects cell with header: "Amount" of selected row
        And the value of the selected cell is "1.67"
        When the user selects editable table row number: 3
        And the user selects cell with header: "Amount" of selected row
        And the value of the selected cell is "1.66"
        Given the user clicks the Close page action icon on the header panel

    Scenario: 008. Logout
        And the user clicks the "Close" main action button on the right panel
        And the user logs-out from the system