###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-p-flow-poh-pih-ef
# - Description: Invoice Elements - Purchasing Picking POH PTH
# - Jira: NA
# - Legislation: BRA
# - Created by : Daniela Anile
# - Created date : 04/02/2021
# - Updated by : Fausto A Neto
# - Updated date : 31/07/2024
# - Status : Automated
###########################################################################

Feature: xq-p-flow-poh-pih-ef

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #National Unique DI
    #--------------------------------------------------------------------------------
    Scenario: 23. Header POH
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

    Scenario Outline: 24. Lines POH
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
        And the user adds the text <XQCSTCOF> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI  | XQCFOP | XQORIGEMICMS | XQCSTICMS | XQCENQ | XQCSTIPI | XQCSTPIS | XQCSTCOF |
            | 1   | "BMS001" | "19"   | "29.61" | "3101" | "0"          | "00"      | "999"  | "49"     | "01"     | "01"     |
            | 2   | "BMS002" | "6"    | "11.69" | "3101" | "0"          | "00"      | "999"  | "49"     | "01"     | "01"     |

    Scenario: 25. Invoice Elements
        Given the user clicks the "Total" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WE3ALL3_ARRAY_NBFAC"
        And the user selects the fixed cell with X3 field name: "WE3ALL3_INVDTAAMT" and row number: (1)
        And the user adds the text "15.55" in selected cell and hits enter key
        And the user selects the fixed cell with X3 field name: "WE3ALL3_INVDTAAMT" and row number: (2)
        And the user adds the text "3.65" in selected cell and hits enter key
        And the user selects the fixed cell with X3 field name: "WE3ALL3_INVDTAAMT" and row number: (4)
        And the user adds the text "4.87" in selected cell and hits enter key

    Scenario: 26. Create and Store Doc Number POH
        Given the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "POH0_POHNUM"
        And the user stores the value of the selected text field with the key: "PoDocumentNo"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 27. Header PIH
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
        And the user stores the value of the selected text field with the key: "DOCSUP044"
        Then the user clicks the Close page action icon on the header panel
        #Fim da criação da String
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "PT006" to the selected text field and hits tab key

    Scenario: 28. Picking
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Enter selection criteria" screen is displayed
        And the user selects the text field with X3 field name: "PCRITINV_WNUMCDE"
        And the user writes the stored text with key "PoDocumentNo" in the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        And the user clicks the "Order selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "PoDocumentNo" and with the text containing "PT006" of the picking list panel
        And the user checks the selected picking list panel item
        And an alert box with the text containing "Replace data from the 'General data' tab?" appears
        And the user clicks the "Yes" opinion in the alert box
        And an alert box with the text containing "Replace data in "data transport" tab?" appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: 29. General data
        Given the user clicks the "General data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "111" to the selected text field and hits tab key
        And the user selects the drop down list with name: "Unique DI"
        And the user clicks on "Yes" option of the selected drop down list
        And the user selects the text field with name: "DI Number"
        And the user writes "1234567890" to the selected text field and hits tab key
        And the user selects the date field with name: "Registry date"
        And the user writes today to the selected date field
        And the user selects the text field with name: "Export code"
        And the user writes "123ABC" to the selected text field and hits tab key
        And the user selects the drop down list with name: "International transport mode"
        And the user clicks on "Own means" option of the selected drop down list
        And the user selects the drop down list with name: "Import type"
        And the user clicks on "Importation by own means" option of the selected drop down list
        And the user selects the text field with name: "Custom clearance"
        And the user writes "Curitiba" to the selected text field and hits tab key
        And the user selects the text field with name: "EU"
        And the user writes "PR" to the selected text field and hits tab key
        And the user selects the date field with name: "Clearance date"
        And the user writes today to the selected date field
        And the user hits tab

    Scenario: 30. Management
        Given the user clicks the "Management" tab selected by title
        When the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "DOCSUP044" in the selected text field and hits tab key

    Scenario: 31. DI Data
        Given the user clicks the "DI Data" action button on the header drop down
        Then the "Import declaration" screen is displayed

    Scenario Outline: 32. Inform DI Data Additions
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

    Scenario: 33. Creation
        Given the user clicks the Close page action icon on the header panel
        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 34. Check Values Invoice Elements
        Given the user clicks the "Control" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE8ALL4_ARRAY_NBFAC"
        And the user selects the fixed cell with X3 field name: "WE8ALL4_INVORDAMT" and row number: 1
        Then the value of the selected cell is "-98.39"
        And the user selects the fixed cell with X3 field name: "WE8ALL4_INVORDAMT" and row number: 2
        Then the value of the selected cell is "3.65"
        And the user selects the fixed cell with X3 field name: "WE8ALL4_INVORDAMT" and row number: 5
        And the value of the selected cell is "4.87"
        Then the user clicks the "Close page" main action button on the right panel

    Scenario: 35. Logout
        And the user logs-out from the system