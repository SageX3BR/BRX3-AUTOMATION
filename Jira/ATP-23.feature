###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:  ATP-23
# - Description: Garantir cadastro com mesmo CNPJ e IE para Terceiro
# - Created by : Diogo Nascimento
# - Created date : 20/05/2022
# - Updated by :
# - Updated date :
# - Status :
###########################################################################

Feature: ATP-23

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
        When the user selects the "param:endPointName1" entry on endpoint panel
        Then the "param:endPointName1" endpoint is selected

    Scenario: 2.BP
        #open customer function
        Given the user opens the "GESBPR" function
        #Set header information
        And the user selects the text field with name: "Category"
        And the user writes "BR" to the selected text field
        And the user hits tab
        And the user selects the data table in the popup
        And the user selects cell with text: "Customer" and column header: ""
        And the user clicks on the selected cell
        And the user selects the text field with name: "BP"
        And the user writes "ATP-23" to the selected text field

    #Set Addresses information

    Scenario: 3.Address code
        Given the user selects the fixed data table for x3 field name: "BPABPR_ARRAY_NBADR"
        And the user selects last editable cell with X3 field name: "BPABPR_CODADR"
        And the user adds the text "E01" in selected cell and hits enter key
        And the user selects the text field with X3 field name: "BPABPR_XBPADES"
        And the user writes "ATP-23 Address" to the selected text field
        And the user selects the text field with X3 field name: "BPABPR_XADDLIG1"
        And the user writes "Av ATP-23" to the selected text field
        And the user selects the text field with name: "Postal code"
        And the user writes "01001001" to the selected text field
        And the user selects the text field with X3 field name: "BPABPR_XXQBPACRN"
        And the user writes "64555626000147" to the selected text field
        And the user selects the text field with X3 field name: "BPABPR_XXQBPAIE"
        And the user writes "122612125111" to the selected text field
        And the user clicks the "Save" main action button on the right panel
    # CNPJ 64555626000147
    #IE 122612125111

    # CNPJ 96726716000140
    # IE 389383714806


    Scenario: 4. Logout scenario
        Then the user logs-out from the system