###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-10 - Sugestão do municipio de prestação do serviço
# - Description: Transmissão RPS
# - Jira:
# - Created by : Diogo Nascimento
# - Created date : 13/05/2022
# - Updated by : -
# - Updated date : -
# - Status : []Automated [x]Work In Progress []Broken
###########################################################################

Feature: ATP-10

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. Criar a Invoice
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
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
        Then the user adds the text "1" in selected cell and hits enter key
        And the user clicks the "Create" main action button on the right panel
        # Validação da Sugestão
        And the user clicks the "Legal data" action button on the header drop down
        Then the user selects the text field with X3 field name: "XQLDATANFSE_MUNPRESTDES"
        And the value of the selected text field is "São Paulo"
        And the user clicks the Close page action icon on the header panel
        Then the user clicks the "Cancel" main action button on the right panel

    Scenario: 4. Transmissão NFS-e
        Given the user clicks the "Transmit RPS" action button on the header drop down
        When a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Código: 100 - Autorizado."
        Then the user clicks the Close page action icon on the header panel
        And the user clicks the "Post" button in the header
        Then the user clicks the Close page action icon on the header panel

    Scenario: 5. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system

