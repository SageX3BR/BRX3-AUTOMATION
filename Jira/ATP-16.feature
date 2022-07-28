###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-16
# - Description: Criar Devolução de Compras Total com IPI
# - Jira: X3DEV-170
# - Legislation: BR addon
# - Created by : Gustavo Albanus
# - Created date : 23/05/2022
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-16

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. Creation
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed

        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key

        When the user clicks the "General Data" tab selected by title
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"


    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
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
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCSTIPI"
        And the user adds the text <XQCSTIPI> in selected cell
        Then the user hits enter
        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI   | XQCFOP | XQORIGEMICMS | XQCSTICMS | XQCSTIPI |
            | 1   | "BMS001" | "10"   | "100.00" | "2101" | "0"          | "90"      | "49"     |
            | 2   | "BMS001" | "10"   | "100.00" | "2101" | "0"          | "90"      | "49"     |
            | 3   | "BMS001" | "10"   | "100.00" | "2101" | "0"          | "90"      | "49"     |

    Scenario: 3. Create/Sefas/Validation
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WE6ALL0_PTHNUM"
        And the user stores the value of the selected text field with the key: "DOCPTH"
        And the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        #Verificar status da nota (6 = Autorizada)
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "[F:XQPTH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 4. Validation Taxes
        When the user clicks the "Resume" tab selected by title
        Then the user selects the text field with X3 field name: "XQPTH2_TTIPI"
        And the value of the selected text field is "300.00"
        Then the user clicks the Close page action icon on the header panel


    Scenario: 5. Creating Purchase Return PNH
        Given the user opens the "GESPNH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase return ALL : Full entry" screen is displayed

        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WE7ALL1_PNHFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE7ALL1_BPSNUM"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE7ALL1_XQCODOPF"
        And the user writes "130" to the selected text field
        Then the user hits tab

        When the user clicks the "Selection criteria" action button on the header drop down
        And the "Preloading Criteria" screen is displayed
        And the user selects the text field with X3 field name: "PCRITRCP_WNUMRCP"
        And the user writes the stored text with key "DOCPTH" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel

        When the user clicks the "Receipt selection" link on the left panel
        When the user selects the main picking list panel of the screen
        And the user clicks the "Expand all" button in the left top bar of the selected picking list
        And the user selects the item "BMS001" of the level 1 on the picking list panel
        And the user checks the selected picking list panel item
        And the user selects the data table with x3 field name: "WE7ALL1_ARRAY_NBLIG"

    Scenario Outline: Lines
        Given the user selects row that has the text <LIN> in column with X3 field name: "WE7ALL1_PTDLIN"
        And the user selects cell with X3 field name: "WE7ALL1_QTYUOM" of selected row
        And the user adds the text <QTYUOM> in selected cell
        And the user selects cell with X3 field name: "WE7ALL1_XQCFOP" of selected row
        And the user adds the text <XQCFOP> in selected cell
        And the user selects cell with X3 field name: "WE7ALL1_XQORIGEMICMS" of selected row
        And the user adds the text <XQORIGEMICMS> in selected cell
        And the user selects cell with X3 field name: "WE7ALL1_XQCSTICMS" of selected row
        And the user adds the text <XQCSTICMS> in selected cell and hits tab key
        And the user selects cell with X3 field name: "WE7ALL1_XQCSTIPI" of selected row
        And the user adds the text <XQCSTIPI> in selected cell
        And the user selects cell with X3 field name: "WE7ALL1_XQCSTPIS" of selected row
        And the user adds the text <XQCSTPIS> in selected cell
        And the user selects cell with X3 field name: "WE7ALL1_XQCSTCOF" of selected row
        Then the user adds the text <XQCSTCOF> in selected cell
        And the user selects cell with X3 field name: "WE7ALL1_XQCENQ" of selected row
        And the user adds the text <XQCENQ> in selected cell and hits enter key
        Examples:
            | LIN    | QTYUOM | XQCFOP | XQORIGEMICMS | XQCSTICMS | XQCSTIPI | XQCSTPIS | XQCSTCOF | XQCENQ |
            | "1000" | "5"    | "6201" | "0"          | "00"      | "50"     | "01"     | "01"     | "999"  |


    Scenario: 6. Create / Transmit to Sefaz and Validation
        Given the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "Transmit SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        #Verificar status da nota (6 = Autorizada)
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "[F:XQPNH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel
        When the user clicks the "Validation" button in the header
        And the user clicks the "Ok" opinion in the alert box
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Return Validation End"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 7. Validation Taxes
        When the user clicks the "Tax detail" action button on the header drop down
        Then the user selects the text field with X3 field name: "XQPTD1_VLIPIDEVOL"
        And the value of the selected text field is "50.00"
        And the user clicks the "Close" main action button on the right panel
        Then the user clicks the Close page action icon on the header panel

    Scenario: 8. Logout
        And the user logs-out from the system