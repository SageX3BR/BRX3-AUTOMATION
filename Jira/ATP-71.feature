###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-81
# - Description:
# - Jira: ATP-81
# - Created by : Douglas Duarte
# - Created date : 23/06/2022
# - Updated by :
# - Updated date :
# - Status : Progress
###########################################################################


Feature: ATP-81

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. SDH Creation
        Given the user opens the "GESSDH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Delivery ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SDH0_STOFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_SDHTYP"
        And the user writes "BRSDH" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_SALFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_BPCORD"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SDH0_BPCINV"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSDH0_CODOPF"
        And the user writes "125" to the selected text field and hits enter key
        And the user hits escape
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario: Add Lines
        Given the user selects editable table row number: "1"
        And the user selects last fixed cell with X3 field name: "WK4ALL1_ITMREF"
        And the user adds the text "BMS106" in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_QTY"
        And the user adds the text "180.01" in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_GROPRI"
        And the user adds the text "17.15" in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCFOP"
        And the user adds the text "6110" in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQOICMS"
        And the user adds the text "0" in selected cell
        And the user selects last editable cell with X3 field name: "WK4ALL1_XQCSTICMS"
        And the user adds the text "00" in selected cell and hits enter key

    Scenario: 3. Document Creation
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: 4. Transmission and Validation
        When the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Rejected            : 000"
        And the selected log panel includes the message "    Number of NF-e Pending return      : 000"
        And the user clicks the "Close page" main action button on the right panel
        Then the user clicks the "Validation" button in the header
        Then the user clicks the "Ok" opinion in the alert box
        And the user selects the text field with X3 field name: "SDH0_SDHNUM"
        And the user stores the value of the selected text field with the key: "SDH_NUM"
        And the user selects the text field with X3 field name: "XQSDH1_TOTMERCA"
        And the user stores the value of the selected text field with the key: "SDH_TOTMERCA"
        Then the user clicks the Close page action icon on the header panel
    Scenario: 5. SHR Creation
        Given the user opens the "GESSRH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Customer return ALL : Full entry" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SRH0_STOFCY"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SRH0_SRHTYP"
        And the user writes "SRN" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SRH0_BPCORD"
        And the user writes "BR001" to the selected text field and hits tab key

    #Picking
    Scenario:6. Picking

        Given the user clicks the "Selection criteria" action button on the header drop down
        And the user selects the text field with X3 field name: "SCRITSRH_CRISDHNUM"
        And the user writes the stored text with key "SDH_NUM" in the selected text field and hits enter key
        And the user clicks the "OK" button in the header
        When the user clicks the "Delivery selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SDH_NUM" and with the text containing "SDH" of the picking list panel
        Then the user checks the selected picking list panel item


    Scenario:8. Complete the document
        Given the user selects the text field with X3 field name: "XQSRH1_CODOPF"
        And the user writes "105" to the selected text field and hits enter key
        And the user selects the text field with X3 field name: "XQSRH1_DTEMI"
        And the user hits escape
        And the user selects the text field with X3 field name: "XQSRH1_HREMI"
        And the user hits escape
        And the user selects the text field with X3 field name: "XQSRH1_DTSAIENT"
        And the user hits escape
        And the user selects the text field with X3 field name: "XQSRH1_HRSAIENT"
        And the user hits escape
        And the user clicks the "Lines (tax)" tab selected by title

    Scenario:7. Complete the document
        Given the user selects the fixed data table for x3 field name: "XQSRH3_ARRAY_PRODLIG"
        And the user selects editable table row number: "1"
        And the user selects the text field with X3 field name: "XQSRH3_OICMS"
        And the user adds the text "0" in selected cell
        And the user selects the text field with X3 field name: "XQSRH3_CSTICMS"
        And the user adds the text "00" in selected cell and hits enter key



    Scenario: 7. Document Creation
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
#Scenario: 5. Attachments
#    Given the user clicks the "Attachments" main action button on the right panel
#    And the user selects the fixed data table of section: "Attachments"
#    And the user selects first row of the selected data table
#    And the user selects the fixed cell with X3 field name: "AOBJTXT_NAM" and row number: 1
#    And the value of the selected cell has string pattern "*[NFE_NUM]*.XML"
#    And the user clicks the "Close" main action button on the right panel
#
#Scenario: 6. Logout
#    And the user logs-out from the system