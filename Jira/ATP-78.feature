###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-78
# - Description: Garantir emissão de NFS-e com desconto na linha do serviço
# - Legislation: BR addon
# - Created by : Ueder Budni
# - Created date : 22/06/2022
# - Updated by : Gustavo Albanus
# - Updated date : 28/06/2024
# - Changes: Invertido os tópicos 3 e 4, pois estava validando os impostos antes de criar o documento
###########################################################################

Feature: ATP-78

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Creation of the sales order
    #--------------------------------------------------------------------------------
    Scenario: 2. Create a Invoice

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
        And the user selects last editable cell with X3 field name: "WK5ALL4_DISCRGVAL1"
        And the user adds the text <DISCRGVAL1> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQSTISS"
        And the user adds the text <XQSTISS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQEXISS"
        Then the user adds the text <XQEXISS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCODINDOP"
        Then the user adds the text <XQCODINDOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTY | GROPRI    | XQSTISS | XQEXISS | DISCRGVAL1 | XQCODINDOP |
            | 1   | "SER017" | "1" | "2000.00" | "1"     | "1"     | "50.00"    | "100301"   |

    Scenario: 3. Create
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 4. Verificar Cálculo de Impostos com desconto aplicado
        Given the user clicks the "NF-e Summary" tab selected by title
        #PIS/COFINS sem desconto na base
        When the user selects the text field with name: "PIS value"
        And the value of the selected text field is "33.00"
        And the user selects the text field with name: "COFINS value"
        And the value of the selected text field is "152.00"
        #Demais impostos com desconto na base
        And the user selects the text field with name: "PIS RF value"
        And the value of the selected text field is "6.50"
        And the user selects the text field with name: "COFINS RF value"
        And the value of the selected text field is "30.00"
        And the user selects the text field with name: "CSLL value"
        And the value of the selected text field is "10.00"
        And the user selects the text field with name: "IRRF value"
        And the value of the selected text field is "150.00"
        And the user selects the text field with name: "IRPJ value"
        And the value of the selected text field is "100.00"
        And the user selects the text field with name: "INSS value"
        And the value of the selected text field is "50.00"
        And the user selects the text field with name: "ISS RF value"
        And the value of the selected text field is "29.00"
    # And the user clicks the "Create" main action button on the right panel
    # And a confirmation dialog appears with the message "Record has been created"

    Scenario: 5. Transmissão NFS-e
        Given the user clicks the "Transmit RPS" action button on the header drop down
        When a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "Código: 100 - Autorizado."
        Then the user clicks the Close page action icon on the header panel
        Given the user selects the text field with X3 field name: "WK5ALLXQ0_NUM"
        Then the user stores the value of the selected text field with the key: "SIH_NUM"
        #Saindo da SIH antes de chamar a CONSXQRPS
        And the user clicks the Close page action icon on the header panel

    Scenario: 6. Validação do RPS
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
        #And the user selects first row of the selected data table
        And the user selects editable table row number: 7
        And the user opens "Request data" function on toolbox of the selected row
        And the user selects the text field with X3 field name: "XQRPSJSON_JSON"
        And the value of the selected text field contains "ValDescIncond": "1000"
        And the user clicks the Close page action icon on the header panel
        #Fechando CONSXQRPS
        And the user clicks the Close page action icon on the header panel

    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system

