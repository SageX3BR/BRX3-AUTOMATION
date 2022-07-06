###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-70
# - Description: Garantir cálculo correto para ICMS-ST para devolução parcial de compra GESPNH
# - Jira: X3-179494
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 01/07/2022
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-70

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

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
        And the user writes "BR001" to the selected text field and hits tab key
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key

    Scenario Outline: 3. Add Lines
        Given the user clicks the "Lines" tab selected by title
        When the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        And the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE6ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCFOP"
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCFOP"
        Then the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQVARCFOP"
        Then the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCSTICMS"
        Then the user adds the text <XQCSTICMS> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI    | XQCFOP | XQVARCFOP | XQCSTICMS |
            | 1   | "BMS001" | "10"   | "1000.00" | "2101" | "11"      | "10"      |


    Scenario: 4. Creation
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 5. Transmission
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Rejected            : 000"
        And the selected log panel includes the message "    Number of NF-e Pending return      : 000"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 6. Tax Detail
        Given the user clicks the "Tax detail" action button on the header drop down
        Then the "Tax detail" screen is displayed
        And the user selects the text field with X3 field name: "XQPTD1_BCICMSST"
        And the value of the selected text field is "15024.3900"
        And the user selects the text field with X3 field name: "XQPTD1_VLICMSST"
        And the value of the selected text field is "2,704.39"
        And the user selects the text field with X3 field name: "XQPTD1_VLFINICMS"
        And the value of the selected text field is "1,504.39"
        Then the user clicks the Close page action icon on the header panel

        And the user selects the text field with X3 field name: "WE6ALL0_PTHNUM"
        And the user stores the value of the selected text field with the key: "DOCPTH"
        And the user clicks the Close page action icon on the header panel


    Scenario: 7. Creating Purchase Return PNH
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
        And the user selects cell with X3 field name: "WE7ALL1_XQCSTICMS" of selected row
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects cell with X3 field name: "WE7ALL1_XQCSTIPI" of selected row
        And the user adds the text <XQCSTIPI> in selected cell
        And the user selects cell with X3 field name: "WE7ALL1_XQCSTPIS" of selected row
        And the user adds the text <XQCSTPIS> in selected cell
        And the user selects cell with X3 field name: "WE7ALL1_XQCSTCOF" of selected row
        Then the user adds the text <XQCSTCOF> in selected cell and hits enter key

        Examples:
            | LIN    | QTYUOM | XQCFOP | XQCSTICMS | XQCSTIPI | XQCSTPIS | XQCSTCOF |
            | "1000" | "5"    | "6201" | "10"      | "99"     | "49"     | "49"     |


    Scenario: 8. Create / Transmit to Sefaz and Validation
        Given the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "Transmit SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Rejected            : 000"
        And the selected log panel includes the message "    Number of NF-e Pending return      : 000"
        Then the user clicks the "Close page" main action button on the right panel
        When the user clicks the "Validation" button in the header
        And the user clicks the "Ok" opinion in the alert box
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Return Validation End"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 9. Validation Taxes
        When the user clicks the "Tax detail" action button on the header drop down
        Then the user selects the text field with X3 field name: "XQPTD1_BCICMSST"
        And the value of the selected text field is "7512.2000"
        Then the user selects the text field with X3 field name: "XQPTD1_VLICMSST"
        And the value of the selected text field is "1,352.20"
        Then the user selects the text field with X3 field name: "XQPTD1_VLFINICMS"
        And the value of the selected text field is "752.20"
        And the user clicks the "Close" main action button on the right panel

    Scenario: 10. Logout
        Given the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system