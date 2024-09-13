###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-p-crud-gespoh
# - Description: CRUD verification of purchase order function gespoh
# - Jira: NA
# - Legislation: BRA
# - Created by : Edivaldo Monteiro
# - Created date : 19/03/2020
# - Updated by : Fausto A Neto
# - Updated date : 01/08/2024
# - Status : Automated
###########################################################################

Feature: xq-p-crud-gespoh

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Creation of the order
    #--------------------------------------------------------------------------------
    Scenario: 2. Create a purchase order
        #Opening the function
        Given the user opens the "GESPOH" function
        #And the user waits 10 seconds
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase order ALL : Full entry" screen is displayed
        #Filling the order header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Order site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key
        When the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Bill-by supplier"
        And the user writes "BR001" to the selected text field and hits tab key
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WE3ALL2_ARRAY_NBLIG"

    Scenario Outline: 3. Lines POH
        And the user selects editable table row number: <LIN>
        When the user selects last fixed cell with X3 field name: "WE3ALL2_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_QTYUOM"
        And the user adds the text <QTYUOM> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WE3ALL2_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell and hits enter key

        Examples:
            | LIN | ITMREF   | QTYUOM | GROPRI | XQCFOP |
            | 1   | "BMS001" | "10"   | "10"   | "2101" |
            | 2   | "BMS002" | "10"   | "10"   | "2101" |

    Scenario: 3.1.Create the order
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 4.Update the order
        And the user selects the text field with name: "Internal reference"
        And the user writes "1" to the selected text field and hits tab key
        And the user clicks the "Save" main action button on the right panel
        And the user clicks the "Yes" opinion in the alert box
        Then a confirmation dialog appears with the message "Record has been modified"

    Scenario: 5.Delete order and close
        When the user clicks the "Delete" main action button on the right panel
        And the user clicks "OK" button on the confirmation dialog
        And the user clicks the "Ok" opinion in the alert box
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system