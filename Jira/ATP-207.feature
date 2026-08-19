###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-207
# - Description: SIH - Exportação com Drawback Manual nas Linhas
# - Jira: X3DEV-11790
# - Created by : Gustavo Albanus
# - Created date : 30/07/2026
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################


Feature: ATP-207

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. Create a Invoice SIH
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        #Filling the Invoice header information
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "PT006" to the selected text field and hits tab key
        And the user clicks the Close page action icon on the header panel
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "102" to the selected text field and hits tab key
        #IMPORTAÇÃO
        And the user selects the text field with X3 field name: "WK5ALLXQ3_UFEMBARQUE"
        And the user writes "SP" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ3_LOCEMBARQUE"
        And the user writes "Porto de Santos" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ3_DESLOCDESP"
        And the user writes "Santos" to the selected text field and hits tab key
        And the user clicks the "Management" tab selected by title
        And the user selects the text field with X3 field name: "WK5ALL1_VACBPR"
        And the user writes "BRL" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    Scenario Outline: 003. Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   |
            | 1   | "BMS001" | "1" | "100.00" |
            | 2   | "BMS001" | "1" | "100.00" |
            | 3   | "BMS001" | "1" | "100.00" |

    Scenario: 004. Export Information
        Then the user clicks the "Create" main action button on the right panel
        And the user waits 3 seconds
        And the user clicks the "Export information" action button on the header drop down

    Scenario Outline: 005. Inform Export Informations
        Given the user selects the text field with X3 field name: "XQEXP0_CURLIG"
        And the user writes <CURLIG> to the selected text field and hits tab key
        And the user selects the data table with x3 field name: "XQEXP1_ARRAY_NBEXP"
        And the user selects first row of the selected data table
        And the user selects cell with header: "Drawback num." of selected row
        And the user adds the text <NUMDRWBCK> in selected cell
        When the user clicks the "OK" button in the header

        Examples:
            | CURLIG | NUMDRWBCK |
            | "1"    | "1111"    |
            | "2"    | "2222"    |
            | "3"    | "3333"    |

    Scenario: 006. Create
        And the user clicks the "Close" main action button on the right panel
        Then the user clicks the "Save" main action button on the right panel
        And the user waits 5 seconds
        And the user clicks the "Export information" action button on the header drop down

    Scenario Outline: 007. Check Values - Linha 1
        Given the user selects the text field with X3 field name: "XQEXP0_CURLIG"
        And the user writes <CURLIG> to the selected text field
        And the user hits tab
        And the user selects the fixed data table for x3 field name: "XQEXP1_ARRAY_NBEXP"
        And the user selects editable table row number: 1
        And the user selects cell with X3 field name: "XQEXP1_NUMDRWBCK" of selected row
        And the value of the selected cell is "1111"
        When the user clicks the "OK" button in the header

        Examples:
            | CURLIG |
            | "1"    |

    Scenario Outline: 008. Check Values - Linha 2
        Given the user selects the text field with X3 field name: "XQEXP0_CURLIG"
        And the user writes <CURLIG> to the selected text field
        And the user hits tab
        And the user selects the fixed data table for x3 field name: "XQEXP1_ARRAY_NBEXP"
        And the user selects editable table row number: 1
        And the user selects cell with X3 field name: "XQEXP1_NUMDRWBCK" of selected row
        And the value of the selected cell is "2222"
        When the user clicks the "OK" button in the header

        Examples:
            | CURLIG |
            | "2"    |

    Scenario Outline: 009. Check Values - Linha 3
        Given the user selects the text field with X3 field name: "XQEXP0_CURLIG"
        And the user writes <CURLIG> to the selected text field
        And the user hits tab
        And the user selects the fixed data table for x3 field name: "XQEXP1_ARRAY_NBEXP"
        And the user selects editable table row number: 1
        And the user selects cell with X3 field name: "XQEXP1_NUMDRWBCK" of selected row
        And the value of the selected cell is "3333"
        When the user clicks the "OK" button in the header

        Examples:
            | CURLIG |
            | "3"    |

    Scenario: 010. Logout
        Then the user clicks the Close page action icon on the header panel
        Then the user clicks the "Cancel" main action button on the right panel
        And the user clicks the "Close" main action button on the right panel
        And the user logs-out from the system