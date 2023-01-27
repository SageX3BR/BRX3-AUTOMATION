##########################################################################
#Header
#-------------------------------------------------------------------------
#- Test code: ATP-113
#- Description: Processo de MDFe - Cancelamento
#- Jira:
#- Legislation: BRA
#- Created by : Gustavo Albanus
#- Created date : 23/01/2023
#- Updated by :
#- Updated date :
#- Status : Done
##########################################################################

Feature: ATP-113

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. GESSIH
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key
        And the user hits escape

    Scenario Outline: 3. Add Lines
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI   |
            | 1   | "BMS001" | "1" | "100.00" |

    Scenario: 4. Document Creation and validation
        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        Then the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        Then the user clicks the Close page action icon on the header panel
        And the user selects the text field with name: "Invoice no."
        And the user stores the value of the selected text field with the key: "SIHNUM"
        And the user clicks the "Post" button in the header
        And the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel

    Scenario: 5. GESXQMDFE
        Given the user opens the "GESXQMDFE" function
        Then the "Manifesto Doc. Fiscais (MDF-e)" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Estab. Expedição"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "BIC code"
        And the user writes "400" to the selected text field and hits tab key
        And the user selects the text field with name: "UF Descarregamento"
        And the user writes "MT" to the selected text field and hits tab key

    Scenario: 6. General Data - Município de carregamento
        And the user selects the data table of section: "Município de carregamento"
        And the user selects cell with column header: "Código Municipio" and row number: 1
        When the user clicks the "Selection" action button of the selected cell
        Then the user selects the data table in the popup
        And the user selects search cell with header: "Municipality code"
        And the user adds the text "01001000" in selected cell and hits enter key
        And the user selects cell with column header: "Municipality code" and row number: 1
        And the user clicks on the selected cell
        And the user hits enter

    Scenario: 7. General Data - UF´s do Percurso
        And the user selects the data table of section: "UF´s do Percurso"
        And the user selects cell with column header: "EU" and row number: 1
        When the user clicks the "Selection" action button of the selected cell
        Then the user selects the data table in the popup
        And the user selects search cell with header: "Code"
        And the user adds the text "MS" in selected cell and hits enter key
        And the user selects cell with column header: "Code" and row number: 1
        And the user clicks on the selected cell
        And the user hits enter
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 8. Generation
        And the user clicks the "Generation" button in the header
        Then the "Consulta documentos para MDF-e" screen is displayed
        And the user selects the drop down list with name: "Term"
        And the user clicks on "Rodoviário" option of the selected drop down list
        And the user hits tab
        And the user selects the check box with name: "Veículo Vazio"
        And the user sets the check box to ticked
        And the user selects the text field with name: "Fatura Início"
        #And the user writes "NFCBR01122/00000068" to the selected text field and hits tab key
        And the user writes the stored text with key "SIHNUM" in the selected text field and hits tab key
        And the user selects the text field with name: "Fatura Fim"
        #And the user writes "NFCBR01122/00000068" to the selected text field and hits tab key
        And the user writes the stored text with key "SIHNUM" in the selected text field and hits tab key
        And the user clicks the "Search" button in the header
        And the user clicks the "OK" button in the header

    Scenario: 9. Rodoviário - Condutor
        Then the user clicks the "Rodoviário" action button on the header drop down
        Then the "Modal Rodoviário" screen is displayed
        And the user selects the text field with name: "Código de Agendamento no porto"
        And the user writes "231231" to the selected text field and hits tab key
        And the user selects the text field with name: "Placa do veículo de tração"
        And the user writes "ABC3333" to the selected text field and hits tab key
        And the user selects the data table of section: "Condutor"
        And the user selects cell with column header: "CPF" and row number: 1
        And the user selects first row of the selected data table
        And the user selects cell with header: "CPF" of selected row
        And the user adds the text "97728862006" in selected cell and hits enter key

    Scenario: 10. Rodoviário - Reboque
        And the user selects the data table of section: "Reboque"
        And the user selects cell with column header: "License plate" and row number: 1
        And the user selects first row of the selected data table
        And the user selects cell with header: "License plate" of selected row
        And the user adds the text "RRR2222" in selected cell and hits enter key

    Scenario: 11. Rodoviário - CIOT
        And the user selects the data table of section: "CIOT"
        And the user selects cell with column header: "Núm. CIOT" and row number: 1
        And the user selects first row of the selected data table
        And the user selects cell with header: "Núm. CIOT" of selected row
        And the user adds the text "232132442424" in selected cell and hits tab key
        And the user selects cell with header: "Código Terceiro" of selected row
        And the user adds the text "BR001" in selected cell and hits enter key

    Scenario: 12. Rodoviário - Contratantes
        And the user selects the data table of section: "Contratantes"
        And the user selects cell with column header: "First name" and row number: 1
        And the user selects first row of the selected data table
        And the user selects cell with header: "First name" of selected row
        And the user adds the text "TRANSCARGAS LTDA" in selected cell and hits tab key
        And the user selects cell with header: "CPF/CNPJ" of selected row
        And the user adds the text "14550864000191" in selected cell and hits enter key
        And the user clicks the "OK" button in the header
        Given the user clicks the "Save" main action button on the right panel

    Scenario: 13. Un. Transp/Pro Perig - Un. de Transporte
        When the user clicks the "Un. Transp/Pro Perig" tab selected by title
        And the user selects the data table of section: "Un. de Transporte"
        And the user selects first row of the selected data table
        And the user opens "Nova Un. Transp." function on toolbox of the selected row
        Then the "Cadastrar Un. de Doc" screen is displayed
        And the user selects the text field with name: "Identification"
        And the user writes "ABC3333" to the selected text field and hits tab key
        And the user selects the text field with name: "Qtde Rateada"
        And the user writes "1" to the selected text field and hits tab key
        And the user clicks the "OK" button in the header

    Scenario: 14. Un. Transp/Pro Perig - Lacres da Un. Trans
        And the user selects the data table of section: "Lacres da Un. Trans"
        And the user selects first row of the selected data table
        And the user opens "Novo Lacre Un. Transp." function on toolbox of the selected row
        Then the "Cadastrar Lacre Un. Transp" screen is displayed
        And the user selects the text field with name: "Lacre"
        And the user writes "ABC123" to the selected text field and hits tab key
        And the user clicks the "OK" button in the header

    Scenario: 15. Un. Transp/Pro Perig - Un. de Carga
        And the user selects the data table of section: "Un. de Carga"
        And the user selects first row of the selected data table
        And the user opens "Nova Un. Carga" function on toolbox of the selected row
        Then the "Cadastrar Un. Carga" screen is displayed
        And the user selects the drop down list with name: "Tipo Unid. Transp."
        And the user clicks on "Pallet" option of the selected drop down list
        And the user hits tab
        And the user selects the text field with name: "Identification"
        And the user writes "PALLET" to the selected text field and hits tab key
        And the user selects the text field with name: "Qtde Rateada"
        And the user writes "1" to the selected text field and hits tab key
        And the user clicks the "OK" button in the header

    Scenario: 16. Un. Transp/Pro Perig - Lacres da Un. Carga
        And the user selects the data table of section: "Lacres da Un. Carga"
        And the user selects first row of the selected data table
        And the user opens "Novo Lacre Un. Carga" function on toolbox of the selected row
        Then the "Cadastrar Lcre Un. Carga" screen is displayed
        And the user selects the text field with name: "Lacre"
        And the user writes "AABC1234" to the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        And the user waits 5 seconds
        And the user selects the text field with name: "UF Descarregamento"
        And the user writes "SP" to the selected text field and hits tab key
        And the user selects the text field with name: "UF Descarregamento"
        And the user writes "MT" to the selected text field and hits tab key

    Scenario: 17. Salvar e Transmitir
        Given the user clicks the "Save" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been modified"
        And the user waits 5 seconds
        And the user clicks the "Transmit SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Código: 100 - Autorizado o uso do MDF-e"
        Then the user clicks the "Close page" main action button on the right panel
        And the user waits 5 seconds

    Scenario: 18. Cancelar MDF-e
        And the user clicks the "Cancelar MDF-e" action button on the header drop down
        Then a log panel appears
        And the "MDF-e Mensagem Justificativa" screen is displayed
        And the user selects the text field with name: "Justificativa (MDF-e)"
        And the user writes "CANCELAMENTO POR MOTIVO DE TESTES " to the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Código: 135 - Evento registrado e vinculado ao MDF-e"
        Then the user clicks the "Close page" main action button on the right panel
        Given the user clicks the Close page action icon on the header panel

    Scenario: 19. Logout
        And the user logs-out from the system
