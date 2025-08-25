###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-180 - NFSe Exportação as propriedades devem estar “TomaUF” = EX e “TomacMun“ = 9999999
# - Jira: X3DEV-8174
# - Created by: Gustavo Albanus
# - Created date: 21/08/2025
# - Updated by:
# - Updated date:
# - Status: Done
# - Parametrizações:
###########################################################################

Feature: ATP-180

    Scenario: 001.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 002. Criar a Invoice
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
        And the user writes "NA012" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "201" to the selected text field
        And the user selects the text field with name: "Departure state"
        And the user writes "SP" to the selected text field
        And the user selects the text field with name: "Departure location"
        And the user writes "SP" to the selected text field
        And the user selects the text field with name: "Departure loc. description"
        And the user writes "SP" to the selected text field
        And the user selects the text field with name: "Sold-to"
        And the user writes "NA012" to the selected text field
        And the user selects the text field with name: "Tax rule"
        And the user writes "BRL" to the selected text field
        And the user selects the text field with X3 field name: "WK5ALL2_RAT2"
        And the user writes "1" to the selected text field
        And the user selects the text field with name: "Control"
        And the user writes "CLI" to the selected text field
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    Scenario: 003. Inserir Linha de Serviço
        Given the user selects editable table row number: 1
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text "SER001" in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text "1" in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text "600" in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQSTISS"
        And the user adds the text "1" in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQEXISS"
        Then the user adds the text "1" in selected cell and hits enter key
        And the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user waits 1 seconds

    Scenario: 004. Transmissão NFS-e
        Given the user clicks the "Transmit RPS" action button on the header drop down
        When a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Código: 100 - Autorizado."
        Then the user clicks the Close page action icon on the header panel
        And the user selects the text field with X3 field name: "WK5ALLXQ0_NUM"
        And the user stores the value of the selected text field with the key: "SIH_NUM"
        And the user waits 2 seconds
        And the user clicks the Close page action icon on the header panel

    Scenario: 005. Validação do RPS
        Given the user opens the "CONSXQRPS" function
        Given the user selects the radio buttons group with X3 field name: "XQRPSMT1_STATUSGRP"
        Then the radio button "Authorized/Rejected" of the selected radio buttons group is enabled
        And the user selects the text field with X3 field name: "XQRPSMT1_FCY"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQRPSMT1_NUM"
        And the user writes the stored text with key "SIH_NUM" in the selected text field and hits tab key
        Then the user clicks the "Search" button in the header
        Given the user selects the data table with x3 field name: "XQRPSMT1_ARRAY_NBLIG"
        When the user selects first row of the selected data table
        Then the user selects cell with header: "Selection" of selected row
        And the user clicks on the selected cell
        And the user opens "NFS-e Log" function on toolbox of the selected row
        And the user selects the data table of section: "NFS-e Log"
        And the user selects first row of the selected data table
        And the user opens "Request data" function on toolbox of the selected row
        And the user selects the text field with X3 field name: "XQRPSJSON_JSON"
        And the value of the selected text field contains ""TomaUF": "EX"
        And the value of the selected text field contains ""TomacMun": "9999999"
        And the user clicks the Close page action icon on the header panel
        #Fechando janela aberta antes do log.
        And the user clicks the Close page action icon on the header panel

    Scenario: 006. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system