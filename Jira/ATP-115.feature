###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-115
# - Description: Garantir que ao transmitir uma expedição não seja cancelada sem antes estar validada
# - Jira: X3DEV-2105
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 06/02/2023
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-115

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. GESSDH Creation
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
        And the user writes "120" to the selected text field and hits tab key
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
            | 1   | "BMS001" | "1" | "100.00" | "6901" | "00"      | "999"  |

    Scenario: 4. Create GESSDH
        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "WK4ALLXQ0_SDHNUM"
        And the user stores the value of the selected text field with the key: "SDH_NUM"
        Then the user clicks the "SEFAZ" action button on the header drop down
        Then a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "WK4ALLXQ3_NFESTATUS"
        And the value of the selected text field is "Authorized invoice"
        And the user clicks the Close page action icon on the header panel

    Scenario: 5. Monitoramento GESSDH
        Given the user opens the "XQCONSNFE" function
        And the "NF-e Monitoring" screen is displayed
        When the user selects the text field with X3 field name: "XQNFEMNT0_NUMDOC"
        And the user writes the stored text with key "SDH_NUM" in the selected text field and hits tab key
        And the user clicks the "Search" button in the header
        Then the user selects the data table with x3 field name: "XQNFEMNT1_ARRAY_NBLIG"
        And the user selects first row of the selected data table
        Given the user opens "Cancel" function on toolbox of the selected row
        Then an alert box with the text "Esta ação não está disponível para Expedições não validadas. Necessário validação deste documento para continuar." appears
        And the user clicks the "Ok" opinion in the alert box

    Scenario: 6. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system