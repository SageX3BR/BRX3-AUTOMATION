###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-53
# - Description: Garantir que ao editar os campos de impostos de uma nota de crédito (SIH)
#                os valores são refletidos no resumo dos impostos e no XML
# - Created by : Carla Cury
# - Created date : 05/07/2022
# - Updated by :
# - Updated date :
# - Status : In progress
###########################################################################

Feature: ATP-53

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. SIH Header
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SIH0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_SIVTYP"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_BPCINV"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSIH0_CODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    Scenario Outline: 3. SIH lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell
        And the user hits enter
        Examples:
            | LIN | ITMREF   | QTY | GROPRI   | XQCFOP | XQOICMS | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "2" | "234.78" | "6101" | "0"     | "00"      | "999"  |

    Scenario: 4. SIH Creation
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 5. SIH Transmission and Validation
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "SIH0_XQSTATUSNFE"
        And the value of the selected text field is "Authorized invoice"
        And the user clicks the "Post" button in the header
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user stores the value of the selected text field with the key: "SIHNUM"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 5. Creation of the Credit Invoice
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "AAL     Full entry credit" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice AAL : Full entry credit" screen is displayed
        #Header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SIH0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SRH0_BPCORD"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user clicks the "Selection criteria" action button on the header drop down
        And the user selects the text field with X3 field name: "SCRITSRH_CRISDHNUM"
        And the user writes the stored text with key "SDH_NUM10" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel
        #Picking the delivery / All items
        And the user clicks the "Delivery selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SDH_NUM10" and with the text containing "BR001" of the picking list panel
        And the user checks the selected picking list panel item
        And the user selects the text field with X3 field name: "XQSRH1_CODOPF"
        And the user writes "140" to the selected text field and hits tab key
        And the user selects the date field with X3 field name: "XQSRH1_DTEMI"
        And the user writes today to the selected date field
        And the user selects the date field with X3 field name: "XQSRH1_DTSAIENT"
        And the user writes today to the selected date field
        And the user clicks the "Lines (tax)" tab selected by title
        And the user selects the fixed data table for x3 field name: "XQSRH3_ARRAY_PRODLIG"
        Then the user selects first row of the selected data table

    Scenario Outline: 6. Add Lines
        Given the user selects cell with X3 field name: "XQSRH3_CFOP" of selected row
        And the user adds the text <CFOP> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_OICMS" of selected row
        And the user adds the text <ORIICMS> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTICMS" of selected row
        And the user adds the text <CSTICMS> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_XQCENQ" of selected row
        And the user adds the text <XQCENQ> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTIPI" of selected row
        And the user adds the text <IPICST> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTPIS" of selected row
        And the user adds the text <PISCST> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTCOF" of selected row
        And the user adds the text <COFCST> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_VALICMSOP" of selected row
        And the user adds the text <VALICMS> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_VALICMSDEVID" of selected row
        And the user adds the text <VICMSDEV> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_IPIBCALC" of selected row
        And the user adds the text <IPIBCAL> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_VALIPI" of selected row
        And the user adds the text <IPIVAL> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_BASEPISVAL" of selected row
        And the user adds the text <PISBASE> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_VALPIS" of selected row
        And the user adds the text <PISVAL> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_BASECOFVAL" of selected row
        And the user adds the text <COFBASE> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_VALCOF" of selected row
        And the user adds the text <COFVAL> in selected cell
        And the user hits enter
        Then the user selects table row that is below the currently selected row
        # Alterando os valores dos impostos entre as linhas, exemplo: ICMS de 1.33 e 0.34 para 1.30 e 0.37
        Examples:
            | CFOP   | ORIICMS | CSTICMS | XQCENQ | IPICST | PISCST | COFCST | VALICMS | VICMSDEV | IPIBCAL | IPIVAL | PISBASE | PISVAL | COFBASE | COFVAL |
            | "2901" | "0"     | "00"    | "999"  | "49"   | "01"   | "01"   | "1.30"  | "1.30"   | "19.19" | "1.90" | "17.85" | "0.10" | "17.85" | "0.50" |
            | "2901" | "0"     | "00"    | "999"  | "49"   | "01"   | "01"   | "0.37"  | "0.37"   | "4.68"  | "0.49" | "4.35"  | "0.05" | "4.35"  | "0.17" |

    Scenario: 7. Return Creation
        Given the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
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
        And the user selects the text field with X3 field name: "SRH0_SRHNUM"
        And the user stores the value of the selected text field with the key: "SRH_NUM"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 8. XML tags validation
        Given the user opens the "XQCONSNFE" function
        And the "NF-e Monitoring" screen is displayed
        When the user selects the text field with X3 field name: "XQNFEMNT0_NUMDOC"
        And the user writes the stored text with key "SRH_NUM" in the selected text field and hits tab key
        And the user clicks the "Search" button in the header
        Then the user selects the data table with x3 field name: "XQNFEMNT1_ARRAY_NBLIG"
        And the user selects first row of the selected data table
        Given the user opens "NF-e log" function on toolbox of the selected row
        When the user selects the data table with x3 field name: "XQNFELOG1_ARRAY_NBLIG"
        And the user selects row by multiple criteria that has the text "NFe Authorization" in column with header: "Event" and the text "103" in column with header: "SEFAZ Ret. Code"
        Then the user clicks on the selected row
        And the user selects the text field with X3 field name: "XQNFELOG1_NFEXMLT"
        #Verificando os valores dos impostos editados manualmente no Scenario outline 6.
        And the value of the selected text field contains "<vICMS>1.30</vICMS>"
        And the value of the selected text field contains "<vICMS>0.37</vICMS>"
        And the value of the selected text field contains "<vIPI>1.90</vIPI>"
        And the value of the selected text field contains "<vIPI>0.49</vIPI>"
        And the value of the selected text field contains "<vPIS>0.10</vPIS>"
        And the value of the selected text field contains "<vPIS>0.05</vPIS>"
        And the value of the selected text field contains "<vCOFINS>0.50</vCOFINS>"
        And the value of the selected text field contains "vCOFINS>0.17</vCOFINS>"

    Scenario: 9. Logout
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system


