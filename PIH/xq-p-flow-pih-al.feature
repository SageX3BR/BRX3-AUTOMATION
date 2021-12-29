###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-p-flow-pih-al
# - Description: National Purchase Invoice with Average load
# - Jira: NA
# - Legislation: BRA
# - Created by : Daniela Anile
# - Created date : 08/02/2021
# - Updated by : Daniela Anile
# - Updated date : 08/02/2021
# - Status : Automated
###########################################################################

Feature: xq-p-flow-pih-al

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    # #--------------------------------------------------------------------------------
    # #Check values of produts and summary
    # #--------------------------------------------------------------------------------
    Scenario: 2. Header
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR012" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR005" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL0_BPRSAC"
        Then the user writes "FORN" to the selected text field and hits tab key

    Scenario: 3. General data
        Given the user clicks the "General data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "52" to the selected text field and hits tab key

    Scenario: 4. Management
        Given the user clicks the "Management" tab selected by title
        When the user selects the text field with name: "Supplier doc no."
        And the user writes "MANAG1234" to the selected text field and hits tab key
        And an alert box appears
        And an alert box with the text containing "Reference entered on invoice" appears
        And the user clicks the "Ok" opinion in the alert box

    Scenario Outline: 5. Lines
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        And the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE8ALL3_TYPORI"
        And the user selects the choice "Miscellaneous" of the selected cell
        And the user selects last fixed cell with X3 field name: "WE8ALL3_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_NETPRI"
        And the user adds the text <NETPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQORIGEMICMS"
        And the user adds the text <XQORIGEMICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCSTIPI"
        And the user adds the text <XQCSTIPI> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCSTPIS"
        And the user adds the text <XQCSTPIS> in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCSTCOF"
        Then the user adds the text <XQCSTCOF> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | NETPRI  | XQCFOP | XQORIGEMICMS | XQCSTICMS | XQCENQ | XQCSTIPI | XQCSTPIS | XQCSTCOF |
            | 1   | "BMS001" | "29"   | "29.65" | "1101" | "0"          | "10"      | "999"  | "49"     | "01"     | "01"     |
            | 2   | "BMS002" | "14"   | "34.99" | "1101" | "0"          | "10"      | "999"  | "49"     | "01"     | "01"     |

    Scenario: 6. Creation
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 7. Tax Detail
        Given the user clicks the "Tax detail" action button on the header drop down
        Then the "Tax detail" screen is displayed

    Scenario Outline: 8. Tax Detail
        Given the user clicks the "Resume" tab selected by title
        And the user selects the text field with X3 field name: "XQPTD0_CURLIG"
        And the user writes <CURLIG> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQPTD1_VLICMSST"
        And the value of the selected text field is <VLICMSST>
        And the user selects the text field with X3 field name: "XQPTD0_CURLIG"
        And the user writes <CURLIG> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQPTD1_VLICMSST"
        And the value of the selected text field is <VLICMSST>

        Examples:
            | CURLIG | VLICMSST |
            | "1"    | "160.79" |
            | "2"    | "91.60"  |

    Scenario: 9. Resume
        Given the user clicks the Close page action icon on the header panel
        And the user selects the text field with X3 field name: "XQPIH2_TTICMSST"
        And the value of the selected text field is "252.39"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 9. Logout
        And the user logs-out from the system