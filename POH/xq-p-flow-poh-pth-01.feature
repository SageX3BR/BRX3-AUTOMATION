###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-p-flow-poh-pth
# - Description: Purchasing Picking POH PTH
# - Jira: NA
# - Legislation: BRA
# - Created by : Daniela Anile
# - Created date : 02/02/2021
# - Updated by : Daniela Anile
# - Updated date : 03/02/2021
# - Status : Automated
###########################################################################

Feature: xq-p-flow-poh-pth-01

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #National
    #--------------------------------------------------------------------------------
    Scenario: 2. Header POH
        Given the user opens the "GESPOH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase order ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Order site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "113" to the selected text field and hits tab key

    Scenario Outline: 3. Lines POH
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"
        And the user selects editable table row number: <LIN>
        When the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCFOP"
        Then the user adds the text <XQCFOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | XQCFOP |
            | 1   | "BMS001" | "1"    | "2152" |
            | 2   | "BMS002" | "2"    | "2152" |

    Scenario: 4. Create and Store Doc Number POH
        Given the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "POH0_POHNUM"
        And the user stores the value of the selected text field with the key: "PoDocumentNo"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 5. Header PTH
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key

    Scenario: 6. Picking
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Preloading Criteria" screen is displayed
        And the user selects the text field with X3 field name: "PCRITORD_WPOHNUM"
        And the user writes the stored text with key "PoDocumentNo" in the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        And the user clicks the "Order selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "PoDocumentNo" and with the text containing "BR001" of the picking list panel
        And the user checks the selected picking list panel item
        And an alert box with the text containing "Replace data from the General Data tab?" appears
        And the user clicks the "Yes" opinion in the alert box
        And an alert box with the text containing "Replace data from the Shipping data tab?" appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: 7. Creation
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 8. Transmission
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Authorized          : 001"
        And the user clicks the "Close page" main action button on the right panel
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 9. Logout
        And the user logs-out from the system
