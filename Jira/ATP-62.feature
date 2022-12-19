###########################################################################
# Header
# -------------------------------------------------------------------------
# - Jira: ATP-62
# - Description: Garantir que XML de distribuição seja anexado junto ao documento de origem ao transmitir via XQCONSNFE - SIH
# - Legislation: BR addon
# - Created by : Ricardo Ribeiro
# - Created date : 22/06/2022
# - Updated by : Ricardo Ribeiro
# - Updated date : 22/06/2022
# - Status : Automated
###########################################################################

Feature: ATP-62

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2.Create a Sales Invoice

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
        #alert
        And the user writes "100" to the selected text field and hits tab key


    Scenario: 3.Process Id
        Given the user selects the fixed data table for x3 field name: "XQSIH0_ARRAY_NBREF"
        And the user selects last editable cell with X3 field name: "XQSIH0_IDENTPROC"
        And the user adds the text "1" in selected cell and hits tab key
    #Filling my industrialize

    Scenario: 4.Fill Management
        When the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Sold-to"
        And the user writes "br001" to the selected text field and hits tab key
        And the user selects the text field with name: "Pay-by"
        And the user writes "Br001" to the selected text field and hits tab key
        And the user selects the text field with name: "Group customer"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    #Filling Lines

    Scenario Outline: 5.Add Lines

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
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCENQ"
        Then the user adds the text <XQCENQ> in selected cell and hits enter key
        # And the user waits (3) seconds
        # And an alert box appears
        # And the user clicks the "Yes" opinion in the alert box

        Examples:
            | LIN | ITMREF   | QTY | GROPRI  | XQCFOP | XQVARCFOP | XQOICMS | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "2" | "29.69" | "6101" | ""        | "0"     | "10"      | "999"  |
            | 2   | "BMS002" | "3" | "19.65" | "6101" | ""        | "0"     | "10"      | "999"  |

    Scenario: 6.Create invoice
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user stores the value of the selected text field with the key: "FATURA"
        And the user clicks the "Close" main action button on the right panel

    Scenario: 7.NF-e monitoring Filter

        Given the user opens the "XQCONSNFE" function
        Then the user clicks the "NF-e monitoring" tab selected by title
        And the user selects the radio buttons group with X3 field name: "XQNFEMNT0_STATUSNFE"
        And the user clicks on "Pending" radio button of the selected radio buttons group
        And the user selects the text field with name: "Site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Document number"
        And the user writes the stored text with key "FATURA" in the selected text field and hits tab key
        And the user clicks the "Search" button in the header

    Scenario: 8.Monitoring
        Given the user selects the main data table of the page
        And the user selects first row of the selected data table
        And the user selects cell with X3 field name: "XQNFEMNT1_SELECAO" of selected row
        And the user clicks on the selected cell
        And the user clicks the "SEFAZ Communication" button in the header
        Then a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the radio buttons group with X3 field name: "XQNFEMNT0_STATUSNFE"
        And the user clicks on "Authorized/Rejected" radio button of the selected radio buttons group
        And the user clicks the "Search" button in the header
        And the user selects the main data table of the page
        And the user selects first row of the selected data table
        And the user selects cell with X3 field name: "XQNFEMNT1_STATUSPROC" of selected row
        And the value of the selected cell is "Authorized"
        And the user clicks the "Close page" main action button on the right panel


    Scenario: 9.Selecting Invoice
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRNFC" to the selected text field
        And the user selects the text field with name: "Invoice no."
        And the user writes the stored text with key "FATURA" in the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_XQNUMNFE"
        And the user stores the value of the selected text field with the key: "NFE_NUM"

    Scenario: 10.Invoice attachement
        Given the user clicks the "Attachments" main action button on the right panel
        And the user selects the fixed data table of section: "Attachments"
        And the user selects first row of the selected data table
        Then the user selects the fixed cell with X3 field name: "AOBJTXT_ORINAM" and row number: 1
        And the value of the selected cell has string pattern "*[NFE_NUM]*"
        And the user clicks the "Close" main action button on the right panel

    Scenario: 11.Logout
        And the user clicks the "Close" main action button on the right panel
        And the user logs-out from the system