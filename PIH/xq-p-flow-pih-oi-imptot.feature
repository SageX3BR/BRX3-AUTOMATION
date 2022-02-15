###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-p-flow-pih-oi-imptot
# - Description: Open Items for Import invoice with the checkbox
# "Sum import taxes to inv. total" from the Fiscal operation selected
# - Jira: NA
# - Legislation: BRA
# - Created by : Daniela Anile
# - Created date : 05/02/2021
# - Updated by : Daniela Anile
# - Updated date : 05/02/2021
# - Status : Automated
###########################################################################

Feature: xq-p-flow-pih-oi-imptot

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    # #--------------------------------------------------------------------------------
    # #Foreign Invoice
    # #--------------------------------------------------------------------------------
    Scenario: 1. Header
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        #Criar string baseada em datetime$ + 5 Random
        When the user opens the header drop down
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "val(ctrans(num$(datetime$),"-:TZ","")+ num$(int(rnd(99999))))" to the selected text field and hits enter key
        And the user selects the text field with name: "Result"
        And the user stores the value of the selected text field with the key: "DOCSUP036"
        Then the user clicks the Close page action icon on the header panel
        #Fim da criação da String
        And the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "PT006" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL0_BPRSAC"
        Then the user writes "FORE" to the selected text field and hits tab key

    Scenario: 2. General data
        Given the user clicks the "General data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "127" to the selected text field and hits tab key

    Scenario: 3. Management
        Given the user clicks the "Management" tab selected by title
        When the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "DOCSUP036" in the selected text field and hits tab key

    Scenario Outline: 4. Lines
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        And the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE8ALL3_TYPORI"
        And the user selects the choice "Miscellaneous" of the selected cell
        And the user hits tab
        And the user selects last fixed cell with X3 field name: "WE8ALL3_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_NETPRI"
        And the user adds the text <NETPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQORIGEMICMS"
        And the user adds the text <XQORIGEMICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCSTIPI"
        And the user adds the text <XQCSTIPI> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCSTPIS"
        And the user adds the text <XQCSTPIS> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCSTCOF"
        Then the user adds the text <XQCSTCOF> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | NETPRI   | XQCFOP | XQORIGEMICMS | XQCSTICMS | XQCENQ | XQCSTIPI | XQCSTPIS | XQCSTCOF |
            | 1   | "BMS001" | "32"   | "120.32" | "3101" | "0"          | "00"      | "999"  | "49"     | "01"     | "01"     |
            | 2   | "BMS002" | "42"   | "95.41"  | "3101" | "0"          | "00"      | "999"  | "49"     | "01"     | "01"     |

    Scenario: 5. DI Data
        Given the user clicks the "DI Data" action button on the header drop down
        Then the "Import declaration" screen is displayed

    Scenario Outline: 6. Import Declaration
        Given the user selects the text field with X3 field name: "XQDI0_CURLIG"
        And the user writes <CURLIG> to the selected text field and hits tab key
        And the user selects the fixed data table for x3 field name: "XQDI1_ARRAY_NBDI"
        And the user selects last editable cell with X3 field name: "XQDI1_NUMDI"
        And the user adds the text <NUMDI> in selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_DTDI"
        And the user enters todays date in the selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_CODEXP"
        And the user adds the text <CODEXP> in selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_RTAFRMM"
        And the user adds the text <RTAFRMM> in selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_RTCREDPRE"
        And the user adds the text <RTCREDPRE> in selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_RTDESPIMP"
        And the user adds the text <RTDESPIMP> in selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_RTIOF"
        And the user adds the text <RTIOF> in selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_RTDESADU"
        And the user adds the text <RTDESADU> in selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_LOCDESEMB"
        And the user adds the text <LOCDESEMB> in selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_UFDESEMB"
        And the user adds the text <UFDESEMB> in selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_DTDESEMB"
        And the user enters todays date in the selected cell
        And the user clicks the "Save" main action button on the right panel

        Examples:
            | CURLIG | NUMDI        | CODEXP   | RTAFRMM | RTCREDPRE | RTDESPIMP | RTIOF  | RTDESADU | LOCDESEMB            | UFDESEMB |
            | "1"    | "1234567890" | "123ABC" | "5.12"  | "3.26"    | "7.15"    | "8.14" | "9.61"   | "Porto de Paranagua" | "PR"     |
            | "2"    | "1234567890" | "ABC123" | "2.69"  | "10.95"   | "7.12"    | "3.62" | "14.95"  | "Porto de Paranagua" | "PR"     |

    Scenario Outline: 7. Inform DI Data Additions
        Given the user selects the text field with X3 field name: "XQDI0_CURLIG"
        And the user writes <CURLIG> to the selected text field and hits tab key
        And the user selects the fixed data table for x3 field name: "XQDI1_ARRAY_NBAD"
        And the user selects last fixed cell with X3 field name: "XQDI1_NUMAD"
        And the user adds the text <NUMAD> in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_CODFAB"
        And the user adds the text <CODFAB> in selected cell
        And the user clicks the "Save" main action button on the right panel

        Examples:
            | CURLIG | NUMAD | CODFAB |
            | "1"    | "10"  | "123"  |
            | "2"    | "20"  | "456"  |

    Scenario: 8. Creation
        Given the user clicks the Close page action icon on the header panel
        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 9. Open Items
        Given the user clicks the "Open items" button in the header
        And the "Open item edit" screen is displayed
        And the user selects the fixed data table for x3 field name: "BPSDUD_ARRAY_NBECH"
        And the user selects the fixed cell with X3 field name: "BPSDUD_AMTCUR" and row number: 1
        And the value of the selected cell is "8,744.45"
        And the user clicks the Close page action icon on the header panel
        Then the user clicks the "Close page" main action button on the right panel

    Scenario: 18. Logout
        And the user logs-out from the system