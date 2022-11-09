###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-93
# - Description: Garantir que a valorização do stock esteja coerente no processo de importação
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 03/11/2022
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-93

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. General Data
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        Given the user clicks the "New" main action button on the right panel
        Then the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "PT006" to the selected text field and hits tab key

    Scenario: 3. General Data
        Given the user clicks the "General Data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "111" to the selected text field and hits tab key

    Scenario Outline: 4. Add Lines
        Given the user clicks the "Lines" tab selected by title
        When the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        And the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE6ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCFOP"
        Then the user adds the text <XQCFOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | XQCFOP |
            | 1   | "BMS001" | "1"    | "3102" |
            | 2   | "BMS002" | "2"    | "3102" |

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
        And the user selects last editable cell with X3 field name: "XQDI1_RTDESPIMP"
        And the user adds the text <RTDESPIMP> in selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_LOCDESEMB"
        And the user adds the text <LOCDESEMB> in selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_UFDESEMB"
        And the user adds the text <UFDESEMB> in selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_DTDESEMB"
        And the user enters todays date in the selected cell
        And the user clicks the "Save" main action button on the right panel

        Examples:
            | CURLIG | NUMDI        | CODEXP   | RTAFRMM  | RTDESPIMP | LOCDESEMB            | UFDESEMB |
            | "1"    | "1234567890" | "123ABC" | "200.00" | "100.00"  | "Porto de Paranagua" | "PR"     |
            | "2"    | "1234567890" | "ABC123" | "200.00" | "100.00"  | "Porto de Paranagua" | "PR"     |

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

    Scenario: 9. Validation Stock Cost
        Given the user selects the data table of section: "Purchase cost"
        When the user selects row that has the text "Purchase cost total" in column with header: "Description"
        And the user selects cell with header: "Doc currency (EUR)" of selected row
        And the user clicks on the selected cell
        When the value of the selected cell is "2,227.50"

    Scenario: 10. Logout
        Then the user clicks the Close page action icon on the header panel
        And the user logs-out from the system