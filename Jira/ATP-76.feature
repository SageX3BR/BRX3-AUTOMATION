###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-76
# - Description: Garantir a criação e autorização de numa Nota adicional (GESXQADD) de uma GESSRH
# - Jira:
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 28/06/2022
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-76

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. Create a Delivery
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Ship-to"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "121" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario Outline: GESSDH Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI    | XQCFOP |
            | 1   | "BMS001" | "1" | "5000.00" | "6901" |


    Scenario: 4. Create document
        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "SDH0_SDHNUM"
        And the user stores the value of the selected text field with the key: "SDH_NUM"
        Then the user clicks the "SEFAZ" action button on the header drop down
        Then a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "XQSDH0_NFESTATUS"
		And the value of the selected text field is "Authorized invoice"
        And the user clicks the "Validation" button in the header
        And a dialog box appears
        And the user clicks the "Ok" opinion in the alert box
        And the user clicks the Close page action icon on the header panel


    Scenario: 5. GESSRH Creation
        Given the user opens the "GESSRH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Customer return ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SRH0_STOFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SRH0_BPCORD"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user clicks the "Selection criteria" action button on the header drop down
        And the user selects the text field with X3 field name: "SCRITSRH_CRISDHNUM"
        And the user writes the stored text with key "SDH_NUM" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel

        And the user clicks the "Delivery selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SDH_NUM" and with the text containing "BR001" of the picking list panel
        And the user checks the selected picking list panel item
        And the user selects the text field with X3 field name: "XQSRH1_CODOPF"
        And the user writes "140" to the selected text field and hits tab key
        #And the user clicks the "Ok" opinion in the alert box
        #And the user clicks the "Ok" opinion in the alert box
        And the user selects the date field with X3 field name: "XQSRH1_DTEMI"
        And the user writes today to the selected date field
        And the user selects the date field with X3 field name: "XQSRH1_DTSAIENT"
        And the user writes today to the selected date field

        And the user clicks the "Lines (tax)" tab selected by title
        And the user selects the fixed data table for x3 field name: "XQSRH3_ARRAY_PRODLIG"
        Then the user selects first row of the selected data table


    Scenario Outline: GESSRH Lines
        Given the user selects cell with X3 field name: "XQSRH3_CFOP" of selected row
        And the user adds the text <CFOP> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_OICMS" of selected row
        And the user adds the text <OICMS> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTICMS" of selected row
        And the user adds the text <CSTICMS> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_XQCENQ" of selected row
        And the user adds the text <XQCENQ> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTIPI" of selected row
        And the user adds the text <CSTIPI> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTPIS" of selected row
        And the user adds the text <CSTPIS> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTCOF" of selected row
        And the user adds the text <CSTCOF> in selected cell
        And the user hits enter
        Then the user selects table row that is below the currently selected row

        Examples:
            | CFOP   | OICMS | CSTICMS | XQCENQ | CSTIPI | CSTPIS | CSTCOF |
            | "2901" | "0"   | "00"    | "999"  | "49"   | "99"   | "99"   |


    Scenario: 8. Return Creation
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
        And the user stores the value of the selected text field with the key: "SRHNUM"
        Then the user clicks the Close page action icon on the header panel


    Scenario: 9.GESXQSADD Creation
        Given the user opens the "GESXQSADD" function
        Then the "Additional Invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "XQSADDI0_CPY"
        And the user writes "BR10" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSADDI0_FCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the drop down list with X3 field name: "XQSADDI0_DOCTYP"
        And the user clicks on "Customer Returns (SRH)" option of the selected drop down list
        Then the value of the selected drop down list is "Customer Returns (SRH)"
        And the user selects the text field with X3 field name: "XQSADDI0_ORIDOCNUM"
        #And the user writes "SRTBR0110062" to the selected text field and hits tab key
        And the user writes the stored text with key "SRHNUM" in the selected text field and hits tab key
        And the user hits escape

    Scenario: 10.Tax detail
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

    Scenario: 11.Resume - Creation and Transmission
        Given the user clicks the "Close" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        Given the user clicks the "SEFAZ" action button on the header drop down
        When a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "XQSADDI1_STATUSSEFAZ"
		And the value of the selected text field is "Autorizada"

    Scenario: 12.Logout
        Then the user logs-out from the system