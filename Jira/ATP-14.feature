###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-14
# - Description: NFS-e de Repasse - Emissão e transmissão pela SIH
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 06/05/2022
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################
# PREREQUISITES
# -------------------------------------------------------------------------
#
# Set a RTAX with zero taxes for all taxes - 702
# Set a OPF specific for transfer invoice with checkbox - 202
#
# ###########################################################################

Feature: ATP-14

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
        And the user writes "202" to the selected text field
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
            | 1   | "SER018" | "1" | "4000.00" | "1"     | "3"     |

    Scenario: 3. Verificar Cálculo de Iss
        Given the user clicks the "Create" main action button on the right panel
        When the user clicks the "NF-e Summary" tab selected by title
        Then the user selects the text field with X3 field name: "XQSIH1_VALPISRF"
        And the value of the selected text field is ""
        And the user selects the text field with X3 field name: "XQSIH1_VALCOFRF"
        And the value of the selected text field is ""
        And the user selects the text field with X3 field name: "XQSIH1_VALCSLLRF"
        And the value of the selected text field is ""
        And the user selects the text field with X3 field name: "XQSIH1_VALIRRF"
        And the value of the selected text field is ""
        And the user selects the text field with X3 field name: "XQSIH1_VALIRPJ"
        And the value of the selected text field is ""
        And the user selects the text field with X3 field name: "XQSIH1_VALINSS"
        And the value of the selected text field is ""
        And the user selects the text field with X3 field name: "XQSIH1_VALISS"
        And the value of the selected text field is ""

    Scenario: 4. Transmissão NFS-e Migrate
        Given the user clicks the "Transmit RPS" action button on the header drop down
        When a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Pending return      : 000"
        Then the user clicks the Close page action icon on the header panel


    Scenario: 5. Create a Invoice

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
        And the user writes "202" to the selected text field
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
            | 1   | "SER018" | "1" | "5000.00" | "1"     | "3"     |

    Scenario: 3. Verificar Cálculo de Iss
        Given the user clicks the "Create" main action button on the right panel
        When the user clicks the "NF-e Summary" tab selected by title
        Then the user selects the text field with X3 field name: "XQSIH1_VALPISRF"
        And the value of the selected text field is ""
        And the user selects the text field with X3 field name: "XQSIH1_VALCOFRF"
        And the value of the selected text field is ""
        And the user selects the text field with X3 field name: "XQSIH1_VALCSLLRF"
        And the value of the selected text field is ""
        And the user selects the text field with X3 field name: "XQSIH1_VALIRRF"
        And the value of the selected text field is ""
        And the user selects the text field with X3 field name: "XQSIH1_VALIRPJ"
        And the value of the selected text field is ""
        And the user selects the text field with X3 field name: "XQSIH1_VALINSS"
        And the value of the selected text field is ""
        And the user selects the text field with X3 field name: "XQSIH1_VALISS"
        And the value of the selected text field is ""
        Given the user selects the text field with X3 field name: "SIH0_NUM"
        Then the user stores the value of the selected text field with the key: "SIH_NUM"

    Scenario: Transmissão via Monitoramento
        Given the user opens the "CONSXQRPS" function
        Given the user selects the radio buttons group with X3 field name: "XQRPSMT1_STATUSGRP"
        Then the radio button "Authorized/Rejected" of the selected radio buttons group is enabled
        When the user clicks on "Pending" radio button of the selected radio buttons group
        Then the radio button "Pending" of the selected radio buttons group is selected
        And the user selects the text field with X3 field name: "XQRPSMT1_FCY"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQRPSMT1_NUM"
        And the user writes the stored text with key "SIH_NUM" in the selected text field and hits tab key
        Then the user clicks the "Search" button in the header
        Given the user selects the data table with x3 field name: "XQRPSMT1_ARRAY_NBLIG"
        When the user selects first row of the selected data table
        Then the user selects cell with header: "Selection" of selected row
        And the user clicks on the selected cell
        And the user clicks the "Communication" button in the header

    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system

