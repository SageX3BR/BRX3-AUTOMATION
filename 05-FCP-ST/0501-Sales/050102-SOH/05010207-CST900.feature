###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:05010207-CST900
# - Description: Validate FCP_ST fields and calculation for CST 202
# - Jira: NA
# - Legislation: BR addon
# - Created by : Jonatas Hille
# - Created date : 01/06/2020
# - Updated by : Jonatas Hille
# - Updated date : 01/06/2020
# - Status : Automated
###########################################################################

Feature:05010207-CST900

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 05010207-01 Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Validate FCP_ST fields and calculation - ICMS CST-202
    #--------------------------------------------------------------------------------
    Scenario: 05010207-02 FCP_ST fields and calculation - ICMS CST-202
        Given the user opens the "GESSOH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        #Header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SOH0_SALFCY"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_SOHTYP"
        And the user writes "BRSON" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_BPCORD"
        And the user writes "BR150" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_XQCODOPF"
        And the user writes "48" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    #Lines
    Scenario Outline: 05010207-03 Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK2ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_DSTOFCY"
        And the user adds the text <DSTOFCY> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_GROPRI"
        # #And the user waits 1 seconds
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCSTICMS"
        # #And the user waits 1 seconds
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell
        And the user hits enter

        Examples:
            | LIN | ITMREF   | DSTOFCY | QTY  | GROPRI  | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "BR001" | "14" | "98.54" | "900"     | "301"  |
            | 2   | "BMS002" | "BR001" | "16" | "98.52" | "900"     | "301"  |

    Scenario: 05010207-04 Create
        #Create
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 05010207-05 Resume - Check Calculated Values
        Given the user clicks the "Tax Summary" tab selected by title
        When the user selects the text field with X3 field name: "XQSOH1_TOTBASEFCPST"
        And the value of the selected text field is "4,271.07"
        And the user selects the text field with X3 field name: "XQSOH1_TOTICMSFCPST"
        And the value of the selected text field is "85.42"
        And the user clicks the "Delivery" button in the header

    Scenario: 05010207-06 Create Delivery
        Given the user selects the data table in the popup
        When the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        And the "Delivery ALL : Full entry" screen is displayed
        And the user clicks the "Validation" button in the header
        And the user clicks the "Ok" opinion in the alert box
        Then the user clicks the "Invoice" button in the header

    Scenario: 05010207-07 Create Invoice - SEFAZ - Validation
        Given the user selects the data table in the popup
        When the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        And the "Sales invoice ALL : Full entry invoice" screen is displayed
        And the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Rejected            : 000"
        And the selected log panel includes the message "    Number of NF-e Pending return      : 000"
        And the user clicks the "Close page" main action button on the right panel
        And the user clicks the "Post" button in the header
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Document creation "
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 05010207-08 Logout
        And the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel
        Then the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system