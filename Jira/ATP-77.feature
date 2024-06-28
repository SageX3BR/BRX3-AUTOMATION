###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-77
# - Description: Garantir a criação e autorização de numa Nota adicional (GESXQADD) de uma GESSRS
# - Jira: ATP-77
# - Created by : Ueder Budni
# - Created date : 27/06/2022
# - Updated by : Gustavo Albanus
# - Updated date : 28/06/2024
# - Changes: Ajustado a opção de documento na SADD
###########################################################################

Feature: ATP-77

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
        And the user writes "BRSDC" to the selected text field and hits tab key
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Ship-to"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "122" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario Outline: 3. Delivery Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQOICMS"
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY | GROPRI    | XQCFOP |
            | 1   | "BMS103" | "3" | "16.0250" | "6414" |

    Scenario: 4. Create document
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        Given the user clicks the "SEFAZ" action button on the header drop down
        Then a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "XQSDH0_NFESTATUS"
        And the value of the selected text field is "Authorized invoice"
        Given the user clicks the "Validation" button in the header
        When a dialog box appears
        Then the user clicks the "Ok" opinion in the alert box
        And the user selects the text field with X3 field name: "SDH0_SDHNUM"
        And the user stores the value of the selected text field with the key: "SDH_NUM"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 5. Create the Subcontraction material Return
        Given the user opens the "GESSRS" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Subcontract material return ALL : Full entry" screen is displayed
        #Header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Ship-to"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user clicks the "Selection criteria" action button on the header drop down
        And the user selects the text field with name: "Delivery no."
        And the user writes the stored text with key "SDH_NUM" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel
        #Picking the delivery / All items
        And the user clicks the "Delivery selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SDH_NUM" and with the text containing "BR001" of the picking list panel
        And the user checks the selected picking list panel item
        And the user selects the text field with X3 field name: "XQSRS1_CODOPF"
        And the user writes "142" to the selected text field and hits tab key
        And the user selects the date field with X3 field name: "XQSRS1_DTSAIENT"
        When the user writes a generated date in the selected date field using the value "T+1"
        And the user selects the text field with X3 field name: "XQSRS1_HRSAIENT"
        Then the user writes "10:00:00" to the selected text field and hits tab key
        And the user clicks the "Lines (tax)" tab selected by title

    Scenario: 6. Informing the CFOP in the line
        Given the user selects the fixed data table for x3 field name: "XQSRS3_ARRAY_PRODLIG"
        And the user selects first row of the selected data table
        Then the user selects cell with X3 field name: "XQSRS3_CFOP" of selected row
        And the user adds the text "2414" in selected cell
        And the user hits tab

    Scenario: 7. Create SRS document
        Given the user clicks the "Create" main action button on the right panel
        #And the "Print labels" screen is displayed
        #Then the user clicks the Close page action icon on the header panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        Then the user clicks the Close page action icon on the header panel
        #Verificar status da nota (6 = Autorizada)
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "[F:XQSRH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel
        And the user selects the text field with X3 field name: "SRS0_SRHNUM"
        And the user stores the value of the selected text field with the key: "SRS_NUM"

    Scenario: 8.GESXQSADD Creation
        Given the user opens the "GESXQSADD" function
        Then the "Additional Invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "XQSADDI0_CPY"
        And the user writes "BR10" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSADDI0_FCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the drop down list with X3 field name: "XQSADDI0_DOCTYP"
        And the user clicks on "Subc. Material Return (SRS)" option of the selected drop down list
        Then the value of the selected drop down list is "Subc. Material Return (SRS)"
        And the user selects the text field with X3 field name: "XQSADDI0_ORIDOCNUM"
        And the user writes the stored text with key "SRS_NUM" in the selected text field and hits tab key
        And the user hits escape

    Scenario: 9.Tax detail
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
        And the user selects the text field with X3 field name: "XQSTD1_VALCOFDESON"
        And the user writes "3.00" to the selected text field and hits tab key
        And the user clicks the "OK" action button on the header drop down

    Scenario: 10.Resume - Creation and Transmission
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
        Then the user clicks the "Close page" main action button on the right panel

    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system