###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-165
# - Description: Geração do ICMS ST cobrado anteriormente
# - Jira: X3DEV-5280
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 16/04/2024
# - Updated by :
# - Updated date :
# - Status : Done
# - Ajustes Efetuados = Parametrização no Ambiente para RTAX/VTAX/Variação de CFOP e OPF
###########################################################################

Feature: ATP-165

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. PTH Creation
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key

    Scenario: 3. General Data
        Given the user clicks the "General Data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "158" to the selected text field and hits tab key

    Scenario Outline: 4. Add Lines
        Given the user clicks the "Lines" tab selected by title
        When the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        And the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE6ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_BPSLOT"
        And the user adds the text <BPSLOT> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_VAT1"
        And the user adds the text <VAT1> in selected cell and hits tab key
        #Then the user clicks the "Ok" option in the alert box
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCFOP"
        Then the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | BPSLOT    | GROPRI    | VAT1  | XQCFOP | XQVARCFOP | XQCSTICMS |
            | 1   | "BMS112" | "1"    | "LOTEFOR" | "4000.00" | "BRL" | "2102" | "3"       | "10"      |

    Scenario: 5. Creation
        And the user clicks the "OK" button in the header
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 6. Tax Detail
        Given the user clicks the "Tax detail" action button on the header drop down
        Then the "Tax detail" screen is displayed
        And the user selects the text field with X3 field name: "XQPTD1_VLFINICMS"
        And the value of the selected text field is "312.00"
        Then the user clicks the Close page action icon on the header panel
        And the user waits 5 seconds

    Scenario: 7. Popup View
        Given the user clicks the "Lines" tab selected by title
        When the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        And the user selects first row of the selected data table
        And the user selects cell with X3 field name: "WE6ALL1_LOT" of selected row
        And the user stores the value of the selected cell with the key: "LOTSDH"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 8. GESSDH
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed

        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WK4ALLXQ0__STOFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SDHTYP"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_BPCORD"
        And the user writes "BR002" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQWK4ALLXQ0_CODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape

    Scenario Outline: 9. Delivery Lines
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_LOT"
        And the user adds the stored text with key "LOTSDH" in selected cell and hits tab key
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   | XQCFOP | XQCSTICMS |
            | 1   | "BMS112" | "1" | "400.00" | "6102" | "60"      |

    Scenario: 10. Create document
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user waits 5 seconds
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"


    Scenario Outline: 11. Tax Detail - Check Calculated Values
        Given the user selects row that has the text <ITMREF> in column with X3 field name: "WK4ALL1_ITMREF"
        And the user selects cell with X3 field name: "WK4ALL1_XQDETIMPOSTO" of selected row
        When the user clicks on the icon contained in the selected cell
        Then the "Tax determination" screen is displayed
        #Check Values
        And the user selects the text field with X3 field name: "XQDTIMP1_CAICMSSTVAL"
        And the value of the selected text field is <CAICMSSTVAL>
        #Then the user clicks the Close page action icon on the header panel

        Examples:
            | ITMREF   | CAICMSSTVAL |
            | "BMS112" | "312.0000"  |

    Scenario: 12. Logout
        And the user clicks the Close page action icon on the header panel
        And the user clicks the "Cancel" main action button on the right panel
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
