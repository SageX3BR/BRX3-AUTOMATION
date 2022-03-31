###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-s-crud-gessoh
# - Description: CRUD verification of sales order function gessoh
# - Jira: NA
# - Legislation: BR addon
# - Created by : Edivaldo Monteiro
# - Created date : 19/03/2020
# - Updated by : Daniela Anile
# - Updated date : 26/01/2021
# - Status : completed
###########################################################################

#Global parameter intialization
###########################################################################
# Notes
# -------------------------------------------------------------------------
# For the purpose of this test:
# - Parameter  : No specific parameter is required
#
# ###########################################################################
#As a user I want to Create , Modify , Delete a Sales order.
Feature: xq-s-crud-gessoh2

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
    #   When the user selects the "param:endPointName1" entry on endpoint panel
    #   Then the "param:endPointName1" endpoint is selected

    #--------------------------------------------------------------------------------
    #Creation of the sales order
    #--------------------------------------------------------------------------------
    Scenario: 2. Create a Sales order
        #Openning the function
        Given the user opens the "GESSOH" function
        #And the user waits 10 seconds
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        #Criar string baseada em datetime$ + 5 Random
        When the user opens the header drop down
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "val(ctrans(num$(datetime$),"-:TZ","")+ num$(int(rnd(99999))))" to the selected text field and hits enter key
        And the user selects the text field with name: "Result"
        And the user stores the value of the selected text field with the key: "DOCREF"
        Then the user clicks the Close page action icon on the header panel
        #Fim da criação da String
        #Filling the sales order header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Reference"
        And the user writes the stored text with key "DOCREF" in the selected text field and hits tab key
        And the user selects the text field with name: "Sold-to"
        And the user writes "BR001" to the selected text field and hits tab key
        #And the user clicks the "Ok" opinion in the alert box
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "100" to the selected text field and hits tab key
        When the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    Scenario Outline: Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK2ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell and hits enter key
        Examples:
            | LIN | ITMREF   | QTY | GROPRI | XQCFOP |
            | 1   | "BMS001" | "1" | "10"   | "6101" |
            | 2   | "BMS002" | "1" | "10"   | "6101" |

    Scenario: Create document
        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 5.Deallocate stock and delete a sales order and close
        #And the user waits 5 second
        And the user clicks the "Allocation" action button on the header drop down
        And the "Order allocations" screen is displayed
        And the user clicks the "Automatic deallocation" button in the popup header
        And the user clicks the Close page action icon on the header panel
        When the user clicks the "Delete" main action button on the right panel
        And the user clicks "OK" button on the confirmation dialog
        And the user clicks the "Ok" opinion in the alert box
        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system