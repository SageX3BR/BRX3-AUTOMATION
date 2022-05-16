Feature: atp-37

    #--------------------------------------------------------------------------------
    #X3 Logingit checkout ATP-6 Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------
    Scenario: 2. SDH Creation
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed


        #Entering in creation mode

        When the user clicks the "New" main action button on the right panel

        When the user selects the text field with name: "Shipment site"
        Then the user writes "FR011" to the selected text field
        And the user selects the text field with name: "Sales site"
        And the user writes "FR011" to the selected text field
        And the user selects the text field with name: "Ship-to"
        And the user writes "FR001" to the selected text field and hits tab key

        #alert
        # And the user writes "001" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user hits enter
        Examples:
            | LIN | ITMREF   | QTY | GROPRI |
            | 1   | "BMS057" | "1" | "100"  |


    Scenario: Create
        When the user clicks the "Create" main action button on the right panel
    ##And a confirmation dialog appears with the message "Record has been created"


    Scenario: Duplication
        When the user selects the text field with name: "Delivery no."
        Then the user writes "" to the selected text field
        And the user hits tab


        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"