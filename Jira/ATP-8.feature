###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-8
# - Description: Transmissão NFS-e pela Função CONSXQRPS - Migrate
# - Jira: X3DEV-40
# - Legislation: BR addon
# - Created by : Gustavo Albanus
# - Created date : 23/05/2022
# - Status : In Progress
###########################################################################

Feature: ATP-8

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
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_SIVTYP"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_BPCINV"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSIH0_CODOPF"
        And the user writes "200" to the selected text field and hits tab key
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
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQSTISS"
        And the user adds the text <XQSTISS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQEXISS"
        And the user adds the text <XQEXISS> in selected cell and hits enter key
        Examples:
            | LIN | ITMREF   | QTY | GROPRI    | XQSTISS | XQEXISS |
            | 1   | "SER017" | "1" | "2000.00" | "1"     | "1"     |

    Scenario: Create
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user stores the value of the selected text field with the key: "DOCSIH"

    Scenario: Validation CONSXQRPS
        Given the user opens the "CONSXQRPS" function
        And the user selects the radio buttons group with X3 field name: "XQRPSMT1_STATUSGRP"
        And the user clicks on "Pending" radio button of the selected radio buttons group
        And the user selects the text field with name: "Site"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with name: "Document no."
        And the user writes the stored text with key "DOCSIH" in the selected text field and hits tab key
        And the user clicks the "Search" button in the header

    Scenario: Selection
        Given the user selects the main data table of the page
        And the user selects first row of the selected data table
        And the user selects cell with X3 field name: "XQRPSMT1_SELECAO" of selected row
        And the user clicks on the selected cell
        And the user clicks the "Communication" button in the header
        Then a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Código: 100 - Autorizado"
        And the user clicks the Close page action icon on the header panel

    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system