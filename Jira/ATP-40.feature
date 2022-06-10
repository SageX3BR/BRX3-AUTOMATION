###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-40
# - Description: Garantir que os campos da legislação brasileira estão desabilitados na criação de Fatura de Compra com estabelecimento não BR
# - Jira: X3DEV-654
# - Legislation:
# - Created by : Gustavo Albanus
# - Created date : 08/06/2022
# - Status : Done
###########################################################################


Feature:ATP-40

    Scenario: 01.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 02. GESSOH Header
        Given the user opens the "GESPIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed

        #Criar string baseada em datetime$ + 5 Random
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "val(ctrans(num$(datetime$),"-:TZ","")+ num$(int(rnd(99999))))" to the selected text field and hits enter key
        And the user selects the text field with name: "Result"
        And the user stores the value of the selected text field with the key: "DOCSUP029"
        Then the user clicks the Close page action icon on the header panel

        #Cabeçalho
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "NA012" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "INV" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "NA052" to the selected text field and hits tab key

        #Management
        Given the user clicks the "Management" tab selected by title
        When the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "DOCSUP029" in the selected text field and hits tab key

    Scenario Outline: 03. Add Lines
        Given the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        And the user selects last row of the selected data table
        And the user opens "Popup view" function on toolbox of the selected row
        And the user selects the drop down list with name: "Source"
        And the user clicks on "Miscellaneous" option of the selected drop down list
        And the user hits tab
        And the user selects the text field with X3 field name: "WE8ALL3_ITMREF"
        And the user writes <ITMREF> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_QTYUOM"
        And the user writes <QTYUOM> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_NETPRI"
        And the user writes <NETPRI> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_VAT1"
        And the user writes <VAT1> to the selected text field and hits enter key
        And the user clicks the Close page action icon on the header panel

        Examples:
            | LIN | ITMREF   | QTYUOM | NETPRI  | VAT1 |
            | 1   | "BMS001" | "1"    | "50.75" | "NT" |

    Scenario: 04. Document Creation
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 05. Check Fiscal Operation field disabled
        Given the user clicks the "General data" tab selected by title
        Given the user selects the text field with name: "Fiscal operation"
        Then the selected text field should be disabled

    Scenario: 06. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
