##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-87
# - Description: Vendas ICMS DIFAL - Grupo <ICMSUFDest> + FCP
# - JIRA: X3DEV-7278
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date :10/02/2025
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-87

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
    #And the user changes the main language code to "en-US"
    #When the user selects the "param:endPointName1" entry on endpoint panel
    #Then the "param:endPointName1" endpoint is selected

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
        #And the user writes "BR015" to the selected text field and hits tab key
        And the user writes "BR015" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key
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
            | LIN | ITMREF   | QTY | GROPRI  | XQCFOP |
            | 1   | "BMS001" | "1" | "43.71" | "6403" |

    Scenario: 004. Elementos de Faturação Frete
        And the user selects the data table of section: "Invoicing elements"
        And the user selects cell with column header: "% or amount" and row number: 3
        And the user adds the text "100" in selected cell and hits tab key

    Scenario: 005. Document Creation and validation
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 006. Verificar Cálculo de Impostos
        Given the user clicks the "NF-e Summary" tab selected by title
        And the user selects the text field with name: "ICMS payable value"
        And the value of the selected text field is "17.25"
        And the user selects the text field with name: "ICMS DIFAL value"
        And the value of the selected text field is "8.62"
        And the user selects the text field with name: "ICMS FCP value"
        And the value of the selected text field is "2.87"

    Scenario: 007. Transmissão NF-e
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
        And the user waits 3 seconds
        Then the user selects the data table with x3 field name: "XQNFEMNT1_ARRAY_NBLIG"
        And the user selects first row of the selected data table
        Given the user opens "NF-e log" function on toolbox of the selected row
        When the user selects the data table with x3 field name: "XQNFELOG1_ARRAY_NBLIG"
        #And the user selects row by multiple criteria that has the text "NFe Authorization" in column with header: "Event" and the text "103" in column with header: "SEFAZ Ret. Code"
        Then the user selects row that has the text "103" in column with header: "SEFAZ Ret. Code"
        And the user selects cell with header: "Event" of selected row
        And the user clicks on the selected cell
        And the user selects the text field with X3 field name: "XQNFELOG1_NFEXMLT"
        And the value of the selected text field contains "<indFinal>1</indFinal>"
        And the value of the selected text field contains "<indIEDest>9</indIEDest>"
        And the value of the selected text field contains "<vICMS>17.25</vICMS>"
        And the value of the selected text field contains "<vFCPUFDest>2.87</vFCPUFDest>"
        And the value of the selected text field contains "<vICMSUFDest>8.62</vICMSUFDest>"

    Scenario: 007. Logout
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system