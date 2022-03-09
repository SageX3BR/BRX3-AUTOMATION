###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:xq-p-flow-pih-CFOP-suggestion
# - Description: CFOP Suggestion scenarios for PIH
# - Jira: NA
# - Created by : Jonatas Hille
# - Created date : 19/05/2020
# - Updated by : Jonatas Hille
# - Updated date : 31/12/2021
# - Status : [X]Automated []Work In Progress []Broken
###########################################################################

Feature:xq-p-flow-pih-CFOP-suggestion

    Scenario: 1.Login
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #CFOP Field Validation First and Second item (Mandatory with 4 Digits)
    #--------------------------------------------------------------------------------
    Scenario: 2. CFOP Field Validation
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR013" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR005" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL0_BPRSAC"
        And the user writes "FORN" to the selected text field and hits tab key
        When the user clicks the "General data" tab selected by title
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "53" to the selected text field and hits tab key
        When the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Supplier doc no."
        Then the user writes "123ABC" to the selected text field and hits tab key

    Scenario Outline: Mandatory CFOP 2 Lines
        Given the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        And the user selects the fixed cell with X3 field name: "WE8ALL3_TYPORI" and row number: <LIN>
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
        And the user adds the text "" in selected cell and hits tab key
        And an alert box with the text "CFOP must have 4 digits" appears
        And the user clicks the "Ok" opinion in the alert box
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCFOP"
        Then the user adds the text <XQCFOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | NETPRI  | XQCFOP |
            | 1   | "BMS001" | "9"    | "23.65" | "1101" |
            | 2   | "BMS001" | "6"    | "12.95" | "1101" |

    #--------------------------------------------------------------------------------
    #CFOP suggestion checking
    #--------------------------------------------------------------------------------
    Scenario: 3. CFOP suggestion checking
        Given the user clicks the "Cancel" main action button on the right panel
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR014" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR005" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL0_BPRSAC"
        And the user writes "FORN" to the selected text field and hits tab key
        And the user clicks the "General data" tab selected by title
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "54" to the selected text field and hits tab key
        When the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Supplier doc no."
        Then the user writes "123ABC" to the selected text field and hits tab key

    Scenario Outline: Suggestion CFOP Checking By function - Line 1 Fiscal Operation - Line 2 CFOP Suggestion
        Given the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        And the user selects the fixed cell with X3 field name: "WE8ALL3_TYPORI" and row number: <LIN>
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
        And the value of the selected cell contains <XQCFOP>
        Then the user hits enter

        Examples:
            | LIN | ITMREF   | QTYUOM | NETPRI  | XQCFOP |
            | 1   | "BMS001" | "9"    | "23.65" | "1102" |
            | 2   | "BMS002" | "10"   | "15.48" | "1102" |

    #--------------------------------------------------------------------------------
    #CFOP suggestion by the function "Fiscal Operation" - First item
    #CFOP suggestion by the function "CFOP Suggestion" - Second item
    #--------------------------------------------------------------------------------
    Scenario: 4. CFOP suggestion by function
        Given the user clicks the "Cancel" main action button on the right panel
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR013" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR005" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL0_BPRSAC"
        And the user writes "FORN" to the selected text field and hits tab key
        And the user clicks the "General data" tab selected by title
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "55" to the selected text field and hits tab key
        And the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Supplier doc no."
        Then the user writes "123ABC" to the selected text field and hits tab key

    Scenario Outline: Suggestion CFOP Checking - 2 Lines
        Given the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        And the user selects the fixed cell with X3 field name: "WE8ALL3_TYPORI" and row number: <LIN>
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
        And the value of the selected cell contains <XQCFOP>
        Then the user hits enter

        Examples:
            | LIN | ITMREF   | QTYUOM | NETPRI  | XQCFOP |
            | 1   | "BMS001" | "9"    | "23.65" | "1113" |
            | 2   | "BMS002" | "10"   | "15.48" | "1113" |

    Scenario: 5. Logout
        And the user clicks the "Cancel" main action button on the right panel
        And the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system