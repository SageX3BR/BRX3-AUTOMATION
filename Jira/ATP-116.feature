##########################################################################
#Header
#-------------------------------------------------------------------------
#- Test code: ATP-116
#- Description: Processo de MDFe Encerramento com mais de um documento
#- Jira: X3DEV-1756
#- Legislation: BRA
#- Created by : Gustavo Albanus
#- Created date : 30/01/2023
#- Updated by : Gustavo Albanus
#- Updated date : 27/06/2024
#- Status : Ajustado a duplicação de documentos
##########################################################################

Feature: ATP-116

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

    Scenario: 5. Duplicar GESSIH
        And the user selects the text field with name: "Invoice no."
        And the user writes " " to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key
        Given the user clicks the "Create" main action button on the right panel
        Then an alert box with the text "Continue and confirm the duplication?" appears
        And the user clicks the "Yes" opinion in the alert box
        Then an alert box with the text "Duplicate attachments and comments?" appears
        And the user clicks the "Yes" opinion in the alert box
        And a confirmation dialog appears with the message "Record has been created"
        Then the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        Then the user clicks the Close page action icon on the header panel
        And the user selects the text field with name: "Invoice no."
        And the user stores the value of the selected text field with the key: "SIHNUM02"
        And the user clicks the "Post" button in the header
        And the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel

    Scenario: 6. GESXQMDFE
        Given the user opens the "GESXQMDFE" function
        Then the "Fiscal Doc. Manifest (MDF-e)" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal op."
        And the user writes "400" to the selected text field and hits tab key
        And the user selects the text field with name: "Unloading state"
        And the user writes "MT" to the selected text field and hits tab key

    Scenario: 6. General Data - Município de carregamento
        And the user selects the data table of section: "Loading city"
        And the user selects cell with column header: "IBGE City Code" and row number: 1
        When the user clicks the "Selection" action button of the selected cell
        Then the user selects the data table in the popup
        And the user selects search cell with header: "Municipality code"
        And the user adds the text "01001000" in selected cell and hits enter key
        And the user selects cell with column header: "City" and row number: 1
        And the user clicks on the selected cell
        And the user hits enter

    Scenario: 7. General Data - UF´s do Percurso
        And the user selects the data table of section: "States in route"
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

    Scenario: 9. Generation
        And the user clicks the "Generation" button in the header
        Then the "Search documents for MDF-e" screen is displayed
        And the user selects the drop down list with name: "Term"
        And the user clicks on "Road" option of the selected drop down list
        And the user hits tab
        And the user selects the check box with name: "Empty vehicle"
        And the user sets the check box to ticked
        And the user selects the text field with name: "Start invoice"
        #And the user writes "NFCBR01122/00000068" to the selected text field and hits tab key
        And the user writes the stored text with key "SIHNUM" in the selected text field and hits tab key
        And the user selects the text field with name: "End invoice"
        #And the user writes "NFCBR01122/00000068" to the selected text field and hits tab key
        And the user writes the stored text with key "SIHNUM02" in the selected text field and hits tab key
        And the user clicks the "Search" button in the header
        And the user clicks the "OK" button in the header

    Scenario: 9. Rodoviário - Condutor
        Then the user clicks the "Road transportation" action button on the header drop down
        Then the "Road modal" screen is displayed
        And the user selects the text field with name: "Port Scheduling Code"
        And the user writes "231231" to the selected text field and hits tab key
        And the user selects the text field with name: "Truck's plate"
        And the user writes "ABC33313" to the selected text field and hits tab key
        And the user selects the data table of section: "Driver"
        And the user selects cell with column header: "CPF" and row number: 1
        And the user selects first row of the selected data table
        And the user selects cell with header: "CPF" of selected row
        And the user adds the text "97728862006" in selected cell and hits enter key

    Scenario: 10. Rodoviário - Reboque
        And the user selects the data table of section: "Trailer"
        And the user selects cell with column header: "License plate" and row number: 1
        And the user selects first row of the selected data table
        And the user selects cell with header: "License plate" of selected row
        And the user adds the text "RRR2222" in selected cell and hits enter key

    Scenario: 12. Rodoviário - CIOT
        And the user selects the data table of section: "CIOT"
        And the user selects cell with column header: "CIOT number" and row number: 1
        And the user selects first row of the selected data table
        And the user selects cell with header: "CIOT number" of selected row
        And the user adds the text "232132442424" in selected cell and hits tab key
        And the user selects cell with header: "Business Partner Code" of selected row
        And the user adds the text "BR001" in selected cell and hits enter key

    Scenario: 13. Rodoviário - Contratantes
        And the user selects the data table of section: "Contractors"
        And the user selects cell with column header: "First name" and row number: 1
        And the user selects first row of the selected data table
        And the user selects cell with header: "First name" of selected row
        And the user adds the text "TRANSCARGAS LTDA" in selected cell and hits tab key
        And the user selects cell with header: "CPF/CNPJ" of selected row
        And the user adds the text "14550864000191" in selected cell and hits enter key
        And the user clicks the "OK" button in the header
        Given the user clicks the "Save" main action button on the right panel

    Scenario: 14. Select First Document
        And the user clicks the "Documents" tab selected by title
        When the user selects the data table of section: "Documents"
        And the user selects cell with column header: "NF-e number" and row number: 1
        And the user clicks on the selected cell

    Scenario: 15. Un. Transp/Pro Perig - Un. de Transporte
        When the user clicks the "Tran. Un/Dang. Prod" tab selected by title
        And the user selects the data table of section: "Tranportation unit"
        And the user selects first row of the selected data table
        And the user opens "New Transp. Un." function on toolbox of the selected row
        Then the "Register Doc. Un." screen is displayed
        And the user selects the text field with name: "Identification"
        And the user writes "ABC33313" to the selected text field and hits tab key
        And the user selects the text field with name: "Apportioned Quantity"
        And the user writes "1" to the selected text field and hits tab key
        And the user clicks the "OK" button in the header

    Scenario: 16. Un. Transp/Pro Perig - Lacres da Un. Trans
        And the user selects the data table of section: "Tranportation unit seals"
        And the user selects first row of the selected data table
        And the user opens "New Transp. Un. Seal" function on toolbox of the selected row
        Then the "Register Transp. Un. Seal" screen is displayed
        And the user selects the text field with name: "Seal"
        And the user writes "ABC123" to the selected text field and hits tab key
        And the user clicks the "OK" button in the header

    Scenario: 17. Un. Transp/Pro Perig - Un. de Carga
        And the user selects the data table of section: "Cargo unit"
        And the user selects first row of the selected data table
        And the user opens "New Cargo Un." function on toolbox of the selected row
        Then the "Register Cargo Un." screen is displayed
        And the user selects the drop down list with name: "Transport Unit Type"
        And the user clicks on "Pallet" option of the selected drop down list
        And the user hits tab
        And the user selects the text field with name: "Identification"
        And the user writes "PALLET" to the selected text field and hits tab key
        And the user selects the text field with name: "Apportioned Quantity"
        And the user writes "1" to the selected text field and hits tab key
        And the user clicks the "OK" button in the header

    Scenario: 18. Un. Transp/Pro Perig - Lacres da Un. Carga
        And the user selects the data table of section: "Cargo unit seals"
        And the user selects first row of the selected data table
        And the user opens "New Cargo Un. Seal" function on toolbox of the selected row
        Then the "Register Cargo Un. Seal" screen is displayed
        And the user selects the text field with name: "Seal"
        And the user writes "AABC1234" to the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        And the user waits 5 seconds

    Scenario: 19. Select Second Document
        And the user clicks the "Documents" tab selected by title
        When the user selects the data table of section: "Documents"
        And the user selects cell with column header: "NF-e number" and row number: 2
        And the user clicks on the selected cell


    Scenario: 20. Un. Transp/Pro Perig - Un. de Transporte
        When the user clicks the "Tran. Un/Dang. Prod" tab selected by title
        And the user selects the data table of section: "Tranportation unit"
        And the user selects first row of the selected data table
        And the user opens "New Transp. Un." function on toolbox of the selected row
        Then the "Register Doc. Un." screen is displayed
        And the user selects the text field with name: "Identification"
        And the user writes "ABC33313" to the selected text field and hits tab key
        And the user selects the text field with name: "Apportioned Quantity"
        And the user writes "1" to the selected text field and hits tab key
        And the user clicks the "OK" button in the header

    Scenario: 21. Un. Transp/Pro Perig - Lacres da Un. Trans
        And the user selects the data table of section: "Tranportation unit seals"
        And the user selects first row of the selected data table
        And the user opens "New Transp. Un. Seal" function on toolbox of the selected row
        Then the "Register Transp. Un. Seal" screen is displayed
        And the user selects the text field with name: "Seal"
        And the user writes "CBA123" to the selected text field and hits tab key
        And the user clicks the "OK" button in the header

    Scenario: 22. Un. Transp/Pro Perig - Un. de Carga
        And the user selects the data table of section: "Cargo unit"
        And the user selects first row of the selected data table
        And the user opens "New Cargo Un." function on toolbox of the selected row
        Then the "Register Cargo Un." screen is displayed
        And the user selects the drop down list with name: "Transport Unit Type"
        And the user clicks on "Pallet" option of the selected drop down list
        And the user hits tab
        And the user selects the text field with name: "Identification"
        And the user writes "PALLET1" to the selected text field and hits tab key
        And the user selects the text field with name: "Apportioned Quantity"
        And the user writes "1" to the selected text field and hits tab key
        And the user clicks the "OK" button in the header

    Scenario: 23. Un. Transp/Pro Perig - Lacres da Un. Carga
        And the user selects the data table of section: "Cargo unit seals"
        And the user selects first row of the selected data table
        And the user opens "New Cargo Un. Seal" function on toolbox of the selected row
        Then the "Register Cargo Un. Seal" screen is displayed
        And the user selects the text field with name: "Seal"
        And the user writes "CBAA1234" to the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        And the user waits 5 seconds
        And the user selects the text field with name: "Unloading state"
        And the user writes "SP" to the selected text field and hits tab key
        And the user selects the text field with name: "Unloading state"
        And the user writes "MT" to the selected text field and hits tab key

    Scenario: 24. Salvar e Transmitir
        Given the user clicks the "Save" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been modified"
        And the user waits 5 seconds
        And the user clicks the "Transmit SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Código: 100 - Autorizado o uso do MDF-e"
        Then the user clicks the "Close page" main action button on the right panel
        And the user waits 5 seconds

    Scenario: 25. Encerrar MDF-e
        And the user clicks the "Close MDF-e" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Código: 135 - Evento registrado e vinculado ao MDF-e"
        Then the user clicks the "Close page" main action button on the right panel
        Given the user clicks the Close page action icon on the header panel

    Scenario: 26. Logout
        And the user logs-out from the system
