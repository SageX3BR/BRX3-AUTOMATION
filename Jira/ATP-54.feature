###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-54
# - Description: Na função “Devolução do cliente” ao criar uma devolução com quantidade fracionada, o valor total
# dos Produtos é igual à entrega na origem (SDH).
# - Jira: X3-187874
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 14/07/2022
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-54

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. SIH Creation
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
        And the user writes "125" to the selected text field and hits tab key
        And the user hits escape
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
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
        And the user hits enter

        #MULTILEG BMS107 / ATP BMS106 / ATP OFICIAL BMS105
        Examples:
            | LIN | ITMREF   | QTY    | GROPRI   | XQCFOP | XQVARCFOP |
            | 1   | "BMS105" | "1.12" | "170.15" | "6110" | ""        |

    Scenario: 3.Create SDH
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 4.Resume - Transmission and Validation
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        #Verificar status da nota (6 = Autorizada)
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "[F:XQSDH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the "Validation" button in the header
        And a dialog box appears
        And the user clicks the "Ok" opinion in the alert box
        And the user clicks the "Tax Summary" tab selected by title
        #Then the user selects the text field with X3 field name: "XQSDH1_TOTMERCA"
        Then the user selects the text field with name: "Products total value"
        And the value of the selected text field is "190.57"
        #And the user selects the text field with X3 field name: "XQSDH1_TOTNF"
        And the user selects the text field with name: "Total shipment value"
        And the value of the selected text field is "209.63"
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SDHNUM"
        And the user stores the value of the selected text field with the key: "SDHNUM"
        And the user clicks the "Close page" main action button on the right panel


    Scenario: 6. GESSRH
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

    Scenario: 7. Picking GESSDH
        And the user clicks the "Selection criteria" action button on the header drop down
        And the user selects the text field with X3 field name: "SCRITSRH_CRISDHNUM"
        And the user writes the stored text with key "SDHNUM" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel
        And the user clicks the "Delivery selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SDHNUM" and with the text containing "BR001" of the picking list panel
        And the user checks the selected picking list panel item
        And the user selects the text field with X3 field name: "WK6ALLXQ3_CODOPF"
        And the user writes "105" to the selected text field and hits tab key
        And the user clicks the "Ok" opinion in the alert box
        And the user clicks the "Ok" opinion in the alert box

        And the user selects the date field with X3 field name: "WK6ALLXQ3_DTEMI"
        And the user writes today to the selected date field
        And the user selects the date field with X3 field name: "WK6ALLXQ3_DTSAIENT"
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

    Scenario: 8. Return Creation
        Given the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "NF-e Summary" tab selected by title
        #Then the user selects the text field with X3 field name: "XQSRH2_TOTMERCA"
        Then the user selects the text field with name: "Products total value"
        And the value of the selected text field is "190.57"
        #Then the user selects the text field with X3 field name: "XQSRH2_TOTNF"
        Then the user selects the text field with name: "Invoice total value"
        And the value of the selected text field is "209.63"

    Scenario: 9.Logout
        Given the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system