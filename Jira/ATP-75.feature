###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-75
# - Description: Garantir a criação e autorização de numa Nota adicional (GESXQADD) de uma GESSRL
# - Jira: ATP-75
# - Legislation: BRA
# - Created by : Ricardo Ribeiro
# - Created date : 22/06/2022
###########################################################################

Feature: ATP-75

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"


    # #--------------------------------------------------------------------------------
    # #Creation of the Delivery
    # #--------------------------------------------------------------------------------

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
        And the user writes "BRSDL" to the selected text field and hits tab key
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Ship-to"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "123" to the selected text field and hits tab key
        And the user selects the date field with X3 field name: "WK4ALL1_DLVDAT"
        And the user writes today to the selected date field
        And the user selects the date field with X3 field name: "WK4ALL1_LNDRTNDAT"
        And the user writes today to the selected date field
        And the user hits tab
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario Outline: 3. Add Lines
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
            | 1   | "BMS103" | "2" | "16.0250" | "6415" |

    Scenario: 4. Create document
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        When the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Rejected            : 000"
        And the selected log panel includes the message "    Number of NF-e Pending return      : 000"
        Then the user clicks the Close page action icon on the header panel
        Given the user clicks the "Validation" button in the header
        When a dialog box appears
        Then the user clicks the "Ok" opinion in the alert box
        And the user selects the text field with X3 field name: "SDH0_SDHNUM"
        And the user stores the value of the selected text field with the key: "SDH_NUM"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 5. Create the Loan Return
        Given the user opens the "GESSRL" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Loan return ALL : Full entry" screen is displayed
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
        And the user selects the text field with X3 field name: "XQSRL1_CODOPF"
        And the user writes "141" to the selected text field and hits tab key
        And the user selects the date field with X3 field name: "XQSRL1_DTSAIENT"
        When the user writes a generated date in the selected date field using the value "T+1"
        And the user selects the text field with X3 field name: "XQSRL1_HRSAIENT"
        Then the user writes "10:00:00" to the selected text field and hits tab key
        And the user clicks the "Lines (tax)" tab selected by title

    Scenario: 6. Informing the CFOP in the line
        Given the user selects the fixed data table for x3 field name: "XQSRL3_ARRAY_PRODLIG"
        And the user selects first row of the selected data table
        Then the user selects cell with X3 field name: "XQSRL3_CFOP" of selected row
        And the user adds the text "2415" in selected cell
        And the user hits tab

    Scenario: 7. Create SRL document
        Given the user clicks the "Create" main action button on the right panel
        When the "Print labels" screen is displayed
        Then the user clicks the Close page action icon on the header panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with name: "Return no."
        And the user stores the value of the selected text field with the key: "FATURA"

    Scenario: Sefaz
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        When the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Rejected            : 000"
        And the selected log panel includes the message "    Number of NF-e Pending return      : 000"
        And the user clicks the "Close" main action button on the right panel
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 9.GESXQSADD Creation
        Given the user opens the "GESXQSADD" function
        Then the "Additional Invoice" screen is displayed
        #Header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "XQSADDI0_CPY"
        And the user writes "BR10" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSADDI0_FCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the drop down list with X3 field name: "XQSADDI0_DOCTYP"
        And the user clicks on "Loan Returns (SRL)" option of the selected drop down list
        Then the value of the selected drop down list is "Loan Returns (SRL)"
        And the user selects the text field with X3 field name: "XQSADDI0_ORIDOCNUM"
        And the user writes the stored text with key "FATURA" in the selected text field and hits tab key

    Scenario: 10.Tax detail
        Given the user clicks the "Tax detail" action button on the header drop down
        When the "Tax detail" screen is displayed
        Then the user selects the text field with X3 field name: "XQSTD1_CSTICMS"
        And the user writes "41" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_XQCENQ"
        And the user writes "301" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_CSTIPI"
        And the user writes "03" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_CSTPIS"
        And the user writes "07" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_CSTCOF"
        And the user writes "07" to the selected text field and hits tab key
        And the user clicks the "OK" action button on the header drop down

    Scenario: 11.Resume - Creation and Transmission
        Given the user clicks the "Close" main action button on the right panel
        Then the user clicks the "Yes" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        Given the user clicks the "SEFAZ" action button on the header drop down
        When a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Rejected            : 000"
        And the selected log panel includes the message "    Number of NF-e Pending return      : 000"
        Then the user clicks the "Close page" main action button on the right panel
        Then the user clicks the "Close page" main action button on the right panel

    Scenario: 12. Logout
        And the user logs-out from the system