###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-flow-sdh-modbcst5-cts10
# - Description: MODBCST 5
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
# ###########################################################################

Feature: xq-s-flow-sdh-modbcst5-cts10

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"


    #--------------------------------------------------------------------------------
    #Creation of the delivery for CST 10 modbc 5
    #--------------------------------------------------------------------------------
    Scenario: 2. Create a Delivery

        Given the user opens the "GESSDH" function
        # #And the user waits 2 seconds
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed
        #Filling the Invoice header information
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WK4ALLXQ0_STOFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SDHTYP"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_BPCORD"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ3_CODOPF"
        And the user writes "125" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario Outline: Add Lines

        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY  | GROPRI  | XQCFOP | XQVARCFOP | XQOICMS | XQCSTICMS |
            | 1   | "BMS001" | "12" | "3.69"  | "6103" | "5"       | "0"     | "10"      |
            | 2   | "BMS001" | "29" | "12.96" | "6103" | "5"       | "0"     | "10"      |


    Scenario: Create document
        When the user clicks the "Create" main action button on the right panel
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario Outline: Tax Detail - Check Calculated Values
        Given the user selects row that has the text <ITMREF> in column with X3 field name: "WK4ALL1_ITMREF"
        And the user selects cell with X3 field name: "WK4ALL1_XQDETIMPOSTO" of selected row
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


    Scenario: SEFAZ
        When the user clicks the "Save" main action button on the right panel
        Given the user clicks the "SEFAZ" action button on the header drop down
        ##And the user waits 10 seconds
        Then a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "WK4ALLXQ3_NFESTATUS"
        And the value of the selected text field is "Authorized invoice"
        Then the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
