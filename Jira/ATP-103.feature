###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-103
# - Description: Selecionar um expedição na devolução cliente e NÃO ser exibido a mensagem erro: Não é possível realizar o picking pois a NF-e não foi transmitida para sefaz
# - Jira: X3DEV-1833
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 01/12/2022
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-103

    Scenario: 1. Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. GESSDH Creation
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed

        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SDH0_STOFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_SDHTYP"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_BPCORD"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSDH0_CODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape
        When the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario Outline: 3. Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   | XQCFOP | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "1" | "100.00" | "6102" | "00"      | "999"  |

    Scenario: 4. Create GESSDH
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user waits 5 seconds
        And the user clicks the "Validation" button in the header
        And the user clicks the "Ok" opinion in the alert box
        Then the user clicks the "Invoice" button in the header

    Scenario: 5. Create Invoice - SEFAZ - Validation
        Given the user selects the data table in the popup
        When the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        And the "Sales invoice ALL : Full entry invoice" screen is displayed
        And the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "SIH0_XQSTATUSNFE"
        And the value of the selected text field is "Authorized invoice"
        And the user clicks the "Post" button in the header
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Document creation "
        And the user clicks the "Close page" main action button on the right panel
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "SDH0_SDHNUM"
        And the user stores the value of the selected text field with the key: "SDHNUM"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 6. GESSRH Creation
        Given the user opens the "GESSRH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Customer return ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SRH0_STOFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SRH0_BPCORD"
        And the user writes "BR001" to the selected text field and hits tab key

    Scenario: 7. Picking GESSDH
        And the user clicks the "Selection criteria" action button on the header drop down
        And the user selects the text field with X3 field name: "SCRITSRH_CRISDHNUM"
        And the user writes the stored text with key "SDHNUM" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel
        And the user clicks the "Delivery selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SDHNUM" and with the text containing "BR001" of the picking list panel
        And the user checks the selected picking list panel item
        And the user selects the text field with X3 field name: "WK6ALLXQ_CODOPF"

    Scenario: 8. OPF and Lines
        And the user writes "105" to the selected text field and hits tab key
        And the user clicks the "Ok" opinion in the alert box
        And the user clicks the "Ok" opinion in the alert box
        And the user selects the date field with X3 field name: "WK6ALLXQ_DTEMI"
        And the user writes today to the selected date field
        And the user selects the date field with X3 field name: "XQSRH1_DTSAIENT"
        And the user writes today to the selected date field
        And the user clicks the "Lines (tax)" tab selected by title
        And the user selects the fixed data table for x3 field name: "XQSRH3_ARRAY_PRODLIG"
        Then the user selects first row of the selected data table

    Scenario Outline: Add Lines
        Given the user selects cell with X3 field name: "XQSRH3_CFOP" of selected row
        And the user adds the text <CFOP> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_VARCFOP" of selected row
        And the user adds the text <VARCFOP> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_OICMS" of selected row
        And the user adds the text <OICMS> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTICMS" of selected row
        And the user adds the text <CSTICMS> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTIPI" of selected row
        And the user adds the text <CSTIPI> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTPIS" of selected row
        And the user adds the text <CSTPIS> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTCOF" of selected row
        And the user adds the text <CSTCOF> in selected cell

        And the user hits enter
        Then the user selects table row that is below the currently selected row

        Examples:
            | CFOP   | VARCFOP | OICMS | CSTICMS | CSTIPI | CSTPIS | CSTCOF |
            | "2201" | ""      | "0"   | "00"    | "99"   | "99"   | "99"   |

    Scenario: 9. Return Creation
        Given the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"

    Scenario: 10.Logout
        Given the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system

