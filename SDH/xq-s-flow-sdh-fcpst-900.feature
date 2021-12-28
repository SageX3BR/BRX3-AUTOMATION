###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:xq-s-flow-sdh-fcpst-900
# - Description: Validate FCP_ST fields and calculation for CST 900
# - Jira: NA
# - Legislation: BR addon
# - Created by : Jonatas Hille
# - Created date : 01/06/2020
# - Updated by : Jonatas Hille
# - Updated date : 01/06/2020
# - Status : Automated
###########################################################################

Feature:xq-s-flow-sdh-fcpst-900

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Validate FCP_ST fields and calculation - ICMS CST-900
    #--------------------------------------------------------------------------------
    Scenario: 2. FCP_ST fields and calculation - ICMS CST-900
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed
        #Header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SDH0_STOFCY"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_SDHTYP"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_SALFCY"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_BPCORD"
        And the user writes "BR150" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSDH0_CODOPF"
        And the user writes "48" to the selected text field and hits tab key
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
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCSTICMS"
        And the user waits 1 seconds
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY  | GROPRI  | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "14" | "98.54" | "900"     | "301"  |
            | 2   | "BMS002" | "16" | "98.52" | "900"     | "301"  |

    Scenario: Create
        #Create
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

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
    #         | "BMS001" | "1,993.3800" | "39.8700"   | "2.0000"  |
    #         | "BMS002" | "2,277.6900" | "45.5500"   | "2.0000"  |


    Scenario: Resume - Check Calculated Values
        Given the user clicks the "Tax Summary" tab selected by title
        When the user selects the text field with X3 field name: "XQSDH1_TOTBASEFCPST"
        And the value of the selected text field is "4,271.07"
        And the user selects the text field with X3 field name: "XQSDH1_TOTICMSFCPST"
        And the value of the selected text field is "85.42"
        And the user clicks the "Validation" button in the header
        And the user clicks the "Ok" opinion in the alert box
        Then the user clicks the "Invoice" button in the header

    Scenario: Create Invoice - SEFAZ - Validation
        Given the user selects the data table in the popup
        When the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        And the "Sales invoice ALL : Full entry invoice" screen is displayed
        And the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Authorized          : 001"
        And the user clicks the "Close page" main action button on the right panel
        And the user clicks the "Post" button in the header
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Document creation "
        And the user clicks the "Close page" main action button on the right panel
        And the user clicks the Close page action icon on the header panel
        Then the user clicks the Close page action icon on the header panel

        #Logout
        Then the user logs-out from the system