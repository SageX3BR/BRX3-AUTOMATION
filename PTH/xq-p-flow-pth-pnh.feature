###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-p-flow-pth-pnh
# - Description: Purchasing Picking PTH PNH
# - Jira: NA
# - Legislation: BR addon
# - Created by : Daniela Anile
# - Created date : 10/02/2021
# - Updated by : Carla Cury
# - Updated date : 05/07/2021
# - Status : In progress
###########################################################################

Feature: xq-p-flow-pth-pnh

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Creation of the receipt for CST 10 modbc 6
    #--------------------------------------------------------------------------------
    Scenario:  2. Header PTH
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        And the "Purchase receipt ALL : Full entry" screen is displayed
        And the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key

    Scenario:  2. General Data
        Given the user clicks the "General Data" tab selected by title
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "113" to the selected text field and hits tab key

    Scenario Outline: Add Lines
        Given the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"
        And the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE6ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell and hits enter key
        #And the user clicks the "OK" button in the header

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI | XQCFOP |
            | 1   | "BMS099" | "1"    | "100"  | "2152" |
            | 2   | "BMS102" | "2"    | "200"  | "2152" |

    Scenario: Create
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WE6ALL0_PTHNUM"
        And the user stores the value of the selected text field with the key: "DOCPTH"

    Scenario: Transmission
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Authorized          : 001"
        And the user clicks the "Close page" main action button on the right panel
        Then the user stores the value of the selected text field with the key: "CHAVENFEPTH"

    Scenario: Header PNH
        Given the user opens the "GESPNH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase return ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WE7ALL1_PNHFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE7ALL1_BPSNUM"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE7ALL1_XQCODOPF"
        And the user writes "131" to the selected text field and hits tab key

    Scenario: Picking
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Preloading Criteria" screen is displayed
        And the user selects the text field with X3 field name: "PCRITRCP_WNUMRCP"
        And the user writes the stored text with key "DOCPTH" in the selected text field and hits enter key
        And the user clicks the "OK" button in the header
        When the user clicks the "Receipt selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "DOCPTH" and with the text containing "BR011" of the picking list panel
        Then the user checks the selected picking list panel item


    Scenario Outline: Lines
        Given the user selects the data table with x3 field name: "WE7ALL1_ARRAY_NBLIG"
        And the user selects row that has the text <LIN> in column with X3 field name: "WE7ALL1_PTDLIN"
        And the user selects cell with X3 field name: "WE7ALL1_XQCFOP" of selected row
        And the user adds the text <XQCFOP> in selected cell

        Examples:
            | LIN    | XQCFOP |
            | "1000" | "6201" |
            | "2000" | "6201" |

    Scenario: Create return
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: Transmission and Validation
        When the user clicks the "Transmit SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Authorized          : 001"
        Then the user clicks the "Close page" main action button on the right panel
        When the user clicks the "Validation" button in the header
        And the user clicks the "Ok" opinion in the alert box
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Return Validation End"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: Loggout
        Given the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system