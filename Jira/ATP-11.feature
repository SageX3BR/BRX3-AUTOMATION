###########################################################################
# - Test code: ATP-11 - SIH - EnvioNFSe
# - Description: PIS / COFINS cumulativo e não cumulativo
# - Jira: ATP-11
# - Created by : Diogo Nascimento
# - Created date : 02/05/2022
# - Updated by : Gustavo Albanus
# - Updated date : 17/07/2024
###########################################################################

Feature: ATP-11

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. Criar a Invoice
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        #Cabeçalho
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "200" to the selected text field
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    Scenario: 3. Inserir Linha de Serviço
        Given the user selects editable table row number: 1
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text "SER017" in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text "1" in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text "200" in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQSTISS"
        And the user adds the text "1" in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQEXISS"
        Then the user adds the text "1" in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCODINDOP"
        Then the user adds the text "100301" in selected cell and hits enter key

    Scenario: 4. Validar impostos na memoria de calculo
        Given the user clicks the "Calc. memory On/Off" action button on the header drop down
        Then an alert box appears
        And the user clicks the "Ok" opinion in the alert box
        And the user clicks the "Create" main action button on the right panel
        And the user selects the main log panel of the page
        Then the user clicks the Close page action icon on the header panel

    Scenario: 5. Validar resumo de impostos
        When the user clicks the "NF-e Summary" tab selected by title
        Then the user selects the text field with name: "PIS value"
        And the value of the selected text field is "3.30"
        And the user selects the text field with name: "COFINS value"
        And the value of the selected text field is "15.20"
        And the user selects the text field with name: "PIS RF value"
        And the value of the selected text field is "1.30"
        And the user selects the text field with name: "COFINS RF value"
        And the value of the selected text field is "6.00"

    Scenario: 6. Transmissão NFS-e
        Given the user clicks the "Transmit RPS" action button on the header drop down
        When a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Código: 100 - Autorizado."
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the "Post" button in the header
        Then the user clicks the Close page action icon on the header panel

    Scenario: 7. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system