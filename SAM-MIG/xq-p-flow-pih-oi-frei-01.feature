###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-p-flow-pih-oi-frei
# - Description: Open Items for invoice with freight
# - Jira: NA
# - Legislation: BRA
# - Created by : Daniela Anile
# - Created date : 05/02/2021
# - Updated by : Fausto A Neto
# - Updated date : 06/08/2024
# - Status : Automated
###########################################################################

Feature: xq-p-flow-pih-oi-frei-01

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #National Invoice
    #--------------------------------------------------------------------------------
    Scenario: 2. Header
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        #Criar string baseada em datetime$ + 5 Random
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "val(ctrans(num$(datetime$),"-:TZ","")+ num$(int(rnd(99999))))" to the selected text field and hits enter key
        And the user selects the text field with name: "Result"
        And the user stores the value of the selected text field with the key: "DOCSUP030"
        Then the user clicks the Close page action icon on the header panel
        #Fim da criação da String
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key

    Scenario: 3. General data
        Given the user clicks the "General data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key

    Scenario: 4. Management and Invoicing element
        Given the user clicks the "Management" tab selected by title
        When the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "DOCSUP030" in the selected text field and hits tab key
        And the user selects the text field with name: "Payment term"
        And the user writes "BR_AVISTA" to the selected text field and hits tab key

        Then the user selects the fixed data table for x3 field name: "WE8ALL1_ARRAY_NBFAC1"
        #Freight
        And the user selects the fixed cell with X3 field name: "WE8ALL1_INVDTAAMT1" and row number: (2)
        And the user adds the text "25.75" in selected cell and hits enter key

    Scenario Outline: 5. Lines
        Given the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        And the user selects last row of the selected data table
        And the user opens "Popup view" function on toolbox of the selected row
        And the user selects the drop down list with name: "Source"
        And the user clicks on "Miscellaneous" option of the selected drop down list
        And the user hits tab
        And the user selects the text field with X3 field name: "WE8ALL3_ITMREF"
        And the user writes <ITMREF> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_QTYUOM"
        And the user writes <QTYUOM> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_NETPRI"
        And the user writes <NETPRI> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQCFOP"
        And the user writes <XQCFOP> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQORIGEMICMS"
        And the user writes <XQORIGEMICMS> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQCSTICMS"
        And the user writes <XQCSTICMS> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQCENQ"
        And the user writes <XQCENQ> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQCSTIPI"
        And the user writes <XQCSTIPI> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQCSTPIS"
        And the user writes <XQCSTPIS> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQCSTCOF"
        And the user writes <XQCSTCOF> to the selected text field and hits enter key
        Then the user clicks the Close page action icon on the header panel

        Examples:
            | LIN | ITMREF   | QTYUOM | NETPRI  | XQCFOP | XQORIGEMICMS | XQCSTICMS | XQCENQ | XQCSTIPI | XQCSTPIS | XQCSTCOF |
            | 1   | "BMS001" | "14"   | "12.69" | "2101" | "0"          | "00"      | "999"  | "49"     | "01"     | "01"     |
            | 2   | "BMS002" | "16"   | "25.36" | "2101" | "0"          | "00"      | "999"  | "49"     | "01"     | "01"     |

    Scenario: 6. Control

        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL3_CUMLINAMT1"
        And the user stores the value of the selected text field with the key: "CALCVALUE"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE" in the selected text field and hits tab key


    Scenario: 7. Creation
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 8. Invoicing elements control
        Given the user clicks the "Control" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE8ALL4_ARRAY_NBFAC"
        When the user selects cell with column header: "Order footer amount" and row number: (2)
        And the user adds the text "25.75" in selected cell and hits enter key
        Then the user clicks the "Save" main action button on the right panel
        And an alert box with the text containing "Recalculate taxes?" appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: 8. Open Items
        Given the user clicks the "Open items" button in the header
        And the "Open item edit" screen is displayed
        And the user selects the fixed data table for x3 field name: "BPSDUD_ARRAY_NBECH"
        And the user selects the fixed cell with X3 field name: "BPSDUD_AMTCUR" and row number: 1
        And the value of the selected cell is "670.09"
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel

    Scenario: 28. Logout
        And the user logs-out from the system