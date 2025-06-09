Feature:ATP-41

    Scenario: 01.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 02. PTH Creation
        Given the user opens the "GESPTH2" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "NA012" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "NA009" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"

    Scenario Outline: 03. Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE6ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_VAT1"
        And the user adds the text <VAT1> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI  | VAT1 |
            | 1   | "BMS001" | "10"   | "50.75" | "NT" |

    Scenario: 04. Document Creation
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WE6ALL0_PTHNUM"
        And the user stores the value of the selected text field with the key: "PTH_NUMBER"


    Scenario: 05. Check Fiscal Operation field disabled
        Given the user clicks the "General Data" tab selected by title
        Given the user selects the text field with name: "Fiscal operation"
        Then the selected text field should be disabled
        #Fechando PTH antes de ir para PNH
        And the user clicks the Close page action icon on the header panel

    Scenario: 06 .Picking GESPTH on GESPNH
        Given the user opens the "GESPNH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase return ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Return site"
        And the user writes "NA012" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "NA009" to the selected text field and hits tab key
        When the user clicks the "Selection criteria" action button on the header drop down
        And the "Preloading Criteria" screen is displayed
        And the user selects the text field with X3 field name: "PCRITRCP_WNUMRCP"
        And the user writes the stored text with key "PTH_NUMBER" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel
        When the user clicks the "Receipt selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "PTH_NUMBER" and with the text containing "NA012" of the picking list panel
        Then the user checks the selected picking list panel item

    Scenario: 07. GESPNH creation
        Given the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"

    Scenario: 08. Checking XQBR actions
        Given the user opens the header drop down
        Then the "Tax detail" action button on the header drop down is disabled
        Then the "Legal data" action button on the header drop down is disabled
        Then the "FS-DA (Contingency)" action button on the header drop down is disabled
        Then the "Transmit SEFAZ" action button on the header drop down is disabled
        Then the "Preview Danfe" action button on the header drop down is disabled
        Then the "Referenced docs." action button on the header drop down is disabled
        Then the "Posting" action button on the header drop down is disabled
        Then the "Export information" action button on the header drop down is disabled

    Scenario: 08. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
