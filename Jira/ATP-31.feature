Feature:ATP-31

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. GESPTH Header
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "NA011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "NA058" to the selected text field and hits tab key

    Scenario Outline: 4. Add Lines
        Given the user clicks the "Lines" tab selected by title
        When the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        And the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE6ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI |
            | 1   | "BMS057" | "10"   | "10"   |

    Scenario: 5. Creation
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WE6ALL0_PTHNUM"
        And the user stores the value of the selected text field with the key: "NUMERO_DA_PTH"
        #Fechando PNH depois da criação
        And the user clicks the Close page action icon on the header panel

    Scenario: Header PNH
        Given the user opens the "GESPNH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase return ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WE7ALL1_PNHFCY"
        And the user writes "NA011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE7ALL1_BPSNUM"
        And the user writes "NA058" to the selected text field and hits tab key


    Scenario: Picking
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Preloading Criteria" screen is displayed
        And the user selects the text field with X3 field name: "PCRITRCP_WNUMRCP"
        And the user writes the stored text with key "NUMERO_DA_PTH" in the selected text field and hits enter key
        And the user clicks the "OK" button in the header
        When the user clicks the "Receipt selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "NUMERO_DA_PTH" and with the text containing "NA011" of the picking list panel
        Then the user checks the selected picking list panel item

    Scenario: Create return
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system