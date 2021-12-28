###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:xq-p-flow-pnh-CFOP-suggestion
# - Description: CFOP Suggestion scenarios for PNH
# - Jira: NA
# - Legislation: BR addon
# - Created by : Jonatas Hille
# - Created date : 26/05/2020
# - Updated by : Jonatas Hille
# - Updated date : 26/05/2020
# - Status : automated
###########################################################################

Feature:xq-p-flow-pnh-CFOP-suggestion

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #CFOP Field Validation First and Second item (Mandatory with 4 Digits)
    #--------------------------------------------------------------------------------
    Scenario: 2. CFOP Field Validation
        Given the user opens the "GESPNH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase return ALL : Full entry" screen is displayed
        #Filling the Invoice header information
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WE7ALL1_PNHFCY"
        And the user writes "BR013" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE7ALL1_BPSNUM"
        And the user writes "BR005" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE7ALL1_XQCODOPF"
        Then the user writes "56" to the selected text field and hits tab key

    Scenario Outline: Mandatory CFOP 2 Lines
        Given the user selects the fixed data table for x3 field name: "WE7ALL1_ARRAY_NBLIG"
        When the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE7ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQCFOP"
        And the user adds the text "" in selected cell and hits tab key
        And an alert box with the text "Mandatory field" appears
        And the user clicks the "Ok" opinion in the alert box
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQORIGEMICMS"
        And the user adds the text <XQORIGEMICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQCSTIPI"
        And the user adds the text <XQCSTIPI> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQCSTPIS"
        And the user adds the text <XQCSTPIS> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQCSTCOF"
        And the user adds the text <XQCSTCOF> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQCENQ"
        Then the user adds the text <XQCENQ> in selected cell and hits enter key
        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI  | XQCFOP | XQORIGEMICMS | XQCSTICMS | XQCSTIPI | XQCSTPIS | XQCSTCOF | XQCENQ |
            | 1   | "BMS001" | "12"   | "3.69"  | "5202" | "0"          | "41"      | "49"     | "01"     | "01"     | "999"  |
            | 2   | "BMS002" | "6"    | "12.95" | "5202" | "0"          | "41"      | "49"     | "01"     | "01"     | "999"  |

    #--------------------------------------------------------------------------------
    #CFOP suggestion checking
    #--------------------------------------------------------------------------------
    Scenario: 3. CFOP suggestion checking
        Given the user clicks the "Cancel" main action button on the right panel
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WE7ALL1_PNHFCY"
        And the user writes "BR014" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE7ALL1_BPSNUM"
        And the user writes "BR005" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE7ALL1_XQCODOPF"
        Then the user writes "58" to the selected text field and hits tab key

    Scenario Outline: Suggestion CFOP Checking - 2 Lines
        Given the user selects the fixed data table for x3 field name: "WE7ALL1_ARRAY_NBLIG"
        When the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE7ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQCFOP"
        And the value of the selected cell contains <XQCFOP>
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQORIGEMICMS"
        And the user adds the text <XQORIGEMICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQCSTIPI"
        And the user adds the text <XQCSTIPI> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQCSTPIS"
        And the user adds the text <XQCSTPIS> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQCSTCOF"
        And the user adds the text <XQCSTCOF> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQCENQ"
        Then the user adds the text <XQCENQ> in selected cell and hits enter key
        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI  | XQCFOP | XQORIGEMICMS | XQCSTICMS | XQCSTIPI | XQCSTPIS | XQCSTCOF | XQCENQ |
            | 1   | "BMS001" | "12"   | "3.69"  | "5202" | "0"          | "00"      | "49"     | "01"     | "01"     | "999"  |
            | 2   | "BMS002" | "2"    | "12.62" | "5202" | "0"          | "00"      | "49"     | "01"     | "01"     | "999"  |

    #--------------------------------------------------------------------------------
    #CFOP suggestion by the function "Fiscal Operation" - First item
    #CFOP suggestion by the function "CFOP Suggestion" - Second item
    #--------------------------------------------------------------------------------
    Scenario: 4. CFOP suggestion by function
        #Filling the Invoice header information
        Given the user clicks the "Cancel" main action button on the right panel
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WE7ALL1_PNHFCY"
        And the user writes "BR013" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE7ALL1_BPSNUM"
        And the user writes "BR005" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE7ALL1_XQCODOPF"
        Then the user writes "59" to the selected text field and hits tab key

    Scenario Outline: Suggestion CFOP Checking By function - Line 1 Fiscal Operation - Line 2 CFOP Suggestion
        Given the user selects the fixed data table for x3 field name: "WE7ALL1_ARRAY_NBLIG"
        When the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE7ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQCFOP"
        And the value of the selected cell contains <XQCFOP>
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQORIGEMICMS"
        And the user adds the text <XQORIGEMICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQCSTIPI"
        And the user adds the text <XQCSTIPI> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQCSTPIS"
        And the user adds the text <XQCSTPIS> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQCSTCOF"
        And the user adds the text <XQCSTCOF> in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALL1_XQCENQ"
        Then the user adds the text <XQCENQ> in selected cell and hits enter key
        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI  | XQCFOP | XQORIGEMICMS | XQCSTICMS | XQCSTIPI | XQCSTPIS | XQCSTCOF | XQCENQ |
            | 1   | "BMS001" | "12"   | "3.69"  | "5553" | "0"          | "00"      | "49"     | "01"     | "01"     | "999"  |
            | 2   | "BMS002" | "2"    | "12.62" | "5553" | "0"          | "00"      | "49"     | "01"     | "01"     | "999"  |

    Scenario: 5. Logout
        And the user clicks the "Cancel" main action button on the right panel
        And the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system