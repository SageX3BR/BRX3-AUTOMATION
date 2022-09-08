Feature:ATP-32
    ###########################################################################
    # Summary:
    # 1. Invoice no XQBR cration
    # 2. Invoice export with SIH template
    # 3. Invoice deletion
    # 4. Invoie Import with SIH template
    ###########################################################################

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. Create GESSIH

        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "NA021" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_BPCINV"
        And the user writes "NA006" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    Scenario Outline: 3. Lines

        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell and hits tab key
        Examples:
            | LIN | ITMREF   | QTY  |
            | 1   | "RAW301" | "10" |

    Scenario: 4. Create document
        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user stores the value of the selected text field with the key: "SIH_NUMBER"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 5. Open GEXPOBJ function
        Given the user opens the "GEXPOBJ" function
        Then the "Exports" screen is displayed
        And the user selects the text field with name: "Template to use"
        And the user writes "SIH" to the selected text field
        And the user selects the fixed data table of section: "Range"
        And the user selects first row of the selected data table
        And the user selects last editable cell with X3 field name: "EXPOBJ_BDEB"
        And the user adds the stored text with key "SIH_NUMBER" in selected cell and hits enter key
        And the user selects the fixed data table of section: "Range"
        And the user selects first row of the selected data table
        And the user selects the fixed cell with X3 field name: "EXPOBJ_BFIN" and row number: 1
        And the user adds the stored text with key "SIH_NUMBER" in selected cell
        And the user selects the radio buttons group with X3 field name: "EXPOBJ_TYPEXP"
        And the user clicks on "Server" radio button of the selected radio buttons group
        And the user clicks the "Ok" opinion in the alert box
        And the user selects the text field with X3 field name: "EXPOBJ_VOLFIL"
        And the user writes "[ATP]/atp-32-sih-import.txt" to the selected text field
        Then the user clicks the "OK" button in the header
        Then the user clicks the Close page action icon on the header panel

        And the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        And the user selects the text field with name: "Sales site"
        And the user writes "NA021" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes the stored text with key "SIH_NUMBER" in the selected text field and hits tab key
        And the user clicks the "Delete" main action button on the right panel
        Then the "Code cancellation" screen is displayed
        And the user clicks the "OK" button in the header
        And the user clicks the "Ok" opinion in the alert box
        Then the user clicks the Close page action icon on the header panel

    Scenario: Logout scenario
        Then the user logs-out from the system

    Scenario: Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 6. Open GIMPOBJ function
        Given the user opens the "GIMPOBJ" function
        Then the "Imports" screen is displayed
        And the user selects the text field with name: "Template"
        And the user writes "SIH" to the selected text field
        And the user selects the radio buttons group with X3 field name: "IMPOBJ_TYPEXP"
        And the user clicks on "Client" radio button of the selected radio buttons group
        And the user clicks on "Server" radio button of the selected radio buttons group
        And the user clicks the "Ok" opinion in the alert box
        And the user selects the text field with X3 field name: "IMPOBJ_VOLFIL"
        And the user writes "[ATP]/atp-32-sih-import.txt" to the selected text field
        Then the user clicks the "OK" button in the header
        Then a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "1 records created"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: Logout scenario
        Then the user logs-out from the system