###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:xq-p-flow-pth-modbcst5-cst10
# - Description: Validate FCP_ST fields and calculation for CST 10-30-70-90
# - Jira: NA
# - Legislation: BR addon
# - Created by : Jonatas Hille
# - Created date : 01/06/2020
# - Updated by : Jonatas Hille
# - Updated date : 12/06/2020
# - Status : Automated
###########################################################################

Feature:xq-p-flow-pth-modbcst5-cst10

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Creation of the receipt for CST 10 modbc 6
    #--------------------------------------------------------------------------------
    Scenario:  2. Create Receipt Purchase
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
        #General Tab
        When the user clicks the "General Data" tab selected by title
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"

    #Lines
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
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQORIGEMICMS"
        And the user adds the text <XQORIGEMICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCSTIPI"
        And the user adds the text <XQCSTIPI> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCSTPIS"
        And the user adds the text <XQCSTPIS> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCSTCOF"
        Then the user adds the text <XQCSTCOF> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI  | XQCFOP | XQVARCFOP | XQORIGEMICMS | XQCSTICMS | XQCENQ | XQCSTIPI | XQCSTPIS | XQCSTCOF |
            | 1   | "BMS001" | "10"   | "78.50" | "2101" | "5"       | "0"          | "10"      | "999"  | "00"     | "01"     | "01"     |
            | 2   | "BMS001" | "10"   | "85.60" | "2101" | "5"       | "0"          | "10"      | "999"  | "00"     | "01"     | "01"     |

    Scenario: Create/Sefas/Validation
        #Create and Send to Sefaz
        When the user clicks the "Create" main action button on the right panel
        #   And the user clicks the "Create" main action button on the right panel
        #And a confirmation dialog appears with the message "Record has been created"
        # And the user selects the text field with X3 field name: "WE6ALL0_PTHNUM"
        # And the user stores the value of the selected text field with the key: "DOCPTH"
        And the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        # And the selected log panel includes the message "NF-e: Authorized"
        And the user clicks the "Close page" main action button on the right panel
        Then the user stores the value of the selected text field with the key: "DOCPTH"



    Scenario: Tax Detail - Check Calculated Values
        #Tax Detail - Check Values
        And the user clicks the "Tax detail" action button on the header drop down
        Then the "Tax detail" screen is displayed

    Scenario Outline: Tax Detail - Check Calculated Values
        Given the user selects the text field with X3 field name: "XQPTD0_CURLIG"
        When the user writes <CURLIG> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQPTD1_MDBCICMSST"
        And the value of the selected text field is <MDBCICMSST>


        Examples:
            | CURLIG | MDBCICMSST           |
            | "1"    | "5 - Ruling (value)" |
            | "2"    | "5 - Ruling (value)" |

    Scenario: Logout
        #And the user clicks the "Close page" main action button on the right panel
        Given the user clicks the Close page action icon on the header panel
        #Logout
        Then the user logs-out from the system