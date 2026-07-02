###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-197 - Reforma Tributaria - Nota de Débito
# - OBS: Tipo de NF de Débito Multa e Juros
# - Jira: X3DEV-9526 / X3DEV-11516
# - Created by: Gustavo Albanus
# - Created date: 11/06/2026
# - Updated by:
# - Updated date:
# - Status: Done
# - Parametrizações: OPF 903
###########################################################################

Feature: ATP-197

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
        And the user writes "903" to the selected text field and hits tab key
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
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   | XQCFOP |
            | 1   | "BMS001" | "1" | "199.77" | "6102" |

    Scenario: 004. Document Creation and validation
        Given the user clicks the "Create" main action button on the right panel
        And the user waits 3 seconds
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 005. Transmissão NF-e
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
        And the user stores the value of the selected text field with the key: "SIH_NF_DEBITO"
        Then the user clicks the Close page action icon on the header panel
        And the user waits 5 seconds

    Scenario: 006. GESXQDIV - Nota de Débito
        Given the user opens the "GESXQDIV" function
        Then the "Nota de Débito" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Company"
        And the user writes "BR10" to the selected text field and hits tab key
        And the user selects the text field with name: "Site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the drop down list with name: "Document type"
        And the user clicks on "Sales Invoice (SIH)" option of the selected drop down list
        And the user hits tab
        When the user selects the text field with name: "Original document no."
        And the user writes the stored text with key "SIH_NF_DEBITO" in the selected text field and hits tab key
        And the user selects the drop down list with name: "NF type"
        And the user clicks on "Multa e juros" option of the selected drop down list
        And the user hits tab
        And the user selects the text field with name: "Invoice total value"
        And the user writes "9.90" to the selected text field and hits tab key
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 007. Transmission and Validation
        When the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "XQDIV1_NFESTATUS"
        And the value of the selected text field is "Authorized invoice"
        And the user selects the text field with X3 field name: "XQDIV0_NUM"
        And the user stores the value of the selected text field with the key: "NF_DEBITO"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 008. XML tags validation
        Given the user opens the "XQCONSNFE" function
        And the "NF-e Monitoring" screen is displayed
        And the user selects the radio buttons group with name: "Fiscal document model"
        And the user clicks on "NF-e (Déb/Cré)" radio button of the selected radio buttons group
        When the user selects the text field with X3 field name: "XQNFEMNT0_NUMDOC"
        And the user writes the stored text with key "NF_DEBITO" in the selected text field and hits tab key
        And the user clicks the "Search" button in the header
        And the user waits 3 seconds
        Then the user selects the data table with x3 field name: "XQNFEMNT1_ARRAY_NBLIG"
        And the user selects first row of the selected data table
        Given the user opens "NF-e log" function on toolbox of the selected row
        When the user selects the data table with x3 field name: "XQNFELOG1_ARRAY_NBLIG"
        And the user selects row by multiple criteria that has the text "NFe Authorization" in column with header: "Event" and the text "104" in column with header: "SEFAZ Ret. Code"
        And the user selects cell with header: "Event" of selected row
        And the user clicks on the selected cell
        And the user selects the text field with X3 field name: "XQNFELOG1_NFEXMLT"
        #Precisa ajustar os valores, pois devem ser iguais nas duas tags
        And the value of the selected text field contains "<finNFe>6</finNFe>"
        And the value of the selected text field contains "<tpNFDebito>04</tpNFDebito>"
        And the value of the selected text field contains "<vBCIBSCBS>9.90</vBCIBSCBS>"
        And the user clicks the Close page action icon on the header panel

    Scenario: 009. Logout
        Then the user clicks the Close page action icon on the header panel
        And the user logs-out from the system