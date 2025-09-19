###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-191 - Reforma Tributaria - Devolução Cliente SDH > SRH
# - OBS: Este cenário Transmite a SDH Remessa, SRH com Picking e Valida as Tags do XML
# - Jira: X3DEV-8318
# - Created by: Gustavo Albanus
# - Created date: 18/09/2025
# - Updated by:
# - Updated date:
# - Status: Done
# - Parametrizações:
###########################################################################

Feature: ATP-191

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. EXPEDIÇÃO SDH
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WK4ALLXQ0_STOFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SDHTYP"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_BPCORD"
        And the user writes "BR016" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ3_CODOPF"
        And the user writes "125" to the selected text field and hits tab key
        And the user hits escape
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario Outline: 003.Linhas
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
        And the user adds the text <XQCCTCBS> in selected cell
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   | XQCFOP | XQCSTIS | XQCCTIS  | XQCSTCBS | XQCCTCBS |
            | 1   | "BMS001" | "1" | "900.00" | "6110" | "000"   | "000001" | "000"    | "000001" |

    Scenario: 004. Criar SDH, Transmitir e Validar os Impostos
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "WK4ALLXQ3_NFESTATUS"
        And the value of the selected text field is "Authorized invoice"
        Then the user clicks the "Validation" button in the header
        And a dialog box appears
        And the user clicks the "Ok" opinion in the alert box
        And the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with name: "Valor IS"
        And the value of the selected text field is "9.00"
        And the user selects the text field with name: "Valor CBS"
        And the value of the selected text field is "8.10"
        And the user selects the text field with name: "Valor IBS Mun."
        And the value of the selected text field is "11.70"
        And the user selects the text field with name: "Valor IBS Est."
        And the value of the selected text field is "11.25"
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SDHNUM"
        And the user stores the value of the selected text field with the key: "SDHNUM"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 005. GESSRH
        Given the user opens the "GESSRH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Customer return ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WK6ALLXQ0_STOFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK6ALLXQ0_BPCORD"
        And the user writes "BR016" to the selected text field and hits tab key

    Scenario: 006. Picking GESSDH
        And the user clicks the "Selection criteria" action button on the header drop down
        And the user selects the text field with X3 field name: "SCRITSRH_CRISDHNUM"
        And the user writes the stored text with key "SDHNUM" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel
        And the user clicks the "Delivery selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SDHNUM" and with the text containing "BR016" of the picking list panel
        And the user checks the selected picking list panel item
        And the user selects the text field with X3 field name: "WK6ALLXQ3_CODOPF"
        And the user writes "140" to the selected text field and hits tab key
        And the user selects the date field with X3 field name: "WK6ALLXQ3_DTEMI"
        And the user writes today to the selected date field
        And the user selects the date field with X3 field name: "WK6ALLXQ3_DTSAIENT"
        And the user writes today to the selected date field
        And the user clicks the "Lines (tax)" tab selected by title
        And the user selects the fixed data table for x3 field name: "XQSRH3_ARRAY_PRODLIG"
        Then the user selects first row of the selected data table

    Scenario Outline: 007. Add Lines
        Given the user selects cell with X3 field name: "XQSRH3_CFOP" of selected row
        And the user adds the text <CFOP> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_VARCFOP" of selected row
        And the user adds the text <VARCFOP> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_OICMS" of selected row
        And the user adds the text <OICMS> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTICMS" of selected row
        And the user adds the text <CSTICMS> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTIPI" of selected row
        And the user adds the text <CSTIPI> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTPIS" of selected row
        And the user adds the text <CSTPIS> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTCOF" of selected row
        And the user adds the text <CSTCOF> in selected cell
        And the user hits enter
        Then the user selects table row that is below the currently selected row

        Examples:
            | CFOP   | VARCFOP | OICMS | CSTICMS | CSTIPI | CSTPIS | CSTCOF |
            | "2901" | ""      | "0"   | "90"    | "99"   | "99"   | "99"   |

    Scenario: 008. Return Creation
        Given the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "NF-e Summary" tab selected by title
        Then the user selects the text field with name: "Valor IS"
        And the value of the selected text field is "9.00"
        And the user selects the text field with name: "Valor CBS"
        And the value of the selected text field is "8.10"
        And the user selects the text field with name: "Valor IBS Mun."
        And the value of the selected text field is "11.70"
        And the user selects the text field with name: "Valor IBS Est."
        And the value of the selected text field is "11.25"

    Scenario: 009. Transmissão SEFAZ SRH
        And the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        #Verificar status da nota (6 = Autorizada)
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "[F:XQSRH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel
        And the user selects the text field with X3 field name: "WK6ALLXQ0_SRHNUM"
        And the user stores the value of the selected text field with the key: "SRHNUM"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 010. Validar Tags no XML
        Given the user opens the "XQCONSNFE" function
        And the "NF-e Monitoring" screen is displayed
        When the user selects the text field with X3 field name: "XQNFEMNT0_NUMDOC"
        And the user writes the stored text with key "SRHNUM" in the selected text field and hits tab key
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
        And the value of the selected text field contains "<vIS>9.00</vIS>"
        And the value of the selected text field contains "<vIBSUF>11.25</vIBSUF>"
        And the value of the selected text field contains "<vIBSMun>11.70</vIBSMun>"
        And the value of the selected text field contains "<vCBS>8.10</vCBS>"

    Scenario: 011. Logout
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system