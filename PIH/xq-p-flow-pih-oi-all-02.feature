###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-p-flow-pih-oi-all
# - Description: Open Items for invoice with freight, insurance and discount
# - Jira: NA
# - Legislation: BRA
# - Created by : Daniela Anile
# - Created date : 05/02/2021
# - Updated by : Daniela Anile
# - Updated date : 05/02/2021
# - Status : Automated
###########################################################################

Feature: xq-p-flow-pih-oi-all-02

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Foreign Invoice
    #--------------------------------------------------------------------------------
    Scenario: 2. Header
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
        And the user stores the value of the selected text field with the key: "DOCSUP026"
        Then the user clicks the Close page action icon on the header panel
        #Fim da criação da String
        Given the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "PT006" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL0_BPRSAC"
        Then the user writes "FORE" to the selected text field and hits tab key

    Scenario: 10. General data
        Given the user clicks the "General data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "133" to the selected text field and hits tab key

    Scenario: 11. Management
        Given the user clicks the "Management" tab selected by title
        When the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "DOCSUP026" in the selected text field and hits tab key

    Scenario Outline: 12. Lines
        Given the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        And the user selects last fixed cell with X3 field name: "WE8ALL3_TYPORI"
        And the user selects the choice "Miscellaneous" of the selected cell
        And the user hits tab key in the selected cell
        And the choice selected of the selected cell is "Miscellaneous"
        And the user selects last editable cell with X3 field name: "WE8ALL3_ITMREF"
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
            | LIN | ITMREF   | QTYUOM | NETPRI  | XQCFOP | XQORIGEMICMS | XQCSTICMS | XQCENQ | XQCSTIPI | XQCSTPIS | XQCSTCOF |
            | 1   | "BMS001" | "26"   | "14.69" | "3101" | "0"          | "00"      | "999"  | "49"     | "01"     | "01"     |
            | 2   | "BMS002" | "14"   | "91.36" | "3101" | "0"          | "00"      | "999"  | "49"     | "01"     | "01"     |

    Scenario: 13. DI Data
        Given the user clicks the "DI Data" action button on the header drop down
        Then the "Import declaration" screen is displayed

    Scenario Outline: 14. Import Declaration
        Given the user selects the text field with X3 field name: "XQDI0_CURLIG"
        And the user writes <CURLIG> to the selected text field and hits tab key
        And the user selects the fixed data table for x3 field name: "XQDI1_ARRAY_NBDI"
        And the user selects last editable cell with X3 field name: "XQDI1_NUMDI"
        And the user adds the text <NUMDI> in selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_DTDI"
        And the user enters todays date in the selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_CODEXP"
        And the user adds the text <CODEXP> in selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_LOCDESEMB"
        And the user adds the text <LOCDESEMB> in selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_UFDESEMB"
        And the user adds the text <UFDESEMB> in selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_DTDESEMB"
        And the user enters todays date in the selected cell
        And the user clicks the "Save" main action button on the right panel

        Examples:
            | CURLIG | NUMDI        | CODEXP   | LOCDESEMB            | UFDESEMB |
            | "1"    | "1234567890" | "123ABC" | "Porto de Paranagua" | "PR"     |
            | "2"    | "1234567890" | "ABC123" | "Porto de Paranagua" | "PR"     |

    Scenario Outline: 15. Inform DI Data Additions
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

    Scenario: 16. Control
        Given the user clicks the Close page action icon on the header panel
        And the user clicks the "Control" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE8ALL4_ARRAY_NBFAC"
        And the user selects the fixed cell with X3 field name: "WE8ALL4_INVDTAAMT" and row number: 1
        And the user adds the text "21.25" in selected cell and hits enter key
        And the user selects the fixed cell with X3 field name: "WE8ALL4_INVDTAAMT" and row number: 5
        And the user adds the text "8.36" in selected cell and hits enter key
        And the user selects the fixed cell with X3 field name: "WE8ALL4_INVDTAAMT" and row number: 2
        Then the user adds the text "12.69" in selected cell and hits enter key

    Scenario: 17. Creation
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 18. Open Items
        Given the user clicks the "Open items" button in the header
        And the "Open item edit" screen is displayed
        And the user selects the fixed data table for x3 field name: "BPSDUD_ARRAY_NBECH"
        And the user selects the fixed cell with X3 field name: "BPSDUD_AMTCUR" and row number: 1
        And the value of the selected cell is "1,837.39"
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel

    Scenario: 28. Logout
        And the user logs-out from the system