###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-flow-gessdh-ipi
# - Description: Delivery with discount in the Line and Invoicing Elements
# - Jira: X3-203943
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 19/06/2020
# - Updated by : Carla Cury
# - Updated date : 29/01/2021
# - Status : in progress
###########################################################################


Feature: xq-s-flow-gessdh-discount-ipi

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------

    Scenario: 1.Login scenario

        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
    #--------------------------------------------------------------------------------
    #Creation of the sales order
    #--------------------------------------------------------------------------------

    Scenario: 2. Create a Delivery

        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed
        #Filling the Invoice header information
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with name: "Ship-to"
        And the user writes "BR002" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        #alert
        And the user writes "121" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"
    # And an alert box with the text containing "delivery" appears
    # Then the user clicks the "Yes" opinion in the alert box
    #Filling Lines

    Scenario Outline: Add Lines

        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQVARCFOP"
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_DISCRGVAL1"
        And the user adds the text <DISCRGVAL1> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_DISCRGVAL2"
        And the user adds the text <DISCRGVAL2> in selected cell
        And the user hits enter



        # And the user waits (3) seconds
        # And an alert box appears
        # And the user clicks the "Yes" opinion in the alert box

        Examples:
            | LIN | ITMREF   | QTY | GROPRI | XQCFOP | XQVARCFOP | DISCRGVAL1 | DISCRGVAL2 |
            | 1   | "BMS001" | "1" | "100"  | "6101" | "6"       | ""         | "2"        |
            | 2   | "BMS001" | "1" | "100"  | "6101" | "6"       | ""         | "2"        |

    Scenario: Invoice Elements

        Given the user clicks the "Management" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL2_ARRAY_NBFAC"
        And the user selects the fixed cell with X3 field name: "WK4ALL2_INVDTAAMT" and row number: (2)
        And the user adds the text "1" in selected cell and hits enter key
        And the user selects the fixed cell with X3 field name: "WK4ALL2_INVDTAAMT" and row number: (6)
        And the user adds the text "0.5" in selected cell and hits enter key

    Scenario: Create document

        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"




    Scenario Outline: Tax Detail - Check Calculated Values
        Given the user selects row that has the text <ITMREF> in column with X3 field name: "WK4ALL1_ITMREF"
        And the user selects cell with X3 field name: "WK4ALL1_XQDETIMPOSTO" of selected row
        When the user clicks on the icon contained in the selected cell
        Then the "Tax determination" screen is displayed
        #Check Values
        And the user selects the text field with X3 field name: "XQDTIMP1_IPIBCALC"
        And the value of the selected text field is <IPIBCALC>
        Then the user clicks the Close page action icon on the header panel

        Examples:
            | ITMREF   | IPIBCALC  |
            | "BMS001" | "97.0200" |
            | "BMS001" | "97.0200" |


    Scenario: Check Calculated Values

        Given the user clicks the "Tax Summary" tab selected by title
        And the user selects the text field with X3 field name: "XQSDH1_TOTBASEIPI"
        And the value of the selected text field is "194.0400"


    # And the user selects cell with X3 field name: "WK2ALL4_XQDETIMPOSTO" of selected row
    # And the user selects the text field with X3 field name: "XQDTIMP1_VALFINST"
    # And the value of the selected text field is "132.1700"
    # And the user clicks the Close page action icon on the header panel
    #Tax Det.



    Scenario: SEFAZ
        Given the user clicks the "Save" main action button on the right panel
        Then the user clicks the "SEFAZ" action button on the header drop down
        And the user waits 10 seconds
        Then a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Authorized          : 001"
        And the user clicks the Close page action icon on the header panel
    # And the user clicks the "Validation" main action button on the right panel
    # And the selected log panel includes the message "X3 validation Delivery"
    # And the user clicks the Close page action icon on the header panel


    #--------------------------------------------------------------------------------
    #Creation of the receipt
    #--------------------------------------------------------------------------------

    # Scenario: 3. Create a new delivery for import


    #     Given the user opens the "GESSDH" function
    #     And the user selects the data table in the popup
    #     And the user selects cell with text: "ALL     Full entry" and column header: ""
    #     And the user clicks on the selected cell
    #     Then the "Delivery ALL : Full entry" screen is displayed
    #     #Filling the Invoice header information
    #     When the user clicks the "New" main action button on the right panel
    #     And the user selects the text field with name: "Shipment site"
    #     And the user writes "BR011" to the selected text field and hits tab key
    #     And the user selects the text field with name: "Sales site"
    #     And the user writes "BR011" to the selected text field and hits tab key
    #     And the user selects the text field with name: "Type"
    #     And the user writes "BRSDH" to the selected text field and hits tab key
    #     And the user selects the text field with name: "Ship-to"
    #     And the user writes "PT006" to the selected text field and hits tab key
    #     And the user selects the text field with name: "Fiscal operation"
    #     And the user writes "121" to the selected text field and hits tab key
    #     And the user clicks the "General Data" tab selected by title
    #     And the user selects the text field with X3 field name: "XQSDH0_UFEMBARQUE"
    #     And the user writes "PR" to the selected text field and hits tab key
    #     And the user selects the text field with X3 field name: "XQSDH0_LOCEMBARQUE"
    #     And the user writes "Paranaguá" to the selected text field and hits tab key
    #     And the user selects the text field with X3 field name: "XQSDH0_LOCEMBARQUE"
    #     And the user writes "Port" to the selected text field and hits tab key
    #     And the user clicks the "Management" tab selected by title
    #     And the user selects the text field with X3 field name: "WK4ALL2_VACBPR"
    #     And the user writes "BRL" to the selected text field and hits tab key


    #     And the user clicks the "Lines" tab selected by title
    #     Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"
    # # And an alert box with the text containing "delivery" appears
    # # Then the user clicks the "Yes" opinion in the alert box
    # #Filling Lines

    # Scenario Outline: Add Lines

    #     Given the user selects editable table row number: <LIN>
    #     And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
    #     And the user adds the text <ITMREF> in selected cell
    #     And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
    #     And the user adds the text <QTY> in selected cell
    #     And the user selects last editable cell with X3 field name: "WK4ALL1_GROPRI"
    #     And the user adds the text <GROPRI> in selected cell
    #     And the user selects last editable cell with X3 field name: "WK4ALL1_XQCFOP"
    #     And the user adds the text <XQCFOP> in selected cell
    #     And the user selects last editable cell with X3 field name: "WK4ALL1_XQVARCFOP"
    #     And the user adds the text <XQVARCFOP> in selected cell
    #     And the user selects last editable cell with X3 field name: "WK4ALL1_XQOICMS"
    #     And the user adds the text <XQOICMS> in selected cell
    #     And the user selects last editable cell with X3 field name: "WK4ALL1_XQCSTICMS"
    #     And the user adds the text <XQCSTICMS> in selected cell
    #     And the user selects last editable cell with X3 field name: "WK4ALL1_XQCENQ"
    #     Then the user adds the text <XQCENQ> in selected cell and hits enter key
    #     And the user waits (3) seconds
    #     # And an alert box appears
    #     # And the user clicks the "Yes" opinion in the alert box

    #     Examples:
    #         | LIN | ITMREF   | QTY | GROPRI   | XQCFOP | XQVARCFOP | XQOICMS | XQCSTICMS | XQCENQ |
    #         | 1   | "BMS001" | "1" | "125.32" | "7551" | ""        | "0"     | "41"      | "999"  |
    #         | 2   | "BMS002" | "2" | "53.98"  | "7551" | ""        | "0"     | "41"      | "999"  |

    # Scenario: Create document

    #     And the user clicks the "Create" main action button on the right panel
    #     Then a confirmation dialog appears with the message "Record has been created"
    #     Then the user clicks the "SEFAZ" action button on the header drop down
    #     And the user waits 10 seconds
    #     Then a log panel appears
    #     And the user selects the main log panel of the page
    #     And the selected log panel includes the message "    Number of NF-e Authorized          : 001"
    #     And the user clicks the Close page action icon on the header panel
    #     And the user clicks the "Validation" main action button on the right panel
    #     And the selected log panel includes the message "X3 validation Delivery"
    #     And the user clicks the Close page action icon on the header panel

    Scenario: Logout

        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
