###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-20
# - Description: Criar Carta de Correção Selecionando Fatura de Compra
# - Jira:
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 24/10/2024
# - Updated by :
# - Updated date :
# - Status : Done
##########################################################################

Feature: ATP-20

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. GESPIH Header
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "val(ctrans(num$(datetime$),"-:TZ","")+ num$(int(rnd(99999))))" to the selected text field and hits enter key
        And the user selects the text field with name: "Result"
        And the user stores the value of the selected text field with the key: "DOCSUP041"
        Then the user clicks the Close page action icon on the header panel
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key

    Scenario: 003. General data
        Given the user clicks the "General data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "112" to the selected text field and hits tab key

    Scenario: 004. Management
        Given the user clicks the "Management" tab selected by title
        When the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "DOCSUP041" in the selected text field and hits tab key

    Scenario Outline: 005. Add Lines
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
        And the user selects the text field with X3 field name: "WE8ALL3_XQCFOP"
        And the user writes <XQCFOP> to the selected text field and hits enter key
        And the user clicks the Close page action icon on the header panel

        Examples:
            | LIN | ITMREF   | QTYUOM | NETPRI | XQCFOP |
            | 1   | "BMS001" | "1"    | "100"  | "2101" |

    Scenario: 006. Control
        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL3_CUMLINAMT1"
        And the user stores the value of the selected text field with the key: "CALCVALUE"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE" in the selected text field and hits tab key

    Scenario: 007. Creation
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with name: "Entry number"
        And the user stores the value of the selected text field with the key: "FATURA"

    Scenario: 008. Transmission
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        #Verificar status da nota (6 = Autorizada)
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "[F:XQPIH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 009. GESXQAMEND Carta de Correção
        Given the user opens the "GESXQAMEND" function
        Then the "Invoice amendment" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "XQAMEND0_CPY"
        And the user writes "BR10" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQAMEND0_FCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the drop down list with X3 field name: "XQAMEND0_DOCTYP"
        When the user clicks on "Purchase Invoice (PIH)" option of the selected drop down list
        Then the value of the selected drop down list is "Purchase Invoice (PIH)"
        And the user selects the text field with X3 field name: "XQAMEND0_DOCNUM"
        And the user writes the stored text with key "FATURA" in the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQAMEND1_AMENDTEXT"
        And the user writes "TESTE DE TRANSMISSÃO DA CARTA DE CORREÇÃO SELECIONANDO FATURA DE COMPRA" to the selected text area

    Scenario: 010. XQAMEND Criado
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 011. Transmissão Carta de Correção
        Given the user clicks the "SEFAZ Communication" button in the header
        And an alert box with the text containing "Warning! This request cannot be reverted! Confirm the invoice amendment of the invoice:" appears
        And the user clicks the "Yes" opinion in the alert box
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Invoice Amendment processed"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 012. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system