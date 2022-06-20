###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-49
# - Description: Garantir que seja possível gerar remessa bancária parcial
# - Jira: X3DEV-770
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 27/05/2022
# - Updated by :
# - Updated date :
# - Status : Done
###########################################################################
# PREREQUISITES
# -------------------------------------------------------------------------
# Parameterize a bank portfolio that uses Tecnospeed
#
# ###########################################################################

Feature: ATP-49

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
        Given the user selects the fixed data table for x3 field name: "XQSIH0_ARRAY_NBREF"
        And the user selects last editable cell with X3 field name: "XQSIH0_IDENTPROC"
        And the user adds the text "1" in selected cell and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"
        And the user selects the text field with name: "Terms"
        And the user writes "30X" to the selected text field and hits tab key
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
        Given the user selects the main data table of the page
        When the user selects row that has the text "Doc. number :" in column with X3 field name: "LECFIC_LIGNE"
        Then the user selects cell with X3 field name: "LECFIC_LIGNE" of selected row
        And the value of the selected cell has string pattern "*NF-e: Authorized*"
        And the user clicks the Close page action icon on the header panel
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user stores the value of the selected text field with the key: "SIHNUM"
        Then the user clicks the "Post" button in the header
        Given the user selects the main data table of the page
        When the user selects row that has the text "X3 validation" in column with X3 field name: "LECFIC_LIGNE"
        Then the user selects cell with X3 field name: "LECFIC_LIGNE" of selected row
        And the value of the selected cell has string pattern "*X3 validation Invoice/Credit memo*"
        And the user selects the main log panel of the page
        And the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel

    Scenario: Generete CNAB Remmitence
        Given the user opens the "CONSXQR" function
        When the user selects the text field with name: "Site"
        And the user writes "BR011" to the selected text field and hits tab key
        When the user selects the text field with name: "Bank"
        And the user writes "BR999" to the selected text field and hits tab key
        When the user selects the text field with name: "Book"
        And the user writes "TS341" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice number"
        And the user writes the stored text with key "SIHNUM" in the selected text field and hits tab key
        Then the user clicks the "Search" button in the header
        Then the user waits 1 seconds
        Given the user selects the fixed cell with X3 field name: "XQREMESSA1_SELECAO" and row number: 1
        When the user ticks the checkbox contained in the selected cell
        And the user selects the fixed cell with X3 field name: "XQREMESSA1_SELECAO" and row number: 2
        And the user ticks the checkbox contained in the selected cell
        And the user selects the fixed cell with X3 field name: "XQREMESSA1_SELECAO" and row number: 3
        And the user ticks the checkbox contained in the selected cell
        Then the user clicks the "Process selection" action button on the header drop down
        Then the user waits 4 seconds

    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system


