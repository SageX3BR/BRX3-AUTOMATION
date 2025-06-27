###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:05010304-CST90
# - Description: Validate FCP_ST fields and calculation for CST 90
# - Jira: NA
# - Legislation: BR addon
# - Created by : Jonatas Hille
# - Created date : 01/06/2020
# - Updated by : Jonatas Hille
# - Updated date : 01/06/2020
# - Status : Automated
###########################################################################

Feature:05010304-CST90

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 05010304-01 Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Validate FCP_ST fields and calculation - ICMS CST-90
    #--------------------------------------------------------------------------------
    Scenario: 05010304-02 FCP_ST fields and calculation - ICMS CST-90
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed
        #Header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WK4ALLXQ0_STOFCY"
        And the user writes "BR050" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_SDHTYP"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_SALFCY"
        And the user writes "BR050" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_BPCORD"
        And the user writes "BR150" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSDH0_CODOPF"
        And the user writes "49" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    #Lines
    Scenario Outline: 05010304-03 Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_GROPRI"
        # #And the user waits 1 seconds
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCSTICMS"
        # #And the user waits 1 seconds
        And the user adds the text <XQCSTICMS> in selected cell
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY  | GROPRI  | XQCSTICMS |
            | 1   | "BMS001" | "14" | "98.54" | "90"      |
            | 2   | "BMS002" | "16" | "98.52" | "90"      |

    Scenario: 05010304-04 Create
        #Create
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 05010304-05 Resume - Check Calculated Values
        Given the user clicks the "Tax Summary" tab selected by title
        When the user selects the text field with name: "FCP-ST Calc. base"
        And the value of the selected text field is "4,271.07"
        And the user selects the text field with name: "ICMS FCP-ST value"
        And the value of the selected text field is "85.42"
        And the user clicks the "Validation" button in the header
        And the user clicks the "Ok" opinion in the alert box
        Then the user clicks the "Invoice" button in the header

    Scenario: 05010304-06 Create Invoice - SEFAZ - Validation
        Given the user selects the data table in the popup
        When the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        And the "Sales invoice ALL : Full entry invoice" screen is displayed
        And the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "SIH0_XQSTATUSNFE"
        And the value of the selected text field is "Authorized invoice"
        And the user clicks the "Post" button in the header
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Document creation "
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 05010304-07 Logout
        And the user clicks the Close page action icon on the header panel
        Then the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system