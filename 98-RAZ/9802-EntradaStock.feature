Feature:9802-EntradaStock

    Scenario: 9802-01 Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 9802-02 Rset folder to zero
        Given the user opens the "RAZDOS" function
        And the "Reset folder to zero" screen is displayed
        And the user selects the text field with name: "Folder"
        And the user writes "ATP" to the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        And the user clicks the "Yes" option in the alert box
        And the user waits 80 seconds
        And the user clicks the Close page action icon on the header panel

    Scenario: 9802-03 Stock resynchronization and control
        Given the user opens the "FUNSTOR" function
        And the "Stock resynchronization" screen is displayed
        And the user selects the text field with name: "Site"
        And the user writes "BR011" to the selected text field and hits tab key
        Then the user selects the check box with X3 field name: "STOR_SYNSTO"
        And the user sets the check box to ticked
        And the user selects the check box with X3 field name: "STOR_SYNQLY"
        And the user sets the check box to ticked
        And the user selects the check box with X3 field name: "STOR_SYNBBY"
        And the user sets the check box to ticked
        And the user selects the check box with X3 field name: "STOR_SYNITV"
        And the user sets the check box to ticked
        And the user selects the check box with X3 field name: "STOR_SYNCUN"
        And the user sets the check box to ticked
        And the user selects the check box with X3 field name: "STOR_SYNLOT"
        And the user sets the check box to ticked
        And the user selects the check box with X3 field name: "STOR_CSTCTL"
        And the user sets the check box to ticked
        And the user selects the check box with X3 field name: "STOR_SERCTL"
        And the user sets the check box to ticked
        And the user selects the check box with X3 field name: "STOR_LPNCTL"
        And the user sets the check box to ticked
        And the user selects the check box with X3 field name: "STOR_RAZFRE"
        And the user sets the check box to ticked
        And the user clicks the "OK" button in the header
        And the user clicks the Close page action icon on the header panel


    Scenario: 9802-04 Open Miscellaneous receipts
        Given the user opens the "GESSMR" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Misc Stock Receipts Full Entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Miscellaneous receipts ALL : Misc Stock Receipts Full Entry" screen is displayed

    Scenario: 9802-05 Create New Entry for BR011
        Given the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Stock site"
        Then the user writes "BR011" to the selected text field and hits tab key

    Scenario Outline: 9802-06 Lines
        Given the user selects the fixed data table for x3 field name: "WT01ALL1_ARRAY_NBLIG"
        And the user selects the fixed cell with X3 field name: "WT01ALL1_ITMREF" and row number: <LIN>
        And the user adds the text <ITMREF> in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WT01ALL1_QTYPCU"
        Then the user adds the text <QTYPCU> in selected cell and hits enter key


        Examples:
            | LIN | ITMREF   | QTYPCU   |
            | 1   | "BMS001" | "999999" |
            | 2   | "BMS002" | "999999" |

    Scenario: 9802-07 Create and Logout
        Given the user clicks the "Create" main action button on the right panel
        And the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system