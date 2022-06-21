Feature:ATP-36

    Scenario: 01.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 02. GESSOH Header
        Given the user opens the "GESSOH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        #Cabeçalho
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "NA011" to the selected text field and hits tab key
        And the user selects the text field with name: "Sold-to"
        And the user writes "NA001" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    Scenario Outline: 03. Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK2ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user hits enter
        Examples:
            | LIN | ITMREF   | QTY | GROPRI  |
            | 1   | "BMS012" | "2" | "45.75" |

    Scenario: 04. Document Creation and BR Add-on field check
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        #Then the user selects the text field with X3 field name: "SOH0_XQCODOPF"
        #And the text field with name: "Fiscal operation" is hidden
        And the value of the "Total value of the order" text field is ""

    Scenario: 05. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system


