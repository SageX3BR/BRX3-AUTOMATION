###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-199 - Elementos de faturação na importação com valores diferentes na Fatura X recepção
# - OBS: Na Recepção PTH, o Picking será da Encomenda, porém deve preencher as informações da Fatura
# - Jira: X3DEV-9633
# - Created by: Gustavo Albanus
# - Created date: 23/02/2026
# - Updated by:
# - Updated date:
# - Status:
# - Parametrizações:
###########################################################################

Feature: ATP-199

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. Header POH
        Given the user opens the "GESPOH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase order ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Order site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "PT006" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "111" to the selected text field and hits tab key
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"

    Scenario Outline: 003. Lines POH
        And the user selects editable table row number: <LIN>
        When the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQORIGEMICMS"
        And the user adds the text <XQORIGEMICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCSTIPI"
        And the user adds the text <XQCSTIPI> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCSTPIS"
        And the user adds the text <XQCSTPIS> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCSTCOF"
        And the user adds the text <XQCSTCOF> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCSTCBS"
        And the user adds the text <XQCSTCBS> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCCTCBS"
        And the user adds the text <XQCCTCBS> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI    | XQCFOP | XQORIGEMICMS | XQCSTICMS | XQCENQ | XQCSTIPI | XQCSTPIS | XQCSTCOF | XQCSTCBS | XQCCTCBS |
            | 1   | "BMS001" | "1"    | "1000.00" | "3101" | "0"          | "00"      | "999"  | "49"     | "01"     | "01"     | "410"    | "410999" |

    Scenario: 004. Create and Store Doc Number POH
        Given the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WE3ALLXQ0_POHNUM"
        And the user stores the value of the selected text field with the key: "POHNUM"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 005. Header PIH
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "PT006" to the selected text field and hits tab key

    Scenario: 006. Picking
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Enter selection criteria" screen is displayed
        And the user selects the text field with X3 field name: "PCRITINV_WNUMCDE"
        And the user writes the stored text with key "POHNUM" in the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        And the user clicks the "Order selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "POHNUM" and with the text containing "PT006" of the picking list panel
        And the user checks the selected picking list panel item
        And an alert box with the text containing "Replace data from the 'General data' tab?" appears
        And the user clicks the "Yes" opinion in the alert box
        And an alert box with the text containing "Replace data in "data transport" tab?" appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: 007. General data
        Given the user clicks the "General data" tab selected by title
        And the user selects the drop down list with name: "Unique DI"
        And the user clicks on "Yes" option of the selected drop down list
        And the user selects the text field with name: "DI/DUIMP Number"
        And the user writes "26BR00000327752" to the selected text field and hits tab key
        And the user selects the date field with name: "Registry date"
        And the user writes today to the selected date field
        And the user selects the text field with name: "Export code"
        And the user writes "IMPORT" to the selected text field and hits tab key
        And the user selects the drop down list with name: "International transport mode"
        And the user clicks on "Own means" option of the selected drop down list
        And the user selects the text field with name: "AFRMM value"
        And the user writes "50.00" to the selected text field and hits tab key
        And the user selects the text field with name: "Import cost"
        And the user writes "30.00" to the selected text field and hits tab key
        And the user selects the drop down list with name: "Import type"
        And the user clicks on "Importation by own means" option of the selected drop down list
        And the user selects the text field with name: "Custom clearance"
        And the user writes "Curitiba" to the selected text field and hits tab key
        And the user selects the text field with name: "EU"
        And the user writes "PR" to the selected text field and hits tab key
        And the user selects the date field with name: "Clearance date"
        And the user writes today to the selected date field

    Scenario: 008. Management
        Given the user clicks the "Management" tab selected by title
        And the user stores the generated value with length 7 with the key "ALEATORIO"
        And the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "ALEATORIO" in the selected text field
        And the user selects the text field with name: "Currency"
        And the user writes "BRL" to the selected text field and hits tab key

    Scenario: 009. DI Data
        Given the user clicks the "DI Data" action button on the header drop down
        Then the "Import declaration" screen is displayed

    Scenario Outline: 010. Inform DI Data Additions
        Given the user selects the text field with X3 field name: "XQDI0_CURLIG"
        And the user writes <CURLIG> to the selected text field and hits tab key
        And the user selects the fixed data table for x3 field name: "XQDI1_ARRAY_NBAD"
        And the user selects last fixed cell with X3 field name: "XQDI1_NUMAD"
        And the user adds the text <NUMAD> in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_CODFAB"
        And the user adds the text <CODFAB> in selected cell
        And the user clicks the "Save" main action button on the right panel

        Examples:
            | CURLIG | NUMAD  | CODFAB |
            | "1"    | "1234" | "AAAB" |

    Scenario: 011. Control
        Given the user clicks the Close page action icon on the header panel
        And the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL3_CUMLINAMT1"
        And the user stores the value of the selected text field with the key: "CALCVALUE"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE" in the selected text field and hits tab key
        Given the user clicks the "Control" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE8ALL4_ARRAY_NBFAC"
        When the user selects cell with column header: "Order footer amount" and row number: (10)
        And the user adds the text "75.60" in selected cell and hits enter key

    Scenario: 012. Creation
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 013. Transmission
        And the user waits 3 seconds
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        #Verificar status da nota (6 = Autorizada)
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "[F:XQPIH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 014. GESPTH
        Given the user opens the "GESPTH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "PT006" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "111" to the selected text field and hits tab key

    Scenario: 015. Picking PTH
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Preloading Criteria" screen is displayed
        And the user selects the text field with name: "Order no."
        And the user writes the stored text with key "POHNUM" in the selected text field
        And the user clicks the "OK" button in the header
        And the user clicks the "Order selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "POHNUM" and with the text containing "PT006" of the picking list panel
        And the user checks the selected picking list panel item
        And the user clicks the "Yes" opinion in the alert box
        And the user clicks the "Yes" opinion in the alert box

    Scenario: 016. Criar PTH e Validar Taxas (Devem estar igual da Fatura)
        And the user selects the text field with name: "Currency"
        And the user writes "BRL" to the selected text field and hits tab key
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        Given the user clicks the "Resume" tab selected by title
        Then the user selects the text field with name: "IPI + ICMS ST value"
        And the value of the selected text field is "75.60"
        Then the user selects the text field with name: "AFRMM Total"
        And the value of the selected text field is "22.22"
        Then the user selects the text field with name: "Import expenses total"
        And the value of the selected text field is "20.00"
        Then the user selects the text field with name: "ICMS payable value"
        And the value of the selected text field is "165.95"
        Then the user selects the text field with name: "II Value"
        And the value of the selected text field is "36.00"
        And the user clicks the "Close" main action button on the right panel

    Scenario: 017. Logout
        And the user logs-out from the system
