##########################################################################
#Header
#-------------------------------------------------------------------------
#- Test code: ATP-142
#- Description: NF-e - Rejeição: Chave de Acesso inválida (modelo diferente de 65)
#- Jira: X3DEV-3410
#- Legislation: BRA
#- Created by : Gustavo Albanus
#- Created date : 16/10/2023
#- Updated by : Gustavo Albanus
#- Updated date : 24/07/2024
#- Status : Done
#- Ajustes Efetuados: Ajustado a Variação da CFOP nas linhas
##########################################################################

Feature: ATP-142

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. GESSIH
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "996" to the selected text field and hits tab key
        And the user hits escape

    Scenario Outline: 003. Add Lines
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   | XQVARCFOP |
            | 1   | "BMS001" | "1" | "100.00" | ""        |

    Scenario: 004. Document Creation and validation
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        Then the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        Then the user clicks the Close page action icon on the header panel
        And the user selects the text field with name: "NF-e number"
        And the user stores the value of the selected text field with the key: "CONTADOR"
        Then the user clicks the "Legal data" action button on the header drop down
        And the user selects the text field with name: "NF-e Access key"
        And the user stores the value of the selected text field with the key: "CHAVE01"
        And the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel
        And the user waits 5 seconds

    Scenario: 005. MODCPT
        Given the user opens the "MODCPT" function
        And the user selects the text field with name: "Sequence number"
        And the user writes "XQNFX" to the selected text field and hits tab key
        And the user selects the text field with name: "Site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Next value"
        And the user writes the stored text with key "CONTADOR" in the selected text field
        And the user hits tab
        Given the user clicks the "Save" main action button on the right panel
        And the user waits 5 seconds
        And the user clicks the Close page action icon on the header panel


    Scenario: 006. GESSIH
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "996" to the selected text field and hits tab key
        And the user hits escape

    Scenario Outline: 007. Add Lines
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   | XQVARCFOP |
            | 1   | "BMS001" | "1" | "150.00" | ""        |

    Scenario: 008. Document Creation and validation
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        Then the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        Then the user clicks the Close page action icon on the header panel
        And the user selects the text field with name: "NF-e number"
        Then the value of the selected text field matches the stored text with key "CONTADOR"
        Then the user clicks the "Legal data" action button on the header drop down
        And the user selects the text field with name: "NF-e Access key"
        Then the value of the selected text field matches the stored text with key "CHAVE01"
        And the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel
        And the user waits 5 seconds

    Scenario: 009. Logout
        And the user logs-out from the system