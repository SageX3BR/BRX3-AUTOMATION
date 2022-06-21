###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-63
# - Description: Garantir que XML de distribuição seja anexado junto ao documento de origem ao transmitir uma GESPTH
# - Jira: ATP-63
# - Legislation: BRA
# - Created by : Diego Oliveira
# - Created date : 17/06/2022
# - Updated by :
# - Updated date :
# - Status :
###########################################################################

Feature: ATP-63

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. PTH Creation
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key

    Scenario: 3. General Data
        Given the user clicks the "General Data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "113" to the selected text field and hits tab key

    Scenario Outline: 4. Add Lines
        Given the user clicks the "Lines" tab selected by title
        When the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        And the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE6ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCFOP"
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCFOP"
        Then the user adds the text <XQCFOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI | XQCFOP |
            | 1   | "BMS001" | "14"   | "3.95" | "2152" |

    Scenario: 5. Creation
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 6. Transmission
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Rejected            : 000"
        And the selected log panel includes the message "    Number of NF-e Pending return      : 000"
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "XQPTH1_NUMNFE"
        And the user stores the value of the selected text field with the key: "NFE_NUM"

    Scenario: 7. Attachments
        Given the user clicks the "Attachments" main action button on the right panel
        And the user selects the fixed data table of section: "Attachments"
        And the user selects first row of the selected data table
        And the user selects the fixed cell with X3 field name: "AOBJTXT_NAM" and row number: 1
        And the value of the selected cell has string pattern "*[NFE_NUM]*.XML"
        And the user clicks the "Close" main action button on the right panel

    Scenario: 8. Logout
        And the user logs-out from the system