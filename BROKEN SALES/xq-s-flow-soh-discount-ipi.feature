###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:xq-s-flow-soh-modbcst-cst10
# - Description: Validate FCP_ST fields and calculation for CST 30
# - Jira: NA
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 01/06/2020
# - Updated by : Carla Cury
# - Updated date : 01/06/2020
# - Status : Automated
###########################################################################

Feature:xq-s-flow-soh-discount-ipi

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #modalidade 4 cts 10
    #--------------------------------------------------------------------------------
    Scenario: 2. FCP_ST fields and calculation - ICMS CST-30
        Given the user opens the "GESSOH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        #Header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SOH0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_SOHTYP"
        And the user writes "BRSON" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_BPCORD"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_XQCODOPF"
        And the user writes "100" to the selected text field and hits tab key
        # And the user clicks the "Calc. memory On/Off" action button on the header drop down
        # And the user clicks the "Ok" opinion in the alert box
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    #Lines
    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK2ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_GROPRI"
        And the user waits 1 seconds
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCFOP"
        And the user waits 1 seconds
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQVARCFOP"
        And the user waits 1 seconds
        And the user adds the text <XQVARCFOP> in selected cell
        And the user hits tab
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQVARCFOP"
        And the user waits 1 seconds
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_DISCRGVAL1"
        And the user adds the text <DISCRGVAL1> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_DISCRGVAL2"
        And the user waits 1 seconds
        And the user adds the text <DISCRGVAL2> in selected cell
        And the user hits enter


        Examples:
            | LIN | ITMREF   | QTY | GROPRI | XQCFOP | XQVARCFOP | XQVARCFOP | DISCRGVAL1 | DISCRGVAL2 |
            | 1   | "BMS001" | "1" | "100"  | "6101" | "7"       | "7"       | "1"        | "1"        |
            | 2   | "BMS001" | "1" | "100"  | "6101" | "7"       | "7"       | "1"        | "1"        |




    Scenario: Invoice Elements

        Given the user clicks the "Invoicing" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL3_ARRAY_NBFAC"
        And the user selects the fixed cell with X3 field name: "WK2ALL3_INVDTAAMT" and row number: (2)

        And the user adds the text "1" in selected cell and hits enter key
        And the user selects the fixed cell with X3 field name: "WK2ALL3_INVDTAAMT" and row number: (9)

        And the user adds the text "0.5" in selected cell and hits enter key

    Scenario: Create document

        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"




    Scenario Outline: Tax Detail - Check Calculated Values
        Given the user selects row that has the text <ITMREF> in column with X3 field name: "WK2ALL4_ITMREF"
        And the user selects cell with X3 field name: "WK2ALL4_XQDETIMPOSTO" of selected row
        When the user clicks on the icon contained in the selected cell
        Then the "Tax determination" screen is displayed
        #Check Values
        And the user selects the text field with X3 field name: "XQDTIMP1_IPIBCALC"
        And the value of the selected text field is <IPIBCALC>
        Then the user clicks the Close page action icon on the header panel

        Examples:
            | ITMREF   | IPIBCALC  |
            | "BMS001" | "96.7700" |
            | "BMS001" | "96.7700" |


    Scenario: Check Calculated Values

        Given the user clicks the "Tax Summary" tab selected by title
        And the user selects the text field with X3 field name: "XQSOH1_TOTBASEIPI"
        And the value of the selected text field is "193.5400"
        #--------------------------------------------------------------------------------
        #modalidade 5 cts 10
        #--------------------------------------------------------------------------------
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SOH0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_SOHTYP"
        And the user writes "BRSON" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_BPCORD"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_XQCODOPF"
        And the user writes "100" to the selected text field and hits tab key
        # And the user clicks the "Calc. memory On/Off" action button on the header drop down
        # And the user clicks the "Ok" opinion in the alert box
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    #Lines
    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK2ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_GROPRI"
        And the user waits 1 seconds
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCFOP"
        And the user waits 1 seconds
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQVARCFOP"
        And the user waits 1 seconds
        And the user adds the text <XQVARCFOP> in selected cell
        And the user hits tab
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQVARCFOP"
        And the user waits 1 seconds
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_DISCRGVAL1"
        And the user adds the text <DISCRGVAL1> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_DISCRGVAL2"
        And the user waits 1 seconds
        And the user adds the text <DISCRGVAL2> in selected cell
        And the user hits enter


        Examples:
            | LIN | ITMREF   | QTY | GROPRI | XQCFOP | XQVARCFOP | XQVARCFOP | DISCRGVAL1 | DISCRGVAL2 |
            | 1   | "BMS001" | "1" | "100"  | "6101" | "7"       | "7"       | ""         | "2"        |
            | 2   | "BMS001" | "1" | "100"  | "6101" | "7"       | "7"       | ""         | "2"        |




    Scenario: Invoice Elements

        Given the user clicks the "Invoicing" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL3_ARRAY_NBFAC"
        And the user selects the fixed cell with X3 field name: "WK2ALL3_INVDTAAMT" and row number: (2)
        And the user waits (2) seconds
        And the user adds the text "1" in selected cell and hits enter key
        And the user selects the fixed cell with X3 field name: "WK2ALL3_INVDTAAMT" and row number: (9)
        And the user waits (2) seconds
        And the user adds the text "0.5" in selected cell and hits enter key

    Scenario: Create document

        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"




    Scenario Outline: Tax Detail - Check Calculated Values
        Given the user selects row that has the text <ITMREF> in column with X3 field name: "WK2ALL4_ITMREF"
        And the user selects cell with X3 field name: "WK2ALL4_XQDETIMPOSTO" of selected row
        When the user clicks on the icon contained in the selected cell
        Then the "Tax determination" screen is displayed
        #Check Values
        And the user selects the text field with X3 field name: "XQDTIMP1_IPIBCALC"
        And the value of the selected text field is <IPIBCALC>
        Then the user clicks the Close page action icon on the header panel

        Examples:
            | ITMREF   | IPIBCALC  |
            | "BMS001" | "96.7700" |
            | "BMS001" | "96.7700" |


    Scenario: Check Calculated Values

        Given the user clicks the "Tax Summary" tab selected by title
        And the user selects the text field with X3 field name: "XQSOH1_TOTBASEIPI"
        And the value of the selected text field is "193.5400"


        #--------------------------------------------------------------------------------
        #modalidade 5 cts 10
        #--------------------------------------------------------------------------------
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SOH0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_SOHTYP"
        And the user writes "BRSON" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_BPCORD"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SOH0_XQCODOPF"
        And the user writes "100" to the selected text field and hits tab key
        # And the user clicks the "Calc. memory On/Off" action button on the header drop down
        # And the user clicks the "Ok" opinion in the alert box
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    #Lines
    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK2ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_GROPRI"
        And the user waits 1 seconds
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCFOP"
        And the user waits 1 seconds
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQVARCFOP"
        And the user waits 1 seconds
        And the user adds the text <XQVARCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_DISCRGVAL1"
        And the user adds the text <DISCRGVAL1> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_DISCRGVAL2"
        And the user waits 1 seconds
        And the user adds the text <DISCRGVAL2> in selected cell
        And the user hits enter


        Examples:
            | LIN | ITMREF   | QTY | GROPRI | XQCFOP | XQVARCFOP | DISCRGVAL1 | DISCRGVAL2 |
            | 1   | "BMS001" | "1" | "100"  | "6101" | "6"       | ""         | ""         |
            | 2   | "BMS001" | "1" | "100"  | "6101" | "6"       | ""         | ""         |


    Scenario: Invoice Elements

        Given the user clicks the "Invoicing" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL3_ARRAY_NBFAC"
        And the user selects the fixed cell with X3 field name: "WK2ALL3_INVDTAAMT" and row number: (2)
        And the user waits (2) seconds
        And the user adds the text "4" in selected cell and hits enter key
        And the user selects the fixed cell with X3 field name: "WK2ALL3_INVDTAAMT" and row number: (9)
        And the user waits (2) seconds
        And the user adds the text "10" in selected cell and hits enter key

    Scenario: Create document

        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        # And  the user clicks the "Save" main action button on the right panel
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"





    Scenario Outline: Tax Detail - Check Calculated Values
        Given the user selects row that has the text <ITMREF> in column with X3 field name: "WK2ALL4_ITMREF"
        And the user selects cell with X3 field name: "WK2ALL4_XQDETIMPOSTO" of selected row
        When the user clicks on the icon contained in the selected cell
        Then the "Tax determination" screen is displayed
        #Check Values
        And the user selects the text field with X3 field name: "XQDTIMP1_IPIBCALC"
        And the value of the selected text field is <IPIBCALC>
        Then the user clicks the Close page action icon on the header panel

        Examples:
            | ITMREF   | IPIBCALC  |
            | "BMS001" | "91.0000" |
            | "BMS001" | "91.0000" |


    Scenario: Check Calculated Values

        Given the user clicks the "Tax Summary" tab selected by title
        And the user selects the text field with X3 field name: "XQSOH1_TOTBASEIPI"
        And the value of the selected text field is "182.0000"

    Scenario: Logout

        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system
