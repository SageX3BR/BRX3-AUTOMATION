###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:002-nfse-EnvioNFSe
# - Description: Cadastro de chaves fornecidas pela Migrate no Estabelecimento
# - Jira: NA
# - Created by : Jonatas Hille
# - Created date : 01/17/2022
# - Updated by : -
# - Updated date : -
# - Status : []Automated [x]Work In Progress []Broken
###########################################################################

Feature: 002-nfse-EnvioNFSe

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

    Scenario Outline: Inserir Linha de Serviço
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQSTISS"
        And the user adds the text <XQSTISS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQEXISS"
        Then the user adds the text <XQEXISS> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI    | XQSTISS | XQEXISS |
            | 1   | "SER001" | "1" | "4368.59" | "1"     | "1"     |

    Scenario: 3. Verificar Cálculo de Iss
        Given the user clicks the "Create" main action button on the right panel
        When the user clicks the "NF-e Summary" tab selected by title
        Then the user selects the text field with X3 field name: "XQSIH1_VALPISRF"
        And the value of the selected text field is "294.88"
        And the user selects the text field with X3 field name: "XQSIH1_VALCOFRF"
        And the value of the selected text field is "349.49"
        And the user selects the text field with X3 field name: "XQSIH1_VALCSLLRF"
        And the value of the selected text field is "436.86"
        And the user selects the text field with X3 field name: "XQSIH1_VALIRRF"
        And the value of the selected text field is "100.48"
        And the user selects the text field with X3 field name: "XQSIH1_VALIRPJ"
        And the value of the selected text field is "72.08"
        And the user selects the text field with X3 field name: "XQSIH1_VALINSS"
        And the value of the selected text field is "377.88"
        And the user selects the text field with X3 field name: "XQSIH1_VALISS"
        And the value of the selected text field is "218.43"

    Scenario: 4. Transmissão NFS-e Migrate
        Given the user clicks the "Transmit RPS" action button on the header drop down
        When a log panel appears
        And the user selects the main log panel of the page
        ##Teste Webhook tarefa ATP-3
        # And the selected log panel includes the message "    Number of NF-e Rejected            : 000"
        And the selected log panel includes the message "    Number of NF-e Pending return      : 000"
        Then the user clicks the Close page action icon on the header panel

    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system

