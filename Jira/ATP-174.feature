##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-174
# - Description: Gerar o Grupo Correto de PIS ST e COFINS ST no XML com Regra Parametrizada para Alíquota Reais
# - JIRA: X3DEV-7049
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 03/02/2025
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-174

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. Create a Invoice
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
        And the user writes "100" to the selected text field
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    Scenario Outline: Inserir Linha de Serviço
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
            | LIN | ITMREF   | QTY    | GROPRI | XQCFOP |
            | 1   | "BMS102" | "1000" | "7.00" | "6102" |

    Scenario: 003. Create
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 004. Verificar Cálculo de Impostos
        Given the user clicks the "NF-e Summary" tab selected by title
        And the user selects the text field with name: "PIS ST base (R$)"
        #And the value of the selected text field is "239,400.00"
        And the value of the selected text field is "1,000.00"
        And the user selects the text field with name: "PIS ST value"
        #And the value of the selected text field is "71,820.00"
        And the value of the selected text field is "34.10"
        And the user selects the text field with name: "COFINS ST base (R$)"
        #And the value of the selected text field is "204,100.00"
        And the value of the selected text field is "1,000.00"
        And the user selects the text field with name: "COFINS ST value"
        #And the value of the selected text field is "24,492.00"
        And the value of the selected text field is "157.00"

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
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user stores the value of the selected text field with the key: "SIH_NUM"
        Then the user clicks the Close page action icon on the header panel
        And the user waits 5 seconds

    Scenario: 006. XML tags validation
        Given the user opens the "XQCONSNFE" function
        And the "NF-e Monitoring" screen is displayed
        When the user selects the text field with X3 field name: "XQNFEMNT0_NUMDOC"
        And the user writes the stored text with key "SIH_NUM" in the selected text field and hits tab key
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
        And the value of the selected text field contains "<qBCProd>1000.0000</qBCProd>"
        And the value of the selected text field contains "<vAliqProd>0.0341</vAliqProd>"
        And the value of the selected text field contains "<vPIS>34.10</vPIS>"
        And the value of the selected text field contains "<qBCProd>1000.0000</qBCProd>"
        And the value of the selected text field contains "<vAliqProd>0.1570</vAliqProd>"
        And the value of the selected text field contains "<vCOFINS>157.00</vCOFINS>"

    Scenario: 007. Logout
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system