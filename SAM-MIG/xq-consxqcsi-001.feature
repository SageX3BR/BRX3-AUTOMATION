###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-conxqcsi-001
# - Description: Teste de funcionamento da consulta CONSXQCSI
# - Jira: NA
# - Legislation: BR addon
# - Created by : Ricaro Ribeiro
# - Created date : 05/02/2022
# - Status : Automated
###########################################################################

Feature: xq-conxqcsi-001

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
            | LIN | ITMREF   | QTY  | GROPRI | XQCFOP | XQOICMS | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "10" | "100"  | "6101" | "0"     | "00"      | "999"  |

    Scenario: Create
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: Resume - Transmission and Validation
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "WK5INVCAXQ0_XQSTATUSNFE"
        And the value of the selected text field is "Authorized invoice"
        And the user selects the text field with X3 field name: "WK5INVCAXQ0_NUM"
        And the user stores the value of the selected text field with the key: "NUMEROFATURA"
        And the user clicks the "Post" button in the header
        And the user clicks the "Close page" main action button on the right panel
        And the user clicks the "Legal data" action button on the header drop down
        And the "Legal data" screen is displayed
        And the user selects the text field with X3 field name: "XQLDATANFE_CHAVENFE"
        And the user stores the value of the selected text field with the key: "CHAVE"
        And the user clicks the "OK" button in the header
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 2. Create a inquiry consulting

        Given the user opens the "CONSXQCSI" function
        Then the "NF-e invoices list" screen is displayed
        And the user selects the text field with name: "Company"
        And the user writes "BR10" to the selected text field and hits tab key
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "NF-e access key"
        And the user writes the stored text with key "CHAVE" in the selected text field and hits tab key
        And the user clicks the "Search" main action button on the right panel
        And the user selects the data table of section: "Invoices"
        And the user selects first row of the selected data table
        And the user opens "Popup view" function on toolbox of the selected row
        #fechando popup view
        And the user clicks the Close page action icon on the header panel

    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system

