##########################################################################
#Header
#-------------------------------------------------------------------------
#- Test code: ATP-141
#- Description: Valor total devolução de empréstimo Parcial
#- Jira: X3DEV-3159
#- Legislation: BRA
#- Created by : Gustavo Albanus
#- Created date : 04/10/2023
#- Updated by :
#- Updated date :
#- Status : Done
##########################################################################

Feature: ATP-141

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. Create a Delivery
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRSDL" to the selected text field and hits tab key
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Ship-to"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "123" to the selected text field and hits tab key
        And the user selects the date field with X3 field name: "WK4ALL1_DLVDAT"
        And the user writes today to the selected date field
        And the user selects the date field with X3 field name: "WK4ALL1_LNDRTNDAT"
        And the user writes today to the selected date field
        And the user hits tab
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario Outline: 003. Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY  | GROPRI | XQCFOP |
            | 1   | "BMS103" | "1"  | "5.00" | "6415" |
            | 2   | "BMS103" | "6"  | "4.38" | "6415" |
            | 3   | "BMS103" | "10" | "3.00" | "6415" |

    Scenario: 004. Create document
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "WK4ALLXQ3_NFESTATUS"
        And the value of the selected text field is "Authorized invoice"
        Given the user clicks the "Validation" button in the header
        When a dialog box appears
        Then the user clicks the "Ok" opinion in the alert box
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SDHNUM"
        And the user stores the value of the selected text field with the key: "SDH_NUM"

    Scenario: 005. Validation Tax
        When the user clicks the "Tax Summary" tab selected by title
        And the user selects the text field with X3 field name: "WK4ALLXQ_TOTMERCA"
        And the value of the selected text field is "61.28"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 006. Create the Loan Return
        Given the user opens the "GESSRL" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Loan return ALL : Full entry" screen is displayed
        #Header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Ship-to"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user clicks the "Selection criteria" action button on the header drop down
        And the user selects the text field with name: "Delivery no."
        And the user writes the stored text with key "SDH_NUM" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel
        #Picking the delivery / All items
        And the user clicks the "Delivery selection" link on the left panel
        And the user selects the main picking list panel of the screen
        When the user clicks the "Expand all" button in the left top bar of the selected picking list
        And the user selects the item "BMS103 Shipped 6 UN Already Returned 0" of the level 2 on the picking list panel
        #And the user selects the item with the stored text with key "SDH_NUM" and with the text containing "BR001" of the picking list panel
        And the user checks the selected picking list panel item
        And the user selects the text field with X3 field name: "WK7ALLXQ3_CODOPF"
        And the user writes "141" to the selected text field and hits tab key
        And the user selects the date field with X3 field name: "WK7ALLXQ3_DTSAIENT"
        When the user writes a generated date in the selected date field using the value "T+1"
        And the user selects the text field with X3 field name: "WK7ALLXQ3_HRSAIENT"
        Then the user writes "10:00:00" to the selected text field and hits tab key
        And the user clicks the "Lines (tax)" tab selected by title

    Scenario: 007. Informing the CFOP in the line
        Given the user selects the fixed data table for x3 field name: "XQSRL3_ARRAY_PRODLIG"
        And the user selects first row of the selected data table
        Then the user selects cell with X3 field name: "XQSRL3_CFOP" of selected row
        And the user adds the text "2415" in selected cell
        And the user hits tab

    Scenario: 008. Create SRL document
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        When the user clicks the "NF-e Summary" tab selected by title
        And the user selects the text field with X3 field name: "XQSRL2_TOTMERCA"
        And the value of the selected text field is "26.28"
        And the user waits 3 seconds

    Scenario: 009. Lines
        When the user clicks the "Lines" tab selected by title
        Given the user selects the data table of section: "Lines"
        And the user selects first row of the selected data table
        Then the user selects cell with X3 field name: "WK7ALL1_QTY" of selected row
        And the user adds the text "3" in selected cell
        And the user hits tab
        Given the user clicks the "Save" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been modified"
        When the user clicks the "NF-e Summary" tab selected by title
        And the user selects the text field with X3 field name: "XQSRL2_TOTMERCA"
        And the value of the selected text field is "13.14"

    Scenario: 010. Logout
        And the user clicks the "Close" main action button on the right panel
        And the user logs-out from the system