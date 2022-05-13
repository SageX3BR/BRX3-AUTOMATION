###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: Sugestão do municipio de prestação do serviço
# - Description: picking de encomenda de venda para verificar a sugestão
# - Jira: ATP-9
# - Legislation: BR addon
# - Created by : Diogo Nascimento
# - Created date : 12/05/2022
# - Updated by :
# - Updated date :
# - Status : in progress
###########################################################################
#PREREQUISITES
###########################################################################


Feature: ATP-9

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------

    Scenario: 1.Login scenario

        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
    #--------------------------------------------------------------------------------
    #Creation of the sales order
    #--------------------------------------------------------------------------------

    Scenario: 2. Create a Sales order
        Given the user opens the "GESSOH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR020" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRSOI" to the selected text field and hits tab key
        And the user selects the text field with name: "Sold-to"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "200" to the selected text field and hits tab key
        # Validação da Sugestão
        Then the user selects the text field with X3 field name: "XQSOH0_MUNPRESTDES"
        And the value of the selected text field is "São Paulo"

        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    Scenario Outline: Add Lines

        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK2ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQSTISS"
        And the user adds the text <XQSTISS> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQEXISS"
        Then the user adds the text <XQEXISS> in selected cell and hits enter key
        Examples:
            | LIN | ITMREF   | QTY | GROPRI    | XQSTISS | XQEXISS |
            | 1   | "SER001" | "1" | "1000.00" | "1"     | "1"     |

    Scenario: 3. Create document

        Given the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        Then the user clicks the "Invoice" action button on the header drop down

    #--------------------------------------------------------------------------------
    #Creation of the sales invoice FOR BUTTON
    #--------------------------------------------------------------------------------
    Scenario: 4. Create a Invoice

        Given the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed

        # Validação da Sugestão
        Then the user clicks the "Legal data" action button on the header drop down
        Then the user selects the text field with X3 field name: "XQLDATANFSE_MUNPRESTDES"
        And the value of the selected text field is "São Paulo"
        And the user clicks the Close page action icon on the header panel

        Then the user clicks the "Cancel" main action button on the right panel
        And the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel

    Scenario: Logout
        And the user logs-out from the system

