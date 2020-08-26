###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:xq-flow-pih-oi
# - Description: Open Items for Import invoice without the checkbox from the Fiscal operation selected
# - Jira: NA
# - Legislation: BR addon
# - Created by : Edivaldo Monteiro
# - Created date : 19/03/2020
# - Updated by : Edivaldo Monteiro
# - Updated date : 20/03/2020
# - Status : in progress
###########################################################################

#Global parameter intialization
###########################################################################
# Notes
# -------------------------------------------------------------------------
# For the purpose of this test:
# - Parameter  : No specific parameter is required
#
# ###########################################################################
#As a user I want to validate the open items created for a import purchase invoice.
Feature:xq-flow-pih-oi

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
    #   When the user selects the "param:endPointName1" entry on endpoint panel
    #   Then the "param:endPointName1" endpoint is selected

    #--------------------------------------------------------------------------------
    #Creation of the invoice
    #--------------------------------------------------------------------------------
    Scenario: 2. Create a purchase invoice
        Given the user opens the "GESPIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        #Filling the Invoice header information
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "PT006" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL0_BPRSAC"
        And the user writes "FORE" to the selected text field and hits tab key
        When the user clicks the "General data" tab selected by title
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "111" to the selected text field and hits tab key
        When the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Supplier doc no."
        And the user writes "123ABCD123" to the selected text field and hits tab key
        And a dialog box appears
        And the user clicks the "Ok" opinion in the alert box
        #Including products at order
        When the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"

        And the user selects editable table row number: 1

        And the user selects last fixed cell with X3 field name: "WE8ALL3_TYPORI"
        And the user selects the choice "Miscellaneous" of the selected cell
        And the user selects last fixed cell with X3 field name: "WE8ALL3_ITMREF"
        And the user adds the text "BMS001" in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_QTYUOM"
        And the user adds the text "36" in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_NETPRI"
        And the user adds the text "106.23" in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCFOP"
        And the user adds the text "3101" in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQORIGEMICMS"
        And the user adds the text "0" in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCSTICMS"
        And the user adds the text "00" in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCENQ"
        And the user adds the text "999" in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCSTIPI"
        And the user adds the text "49" in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCSTPIS"
        And the user adds the text "01" in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCSTCOF"
        And the user adds the text "01" in selected cell and hits enter key

        #Second product
        When the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        And the user selects editable table row number: 1

        And the user selects last fixed cell with X3 field name: "WE8ALL3_TYPORI"
        And the user selects the choice "Miscellaneous" of the selected cell
        And the user selects last fixed cell with X3 field name: "WE8ALL3_ITMREF"
        And the user adds the text "BMS002" in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_QTYUOM"
        And the user adds the text "51" in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_NETPRI"
        And the user adds the text "99.98" in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCFOP"
        And the user adds the text "3101" in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQORIGEMICMS"
        And the user adds the text "0" in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCSTICMS"
        And the user adds the text "00" in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCENQ"
        And the user adds the text "999" in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCSTIPI"
        And the user adds the text "49" in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCSTPIS"
        And the user adds the text "01" in selected cell
        And the user selects last editable cell with X3 field name: "WE8ALL3_XQCSTCOF"
        And the user adds the text "01" in selected cell and hits enter key

        #Informing Importing declaration (DI Data)  ITEM 1
        Then the user clicks the "more_vertical" button in the header
        And the user clicks the "DI Data" secondary action button on the right panel
        And the "Import declaration" screen is displayed
        And the user selects the text field with name: "Current displayed line"
        And the user writes "1" to the selected text field and hits tab key
        And the user selects the fixed data table for x3 field name: "XQDI1_ARRAY_NBDI"
        And the user selects last fixed cell with X3 field name: "XQDI1_NUMDI"
        And the user adds the text "1234567890" in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_DTDI"
        And the user enters todays date in the selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_CODEXP"
        And the user adds the text "1234567890" in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_RTAFRMM"
        And the user adds the text "23.21" in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_RTCREDPRE"
        And the user adds the text "14.69" in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_RTDESPIMP"
        And the user adds the text "6.95" in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_RTIOF"
        And the user adds the text "7.39" in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_RTDESADU"
        And the user adds the text "17.32" in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_LOCDESEMB"
        And the user adds the text "Porto de Paranagua" in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_UFDESEMB"
        And the user adds the text "PR" in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_DTDESEMB"
        And the user enters todays date in the selected cell
        And the user selects the fixed data table for x3 field name: "XQDI1_ARRAY_NBAD"
        And the user selects last fixed cell with X3 field name: "XQDI1_NUMAD"
        And the user adds the text "10" in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_CODFAB"
        And the user adds the text "123" in selected cell and hits enter key
        #And the user clicks the "Save" main action button on the right panel
        And the "Save" main action button on the right panel is enabled
        And the user opens the "Save" section on the right panel

        #Informing Importing declaration (DI Data)
        #Second ITEM
        And the user selects the text field with name: "Current displayed line"
        And the user writes "2" to the selected text field and hits tab key
        And the user selects the fixed data table for x3 field name: "XQDI1_ARRAY_NBDI"
        And the user selects last fixed cell with X3 field name: "XQDI1_NUMDI"
        And the user adds the text "1234567899" in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_DTDI"
        And the user enters todays date in the selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_CODEXP"
        And the user adds the text "1234567899" in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_RTAFRMM"
        And the user adds the text "4.32" in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_RTCREDPRE"
        And the user adds the text "21.95" in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_RTDESPIMP"
        And the user adds the text "9.64" in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_RTIOF"
        And the user adds the text "7.25" in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_RTDESADU"
        And the user adds the text "12.36" in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_LOCDESEMB"
        And the user adds the text "Porto de Santos" in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_UFDESEMB"
        And the user adds the text "SP" in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_DTDESEMB"
        And the user enters todays date in the selected cell
        And the user selects the fixed data table for x3 field name: "XQDI1_ARRAY_NBAD"
        And the user selects last fixed cell with X3 field name: "XQDI1_NUMAD"
        And the user adds the text "20" in selected cell
        And the user selects last fixed cell with X3 field name: "XQDI1_CODFAB"
        And the user adds the text "456" in selected cell and hits enter key
        And the user clicks the "Save" secondary action button on the right panel
        And the user clicks the Close page action icon on the header panel

        #Saving the invoice
        When the user clicks the "Control" tab selected by title
        And the user selects the text field with name: "Calculated - tax"
        And the user stores the value of the selected text field with the key: "InvoiceTaxValue"
        And the user selects the text field with name: "Invoice - tax"
        And the user adds the stored text with key "InvoiceTaxValue" in selected cell and hits enter key
        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"


        #Checking Open Items data
        Then the user clicks the "Open items" button in the header
        And the "Open item edit" screen is displayed
        And the user selects the fixed data table for x3 field name: "BPSDUD_ARRAY_NBECH"
        And the user selects row that has the text "BOL" in column with X3 field name: "BPSDUD_PAM"
        And the user selects the text field with X3 field name: "BPSDUD_AMTCUR"
        And the value of the selected text field is "13,177.35"
        And the user clicks the Close page action icon on the header panel

        And the user clicks the "SEFAZ" secondary action button on the right panel
        Then a log panel appears
        And the user selects the main log panel of the page
        And the user waits 20 seconds
        And the selected log panel includes the confirmation message "Authorized"

        And the user clicks the Close page action icon on the header panel
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system