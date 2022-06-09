###########################################################################
# - Test code: ATP-19
# - Description: Garantir ação de picking ao selecionar contratos de serviço
# - Legislation: BR addon
# - Created by : Diogo Nascimento
# - Created date : 06/06/2022
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################

Feature: ATP-19

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. Create GESCON
        Given the user opens the "GESCON" function
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Company"
        And the user writes "BR10" to the selected text field and hits tab key
        And the user selects the text field with name: "Site"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with name: "Customer"
        And the user writes "BR001" to the selected text field and hits tab key

        #General Tab
        When the user clicks the "General" tab selected by title
        And the user selects the text field with name: "Description"
        And the user writes "ATP-19" to the selected text field and hits tab key
        Given the user selects the drop down list with name: "Category"
        When the user clicks on option that matches exact with the text "Maintenance" of the selected drop down list
        Then the value of the selected drop down list is "Maintenance"

        #Management Tab
        When the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Duration"
        And the user writes "12" to the selected text field and hits tab key
        Given the user selects the drop down list with name: "Unit"
        When the user clicks on option that matches exact with the text "months" of the selected drop down list
        And the value of the selected drop down list is "months"
        And the user selects the text field with name: "Annual royalty base"
        And the user writes "2000" to the selected text field and hits tab key

        #Invoicing rules Tab
        When the user clicks the "Invoicing rules" tab selected by title
        And the user selects the text field with name: "Frequency"
        And the user writes "1" to the selected text field and hits tab key
        Given the user selects the drop down list with X3 field name: "CON8_INVFRYBAS"
        When the user clicks on option that matches exact with the text "months" of the selected drop down list
        Then the value of the selected drop down list is "months"

        #Invoice elements Tab
        When the user clicks the "Invoice elements" tab selected by title
        And the user selects the text field with name: "Invoicing product"
        And the user writes "SER019" to the selected text field and hits enter key
        Then a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "CON0_CONNUM"
        And the user stores the value of the selected text field with the key: "CON_NUM"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 3. Create a Invoice
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed

        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "200" to the selected text field and hits tab key

        #Picking the contract
        Given the user clicks the "Service contract selection" link on the left panel
        When the user selects the data table of left panel
        Then the user selects search cell with header: "Number"
        And the user adds the stored text with key "CON_NUM" in selected cell and hits enter key
        And the user selects cell that matches exact with the stored text with the key: "CON_NUM" and column header: "Number"
        And the user clicks on the selected cell
        And the user selects the data table with x3 field name: "WK5ALL4_ARRAY_NBLIG"

    Scenario Outline: Lines
        Given the user selects fixed table row number: (1)
        And the user selects cell with X3 field name: "WK5ALL4_XQSTISS" of selected row
        And the user adds the text <XQSTISS> in selected cell and hits enter key
        Examples:
            | XQSTISS |
            | "1"     |

    Scenario: 4. Transmissão / Validação
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "Transmit RPS" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Código: 100 - Autorizado."
        And the user clicks the "Close page" main action button on the right panel
        And the user clicks the "Post" button in the header
        And the user clicks the "Close page" main action button on the right panel
        Then the user clicks the Close page action icon on the header panel

    Scenario: 5. Logout
        And the user logs-out from the system
