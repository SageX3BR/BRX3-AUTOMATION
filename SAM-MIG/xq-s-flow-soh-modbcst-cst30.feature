###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:xq-s-flow-soh-modbcst-cst30
# - Description: MODBCST
# - Jira: X3-202065 - [BR] [NF-e] [Sales] Nota Técnica 2019.001 v1.40 - modBCST
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 10/07/2020
# - Updated by : Carla Cury
# - Updated date : 10/07/2020
# - Status : COMPLET
###########################################################################

#Global parameter intialization
###########################################################################
# Notes
# -------------------------------------------------------------------------
# For the purpose of this test:
# - Parameter  : Create RTAX with modbcST
# # ###########################################################################
#
#
#
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
    Scenario: Sales Order
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
        # And the user clicks the "Calc. memory On/Off" action button on the header drop down
        # And the user clicks the "Ok" opinion in the alert box
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
        # #And the user waits 1 seconds
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCFOP"
        # #And the user waits 1 seconds
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQVARCFOP"
        # #And the user waits 1 seconds
        And the user adds the text <XQVARCFOP> in selected cell
        And the user hits tab
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQVARCFOP"
        # #And the user waits 1 seconds
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCSTICMS"
        # #And the user waits 1 seconds
        And the user adds the text <XQCSTICMS> in selected cell
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY  | GROPRI  | XQCFOP | XQVARCFOP | XQVARCFOP | XQOICMS | XQCSTICMS |
            | 1   | "BMS001" | "12" | "3.69"  | "6101" | "4"       | "4"       | "0"     | "30"      |
            | 2   | "BMS001" | "29" | "12.96" | "6101" | "4"       | "4"       | "0"     | "30"      |

    Scenario: Create document

        When the user clicks the "Create" main action button on the right panel
        # #And the user waits 4 seconds
        # And a log panel appears
        # And the user selects the main log panel of the page
        # And the selected log panel includes the message "Modalidade de Base Cálculo de ICMS ST definida pelo usuário: 6 - Operation Value"
        # And the user clicks the "Close page" main action button on the right panel

        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    Scenario Outline: Tax Detail - Check Calculated Values
        Given the user selects row that has the text <ITMREF> in column with X3 field name: "WK2ALL4_ITMREF"
        And the user selects cell with X3 field name: "WK2ALL4_XQDETIMPOSTO" of selected row
        When the user clicks on the icon contained in the selected cell
        Then the "Tax determination" screen is displayed
        #Check Values
        And the user selects the text field with X3 field name: "XQDTIMP1_MODDETCALCST"
        And the value of the selected text field is <MODDETCALCST>
        Then the user clicks the Close page action icon on the header panel

        Examples:
            | ITMREF   | MODDETCALCST                 |
            | "BMS001" | "4 - Margin Value added (%)" |
            | "BMS001" | "4 - Margin Value added (%)" |

    Scenario: SAVE

        And the user clicks the "Save" main action button on the right panel

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
        # #And the user waits 1 seconds
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCFOP"
        # #And the user waits 1 seconds
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQVARCFOP"
        # #And the user waits 1 seconds
        And the user adds the text <XQVARCFOP> in selected cell
        And the user hits tab
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQVARCFOP"
        # #And the user waits 1 seconds
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCSTICMS"
        # #And the user waits 1 seconds
        And the user adds the text <XQCSTICMS> in selected cell
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY  | GROPRI  | XQCFOP | XQVARCFOP | XQVARCFOP | XQOICMS | XQCSTICMS |
            | 1   | "BMS001" | "12" | "3.69"  | "6101" | "5"       | "5"       | "0"     | "30"      |
            | 2   | "BMS001" | "29" | "12.96" | "6101" | "5"       | "5"       | "0"     | "30"      |

    Scenario: Create document

        When the user clicks the "Create" main action button on the right panel
        # #And the user waits 4 seconds
        # And a log panel appears
        # And the user selects the main log panel of the page
        # And the selected log panel includes the message "Modalidade de Base Cálculo de ICMS ST definida pelo usuário: 6 - Operation Value"
        # And the user clicks the "Close page" main action button on the right panel

        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    Scenario Outline: Tax Detail - Check Calculated Values
        Given the user selects row that has the text <ITMREF> in column with X3 field name: "WK2ALL4_ITMREF"
        And the user selects cell with X3 field name: "WK2ALL4_XQDETIMPOSTO" of selected row
        When the user clicks on the icon contained in the selected cell
        Then the "Tax determination" screen is displayed
        #Check Values
        And the user selects the text field with X3 field name: "XQDTIMP1_MODDETCALCST"
        And the value of the selected text field is <MODDETCALCST>
        Then the user clicks the Close page action icon on the header panel

        Examples:
            | ITMREF   | MODDETCALCST         |
            | "BMS001" | "5 - Ruling (value)" |
            | "BMS001" | "5 - Ruling (value)" |

    Scenario: SAVE

        And the user clicks the "Save" main action button on the right panel
    #--------------------------------------------------------------------------------
    #modalidade 6 cts 10
    #--------------------------------------------------------------------------------

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
        # #And the user waits 1 seconds
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCFOP"
        # #And the user waits 1 seconds
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQVARCFOP"
        # #And the user waits 1 seconds
        And the user adds the text <XQVARCFOP> in selected cell
        And the user hits tab
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQVARCFOP"
        # #And the user waits 1 seconds
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCSTICMS"
        # #And the user waits 1 seconds
        And the user adds the text <XQCSTICMS> in selected cell
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY  | GROPRI  | XQCFOP | XQVARCFOP | XQVARCFOP | XQOICMS | XQCSTICMS |
            | 1   | "BMS001" | "12" | "3.69"  | "6101" | "6"       | "6"       | "0"     | "30"      |
            | 2   | "BMS001" | "29" | "12.96" | "6101" | "6"       | "6"       | "0"     | "30"      |

    Scenario: Create document

        When the user clicks the "Create" main action button on the right panel
        # #And the user waits 4 seconds
        # And a log panel appears
        # And the user selects the main log panel of the page
        # And the selected log panel includes the message "Modalidade de Base Cálculo de ICMS ST definida pelo usuário: 6 - Operation Value"
        # And the user clicks the "Close page" main action button on the right panel

        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    Scenario Outline: Tax Detail - Check Calculated Values
        Given the user selects row that has the text <ITMREF> in column with X3 field name: "WK2ALL4_ITMREF"
        And the user selects cell with X3 field name: "WK2ALL4_XQDETIMPOSTO" of selected row
        When the user clicks on the icon contained in the selected cell
        Then the "Tax determination" screen is displayed
        #Check Values
        And the user selects the text field with X3 field name: "XQDTIMP1_MODDETCALCST"
        And the value of the selected text field is <MODDETCALCST>
        Then the user clicks the Close page action icon on the header panel

        Examples:
            | ITMREF   | MODDETCALCST          |
            | "BMS001" | "6 - Operation Value" |
            | "BMS001" | "6 - Operation Value" |

    Scenario: Save and Logout

        Given the user clicks the "Save" main action button on the right panel
        Then the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
