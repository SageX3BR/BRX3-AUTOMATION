##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-202
# - Description: Grupo de tributação regular para as CSTs 200 / cClassTrib 200022 de IBS CBS
# - JIRA: X3DEV-11762
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date :19/10/2026
# - Updated by :
# - Updated date :
# - Status : Done
# - Parametrizações:
###########################################################################

Feature: ATP-202

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
        And the user writes "BR018" to the selected text field and hits tab key
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
            | 1   | "BMS120" | "1" | "300.00" | "6102" | "13"      | ""      | ""      | "200"    | "200022" |

    Scenario: 004. Document Creation and validation
        When the user clicks the "Create" main action button on the right panel

    Scenario: 005. Validar Impostos
        Given the user clicks the "NF-e Summary" tab selected by title
        And the user selects the text field with name: "Reg. CBS tax. value"
        And the value of the selected text field is "2.70"
        And the user selects the text field with name: "Reg. UF IBS tax. value"
        And the value of the selected text field is "0.30"

    Scenario: 006. SEFAZ
        And the user waits 2 seconds
        Then the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "WK5ALLXQ0_XQSTATUSNFE"
        And the value of the selected text field is "Authorized invoice"
        And the user selects the text field with X3 field name: "WK5ALLXQ0_NUM"
        And the user stores the value of the selected text field with the key: "SIH_NUM"
        Then the user clicks the Close page action icon on the header panel
        And the user waits 2 seconds

    Scenario: 007. Validar Tags no XML SDH
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
        And the user selects row by multiple criteria that has the text "NFe Authorization" in column with header: "Event" and the text "104" in column with header: "SEFAZ Ret. Code"
        And the user selects cell with header: "Event" of selected row
        And the user clicks on the selected cell
        And the user selects the text field with X3 field name: "XQNFELOG1_NFEXMLT"
        And the value of the selected text field contains "<cClassTrib>200022</cClassTrib>"
        And the value of the selected text field contains "<pIBSUF>0.00</pIBSUF>"
        And the value of the selected text field contains "<vIBSUF>0.00</vIBSUF>"
        And the value of the selected text field contains "<pIBSMun>0.00</pIBSMun>"
        And the value of the selected text field contains "<vIBSMun>0.00</vIBSMun>"
        And the value of the selected text field contains "<pCBS>0.00</pCBS>"
        And the value of the selected text field contains "<cClassTribReg>000001</cClassTribReg>"
        And the value of the selected text field contains "<vTribRegIBSUF>0.30</vTribRegIBSUF>"
        And the value of the selected text field contains "<vTribRegCBS>2.70</vTribRegCBS>"

    Scenario: 008. Logout
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system