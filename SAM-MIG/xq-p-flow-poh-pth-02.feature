###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-p-flow-poh-pth
# - Description: Purchasing Picking POH PTH
# - Jira: NA
# - Legislation: BRA
# - Created by : Daniela Anile
# - Created date : 02/02/2021
# - Updated by : Fausto A Neto
# - Updated date : 31/07/2024
# - Status : Automated
###########################################################################

Feature: xq-p-flow-poh-pth-02

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Foreign
    #--------------------------------------------------------------------------------
    Scenario: 2. Header POH
        Given the user opens the "GESPOH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        And the "Purchase order ALL : Full entry" screen is displayed
        And the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Order site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "PT006" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "111" to the selected text field and hits tab key
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"

    Scenario Outline: 3. Lines POH
        And the user selects editable table row number: <LIN>
        When the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCFOP"
        Then the user adds the text <XQCFOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | XQCFOP |
            | 1   | "BMS001" | "1"    | "3949" |
            | 2   | "BMS002" | "2"    | "3949" |

    Scenario: 4. Create and Store Doc Number POH
        Given the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WE3ALLXQ0_POHNUM"
        And the user stores the value of the selected text field with the key: "PoDocumentNo2"
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
        And the user writes "PT006" to the selected text field and hits tab key

    Scenario: 6. Picking
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Preloading Criteria" screen is displayed
        And the user selects the text field with X3 field name: "PCRITORD_WPOHNUM"
        And the user writes the stored text with key "PoDocumentNo2" in the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        And the user clicks the "Order selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "PoDocumentNo2" and with the text containing "PT006" of the picking list panel
        And the user checks the selected picking list panel item
        And an alert box with the text containing "Replace data from the General Data tab?" appears
        And the user clicks the "Yes" opinion in the alert box
        And an alert box with the text containing "Replace data from the Shipping data tab?" appears
        And the user clicks the "Yes" opinion in the alert box

    Scenario: 7. DI Data
        Given the user clicks the "DI Data" action button on the header drop down
        Then the "Import declaration" screen is displayed

    Scenario Outline: 8. Import Declaration
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
            | "2"    | "1234567890" | "ABC123" | "Porto de Paranagua" | "PR"     |

    Scenario Outline: 9. Inform DI Data Additions
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

    Scenario: 10. Creation
        Given the user clicks the Close page action icon on the header panel
        Then the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 11. Transmission
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        #Verificar status da nota (6 = Autorizada)
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "[F:XQPTH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 12. Logout
        And the user logs-out from the system
