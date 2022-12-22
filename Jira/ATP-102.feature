###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-102
# - Description: ICMS desonerado subtraindo do total da NF-e mesmo a regra fiscal não marcada para subtrair
# - Jira: X3DEV-1875
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 28/11/2022
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-102

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. GESSOH Creation
        Given the user opens the "GESSOH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRSON" to the selected text field and hits tab key
        And the user selects the text field with name: "Sold-to"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key
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
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI | XQCFOP | XQVARCFOP | XQCSTICMS |
            | 1   | "BMS001" | "1" | "5.00" | "6102" | "3"       | "20"      |

    Scenario: 3. Document Creation
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"


    Scenario: 4. Validation of Taxes
        When the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with X3 field name: "WK2ALLXQ_TOTMERCA"
        And the value of the selected text field is "5.00"
        And the user selects the text field with X3 field name: "WK2ALLXQ_TOTDESCDESON"
        And the value of the selected text field is "0.12"
        And the user selects the text field with X3 field name: "WK2ALLXQ_TOTNF"
        And the value of the selected text field is "5.00"
    #O Valor Esperado é 5.00, pois na RTAX está marcado para não deduzir do Total da NF

    Scenario: 5. Num. Doc.
        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user stores the value of the selected text field with the key: "SOHNUM"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 6. GESSDH Creation
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

    Scenario: 7. Picking
        Given the user clicks the "Selection criteria" action button on the header drop down
        And the "Delivery preloading filter" screen is displayed
        And the user selects the text field with X3 field name: "SCRITSDH_CRISOHNUM"
        And the user writes the stored text with key "SOHNUM" in the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        And the user clicks the "Order selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SOHNUM" and with the text containing "BR011" of the picking list panel
        And the user checks the selected picking list panel item

    Scenario: 8. Document Creation
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 9. Validation of Taxes
        When the user clicks the "Tax Summary" tab selected by title
        Then the user selects the text field with X3 field name: "XQSDH1_TOTMERCA"
        And the value of the selected text field is "5.00"
        And the user selects the text field with X3 field name: "XQSDH1_TOTDESCDESON"
        And the value of the selected text field is "0.12"
        And the user selects the text field with X3 field name: "XQSDH1_TOTNF"
        And the value of the selected text field is "5.00"
    #O Valor Esperado é 5.00, pois na RTAX está marcado para não deduzir do Total da NF

    Scenario: 10. Num. Doc.
        And the user selects the text field with X3 field name: "SDH0_SDHNUM"
        And the user stores the value of the selected text field with the key: "SDHNUM"
        Then the user clicks the "Validation" button in the header
        And a dialog box appears
        And the user clicks the "Ok" opinion in the alert box
        Then the user clicks the Close page action icon on the header panel

    Scenario: 11. SIH Creation
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SIH0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_SIVTYP"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_BPCINV"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSIH0_CODOPF"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape

    Scenario: 12. Picking
        Given the user selects the data table of left panel
        When the user clicks the "Delivery selection" link on the left panel
        Then the user selects search cell with header: "Delivery"
        And the user adds the stored text with key "SDHNUM" in selected cell and hits enter key
        And the user selects cell that matches exact with the stored text with the key: "SDHNUM" and column header: "Delivery"
        And the user clicks on the selected cell

    Scenario: 13. Document Creation
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 14. Validation of Taxes
        When the user clicks the "NF-e Summary" tab selected by title
        Then the user selects the text field with X3 field name: "XQSIH1_TOTMERCA"
        And the value of the selected text field is "5.00"
        And the user selects the text field with X3 field name: "XQSIH1_TOTDESCDESON"
        And the value of the selected text field is "0.12"
        And the user selects the text field with X3 field name: "XQSIH1_TOTNF"
        And the value of the selected text field is "5.00"
        #O Valor Esperado é 5.00, pois na RTAX está marcado para não deduzir do Total da NF
        Then the user clicks the Close page action icon on the header panel

    Scenario: 15. Logout
        And the user logs-out from the system









