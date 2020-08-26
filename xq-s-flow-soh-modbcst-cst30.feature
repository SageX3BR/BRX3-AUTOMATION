###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:xq-s-flow-soh-modbcst-cst10
# - Description: Validate FCP_ST fields and calculation for CST 30
# - Jira: NA
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 01/06/2020
# - Updated by : Carla Cury
# - Updated date : 01/06/2020
# - Status : Automated
###########################################################################

Feature:xq-s-flow-soh-modbcst-cst30

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #modalidade 4 cts 10
    #--------------------------------------------------------------------------------
    Scenario: 2. FCP_ST fields and calculation - ICMS CST-30
        Given the user opens the "GESSOH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        #Header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SOH0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_SOHTYP"
        And the user writes "BRSON" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_BPCORD"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_XQCODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user clicks the "Calc. memory On/Off" action button on the header drop down
        And the user clicks the "Ok" opinion in the alert box
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    #Lines
    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK2ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_GROPRI"
        And the user waits 1 seconds
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCFOP"
        And the user waits 1 seconds
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQVARCFOP"
        And the user waits 1 seconds
        And the user adds the text <XQVARCFOP> in selected cell
        And the user hits tab
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQVARCFOP"
        And the user waits 1 seconds
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCSTICMS"
        And the user waits 1 seconds
        And the user adds the text <XQCSTICMS> in selected cell
        And the user hits enter


        Examples:
            | LIN | ITMREF   | QTY  | GROPRI  | XQCFOP | XQVARCFOP | XQVARCFOP | XQOICMS | XQCSTICMS |
            | 1   | "BMS001" | "12" | "3.69"  | "6101" | "4"       | "4"       | "0"     | "30"      |
            | 2   | "BMS001" | "29" | "12.96" | "6101" | "4"       | "4"       | "0"     | "30"      |

    Scenario: Create
        #Create
        When the user clicks the "Create" main action button on the right panel
        And the user waits 4 seconds
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Modalidade de Base Cálculo de ICMS ST definida pelo usuário: 4 - Margin Value added (%)"
        And the user clicks the "Close page" main action button on the right panel
    #And the user clicks the "Ok" opinion in the alert box

    Scenario: Modalidade 5
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SOH0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_SOHTYP"
        And the user writes "BRSON" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_BPCORD"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_XQCODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    #Lines
    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK2ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_GROPRI"
        And the user waits 1 seconds
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCFOP"
        And the user waits 1 seconds
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQVARCFOP"
        And the user waits 1 seconds
        And the user adds the text <XQVARCFOP> in selected cell
        And the user hits tab
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQVARCFOP"
        And the user waits 1 seconds
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCSTICMS"
        And the user waits 1 seconds
        And the user adds the text <XQCSTICMS> in selected cell
        And the user hits enter


        Examples:
            | LIN | ITMREF   | QTY  | GROPRI  | XQCFOP | XQVARCFOP | XQVARCFOP | XQOICMS | XQCSTICMS |
            | 1   | "BMS001" | "12" | "3.69"  | "6101" | "5"       | "5"       | "0"     | "30"      |
            | 2   | "BMS001" | "29" | "12.96" | "6101" | "5"       | "5"       | "0"     | "30"      |

    Scenario: Create
        #Create
        When the user clicks the "Create" main action button on the right panel
        And the user waits 4 seconds
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Modalidade de Base Cálculo de ICMS ST definida pelo usuário: 5 - Ruling (value)"
        And the user clicks the "Close page" main action button on the right panel



    Scenario: Modalidade 6
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SOH0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_SOHTYP"
        And the user writes "BRSON" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_BPCORD"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_XQCODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    #Lines
    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK2ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_GROPRI"
        And the user waits 1 seconds
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCFOP"
        And the user waits 1 seconds
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQVARCFOP"
        And the user waits 1 seconds
        And the user adds the text <XQVARCFOP> in selected cell
        And the user hits tab
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQVARCFOP"
        And the user waits 1 seconds
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCSTICMS"
        And the user waits 1 seconds
        And the user adds the text <XQCSTICMS> in selected cell
        And the user hits enter


        Examples:
            | LIN | ITMREF   | QTY  | GROPRI  | XQCFOP | XQVARCFOP | XQVARCFOP | XQOICMS | XQCSTICMS |
            | 1   | "BMS001" | "12" | "3.69"  | "6101" | "6"       | "6"       | "0"     | "30"      |
            | 2   | "BMS001" | "29" | "12.96" | "6101" | "6"       | "6"       | "0"     | "30"      |

    Scenario: Create
        #Create
        When the user clicks the "Create" main action button on the right panel
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Modalidade de Base Cálculo de ICMS ST definida pelo usuário: 6 - Operation Value"
        And the user clicks the "Close page" main action button on the right panel





    Scenario: Logout

        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
