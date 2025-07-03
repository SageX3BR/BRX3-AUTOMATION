###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-152
# - Description: Gerar a Tag CBENEF no XML para artigos com gestão de Stock e Sem gestão de Stock
# - Jira: X3DEV-4551
# - Created by : Gustavo Albanus
# - Created date : 08/02/2024
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################


Feature: ATP-152

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
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCODBF"
        And the user adds the text <XQCODBF> in selected cell
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   | XQCFOP | XQVARCFOP | XQCODBF    |
            | 1   | "BMS110" | "1" | "100.00" | "6102" | "3"       | "SP000202" |
            | 2   | "BMS111" | "1" | "200.00" | "6102" | "3"       | "SP000206" |

    Scenario: 3. Document Creation
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 4. Transmission and Validation
        When the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "WK5INVCAXQ0_XQSTATUSNFE"
        And the value of the selected text field is "Authorized invoice"
        And the user clicks the "Post" button in the header
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "WK5INVCAXQ0_NUM"
        And the user stores the value of the selected text field with the key: "SIHNUM"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 5. XML tags validation
        Given the user opens the "XQCONSNFE" function
        And the "NF-e Monitoring" screen is displayed
        When the user selects the text field with X3 field name: "XQNFEMNT0_NUMDOC"
        And the user writes the stored text with key "SIHNUM" in the selected text field and hits tab key
        And the user clicks the "Search" button in the header
        Then the user selects the data table with x3 field name: "XQNFEMNT1_ARRAY_NBLIG"
        And the user selects first row of the selected data table
        Given the user opens "NF-e log" function on toolbox of the selected row
        When the user selects the data table with x3 field name: "XQNFELOG1_ARRAY_NBLIG"
        #And the user selects row by multiple criteria that has the text "NFe Authorization" in column with header: "Event" and the text "103" in column with header: "SEFAZ Ret. Code"
        Then the user selects row that has the text "103" in column with header: "SEFAZ Ret. Code"
        And the user selects cell with header: "Event" of selected row
        And the user clicks on the selected cell
        And the user selects the text field with X3 field name: "XQNFELOG1_NFEXMLT"
        #Verificando os valores dos impostos editados manualmente no Scenario outline 6.
        And the value of the selected text field contains "<cBenef>SP000202</cBenef>"
        And the value of the selected text field contains "<cBenef>SP000206</cBenef>"
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel

    Scenario: 6. Logout
        And the user logs-out from the system
