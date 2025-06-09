##########################################################################
#Header
#-------------------------------------------------------------------------
#- Test code: ATP-125
#- Description: Nota complementar com erro de A requisição não pode ser nula
#- Jira: X3DEV-2597
#- Legislation: BRA
#- Created by : Gustavo Albanus
#- Created date : 19/05/2023
#- Updated by : Gustavo Albanus
#- Updated date : 24/07/2024
#- Status : Done
#- Ajustes Efetuados: Parametrização da ADPVAL Doc. Aut. / Variação da CFOP e Ajuste do Campo Chave NFe
##########################################################################

Feature: ATP-125

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. GESSIH
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape

    Scenario Outline: 3. Add Lines
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY  | GROPRI   | XQVARCFOP |
            | 1   | "BMS108" | "10" | "100.00" | ""        |

    Scenario: 4. Document Creation and validation
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        Then the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        Then the user clicks the Close page action icon on the header panel
        Then the user clicks the "Legal data" action button on the header drop down
        And the user selects the text field with X3 field name: "XQLDATANFE_CHAVENFE"
        And the user stores the value of the selected text field with the key: "CHAVE"
        Then the user clicks the Close page action icon on the header panel
        #Given the user clicks the "Cancel" main action button on the right panel
        Then the user clicks the Close page action icon on the header panel

    Scenario: 003. GESPTH
        Given the user opens the "GESPTH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase receipt ALL : Full entry" screen is displayed

        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Receiving site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key

        When the user clicks the "General Data" tab selected by title
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "902" to the selected text field and hits tab key
        And the user stores the generated value with length 5 with the key "ALEATORIO"
        And the user selects the text field with X3 field name: "WE6ALLXQ_NUMNFE"
        And the user writes the stored text with key "ALEATORIO" in the selected text field and hits tab key
        And the user selects the text field with name: "Serial number"
        And the user writes "1" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE6ALLXQ_CHAVENFE"
        And the user writes the stored text with key "CHAVE" in the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WE6ALL1_ARRAY_NBLIG"

    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WE6ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQORIGEMICMS"
        And the user adds the text <XQORIGEMICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCSTPIS"
        And the user adds the text <XQCSTPIS> in selected cell
        And the user selects last editable cell with X3 field name: "WE6ALL1_XQCSTCOF"
        And the user adds the text <XQCSTCOF> in selected cell
        Then the user hits enter
        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI   | XQCFOP | XQORIGEMICMS | XQCSTICMS | XQCSTPIS | XQCSTCOF |
            | 1   | "BMS108" | "10"   | "100.00" | "2653" | "0"          | "00"      | "50"     | "50"     |

    Scenario: 004. Create
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WE6ALL0_PTHNUM"
        And the user stores the value of the selected text field with the key: "DOCPTH"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 005. Creating GESPNH
        Given the user opens the "GESPNH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase return ALL : Full entry" screen is displayed

        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Return site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "130" to the selected text field
        Then the user hits tab

        When the user clicks the "Selection criteria" action button on the header drop down
        And the "Preloading Criteria" screen is displayed
        And the user selects the text field with X3 field name: "PCRITRCP_WNUMRCP"
        And the user writes the stored text with key "DOCPTH" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel

        When the user clicks the "Receipt selection" link on the left panel
        When the user selects the main picking list panel of the screen
        And the user clicks the "Expand all" button in the left top bar of the selected picking list
        And the user selects the item "BMS108" of the level 1 on the picking list panel
        And the user checks the selected picking list panel item
        And the user selects the data table with x3 field name: "WE7ALLXQ0_ARRAY_NBLIG"

    Scenario Outline: Lines
        Given the user selects row that has the text <LIN> in column with X3 field name: "WE7ALLXQ0_PTDLIN"
        And the user selects cell with X3 field name: "WE7ALLXQ0_XQCFOP" of selected row
        And the user adds the text <XQCFOP> in selected cell
        And the user selects cell with X3 field name: "WE7ALLXQ0_XQORIGEMICMS" of selected row
        And the user adds the text <XQORIGEMICMS> in selected cell
        And the user selects cell with X3 field name: "WE7ALLXQ0_XQCSTICMS" of selected row
        And the user adds the text <XQCSTICMS> in selected cell and hits tab key
        And the user selects cell with X3 field name: "WE7ALLXQ0_XQCSTPIS" of selected row
        And the user adds the text <XQCSTPIS> in selected cell
        And the user selects cell with X3 field name: "WE7ALLXQ0_XQCSTCOF" of selected row
        Then the user adds the text <XQCSTCOF> in selected cell
        And the user selects cell with X3 field name: "WE7ALLXQ0_XQCENQ" of selected row
        And the user adds the text <XQCENQ> in selected cell and hits enter key
        Examples:
            | LIN    | XQCFOP | XQORIGEMICMS | XQCSTICMS | XQCSTPIS | XQCSTCOF | XQCENQ |
            | "1000" | "6661" | "0"          | "00"      | "01"     | "01"     | "999"  |


    Scenario: 006. Create / Transmit to Sefaz and Validation
        Given the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "Transmit SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        #Verificar status da nota (6 = Autorizada)
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "[F:XQPNH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel
        When the user clicks the "Validation" button in the header
        And the user clicks the "Ok" opinion in the alert box
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Return Validation End"
        Then the user clicks the Close page action icon on the header panel
        And the user selects the text field with X3 field name: "WE7ALLXQ0_PNHNUM"
        And the user stores the value of the selected text field with the key: "DOCPNH"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 007.GESXQSADD Creation
        Given the user opens the "GESXQSADD" function
        Then the "Additional Invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "XQSADDI0_CPY"
        And the user writes "BR10" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSADDI0_FCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the drop down list with X3 field name: "XQSADDI0_DOCTYP"
        And the user clicks on "Purchase Return (PNH)" option of the selected drop down list
        Then the value of the selected drop down list is "Purchase Return (PNH)"
        And the user selects the text field with X3 field name: "XQSADDI0_ORIDOCNUM"
        And the user writes the stored text with key "DOCPNH" in the selected text field and hits tab key
        And the user hits escape

    Scenario: 008.Tax detail
        Given the user clicks the "Tax detail" action button on the header drop down
        When the "Tax detail" screen is displayed
        Then the user selects the text field with X3 field name: "XQSTD1_ICMSBCALC"
        And the user writes "10.00" to the selected text field and hits tab key
        Then the user selects the text field with X3 field name: "XQSTD1_VALICMSOP"
        And the user writes "1.00" to the selected text field and hits tab key
        Then the user selects the text field with X3 field name: "XQSTD1_VALICMSDEVID"
        And the user writes "1.00" to the selected text field and hits tab key
        Then the user selects the text field with X3 field name: "XQSTD1_CSTPIS"
        And the user writes "49" to the selected text field and hits tab key
        Then the user selects the text field with X3 field name: "XQSTD1_CSTCOF"
        And the user writes "49" to the selected text field and hits tab key
        And the user clicks the "OK" action button on the header drop down
        Then the user clicks the Close page action icon on the header panel
        Then the user clicks the "Yes" opinion in the alert box

    Scenario: 009.Resume - Creation and Transmission
        And the user clicks the "Create" main action button on the right panel
        Given the user clicks the "SEFAZ" action button on the header drop down
        When a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "XQSADDI1_STATUSSEFAZ"
        And the value of the selected text field is "Authorized"
        And the user clicks the "Post" button in the header
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 010. Logout
        And the user logs-out from the system


