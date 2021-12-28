###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:xq-s-flow-sdh-cfop-sug1
# - Description: SDH CFOP Suggestion1
# - Jira: NA
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 22/07/2020
# - Updated by : Carla Cury
# - Updated date : 22/07/2020
# - Status : Automated
###########################################################################

Feature:xq-s-flow-sdh-cfop-sug1

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Validate FCP_ST fields and calculation - ICMS CST-10
    #--------------------------------------------------------------------------------
    Scenario: 2. FCP_ST fields and calculation - ICMS CST-10
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed
        #Header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SDH0_STOFCY"
        And the user writes "BR013" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_SDHTYP"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_SALFCY"
        And the user writes "BR013" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_BPCORD"
        And the user writes "BR005" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSDH0_CODOPF"
        And the user writes "63" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    #Lines
    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_GROPRI"
        And the user waits 1 seconds
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCFOP"
        And the user adds the text "" in selected cell and hits tab key
        And an alert box with the text "Mandatory field" appears
        And the user clicks the "Ok" opinion in the alert box

        Examples:
            | LIN | ITMREF   | QTY  | GROPRI  |
            | 1   | "BMS001" | "21" | "24.95" |




    #     #Tax Detail - Check Values
    #     Given the user clicks the "Lines" tab selected by title
    #     When the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"
    # Scenario Outline: Tax Detail - Check Calculated Values
    #     Given the user selects row that has the text <ITMREF> in column with X3 field name: "WK4ALL1_ITMREF"
    #     And the user selects cell with X3 field name: "WK4ALL1_XQDETIMPOSTO" of selected row
    #     When the user clicks on "1" action button of the selected cell
    #     #And the user clicks on the link in the cell that has the text "204" in cell with header: "Tax Det."
    #     #And the user clicks on the selected cell
    #     Then the "Tax determination" screen is displayed
    #     #Check Values
    #     When the user selects the text field with X3 field name: "XQDTIMP1 _BCFCPST"
    #     And the value of the selected text field is <BCFCPST>
    #     And the user selects the text field with X3 field name: "XQDTIMP1 _VLICMSFCPST"
    #     And the value of the selected text field is <VLICMSFCPST>
    #     And the user selects the text field with X3 field name: "XQDTIMP1 _ALIQFCPST"
    #     And the value of the selected text field is <ALIQFCPST>
    #     Then the user clicks the Close page action icon on the header panel

    #     Examples:
    #         | ITMREF   | BCFCPST      | VLICMSFCPST | ALIQFCPST |
    #         | "BMS001" | "2,098.2900" | "41.9700"   | "2.0000"  |
    #         | "BMS002" | "2,397.5600" | "47.9500"   | "2.0000"  |

    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And an alert box with the text "Continue and cancel the creation?" appears
        And the user clicks the "Yes" opinion in the alert box
        And the user logs-out from the system

