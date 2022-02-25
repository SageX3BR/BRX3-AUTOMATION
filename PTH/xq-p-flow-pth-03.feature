###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-p-flow-pth
# - Description: CRUD verification of purchase receipts
# - Jira: NA
# - Legislation: BRA
# - Created by : Daniela Anile
# - Created date : 01/02/2021
# - Updated by : Daniela Anile
# - Updated date : 02/02/2021
# - Status : Automated
###########################################################################

Feature: xq-p-flow-pth-03

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Foreign Receipt Unique DI (with transmission)
    #--------------------------------------------------------------------------------
    Scenario: 2. Header
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed
        Given the user clicks the "New" main action button on the right panel
        Then the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "PT006" to the selected text field and hits tab key

    Scenario: 3. General Data
        Given the user clicks the "General Data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "111" to the selected text field and hits tab key

    Scenario: 4. General Data
        Given the user clicks the "General Data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "111" to the selected text field and hits tab key
        And the user selects the drop down list with name: "Unique DI"
        And the user clicks on "Yes" option of the selected drop down list
        And the user selects the text field with name: "DI Number"
        And the user writes "1234567890" to the selected text field and hits tab key
        And the user selects the date field with name: "Registry date"
        And the user writes today to the selected date field
        And the user selects the text field with name: "Export code"
        And the user writes "123ABC" to the selected text field and hits tab key
        And the user selects the drop down list with name: "International transport mode"
        And the user clicks on "Own means" option of the selected drop down list
        And the user selects the drop down list with name: "Import type"
        And the user clicks on "Importation by own means" option of the selected drop down list
        And the user selects the text field with name: "Custom clearance"
        And the user writes "Curitiba" to the selected text field and hits tab key
        And the user selects the text field with name: "EU"
        And the user writes "PR" to the selected text field and hits tab key
        And the user selects the date field with name: "Clearance date"
        And the user writes today to the selected date field

    Scenario Outline: 5. Add Lines
        Given the user clicks the "Lines" tab selected by title
        When the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        And the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE6ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCFOP"
        Then the user adds the text <XQCFOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | XQCFOP |
            | 1   | "BMS001" | "1"    | "3949" |
            | 2   | "BMS002" | "2"    | "3949" |

    Scenario: 6. DI Data
        Given the user clicks the "DI Data" action button on the header drop down
        Then the "Import declaration" screen is displayed

    Scenario Outline: 7. Inform DI Data Additions
        Given the user selects the text field with X3 field name: "XQDI0_CURLIG"
        And the user writes <CURLIG> to the selected text field and hits tab key
        And the user selects the fixed data table for x3 field name: "XQDI1_ARRAY_NBAD"
        And the user selects last fixed cell with X3 field name: "XQDI1_NUMAD"
        And the user adds the text <NUMAD> in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_CODFAB"
        And the user adds the text <CODFAB> in selected cell
        And the user clicks the "Save" main action button on the right panel
        Examples:
            | CURLIG | NUMAD | CODFAB |
            | "1"    | "10"  | "123"  |
            | "2"    | "20"  | "456"  |

    Scenario: 8. Creation
        Given the user clicks the Close page action icon on the header panel
        Then the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 9. Transmission
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Rejected            : 000"
        And the selected log panel includes the message "    Number of NF-e Pending return      : 000"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 10. Logout
        And the user logs-out from the system