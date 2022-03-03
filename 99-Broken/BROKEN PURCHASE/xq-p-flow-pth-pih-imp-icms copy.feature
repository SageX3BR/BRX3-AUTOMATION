###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-p-flow-pth-pih-imp-icms
# - Description: Import receipt create via picking a order with
# all incidences in the Acessories Expenses
# - Jira: NA
# - Legislation: BRA
# - Created by : Daniela Anile
# - Created date : 10/02/2021
# - Updated by : Daniela Anile
# - Updated date : 10/02/2021
# - Status : Automated
###########################################################################

Feature: xq-p-flow-pth-pih-imp-icms

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #National
    #--------------------------------------------------------------------------------
    Scenario: 7. Header
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        And the "Purchase receipt ALL : Full entry" screen is displayed
        And the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "PT006" to the selected text field and hits tab key

    Scenario: 8. General Data
        Given the user clicks the "General Data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "111" to the selected text field and hits tab key

    Scenario Outline: 9. Add Lines
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
        Then the user adds the text <XQCFOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI | XQCFOP |
            | 1   | "BMS001" | "10"   | "100"  | "3101" |

    Scenario: 10. DI Data
        Given the user clicks the "DI Data" action button on the header drop down
        Then the "Import declaration" screen is displayed

    Scenario Outline: 11. Import Declaration
        Given the user selects the text field with X3 field name: "XQDI0_CURLIG"
        And the user writes <CURLIG> to the selected text field and hits tab key
        And the user selects the fixed data table for x3 field name: "XQDI1_ARRAY_NBDI"
        And the user selects last editable cell with X3 field name: "XQDI1_NUMDI"
        And the user adds the text <NUMDI> in selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_DTDI"
        And the user enters todays date in the selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_CODEXP"
        And the user adds the text <CODEXP> in selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_LOCDESEMB"
        And the user adds the text <LOCDESEMB> in selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_UFDESEMB"
        And the user adds the text <UFDESEMB> in selected cell
        And the user selects last editable cell with X3 field name: "XQDI1_DTDESEMB"
        And the user enters todays date in the selected cell
        And the user clicks the "Save" main action button on the right panel

        Examples:
            | CURLIG | NUMDI        | CODEXP   | LOCDESEMB            | UFDESEMB |
            | "1"    | "1234567890" | "123ABC" | "Porto de Paranagua" | "PR"     |

    Scenario Outline: 12. Inform DI Data Additions
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

    Scenario: 13. Creation
        Given the user clicks the Close page action icon on the header panel
        And the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WE6ALL0_PTHNUM"
        And the user stores the value of the selected text field with the key: "PTHDocumentNo"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 6. Header PIH
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "PT006" to the selected text field and hits tab key

    Scenario: 7. Picking
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Enter selection criteria" screen is displayed
        And the user selects the text field with X3 field name: "PCRITINV_WNUMRCP"
        And the user writes the stored text with key "PTHDocumentNo" in the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        And the user clicks the "Receipt selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "PTHDocumentNo" and with the text containing "BR011" of the picking list panel
        And the user checks the selected picking list panel item
        And an alert box with the text containing "Replace data from the 'General data' tab?" appears
        And the user clicks the "Yes" opinion in the alert box
        And an alert box with the text containing "Replace data in "data transport" tab?" appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: 8. Management
        Given the user clicks the "Management" tab selected by title
        When the user selects the text field with name: "Supplier doc no."
        And the user writes "MANAG1234" to the selected text field and hits tab key
        And an alert box appears
        And an alert box with the text containing "Reference entered on invoice" appears
        And the user clicks the "Ok" opinion in the alert box

    Scenario: 21. Creation
        Given the user clicks the Close page action icon on the header panel
        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 9. Resume
        Given the user clicks the "Resume" tab selected by title
        And the user selects the text field with X3 field name: "XQPIH2_TTDESPACES"
        And the value of the selected text field is "86.6700"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 35. Logout
        And the user logs-out from the system

####