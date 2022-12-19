###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:ATP-66
# - Description: Garantir sucesso no processo de devolução simbólica
# - Jira: ATP-66
# - Legislation: BR addon
# - Created by : Diego Oliveira
# - Created date : 28/06/2022
# - Updated by :
# - Updated date :
# - Status :
###########################################################################

Feature: ATP-66

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2.Creation PTH
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        #Header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key
        #General Data
        When the user clicks the "General Data" tab selected by title
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
    #Lines
    Scenario Outline: 3.Add Lines
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
            | LIN | ITMREF   | QTYUOM | GROPRI  | XQCFOP | XQORIGEMICMS | XQCSTICMS | XQCSTIPI |
            | 1   | "BMS107" | "310"  | "15.23" | "2101" | "0"          | "90"      | "49"     |

    Scenario: 4.Create/Sefaz/Validation
        And the user selects the text field with X3 field name: "STOENTLOT_USRFLD1"
        And the user writes "DEV SIMBOL" to the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel

    Scenario: 5.Create/Sefaz/Validation
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WE6ALL0_PTHNUM"
        And the user stores the value of the selected text field with the key: "DOCPTH"
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        #Verificar status da nota (6 = Autorizada)And a log panel appears
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 6.Creating Purchase Return PNH
        Given the user opens the "GESPNH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase return ALL : Full entry" screen is displayed
        #Filling the Invoice header information
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WE7ALL1_PNHFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE7ALL1_BPSNUM"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE7ALL1_XQCODOPF"
        And the user writes "246" to the selected text field
        Then the user hits tab
        #Filter with the order created above
        When the user clicks the "Selection criteria" action button on the header drop down
        And the "Preloading Criteria" screen is displayed
        And the user selects the text field with X3 field name: "PCRITRCP_WNUMRCP"
        And the user writes the stored text with key "DOCPTH" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel

    Scenario: 7.Picking
        When the user clicks the "Receipt selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "DOCPTH" and with the text containing "BR001" of the picking list panel
        Then the user checks the selected picking list panel item
        And the user selects the data table with x3 field name: "WE7ALL1_ARRAY_NBLIG"

    Scenario Outline: 8.Lines
        Given the user selects row that has the text <LIN> in column with X3 field name: "WE7ALL1_PTDLIN"
        And the user selects cell with X3 field name: "WE7ALL1_XQCFOP" of selected row
        And the user adds the text <XQCFOP> in selected cell
        And the user selects cell with X3 field name: "WE7ALL1_XQORIGEMICMS" of selected row
        And the user adds the text <XQORIGEMICMS> in selected cell
        And the user selects cell with X3 field name: "WE7ALL1_XQCSTICMS" of selected row
        And the user adds the text <XQCSTICMS> in selected cell and hits tab key
        And the user selects cell with X3 field name: "WE7ALL1_XQCSTPIS" of selected row
        And the user adds the text <XQCSTPIS> in selected cell
        And the user selects cell with X3 field name: "WE7ALL1_XQCSTCOF" of selected row
        And the user adds the text <XQCSTCOF> in selected cell and hits enter key
        Examples:
            | LIN | XQCFOP | XQORIGEMICMS | XQCSTICMS | XQCSTPIS | XQCSTCOF |
            | "1" | "6919" | "0"          | "00"      | "70"     | "70"     |

    Scenario: 9.Creation
        Given the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"

    Scenario: 10.Transmission
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
    #Verificar status da nota (6 = Autorizada)

    Scenario: 11.Logout
        And the user clicks the "Close page" main action button on the right panel
        And the user logs-out from the system