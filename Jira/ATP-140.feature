###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-140
# - Description: Nota Complementar CTe com Resumo preenchido corretamente
# - Jira: X3DEV-3276
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 03/08/2023
# - Updated by : Gustavo Albanus
# - Updated date : 24/07/2024
# - Status : Done
# - Ajustes Efetuados: Ajustado a Chave da Nota / Criado o Scenario de Deletar o documento
###########################################################################

Feature: ATP-140

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. GESPIH
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "CTE" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key

    Scenario: 3. General data
        Given the user clicks the "General data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "995" to the selected text field and hits tab key
        And the user stores the generated value with length 5 with the key "ALEATORIO"
        When the user selects the text field with name: "NF-e number"
        And the user writes the stored text with key "ALEATORIO" in the selected text field
        When the user selects the text field with name: "Serial number"
        And the user writes "1" to the selected text field and hits tab key
        When the user selects the text field with name: "NF-e Access key"
        And the user writes "35170364555626000147550770000000441000000446" to the selected text field and hits tab key
        When the user selects the text field with name: "NF-e number"
        And the user stores the value of the selected text field with the key: "NUMBER"

    Scenario: 4. Management
        Given the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "NUMBER" in the selected text field

    Scenario: 5. Shipping data
        Given the user clicks the "Shipping data" tab selected by title
        When the user selects the text field with name: "Source state"
        And the user writes "SP" to the selected text field and hits tab key
        When the user selects the text field with name: "Municipality of Origin"
        And the user writes "São Paulo" to the selected text field and hits tab key
        And the user hits escape

    Scenario Outline: 6. Add Lines
        Given the user clicks the "Lines" tab selected by title
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
            | LIN | ITMREF   | QTYUOM | NETPRI    | XQCFOP |
            | 1   | "SER001" | "1"    | "1000.00" | "2101" |

    Scenario: 7. Creation
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        Given the user clicks the "Resume" tab selected by title
        Then the user selects the text field with X3 field name: "XQPIH2_TTSERVICO"
        And the value of the selected text field is "1,000.00"
        Then the user selects the text field with X3 field name: "XQPIH2_TTNFE"
        And the value of the selected text field is "1,000.00"
        And the user waits 5 seconds

    Scenario: 8. Delete Doc.
        Given the user clicks the "Delete" main action button on the right panel
        And the user clicks the "OK" button in the header
        Then the user clicks the "Ok" option in the alert box

    Scenario: 9. Logout
        Given the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system



