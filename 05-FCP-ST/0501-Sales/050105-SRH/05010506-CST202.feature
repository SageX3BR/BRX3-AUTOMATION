###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:05010506-CST202
# - Description: Validate FCP_ST fields and calculation for CST 202
# - Jira: NA
# - Legislation: BR addon
# - Created by : Jonatas Hille
# - Created date : 01/06/2020
# - Updated by : Jonatas Hille
# - Updated date : 01/06/2020
# - Status : Automated
###########################################################################

Feature:05010506-CST202

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 05010506-01 Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Validate FCP_ST fields and calculation - ICMS CST-202
    #--------------------------------------------------------------------------------
    Scenario: 05010506-02 FCP_ST fields and calculation - ICMS CST-202
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed
        #Header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SDH0_STOFCY"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_SDHTYP"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_SALFCY"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_BPCORD"
        And the user writes "BR150" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSDH0_CODOPF"
        And the user writes "45" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    #Lines
    Scenario Outline: 05010506-03 Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_GROPRI"
        # #And the user waits 1 seconds
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCSTICMS"
        # #And the user waits 1 seconds
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY  | GROPRI  | XQCSTICMS | XQCENQ |
            | 1   | "BMS001" | "14" | "98.54" | "202"     | "301"  |
            | 2   | "BMS002" | "16" | "98.52" | "202"     | "301"  |

    Scenario: 05010506-04 Create
        #Create
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 05010506-05 Resume - Check Calculated Values
        Given the user clicks the "Tax Summary" tab selected by title
        When the user selects the text field with X3 field name: "XQSDH1_TOTBASEFCPST"
        And the value of the selected text field is "4,495.85"
        And the user selects the text field with X3 field name: "XQSDH1_TOTICMSFCPST"
        And the value of the selected text field is "89.92"
        And the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Rejected            : 000"
        And the selected log panel includes the message "    Number of NF-e Pending return      : 000"
        And the user clicks the "Close page" main action button on the right panel
        And the user clicks the "Validation" button in the header
        And the user clicks the "Ok" opinion in the alert box
        And the user selects the text field with X3 field name: "SDH0_SDHNUM"
        And the user stores the value of the selected text field with the key: "SDHNUM"
        Then the user clicks the Close page action icon on the header panel

    Scenario: 05010506-06 Create Return
        Given the user opens the "GESSRH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Customer return ALL : Full entry" screen is displayed
        #Header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SRH0_STOFCY"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SRH0_BPCORD"
        And the user writes "BR150" to the selected text field and hits tab key
        And the user clicks the "Selection criteria" action button on the header drop down
        And the user selects the text field with X3 field name: "SCRITSRH_CRISDHNUM"
        And the user writes the stored text with key "SDHNUM" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel
        #Picking the order / All items
        And the user clicks the "Delivery selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SDHNUM" and with the text containing "BR001" of the picking list panel
        And the user checks the selected picking list panel item

        And the user selects the text field with X3 field name: "XQSRH1_CODOPF"
        And the user writes "44" to the selected text field and hits tab key
        And the user selects the date field with X3 field name: "XQSRH1_DTEMI"
        And the user writes today to the selected date field
        And the user selects the date field with X3 field name: "XQSRH1_DTSAIENT"
        And the user writes today to the selected date field

        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "XQSRH3_ARRAY_PRODLIG"
        Then the user selects first row of the selected data table


    #Lines
    Scenario Outline: 05010506-07 Add Lines
        Given the user selects cell with X3 field name: "XQSRH3_CFOP" of selected row
        And the user adds the text <CFOP> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_VARCFOP" of selected row
        And the user adds the text <VARCFOP> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_OICMS" of selected row
        And the user adds the text <OICMS> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTICMS" of selected row
        And the user adds the text <CSTICMS> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_XQCENQ" of selected row
        And the user adds the text <XQCENQ> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTIPI" of selected row
        And the user adds the text <CSTIPI> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTPIS" of selected row
        And the user adds the text <CSTPIS> in selected cell
        And the user selects cell with X3 field name: "XQSRH3_CSTCOF" of selected row
        And the user adds the text <CSTCOF> in selected cell

        And the user hits enter
        Then the user selects table row that is below the currently selected row

        Examples:
            | CFOP   | VARCFOP | OICMS | CSTICMS | XQCENQ | CSTIPI | CSTPIS | CSTCOF |
            | "2414" | "5"     | "0"   | "202"   | "301"  | "02"   | "01"   | "01"   |
            | "2414" | "5"     | "0"   | "202"   | "301"  | "02"   | "01"   | "01"   |

    Scenario: 05010506-08 Return Creation
        #Create
        Given the user clicks the "Create" main action button on the right panel
        When a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "XQSRH3_ARRAY_PRODLIG"
        Then the user selects first row of the selected data table

    Scenario Outline: 05010506-09 Add Lines
        Given the user selects cell with X3 field name: "XQSRH3_BCFCPST" of selected row
        And the value of the selected cell contains <BCFCPST>
        And the user selects cell with X3 field name: "XQSRH3_VLICMSFCPST" of selected row
        And the value of the selected cell contains <VLICMSFCPST>
        And the user selects cell with X3 field name: "XQSRH3_ALIQFCPST" of selected row
        And the value of the selected cell contains <ALIQFCPST>
        And the user hits enter
        Then the user selects table row that is below the currently selected row

        Examples:
            | BCFCPST    | VLICMSFCPST | ALIQFCPST |
            | "2,098.29" | "41.97"     | "2.00"    |
            | "2,397.56" | "47.95"     | "2.00"    |

    Scenario: 05010506-10 Resume - Check Calculated Values
        Given the user clicks the "NF-e Summary" tab selected by title
        When the user selects the text field with X3 field name: "XQSRH2_TOTBASEFCPST"
        And the value of the selected text field is "4,495.85"
        And the user selects the text field with X3 field name: "XQSRH2_TOTICMSFCPST"
        And the value of the selected text field is "89.92"
        And the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Rejected            : 000"
        And the selected log panel includes the message "    Number of NF-e Pending return      : 000"
        And the user clicks the "Close page" main action button on the right panel

        Then the user clicks the Close page action icon on the header panel

        #Logout
        Then the user logs-out from the system