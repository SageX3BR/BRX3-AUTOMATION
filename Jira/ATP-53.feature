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
        And the user selects the text field with X3 field name: "SIH0_BPCINV"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user clicks the "Selection criteria" action button on the header drop down
        And the user selects the text field with X3 field name: "SCRITCNO_CRISIHNUM"
        And the user writes the stored text with key "SIHNUM" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel
        #Picking the delivery / All items
        And the user clicks the "Select invoices" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SIHNUM" and with the text containing "BR001" of the picking list panel
        And the user checks the selected picking list panel item
        And the user selects the text field with X3 field name: "XQSIH0_CODOPF"
        And the user writes "105" to the selected text field and hits tab key
    Scenario: Process Id
        Given the user selects the fixed data table for x3 field name: "XQSIH0_ARRAY_NBREF"
        And the user selects last editable cell with X3 field name: "XQSIH0_IDENTPROC"
        And the user adds the text "1" in selected cell and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5AAL4_ARRAY_NBLIG"

    Scenario Outline: 3. SIH lines
        Given the user selects editable table row number: <LIN>
        And the user edits text to <QTY> for cell with X3 field name: "WK5AAL4_QTY" of selected row
        And the user edits text to <XQCFOP> for cell with X3 field name: "WK5AAL4_XQCFOP" of selected row
        And the user edits text to <XQOICMS> for cell with X3 field name: "WK5AAL4_XQOICMS" of selected row
        And the user edits text to <XQCSTICMS> for cell with X3 field name: "WK5AAL4_XQCSTICMS" of selected row
        Then the user hits enter
        # Alterando os valores dos impostos entre as linhas, exemplo: ICMS de 1.33 e 0.34 para 1.30 e 0.37
        Examples:
            | LIN | QTY | XQCFOP | XQOICMS | XQCSTICMS |
            | 1   | "1" | "2201" | "0"     | "00"      |


    # DADO a criação de uma nota de crédito (SIH)
    # QUANDO o usuário acessar a tela “Detalhamento de Impostos“ da linha
    # ENTÃO os campos, CST, Base e Valor de todos os tributos (ICMS, IPI, PIS e COFINS) devem permitir edição
    Scenario: 4. SIH Creation
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5AAL4_ARRAY_NBLIG"


    Scenario Outline: Tax Detail - Check Calculated Values
        Given the user selects row that has the text <ITMREF> in column with X3 field name: "WK5AAL4_ITMREF"
        And the user selects cell with X3 field name: "WK5AAL4_XQDETIMPOSTO" of selected row
        When the user clicks on the icon contained in the selected cell
        Then the "Tax determination" screen is displayed
        #Check Values
        And the user selects the text field with X3 field name: "XQDTIMP1_CSTICMS"
        And the user writes <CSTICMS> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQDTIMP1_ICMSBCALC"
        And the user writes <ICMSBCALC> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQDTIMP1_VALICMSDEVID"
        And the user writes <VALICMSDEVID> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQDTIMP1_CSTIPI"
        And the user writes <CSTIPI> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQDTIMP1_IPIBCALC"
        And the user writes <IPIBCALC> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQDTIMP1_VALIPI"
        And the user writes <VALIPI> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQDTIMP1_VLCREDIPI"
        And the user writes <VLCREDIPI> to the selected text field and hits tab key
        #Valores PIS
        And the user selects the text field with X3 field name: "XQDTIMP1_CSTPIS"
        And the user writes <CSTPIS> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQDTIMP1_BASEPISVAL"
        And the user writes <BASEPISVAL> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQDTIMP1_VALPIS"
        And the user writes <VALPIS> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQDTIMP1_BCCREDPIS"
        And the user writes <BCCREDPIS> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQDTIMP1_VLCREDPIS"
        And the user writes <VLCREDPIS> to the selected text field and hits tab key
        #Valores COFINS
        And the user selects the text field with X3 field name: "XQDTIMP1_CSTCOF"
        And the user writes <CSTPIS> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQDTIMP1_BASECOFVAL"
        And the user writes <BASEPISVAL> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQDTIMP1_VALCOF"
        And the user writes <VALPIS> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQDTIMP1_BCCREDCOF"
        And the user writes <BCCREDPIS> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQDTIMP1_VLCREDCOF"
        And the user writes <VLCREDPIS> to the selected text field and hits tab key
        Then the user clicks the "OK" button in the popup header
        Then the user clicks the Close page action icon on the header panel
        #234,78, "16,4400"
        Examples:
            | ITMREF   | CSTICMS | ICMSBCALC | VALICMSDEVID | CSTIPI | IPIBCALC | VALIPI  | VLCREDIPI | CSTPIS | BASEPISVAL | VALPIS | BCCREDPIS | VLCREDPIS | CSTCOF | COFBCALC | VALCOF  | VLCREDCOF |
            | "BMS001" | "00"    | "234.77"  | "16.4300"    | "49"   | "234.77" | "11.73" | "11.73"   | "72"   | "234.77"   | "3.87" | "234.77"  | "3.87"    | "72"   | "234.77" | "11.84" | "11.84"   |




    Scenario: SEFAZ
        When the user clicks the "Save" main action button on the right panel
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
        And the user selects the text field with X3 field name: "SIHC0_NUM"
        And the user stores the value of the selected text field with the key: "SIHNUM"
        Then the user clicks the Close page action icon on the header panel



    Scenario: 8. XML tags validation
        Given the user opens the "XQCONSNFE" function
        And the "NF-e Monitoring" screen is displayed
        When the user selects the text field with X3 field name: "XQNFEMNT0_NUMDOC"
        And the user writes the stored text with key "SIHC0_NUM" in the selected text field and hits tab key
        And the user clicks the "Search" button in the header
        Then the user selects the data table with x3 field name: "XQNFEMNT1_ARRAY_NBLIG"
        And the user selects first row of the selected data table
        Given the user opens "NF-e log" function on toolbox of the selected row
        When the user selects the data table with x3 field name: "XQNFELOG1_ARRAY_NBLIG"
        And the user selects row by multiple criteria that has the text "NFe Authorization" in column with header: "Event" and the text "103" in column with header: "SEFAZ Ret. Code"
        Then the user clicks on the selected row
        And the user selects the text field with X3 field name: "XQNFELOG1_NFEXMLT"
        #Verificando os valores dos impostos editados manualmente no Scenario outline 6.
        And the value of the selected text field contains "<vICMS>234.77</vICMS>"
        And the value of the selected text field contains "<vICMS>16.43</vICMS>"
        And the value of the selected text field contains "<vIPI>11.73</vIPI>"
        And the value of the selected text field contains "<vIPI>11.73</vIPI>"
        And the value of the selected text field contains "<vPIS>3.87</vPIS>"
        And the value of the selected text field contains "<vPIS>3.87</vPIS>"
        And the value of the selected text field contains "<vCOFINS11.84</vCOFINS>"
        And the value of the selected text field contains "vCOFINS>11.84</vCOFINS>"

    Scenario: 9. Logout
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system


