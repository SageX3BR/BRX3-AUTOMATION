###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-205
# - Description: Criar Fatura de Vendas com IBS/CBS inferior a 0,01 e transmitir para a SEFAZ
# - Jira: X3DEV-11781
# - Created by : Gustavo Albanus
# - Created date : 12/07/2026
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################


Feature: ATP-205

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
        And the user hits enter
        Examples:
            | LIN | ITMREF   | QTY | GROPRI | XQCFOP |
            | 1   | "BMS122" | "1" | "2.91" | "6102" |

    Scenario: 003. Document Creation
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 004. Transmission and Validation
        When the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "WK5ALLXQ0_XQSTATUSNFE"
        And the value of the selected text field is "Authorized invoice"
        And the user selects the text field with X3 field name: "WK5ALLXQ0_NUM"
        And the user stores the value of the selected text field with the key: "DIF_SIH_NUM"

    Scenario: 005. Validation Tags XML
        Given the user opens the "XQCONSNFE" function
        And the "NF-e Monitoring" screen is displayed
        When the user selects the text field with X3 field name: "XQNFEMNT0_NUMDOC"
        And the user writes the stored text with key "DIF_SIH_NUM" in the selected text field and hits tab key
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
        And the value of the selected text field contains "<vBCIBSCBS>2.91</vBCIBSCBS>"
        And the value of the selected text field contains "<vDif>0.00</vDif>"
        And the value of the selected text field contains "<vDif>0.03</vDif>"

    Scenario: 006. Logout
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system