###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-flow-gessih-discount-IPI
# - Description: Delivery with discount in the Line and Invoicing Elements
# - Jira: X3-203943
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 10/07/2020
# - Updated by : Carla Cury
# - Updated date : 29/01/2021
# - Status : in progress
###########################################################################

# ###########################################################################

Feature: xq-s-flow-gessih-discount-IPI

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"


    #--------------------------------------------------------------------------------
    #Creation of the sales invoice
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
        # And the user selects the text field with name: "Type"
        # And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR002" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key


    Scenario: Process Id
        Given the user selects the fixed data table for x3 field name: "XQSIH0_ARRAY_NBREF"
        And the user selects last editable cell with X3 field name: "XQSIH0_IDENTPROC"
        And the user adds the text "1" in selected cell and hits tab key
    #Filling my industrialize

    Scenario: Fill Management
        # When the user clicks the "Management" tab selected by title
        # And the user selects the text field with name: "Sold-to"
        # And the user writes "br003" to the selected text field and hits tab key
        # And the user selects the text field with name: "Pay-by"
        # And the user writes "Br003" to the selected text field and hits tab key
        # And the user selects the text field with name: "Group customer"
        # And the user writes "BR003" to the selected text field and hits tab key
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
        And the user selects last editable cell with X3 field name: "WK5ALL4_DISCRGVAL1"
        And the user adds the text <DISCRGVAL1> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_DISCRGVAL2"
        And the user adds the text <DISCRGVAL2> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user hits enter

        # #And the user waits (3) seconds
        # And an alert box appears
        # And the user clicks the "Yes" opinion in the alert box

        Examples:
            | LIN | ITMREF   | QTY | GROPRI | XQCFOP | XQVARCFOP | DISCRGVAL1 | DISCRGVAL2 | XQOICMS |
            | 1   | "BMS001" | "1" | "100"  | "6101" | "6"       | "2"        | ""         | "0"     |
            | 2   | "BMS001" | "1" | "100"  | "6101" | "6"       | ""         | "2"        | "0"     |

    Scenario: Create document

        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
    #When a confirmation dialog appears with the message "Record has been created"



    Scenario: Invoice Elements

        Given the user clicks the "Invoicing" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5ALL2_ARRAY_NBFAC"
        And the user selects the fixed cell with X3 field name: "WK5ALL2_INVDTAAMT" and row number: (2)
        And the user adds the text "1" in selected cell and hits enter key
    # And the user selects the fixed cell with X3 field name: "WK5ALL2_INVDTAAMT" and row number: (9)
    # And the user adds the text "0.5" in selected cell and hits enter key

    Scenario: Create document

        And the user clicks the "Save" main action button on the right panel
        #Then a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"




    Scenario Outline: Tax Detail - Check Calculated Values
        Given the user selects row that has the text <ITMREF> in column with X3 field name: "WK5ALL4_ITMREF"
        And the user selects cell with X3 field name: "WK5ALL4_XQDETIMPOSTO" of selected row
        When the user clicks on the icon contained in the selected cell
        Then the "Tax determination" screen is displayed
        #Check Values
        And the user selects the text field with X3 field name: "XQDTIMP1_IPIBCALC"
        And the value of the selected text field is <IPIBCALC>
        Then the user clicks the Close page action icon on the header panel

        Examples:
            | ITMREF   | IPIBCALC |
            | "BMS001" | "97.02"  |
            | "BMS001" | "97.02"  |


    Scenario: Check Calculated Values

        Given the user clicks the "NF-e Summary" tab selected by title
        And the user selects the text field with X3 field name: "XQSIH1_TOTBASEIPI"
        And the value of the selected text field is "194.04"



    #Send to Sefaz and verify if authorized
    Scenario: SEFAZ
        Given the user clicks the "Save" main action button on the right panel
        Then the user clicks the "SEFAZ" action button on the header drop down
        # ##And the user waits 10 seconds
        Then a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Authorized          : 001"
        And the user clicks the Close page action icon on the header panel
    # And the user clicks the "Post" main action button on the right panel
    # And the selected log panel includes the message "X3 validation Invoice/Credit"
    # And the user clicks the Close page action icon on the header panel

    # Scenario: 3. Create a Invoice

    #     Given the user opens the "GESSIH" function
    #     And the user selects the data table in the popup
    #     And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
    #     And the user clicks on the selected cell
    #     Then the "Sales invoice ALL : Full entry invoice" screen is displayed
    #     #Filling the Invoice header information
    #     When the user clicks the "New" main action button on the right panel
    #     And the user selects the text field with name: "Sales site"
    #     And the user writes "BR011" to the selected text field and hits tab key
    #     # And the user selects the text field with name: "Type"
    #     # And the user writes "BRNFC" to the selected text field and hits tab key
    #     And the user selects the text field with name: "Bill-to customer"
    #     And the user writes "PT006" to the selected text field and hits tab key
    #     And the user selects the text field with name: "Fiscal operation"
    #     And the user writes "102" to the selected text field and hits tab key
    #     And the user clicks the "General Data" tab selected by title
    #     And the user selects the text field with X3 field name: "XQSIH0_UFEMBARQUE"
    #     And the user writes "PR" to the selected text field and hits tab key
    #     And the user selects the text field with X3 field name: "XQSIH0_LOCEMBARQUE"
    #     And the user writes "Paranaguá" to the selected text field and hits tab key
    #     And the user selects the text field with X3 field name: "XQSIH0_LOCEMBARQUE"
    #     And the user writes "Port" to the selected text field and hits tab key
    #     And the user clicks the "Invoicing" tab selected by title
    #     And the user selects the text field with X3 field name: "WK5ALL4_CUR"
    #     And the user writes "BRL" to the selected text field and hits tab key


    # Scenario: Process Id
    #     Given the user selects the fixed data table for x3 field name: "XQSIH0_ARRAY_NBREF"
    #     And the user selects last editable cell with X3 field name: "XQSIH0_IDENTPROC"
    #     And the user adds the text "1" in selected cell and hits tab key
    # #Filling my industrialize

    # Scenario: Fill Management
    #     # When the user clicks the "Management" tab selected by title
    #     # And the user selects the text field with name: "Sold-to"
    #     # And the user writes "br003" to the selected text field and hits tab key
    #     # And the user selects the text field with name: "Pay-by"
    #     # And the user writes "Br003" to the selected text field and hits tab key
    #     # And the user selects the text field with name: "Group customer"
    #     # And the user writes "BR003" to the selected text field and hits tab key
    #     And the user clicks the "Lines" tab selected by title
    #     Then the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"
    # #Filling Lines

    # Scenario Outline: Add Lines

    #     Given the user selects editable table row number: <LIN>
    #     And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
    #     And the user adds the text <ITMREF> in selected cell
    #     And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
    #     And the user adds the text <QTY> in selected cell
    #     And the user selects last editable cell with X3 field name: "WK5ALL4_XQCFOP"
    #     And the user adds the text <XQCFOP> in selected cell
    #     And the user selects last editable cell with X3 field name: "WK5ALL4_XQOICMS"
    #     And the user adds the text <XQOICMS> in selected cell
    #     # #And the user waits (3) seconds
    #     # And an alert box appears
    #     # And the user clicks the "Yes" opinion in the alert box

    #     Examples:
    #         | LIN | ITMREF   | QTY | XQCFOP | XQOICMS |
    #         | 1   | "BMS001" | "1" | "7101" | "41"    |
    #         | 2   | "BMS002" | "2" | "7101" | "41"    |

    # Scenario: Create document

    #     And the user clicks the "Create" main action button on the right panel
    #     Then a confirmation dialog appears with the message "Record has been created"


    #     Given the user clicks the "Save" main action button on the right panel
    #     #When a confirmation dialog appears with the message "Record has been created"
    #     And the user selects the text field with X3 field name: "SIH0_NUM"
    #     And the user stores the value of the selected text field with the key: "SIHDocumentNo"
    #     #Send to Sefaz and verify if authorized
    #     Then the user clicks the "SEFAZ" action button on the header drop down
    #     ##And the user waits 10 seconds
    #     Then a log panel appears
    #     And the user selects the main log panel of the page
    #     And the selected log panel includes the message "    Number of NF-e Authorized          : 001"
    #     And the user clicks the Close page action icon on the header panel
    #     And the user clicks the "Post" main action button on the right panel
    #     And the selected log panel includes the message "X3 validation Invoice/Credit"
    #     And the user clicks the Close page action icon on the header panel


    Scenario: Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
