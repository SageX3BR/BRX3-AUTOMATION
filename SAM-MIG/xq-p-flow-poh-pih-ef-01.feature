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

Feature: xq-p-flow-poh-pih-ef-01

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #National
    #--------------------------------------------------------------------------------
    Scenario: 2. Header POH
        Given the user opens the "GESPOH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase order ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Order site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"

    Scenario Outline: 3. Lines POH
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
            | 1   | "BMS001" | "6"    | "12.96" | "2101" | "0"          | "00"      | "999"  | "49"     | "01"     | "01"     |
            | 2   | "BMS002" | "8"    | "15.36" | "2101" | "0"          | "00"      | "999"  | "49"     | "01"     | "01"     |

    Scenario: 4. Invoice Elements
        Given the user clicks the "Total" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WE3ALL3_ARRAY_NBFAC"
        And the user selects the fixed cell with X3 field name: "WE3ALL3_INVDTAAMT" and row number: (1)
        And the user adds the text "12.99" in selected cell and hits enter key
        And the user selects the fixed cell with X3 field name: "WE3ALL3_INVDTAAMT" and row number: (2)
        And the user adds the text "6.32" in selected cell and hits enter key
        And the user selects the fixed cell with X3 field name: "WE3ALL3_INVDTAAMT" and row number: (4)
        And the user adds the text "3.12" in selected cell and hits enter key

    Scenario: 5. Create and Store Doc Number POH
        Given the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: " WE3ALLXQ0_POHNUM"
        And the user stores the value of the selected text field with the key: "PoDocumentNo"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 6. Header PIH
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
        And the user stores the value of the selected text field with the key: "DOCSUP042"
        Then the user clicks the Close page action icon on the header panel
        #Fim da criação da String
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key

    Scenario: 7. Picking
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Enter selection criteria" screen is displayed
        And the user selects the text field with X3 field name: "PCRITINV_WNUMCDE"
        And the user writes the stored text with key "PoDocumentNo" in the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        And the user clicks the "Order selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "PoDocumentNo" and with the text containing "BR001" of the picking list panel
        And the user checks the selected picking list panel item
        And an alert box with the text containing "Replace data from the 'General data' tab?" appears
        And the user clicks the "Yes" opinion in the alert box
        And an alert box with the text containing "Replace data in "data transport" tab?" appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: 8. Management
        Given the user clicks the "Management" tab selected by title
        When the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "DOCSUP042" in the selected text field and hits tab key

    Scenario: 9. Creation
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 10. Check Values Invoice Elements
        Given the user clicks the "Control" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE8ALL4_ARRAY_NBFAC"
        And the user selects the fixed cell with X3 field name: "WE8ALL4_INVORDAMT" and row number: 1
        Then the value of the selected cell is "-26.06"
        And the user selects the fixed cell with X3 field name: "WE8ALL4_INVORDAMT" and row number: 2
        Then the value of the selected cell is "6.32"
        And the user selects the fixed cell with X3 field name: "WE8ALL4_INVORDAMT" and row number: 5
        And the value of the selected cell is "3.12"
        Then the user clicks the "Close page" main action button on the right panel

    Scenario: 35. Logout
        And the user logs-out from the system