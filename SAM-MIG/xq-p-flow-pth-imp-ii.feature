###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-p-flow-pth-imp-ii
# - Description: Import receipt with Sum II value to invoice total in the NF-e Summary
# - Jira: NA
# - Legislation: BRA
# - Created by : Daniela Anile
# - Created date : 08/02/2021
# - Updated by : Fausto A Neto
# - Updated date : 16/08/2024
# - Status : Automated
###########################################################################

Feature: xq-p-flow-pth-imp-ii

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Foreign
    #--------------------------------------------------------------------------------
    Scenario: 2. Header
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "PT006" to the selected text field and hits tab key

    Scenario: 3. General Data
        Given the user clicks the "General Data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "118" to the selected text field and hits tab key
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"

    Scenario Outline: 4. Add Lines
        And the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE6ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQORIGEMICMS"
        And the user adds the text <XQORIGEMICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCSTIPI"
        And the user adds the text <XQCSTIPI> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCSTPIS"
        And the user adds the text <XQCSTPIS> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCSTCOF"
        Then the user adds the text <XQCSTCOF> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI  | XQCFOP | XQORIGEMICMS | XQCSTICMS | XQCENQ | XQCSTIPI | XQCSTPIS | XQCSTCOF |
            | 1   | "BMS001" | "21"   | "47.69" | "3101" | "0"          | "00"      | "999"  | "49"     | "01"     | "01"     |
            | 2   | "BMS002" | "16"   | "25.34" | "3101" | "0"          | "00"      | "999"  | "49"     | "01"     | "01"     |

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
            | "1"    | "1234567890" | "123ABC" | "1.69"  | "5.23"    | "7.14"    | "3.02" | "6.32"   | "Porto de Paranagua" | "PR"     |
            | "2"    | "1234567890" | "ABC123" | "0.36"  | "4.21"    | "6.25"    | "8.65" | "7.32"   | "Porto de Paranagua" | "PR"     |

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
        Then the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 9. Resume
        Given the user clicks the "Resume" tab selected by title
        And the user selects the text field with X3 field name: "XQPTH2_TTNFE"
        And the value of the selected text field is "1,629.21"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 10. Logout
        And the user logs-out from the system