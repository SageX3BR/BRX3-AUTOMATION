###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:xq-p-flow-poh-mobcst5-cst10
# - Description: [BR] [NF-e] [Purchase] Nota Técnica 2019.001 v1.40 - modBCST
# - Jira: X3-203742
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 01/06/2020
# - Updated by : Carla Cury
# - Updated date : 01/06/2020
# - Status : Automated
###########################################################################

Feature:xq-p-flow-poh-mobcst5-cst10

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Creation of the order for CST 10 modbc 6
    #--------------------------------------------------------------------------------
    Scenario: 2. Create Order Purchase
        Given the user opens the "GESPOH" function
        # #And the user waits (3) seconds
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase order ALL : Full entry" screen is displayed
        #Header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WE3ALLXQ0_POHFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE3ALLXQ0_BPSNUM"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE3ALLXQ0_XQCODOPF"
        And the user writes "110" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"

    #Lines
    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQORIGEMICMS"
        And the user adds the text <XQORIGEMICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI  | XQCFOP | XQVARCFOP | XQORIGEMICMS | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "10"   | "78.50" | "2101" | "5"       | "0"          | "10"      | "999"  |
            | 2   | "BMS001" | "10"   | "85.60" | "2101" | "5"       | "0"          | "10"      | "999"  |

    Scenario: Create
        #Create and Send to Sefaz
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        # And the user clicks the "Auto. tax calc." action button on the header drop down
        # And the user clicks the "View log" action button on the header drop down
        # #And the user waits 4 seconds
        # And a log panel appears
        # And the user selects the main log panel of the page
        # And the selected log panel includes the message "Modalidade de Base Cálculo de ICMS ST definida pelo usuário: 6 - Operation Value"
        # And the user clicks the "Close page" main action button on the right panel

        #Tax Detail - Check Values
        And the user clicks the "Tax detail" action button on the header drop down
        Then the "Tax detail" screen is displayed

    Scenario Outline: Tax Detail - Check Calculated Values
        Given the user selects the text field with X3 field name: "XQPTD0_CURLIG"
        When the user writes <CURLIG> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE6PTDXQ_MDBCICMSST"
        And the value of the selected text field is <MDBCICMSST>

        Examples:
            | CURLIG | MDBCICMSST           |
            | "1"    | "5 - Ruling (value)" |
            | "2"    | "5 - Ruling (value)" |

    #Logout
    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system