##########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-177
# - Description: Documento GESSRH  diverge do valor total da Fatura
# - JIRA: X3DEV-8039
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date :31/07/2025
# - Updated by :
# - Updated date :
# - Status : Done
# - Parametrizações:
###########################################################################

Feature: ATP-177

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. GESSDH Creation
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed

        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WK4ALLXQ0_STOFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SDHTYP"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ0_BPCORD"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK4ALLXQ3_CODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape
        When the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario Outline: 003. Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY  | GROPRI    |
            | 1   | "BMS001" | "1"  | "7.9885"  |
            | 1   | "BMS001" | "3"  | "1.9171"  |
            | 1   | "BMS001" | "5"  | "16.3231" |
            | 1   | "BMS001" | "7"  | "9.5176"  |
            | 1   | "BMS001" | "11" | "3.2977"  |

    Scenario: 004. Create GESSDH and Validation of Taxes
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        When the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with name: "Products total value"
        And the value of the selected text field is "198.25"
        And the user selects the text field with name: "Total shipment value"
        And the value of the selected text field is "218.08"
        And the user selects the text field with name: "ICMS base total"
        And the value of the selected text field is "198.25"
        And the user selects the text field with name: "IPI base total"
        And the value of the selected text field is "198.25"
        And the user selects the text field with name: "PIS base (R$)"
        And the value of the selected text field is "198.25"
        And the user selects the text field with name: "COFINS base (R$)"
        And the value of the selected text field is "198.25"
        And the user waits 3 seconds
        And the user clicks the "Validation" button in the header
        And the user clicks the "Ok" opinion in the alert box
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SDHNUM"
        And the user stores the value of the selected text field with the key: "SDHNUM"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 005. SIH Creation
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WK5ALLXQ0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ0_SIVTYP"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ0_BPCINV"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ3_CODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape

    Scenario: 006. Picking and Create SIH
        Given the user selects the data table of left panel
        When the user clicks the "Delivery selection" link on the left panel
        Then the user selects search cell with header: "Delivery"
        And the user adds the stored text with key "SDHNUM" in selected cell and hits enter key
        And the user selects cell that matches exact with the stored text with the key: "SDHNUM" and column header: "Delivery"
        And the user clicks on the selected cell
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 007. Validation of Taxes SIH
        When the user clicks the "NF-e Summary" tab selected by title
        Then the user selects the text field with name: "Products total value"
        And the value of the selected text field is "198.25"
        And the user selects the text field with name: "Invoice total value"
        And the value of the selected text field is "218.08"
        And the user selects the text field with name: "ICMS base total"
        And the value of the selected text field is "198.25"
        And the user selects the text field with name: "IPI base total"
        And the value of the selected text field is "198.25"
        And the user selects the text field with name: "PIS base (R$)"
        And the value of the selected text field is "198.25"
        And the user selects the text field with name: "COFINS base (R$)"
        And the value of the selected text field is "198.25"

    Scenario: 008. SEFAZ
        And the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        #Verificar status da nota (6 = Autorizada)
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "[F:XQSIH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel
        Then the user clicks the Close page action icon on the header panel

    Scenario: 009. Creation of the Return Invoice
        Given the user opens the "GESSRH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Customer return ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "WK6ALLXQ0_STOFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK6ALLXQ0_BPCORD"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user clicks the "Selection criteria" action button on the header drop down
        And the user selects the text field with X3 field name: "SCRITSRH_CRISDHNUM"
        And the user writes the stored text with key "SDHNUM" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel

        And the user clicks the "Delivery selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SDHNUM" and with the text containing "BR001" of the picking list panel
        And the user checks the selected picking list panel item
        And the user selects the text field with X3 field name: "WK6ALLXQ3_CODOPF"
        And the user writes "140" to the selected text field and hits tab key
        And the user selects the date field with X3 field name: "WK6ALLXQ3_DTEMI"
        And the user writes today to the selected date field
        And the user selects the date field with X3 field name: "WK6ALLXQ3_DTSAIENT"
        And the user writes today to the selected date field
        And the user clicks the "Lines (tax)" tab selected by title
        And the user selects the fixed data table for x3 field name: "XQSRH3_ARRAY_PRODLIG"
        Then the user selects first row of the selected data table

    Scenario Outline: 010. Add Lines
        Given the user selects cell with X3 field name: "XQSRH3_CFOP" of selected row
        And the user adds the text <CFOP> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_OICMS" of selected row
        And the user adds the text <ORIICMS> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTICMS" of selected row
        And the user adds the text <CSTICMS> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_XQCENQ" of selected row
        And the user adds the text <XQCENQ> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTIPI" of selected row
        And the user adds the text <IPICST> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTPIS" of selected row
        And the user adds the text <PISCST> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTCOF" of selected row
        And the user adds the text <COFCST> in selected cell
        And the user hits enter
        Then the user selects table row that is below the currently selected row

        Examples:
            | CFOP   | ORIICMS | CSTICMS | XQCENQ | IPICST | PISCST | COFCST |
            | "2901" | "0"     | "00"    | "999"  | "49"   | "01"   | "01"   |
            | "2901" | "0"     | "00"    | "999"  | "49"   | "01"   | "01"   |
            | "2901" | "0"     | "00"    | "999"  | "49"   | "01"   | "01"   |
            | "2901" | "0"     | "00"    | "999"  | "49"   | "01"   | "01"   |
            | "2901" | "0"     | "00"    | "999"  | "49"   | "01"   | "01"   |

    Scenario: 011. Return Creation
        Given the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        When the user clicks the "NF-e Summary" tab selected by title
        Then the user selects the text field with name: "Products total value"
        And the value of the selected text field is "198.25"
        And the user selects the text field with name: "Invoice total value"
        And the value of the selected text field is "218.08"
        And the user selects the text field with name: "ICMS base total"
        And the value of the selected text field is "198.25"
        And the user selects the text field with name: "IPI base total"
        And the value of the selected text field is "198.25"
        And the user selects the text field with name: "PIS base (R$)"
        And the value of the selected text field is "198.25"
        And the user selects the text field with name: "COFINS base (R$)"
        And the value of the selected text field is "198.25"
        And the user waits 2 seconds
        And the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        #Verificar status da nota (6 = Autorizada)
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "[F:XQSRH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 012. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system