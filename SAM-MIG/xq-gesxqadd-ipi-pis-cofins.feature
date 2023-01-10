

###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-gesxqadd-ipi-pis-cofins
# - Description: Nota Complementar de Venda com IPI/PIS/COFINS Desonerado
# - Jira: NA
# - Legislation: BR addon
# - Created by : Gustavo Albanus
# - Created date : 05/02/2022
# - Updated by : Fausto A Neto
# - Updated date : 27/10/2022
# - Status : Automated
###########################################################################

Feature: xq-gesxqadd-ipi-pis-cofins

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. SIH Creation
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
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   | XQCFOP | XQOICMS | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "3" | "100.54" | "6101" | "0"     | "00"      | "999"  |

    Scenario: 3.Create SIH
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 4.Resume - Transmission and Validation
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

    Scenario: 5.GESXQSADD Creation
        Given the user opens the "GESXQSADD" function
        Then the "Additional Invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "XQSADDI0_CPY"
        And the user writes "BR10" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSADDI0_FCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the drop down list with X3 field name: "XQSADDI0_DOCTYP"
        And the user clicks on "Sales Invoice (SIH)" option of the selected drop down list
        Then the value of the selected drop down list is "Sales Invoice (SIH)"
        And the user selects the text field with X3 field name: "XQSADDI0_ORIDOCNUM"
        And the user writes the stored text with key "SIHNUM" in the selected text field and hits tab key

    Scenario: 6.Tax detail
        Given the user clicks the "Tax detail" action button on the header drop down
        When the "Tax detail" screen is displayed
        Then the user selects the text field with X3 field name: "XQSTD0_GROPRI"
        And the user writes "100.00" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_ALIQIPI"
        And the user writes "5" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_IPIBCALC"
        And the user writes "100.00" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_CSTIPI"
        And the user writes "01" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_VALIPIDESON"
        And the user writes "5.00" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_CSTPIS"
        And the user writes "06" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_ALIQPISPERC"
        And the user writes "2" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_BASEPISVAL"
        And the user writes "100.00" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_VALPISDESON"
        And the user writes "2.00" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_CSTCOF"
        And the user writes "06" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_ALIQCOFPERC"
        And the user writes "3" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_BASECOFVAL"
        And the user writes "100.00" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_VALCOFDESON"
        And the user writes "3.00" to the selected text field and hits tab key
        And the user clicks the "OK" action button on the header drop down

    Scenario: 7.Resume - Creation and Transmission
        Given the user clicks the "Close" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user selects the date field with X3 field name: "XQSADDI1_DTVENC"
        And the user writes a generated date in the selected date field using the value "T+1"
        And the user clicks the "Create" main action button on the right panel

        Given the user clicks the "SEFAZ" action button on the header drop down
        When a log panel appears
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

    Scenario: 8.Logout
        Given the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system
