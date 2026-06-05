###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-196 - Reforma Tributaria - SDH Remessa e Fatura de Venda com CCT 410 e ClassTrib 410999
# - OBS:
# - Jira: X3DEV-10096
# - Created by: Gustavo Albanus
# - Created date: 30/12/2025
# - Updated by:
# - Updated date:
# - Status: Done
# - Parametrizações: RTAX 1024 / Cliente BR001 / CFOP 6910 e 6102-11
###########################################################################

Feature: ATP-196

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. Expedição SDH - Remessa
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Ship-to"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "120" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario Outline: 003. SDH Linhas
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCSTIS"
        And the user adds the text <XQCSTIS> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCCTIS"
        And the user adds the text <XQCCTIS> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCSTCBS"
        And the user adds the text <XQCSTCBS> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCCTCBS"
        And the user adds the text <XQCCTCBS> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   | XQCFOP | XQCSTIS | XQCCTIS | XQCSTCBS | XQCCTCBS |
            | 1   | "BMS001" | "1" | "100.00" | "6910" | ""      | ""      | "410"    | "410999" |

    Scenario: 004. Criar Documento e Transmissão SEFAZ
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        Given the user clicks the "SEFAZ" action button on the header drop down
        Then a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "WK4ALLXQ3_NFESTATUS"
        And the value of the selected text field is "Authorized invoice"
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SDHNUM"
        And the user stores the value of the selected text field with the key: "SDH_NUM"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 005. Validar Tags no XML - SDH
        Given the user opens the "XQCONSNFE" function
        And the "NF-e Monitoring" screen is displayed
        When the user selects the text field with X3 field name: "XQNFEMNT0_NUMDOC"
        And the user writes the stored text with key "SDH_NUM" in the selected text field and hits tab key
        And the user clicks the "Search" button in the header
        And the user waits 3 seconds
        Then the user selects the data table with x3 field name: "XQNFEMNT1_ARRAY_NBLIG"
        And the user selects first row of the selected data table
        Given the user opens "NF-e log" function on toolbox of the selected row
        When the user selects the data table with x3 field name: "XQNFELOG1_ARRAY_NBLIG"
        #And the user selects row by multiple criteria that has the text "NFe Authorization" in column with header: "Event" and the text "104" in column with header: "SEFAZ Ret. Code"
        Then the user selects row that has the text "104" in column with header: "SEFAZ Ret. Code"
        And the user selects cell with header: "Event" of selected row
        And the user clicks on the selected cell
        And the user selects the text field with X3 field name: "XQNFELOG1_NFEXMLT"
        And the value of the selected text field contains "<CST>410</CST>"
        And the value of the selected text field contains "<cClassTrib>410999</cClassTrib>"
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel

    Scenario: 006. GESSIH Fatura
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
        And the user writes "100" to the selected text field and hits tab key
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
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCSTIS"
        And the user adds the text <XQCSTIS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCCTIS"
        And the user adds the text <XQCCTIS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCSTCBS"
        And the user adds the text <XQCSTCBS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCCTCBS"
        And the user adds the text <XQCCTCBS> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   | XQCFOP | XQVARCFOP | XQCSTIS | XQCCTIS | XQCSTCBS | XQCCTCBS |
            | 1   | "BMS001" | "1" | "100.00" | "6102" | "11"      | ""      | ""      | "410"    | "410999" |

    Scenario: 008. Document Creation and validation
        Given the user clicks the "Create" main action button on the right panel
        And the user waits 3 seconds
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 009. Transmissão NF-e
        And the user clicks the "SEFAZ" action button on the header drop down
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
        And the user selects the text field with X3 field name: "WK5ALLXQ0_NUM"
        And the user stores the value of the selected text field with the key: "SIH_NUM"
        Then the user clicks the Close page action icon on the header panel
        And the user waits 5 seconds

    Scenario: 010. XML tags validation
        Given the user opens the "XQCONSNFE" function
        And the "NF-e Monitoring" screen is displayed
        When the user selects the text field with X3 field name: "XQNFEMNT0_NUMDOC"
        And the user writes the stored text with key "SIH_NUM" in the selected text field and hits tab key
        And the user clicks the "Search" button in the header
        And the user waits 3 seconds
        Then the user selects the data table with x3 field name: "XQNFEMNT1_ARRAY_NBLIG"
        And the user selects first row of the selected data table
        Given the user opens "NF-e log" function on toolbox of the selected row
        When the user selects the data table with x3 field name: "XQNFELOG1_ARRAY_NBLIG"
        #And the user selects row by multiple criteria that has the text "NFe Authorization" in column with header: "Event" and the text "104" in column with header: "SEFAZ Ret. Code"
        Then the user selects row that has the text "104" in column with header: "SEFAZ Ret. Code"
        And the user selects cell with header: "Event" of selected row
        And the user clicks on the selected cell
        And the user selects the text field with X3 field name: "XQNFELOG1_NFEXMLT"
        And the value of the selected text field contains "<CST>410</CST>"
        And the value of the selected text field contains "<cClassTrib>410999</cClassTrib>"

    Scenario: 011. Logout
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system


