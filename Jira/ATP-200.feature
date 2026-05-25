###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-200 - NFS-e - Calculos de PIS/COFINS em faturas como mais de uma linha
# - OBS:
# - Jira: X3DEV-10514
# - Created by: Gustavo Albanus
# - Created date: 02/03/2026
# - Updated by:
# - Updated date:
# - Status:
# - Parametrizações: FORMATO ARREDONDADO - Artigo SER017 / RTAX 7017 -- FORMATO TRUNCADO - Artigo SER023 / RTAX 7018
###########################################################################

Feature: ATP-200

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. INVOICE - ARREDONDADO
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "200" to the selected text field and hits tab key


    Scenario Outline: 003.Add Lines
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"
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
            | LIN | ITMREF   | QTY | GROPRI     | XQSTISS | XQEXISS |
            | 1   | "SER017" | "1" | "579.20"   | "1"     | "1"     |
            | 2   | "SER017" | "1" | "24683.49" | "1"     | "1"     |

    Scenario: 004. Criar Documento e Validar Impostos
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user waits 2 seconds
        Given the user clicks the "NF-e Summary" tab selected by title
        And the user selects the text field with name: "PIS RF value"
        And the value of the selected text field is "164.21"
        And the user selects the text field with name: "COFINS RF value"
        And the value of the selected text field is "757.88"
        And the user selects the text field with name: "CSLL value"
        And the value of the selected text field is "252.63"
        And the user selects the text field with name: "ISS RF value"
        And the value of the selected text field is "732.61"

    Scenario: 005. Transmissão
        Then the user clicks the "Transmit RPS" action button on the header drop down
        And a log panel appears
        Then the user clicks the Close page action icon on the header panel
        And the user selects the text field with name: "Invoice no."
        And the user stores the value of the selected text field with the key: "SIHNUM01"

    Scenario: 006. INVOICE - TRUNCADO
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "200" to the selected text field and hits tab key

    Scenario Outline: 007.Add Lines
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"
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
            | LIN | ITMREF   | QTY | GROPRI     | XQSTISS | XQEXISS |
            | 1   | "SER023" | "1" | "579.20"   | "1"     | "1"     |
            | 2   | "SER023" | "1" | "24683.49" | "1"     | "1"     |

    Scenario: 008. Criar Documento e Validar Impostos
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user waits 2 seconds
        Given the user clicks the "NF-e Summary" tab selected by title
        And the user selects the text field with name: "PIS RF value"
        And the value of the selected text field is "164.20"
        And the user selects the text field with name: "COFINS RF value"
        And the value of the selected text field is "757.88"
        And the user selects the text field with name: "CSLL value"
        And the value of the selected text field is "252.62"
        And the user selects the text field with name: "ISS RF value"
        And the value of the selected text field is "732.61"

    Scenario: 009. Transmissão
        Then the user clicks the "Transmit RPS" action button on the header drop down
        And a log panel appears
        Then the user clicks the Close page action icon on the header panel
        And the user selects the text field with name: "Invoice no."
        And the user stores the value of the selected text field with the key: "SIHNUM02"
        And the user clicks the Close page action icon on the header panel
        And the user waits 2 seconds

    Scenario: 010. Validação do RPS - ARREDONDADO
        Given the user opens the "CONSXQRPS" function
        Given the user selects the radio buttons group with X3 field name: "XQRPSMT1_STATUSGRP"
        Then the radio button "Authorized/Rejected" of the selected radio buttons group is enabled
        And the user selects the text field with X3 field name: "XQRPSMT1_FCY"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQRPSMT1_NUM"
        And the user writes the stored text with key "SIHNUM01" in the selected text field and hits tab key
        Then the user clicks the "Search" button in the header
        Given the user selects the data table with x3 field name: "XQRPSMT1_ARRAY_NBLIG"
        When the user selects first row of the selected data table
        Then the user selects cell with header: "Selection" of selected row
        And the user clicks on the selected cell
        And the user opens "NFS-e Log" function on toolbox of the selected row
        And the user selects the data table of section: "NFS-e Log"
        #And the user selects first row of the selected data table
        And the user selects editable table row number: 7
        And the user opens "Request data" function on toolbox of the selected row
        And the user selects the text field with X3 field name: "XQRPSJSON_JSON"
        And the value of the selected text field contains "ValPIS": 164.21"
        And the value of the selected text field contains "ValCOFINS": 757.88"
        And the value of the selected text field contains "ValCSLL": "252.63"
        And the value of the selected text field contains "ValISSRetido": "732.61801"
        And the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel
        And the user waits 3 seconds

    Scenario: 011. Validação do RPS - TRUNCADO
        And the user selects the text field with X3 field name: "XQRPSMT1_NUM"
        And the user writes the stored text with key "SIHNUM02" in the selected text field and hits tab key
        Then the user clicks the "Search" button in the header
        Given the user selects the data table with x3 field name: "XQRPSMT1_ARRAY_NBLIG"
        When the user selects first row of the selected data table
        Then the user selects cell with header: "Selection" of selected row
        And the user clicks on the selected cell
        And the user opens "NFS-e Log" function on toolbox of the selected row
        And the user selects the data table of section: "NFS-e Log"
        #And the user selects first row of the selected data table
        And the user selects editable table row number: 7
        And the user opens "Request data" function on toolbox of the selected row
        And the user selects the text field with X3 field name: "XQRPSJSON_JSON"
        And the value of the selected text field contains "ValPIS": 164.2"
        And the value of the selected text field contains "ValCOFINS": 757.88"
        And the value of the selected text field contains "ValCSLL": "252.62"
        And the value of the selected text field contains "ValISSRetido": "732.61801"
        And the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel

    Scenario: 012. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system


