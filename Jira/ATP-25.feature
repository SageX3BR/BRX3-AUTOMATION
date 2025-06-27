###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-25
# - Description: Estorno contabilistco para NF-e denegada
# - Jira: X3-210391
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 06/05/2022
# - Updated by : Gustavo Albanus
# - Updated date : 30/10/2024
# - Changes: Ajustado o campo de "STD1_ZONE3_14" para "STD1_ZONE3_15"
###########################################################################
# PREREQUISITES
# -------------------------------------------------------------------------
#
#
# ###########################################################################

Feature: ATP-25

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
        #Filling the Invoice header information
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key


    Scenario: Process Id
        Given the user selects the fixed data table for x3 field name: "XQWK5ALLXQ0_ARRAY_NBREF"
        And the user selects last editable cell with X3 field name: "XQWK5ALLXQ0_IDENTPROC"
        And the user adds the text "1" in selected cell and hits tab key
    #Filling my industrialize

    Scenario: Fill Management
        When the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Sold-to"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Pay-by"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Group customer"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"
    #Filling Lines

    Scenario Outline: Add Lines

        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user hits enter key in the selected cell

        Examples:
            | LIN | ITMREF   | QTY  | GROPRI  | XQCFOP | XQVARCFOP | XQOICMS | XQCSTICMS |
            | 1   | "BMS001" | "10" | "15.50" | "6101" | ""        | "0"     | "00"      |

    Scenario: Create document

        When the user clicks the "Create" main action button on the right panel
        Then the user clicks the "SEFAZ" action button on the header drop down
        Then a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "WK5ALLXQ0_XQSTATUSNFE"
        And the value of the selected text field is "Authorized invoice"
        And the user selects the text field with X3 field name: "WK5ALLXQ0_NUM"
        And the user stores the value of the selected text field with the key: "SIHNUM"
        And the user clicks the Close page action icon on the header panel


    Scenario: Alterar status da nota para denegado
        Given the user opens the "GMAINT" function
        When the user selects the text field with X3 field name: "GSTD_FICH"
        And the user writes "XQINVOICE" to the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        And the user selects the text field with X3 field name: "STD0_CLE1_1"
        And the user writes the stored text with key "SIHNUM" in the selected text field and hits tab key
        And the user selects the text field with X3 field name: "STD1_ZONE3_16"
        And the user writes "17" to the selected text field and hits tab key
        And the user clicks the "Save" main action button on the right panel
        And the user clicks the "Table" button in the header
        When the user selects the text field with X3 field name: "GSTD_FICH"
        And the user writes "XQNFELOGH" to the selected text field and hits tab key
        And the user clicks the "OK" button in the header
        And the user selects the text field with X3 field name: "STD0_CLE1_1"
        And the user writes the stored text with key "SIHNUM" in the selected text field and hits tab key
        And the user selects the text field with X3 field name: "STD1_ZONE1_8"
        And the user writes "4" to the selected text field and hits enter key
        And the user clicks the Close page action icon on the header panel
    # And the user clicks the "Save" main action button on the right panel

    Scenario: Post document
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WK5ALLXQ0_NUM"
        And the user writes the stored text with key "SIHNUM" in the selected text field and hits tab key
        And the user clicks the "Post" button in the header
        Then a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "X3 validation Invoice/Credit"
        Then the user clicks the Close page action icon on the header panel
        #tempo para esperar o job da contabilização
        When the user waits 115 seconds
        Given the user selects the text field with X3 field name: "WK5ALLXQ0_XQSTATUSNFE"
        #And the value of the selected text field is "Denegated Invoice"
        And the value of the selected text field is "Nota Denegada"
        And the user waits 2 seconds
        When the user clicks the "Accounting reversal" action button on the header drop down
        And an alert box with the text "Document successfully reversed." appears
        And the user clicks the "Ok" option in the alert box

    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system


