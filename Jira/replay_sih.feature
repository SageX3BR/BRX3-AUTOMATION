###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-27
# - Description: Garantir que seja possível gerenciar Ocorrência bancária de baixa
# - Jira: X3DEV-770
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 21/05/2022
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################
# PREREQUISITES
# -------------------------------------------------------------------------
# Parameterize a bank portfolio that uses Tecnospeed
#
# ###########################################################################

Feature: ATP-27

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"




    #--------------------------------------------------------------------------------
    #Creation of the sales order
    #--------------------------------------------------------------------------------

    Scenario: 02. GESSIH Header
        Given the user opens the "GESSIH" function
        Then the user waits 2 seconds
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        #Filling the Invoice header information
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user writes the stored text with key "  " in the selected text field and hits tab key
        When the user clicks the "Create" main action button on the right panel
        When the user clicks the "Yes" opinion in the alert box
        Then the user waits 2 seconds

    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system


