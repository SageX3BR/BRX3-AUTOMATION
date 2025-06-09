###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-51
# - Description: Criar devolução de compra direta sem picking
# - Jira: X3DEV-569
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 02/06/2022
# - Updated by : Fausto A Neto
# - Updated date : 05/08/2024
# - Status : IN PROGRESS
###########################################################################

Feature: ATP-51

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. Creating Purchase Return PNH
        Given the user opens the "GESPNH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase return ALL : Full entry" screen is displayed

        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Return site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "130" to the selected text field
        Then the user hits tab

        Given the user selects the data table of section: "Lines"

        Given the user selects editable table row number: 1
        And the user selects last fixed cell with X3 field name: "WE7ALLXQ0_ITMREF"
        And the user adds the text "BMS001" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE7ALLXQ0_QTYUOM"
        And the user adds the text "5" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE7ALLXQ0_GROPRI"
        And the user adds the text "100" in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALLXQ0_XQCFOP"
        And the user adds the text "6201" in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALLXQ0_XQORIGEMICMS"
        And the user adds the text "0" in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALLXQ0_XQCSTICMS"
        And the user adds the text "60" in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALLXQ0_XQCSTIPI"
        And the user adds the text "50" in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALLXQ0_XQCSTPIS"
        And the user adds the text "01" in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALLXQ0_XQCSTCOF"
        And the user adds the text "01" in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALLXQ0_XQCENQ"
        And the user adds the text "999" in selected cell and hits enter key

        Given the user clicks the "Save" main action button on the right panel
        When the user clicks the "Yes" option in the alert box

        Given the user selects editable table row number: 2
        And the user selects last fixed cell with X3 field name: "WE7ALLXQ0_ITMREF"
        And the user adds the text "BMS001" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE7ALLXQ0_QTYUOM"
        And the user adds the text "5" in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WE7ALLXQ0_GROPRI"
        And the user adds the text "100" in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALLXQ0_XQCFOP"
        And the user adds the text "6201" in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALLXQ0_XQORIGEMICMS"
        And the user adds the text "0" in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALLXQ0_XQCSTICMS"
        And the user adds the text "60" in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALLXQ0_XQCSTIPI"
        And the user adds the text "50" in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALLXQ0_XQCSTPIS"
        And the user adds the text "01" in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALLXQ0_XQCSTCOF"
        And the user adds the text "01" in selected cell
        And the user selects last editable cell with X3 field name: "WE7ALLXQ0_XQCENQ"
        And the user adds the text "999" in selected cell and hits enter key

        Given the user clicks the "Save" main action button on the right panel
        When the user clicks the "Yes" option in the alert box


    Scenario: 6. Create / Addition ICMS base

        Given the user clicks the "Referenced docs." action button on the header drop down
        And the user selects the data table in the popup
        When the user selects last editable cell with column header: "Reference type"
        Then the user selects the choice "NF Mod.1/1A ou NF modelo 2 referenciada" of the selected cell
        And the user hits tab
        And the user selects last fixed cell with X3 field name: "XQIREF1_UF"
        And the user adds the text "PR" in selected cell
        When the user selects last editable cell with column header: "Issue month"
        Then the user enters todays date in the selected cell
        And the user hits tab
        And the user selects last fixed cell with X3 field name: "XQIREF1_MODNFE"
        And the user adds the text "1" in selected cell
        And the user selects last fixed cell with X3 field name: "XQIREF1_SERNFE"
        And the user adds the text "0" in selected cell
        And the user selects last fixed cell with X3 field name: "XQIREF1_NUMNFE"
        And the user adds the text "0" in selected cell
        And the user selects last fixed cell with X3 field name: "XQIREF1_BPR"
        And the user adds the text "BR001" in selected cell
        And the user clicks the "OK" button in the popup header
        Given the user clicks the "Create" main action button on the right panel
        When the user clicks the "Tax detail" action button on the header drop down
        Then the user selects the text field with X3 field name: "XQPTD0_CURLIG"
        And the user writes "2" to the selected text field and hits tab key
        Then the user selects the text field with name: "Base ICMS"
        And the user writes "100" to the selected text field and hits tab key
        Then the user selects the text field with name: "ICMS payable value"
        And the user writes "10" to the selected text field and hits tab key
        And the user clicks the "OK" button in the popup header
        And the user clicks the "Close" main action button on the right panel
        Given the user clicks the "Save" main action button on the right panel


    Scenario: 6. Check Values after creation

        When the user clicks the "Tax detail" action button on the header drop down
        Then the user selects the text field with X3 field name: "XQPTD0_CURLIG"
        And the value of the selected text field is "2"
        Then the user selects the text field with name: "Base ICMS"
        And the value of the selected text field is "100.0000"
        Then the user selects the text field with name: "ICMS payable value"
        And the value of the selected text field is "10.0000"
        And the user clicks the "Close" main action button on the right panel
        Given the user clicks the "Save" main action button on the right panel

    Scenario: 8. Logout
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system