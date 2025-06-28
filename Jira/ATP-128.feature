########################################################################################################
#Header
#-------------------------------------------------------------------------
#- Test code: ATP-128
#- Description: GESSOH Manual não deve sobrepor a Operação Fiscal Inter-Estab. / GESSOH Automatica deve
#               respeitar a parametrização Operação Fiscal da ADPVAL
#- Jira: X3DEV-2765
#- Legislation: BRA
#- Created by : Gustavo Albanus
#- Created date : 30/05/2023
#- Updated by :
#- Updated date :
#- Status :
########################################################################################################

Feature: ATP-128

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. GESSOH MANUAL
        Given the user opens the "GESSOH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRSON" to the selected text field and hits tab key
        And the user selects the text field with name: "Sold-to"
        And the user writes "BR012" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        Then the user writes "120" to the selected text field and hits tab key

    Scenario: 003. LINES
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK2ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell and hits enter key
        Then the user clicks the "Yes" opinion in the alert box

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   | XQCFOP |
            | 1   | "BMS001" | "1" | "100.00" | "5151" |

    Scenario: 004. CREATE GESSOH MANUAL
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WK2ALLXQ0_XQCODOPF"
        And the value of the selected text field is "120"
        And the user clicks the Close page action icon on the header panel
        And the user waits 3 seconds


    Scenario: 005. CREATE GESPOH
        Given the user opens the "GESPOH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase order ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Order site"
        And the user writes "BR012" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        Then the user writes "500" to the selected text field and hits tab key

    Scenario Outline: Lines GESPOH
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"
        And the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI   | XQCFOP |
            | 1   | "BMS001" | "1"    | "100.00" | "1102" |

    Scenario: 006. CREATE
        Given the user clicks the "Create" main action button on the right panel
        When a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Automatic generation of sales order"
        And the user clicks the Close page action icon on the header panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WE3ALL3_OCNNUM"
        And the user stores the value of the selected text field with the key: "DOCSOH"
        And the user clicks the Close page action icon on the header panel

    Scenario: 007. GESSOH AUTOMATIC
        Given the user opens the "GESSOH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        Given the user selects the data table of left panel
        When the user clicks the "Orders" link on the left panel
        Then the user selects search cell with header: "Order no."
        And the user adds the stored text with key "DOCSOH" in selected cell and hits tab key
        And the user selects cell with column header: "Order no." and row number: 1
        And the user clicks on the selected cell
        And the user selects the text field with X3 field name: "WK2ALLXQ0_XQCODOPF"
        And the value of the selected text field is "100"
        And the user clicks the Close page action icon on the header panel

    Scenario: 008. LOGOUT
        And the user logs-out from the system
