###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:001-nfse-CadastroChaves
# - Description: Cadastro de chaves fornecidas pela Migrate no Estabelecimento
# - Jira: NA
# - Created by : Jonatas Hille
# - Created date : 01/17/2022
# - Updated by : -
# - Updated date : -
# - Status : []Automated [x]Work In Progress []Broken
###########################################################################

Feature:001-nfse-CadastroChaves

    Scenario: 1.Login
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. Abrir Tela de Comunicação da NFS-e
        Given the user opens the "GESFCY" function
        When the "Sites" screen is displayed
        And the user selects the text field with name: "Site"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user clicks the "NFS-e communic. data" action button on the header drop down
        Then the "NFS-e communic. data" screen is displayed

    Scenario: 3. Cadastrar/Alterar Chave
        # Given the user selects the text field with X3 field name: "XQFCYCOM2_INCYKEYHOM"
        # And the user writes "g5Fy7XiLKb3ID5791L51Np3cHUFvqG0o" to the selected text field and hits tab key
        # And the user selects the text field with X3 field name: "XQFCYCOM2_INCYKEYPRD"
        # And the user writes "g5Fy7XiLKb3ID5791L51Np3cHUFvqG0o" to the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        Then the user clicks the "Save" main action button on the right panel

    Scenario: 5. Logout
        And the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system