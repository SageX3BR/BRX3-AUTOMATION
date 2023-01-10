###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-72
# - Description: Garantir a criação e autorização de numa Nota adicional (GESXQADD) de uma GESSDH
# - Jira:
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 20/06/2022
# - Updated by : Gustavo Albanus
# - Updated date : 28/07/2022
# - Changes: Incluído as linhas 89 a 95 para editar as linhas
# - Status :
###########################################################################

Feature: ATP-72

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. SIH Creation
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed

        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SDH0_STOFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_SDHTYP"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_BPCORD"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSDH0_CODOPF"
        And the user writes "120" to the selected text field and hits tab key
        And the user hits escape
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY | GROPRI    | XQCFOP |
            | 1   | "BMS001" | "1" | "1000.00" | "6912" |

    Scenario: 3.Create SIH
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 4.Resume - Transmission and Validation
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "XQSDH0_NFESTATUS"
        And the value of the selected text field is "Authorized invoice"
        And the user selects the text field with X3 field name: "SDH0_SDHNUM"
        And the user stores the value of the selected text field with the key: "SDHNUM"
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
        And the user clicks on "Deliveries (SDH)" option of the selected drop down list
        Then the value of the selected drop down list is "Deliveries (SDH)"
        And the user selects the text field with X3 field name: "XQSADDI0_ORIDOCNUM"
        #And the user writes "SDH-BR01122/00000497" to the selected text field and hits tab key
        And the user writes the stored text with key "SDHNUM" in the selected text field and hits tab key
        And the user hits escape
        And the user selects the fixed data table for x3 field name: "XQSADDI2_ARRAY_NBLIG"
        Then the user selects first row of the selected data table

    Scenario: Editing Lines
        Given the user selects cell with X3 field name: "XQSADDI2_QTY" of selected row
        And the user adds the text "1" in selected cell
        And the user hits enter

    Scenario: 6.Tax detail
        Given the user clicks the "Tax detail" action button on the header drop down
        When the "Tax detail" screen is displayed
        Then the user selects the text field with X3 field name: "XQSTD0_GROPRI"
        And the user writes "100.00" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_CSTPIS"
        And the user writes "01" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_ALIQPISPERC"
        And the user writes "0.65" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_BASEPISVAL"
        And the user writes "100.00" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_VALPIS"
        And the user writes "0.65" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_CSTCOF"
        And the user writes "01" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_ALIQCOFPERC"
        And the user writes "3" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_BASECOFVAL"
        And the user writes "100.00" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_VALCOF"
        And the user writes "3.00" to the selected text field and hits tab key
        And the user clicks the "OK" action button on the header drop down

    Scenario: 7.Resume - Creation and Transmission
        Given the user clicks the "Close" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
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
        And the user writes "[F:XQSADI]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 8.Logout
        Given the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system