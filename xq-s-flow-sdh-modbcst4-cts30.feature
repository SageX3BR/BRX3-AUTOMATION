###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-flow-sdh-modbcst4-cts10
# - Description: MODBCST 4
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

Feature: xq-s-flow-sdh-modbcst4-cts10

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"


    #--------------------------------------------------------------------------------
    #Creation of the delivery for CST 10 modbc 6
    #--------------------------------------------------------------------------------
    Scenario: 2. Create a Delivery

        Given the user opens the "GESSDH" function
        And the user waits 2 seconds
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed
        #Filling the Invoice header information
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SDH0_STOFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_SDHTYP"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_BPCORD"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSDH0_CODOPF"
        And the user writes "125" to the selected text field and hits tab key
        And the user clicks the "Calc. memory On/Off" action button on the header drop down
        And the user clicks the "Ok" opinion in the alert box
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    #Filling Lines

    Scenario Outline: Add Lines

        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user waits 2 seconds
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user waits 2 seconds
        And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
        And the user adds the text <QTY> in selected cell
        And the user waits 1 seconds
        And the user adds the text <XQVARCFOP> in selected cell
        And the user waits 1 seconds
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
        And the user waits 1 seconds
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user waits 1 seconds
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCODBF"
        And the user adds the text <XQCODBF> in selected cell and hits enter key
        And the user waits 2 seconds
        And the user hits enter

        Examples:
            | LIN | ITMREF   | ITMREF   | QTY  | GROPRI  | XQCFOP | XQVARCFOP | XQVARCFOP | XQOICMS | XQCSTICMS | XQCODBF   |
            | 1   | "BMS001" | "BMS001" | "12" | "3.69"  | "6101" | "4"       | "4"       | "0"     | "30"      | "PR80003" |
            | 2   | "BMS001" | "BMS001" | "29" | "12.96" | "6101" | "4"       | "4"       | "0"     | "30"      | "PR80003" |


    Scenario: Create document

        When the user clicks the "Create" main action button on the right panel
        And the user waits 4 seconds
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Modalidade de Base Cálculo de ICMS ST definida pelo usuário: 4 - Margin Value added (%)"
        And the user clicks the "Close page" main action button on the right panel
        Then the user clicks the "SEFAZ" action button on the header drop down
        And the user waits 10 seconds
        Then a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Authorized          : 001"
        And the user clicks the Close page action icon on the header panel

    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system

