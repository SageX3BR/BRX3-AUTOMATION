###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: xq-p-flow-sdh-ot-al1
# - Description: Operation Triangular SDH Average Load OP1
# - Jira: NA
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 19/06/2020
# - Updated by : Carla Cury
# - Updated date : 19/06/2020
# - Status : in progress
###########################################################################
#Global parameter intialization
###########################################################################
# Notes
# -------------------------------------------------------------------------
# For the purpose of this test:
# - Parameter  : No specific parameter is required
# SCENARIO 1: Perform a triangular operation where the Supplier (A) makes a sale to the customer (B) who will industrialize the product in an Industrializer (C). Aiming at an interstadual operation with state MT.
#
# PREREQUISITES:
# CLIENTS WITH ADDRESS REGISTERED IN DIVERGENT STATES.
# REGISTER NEW VTAX WITH TAXES RESETED TO GESSDH WITH USED CFOP.
# ###########################################################################
#As a user I want to Create , Modify , Delete a Sales order.
#
# ###########################################################################
#As a user I want to Create , Modify , Delete a Sales order.

Feature: xq-s-flow-sdh-ot-al1

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------

    Scenario: 1.Login scenario

        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"
    #--------------------------------------------------------------------------------
    #Creation of the sales order
    #--------------------------------------------------------------------------------

    Scenario: 2. Create a Sales order

        #Openning the function
        Given the user opens the "GESSOH" function
        ##And the user waits 10 seconds
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales order ALL : Full entry" screen is displayed
        #Filling the sales order header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRSOI" to the selected text field and hits tab key
        And the user selects the text field with name: "Sold-to"
        And the user writes "BR004" to the selected text field and hits tab key
        And the user selects the text field with name: "Fiscal operation"
        #alert
        And the user writes "107" to the selected text field and hits tab key
        #Filling my industrialize
        When the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "br005" to the selected text field
        And the user selects the text field with name: "Pay-by"
        And the user writes "Br004" to the selected text field and hits tab key
        And the user selects the text field with name: "Group customer"
        And the user writes "BR004" to the selected text field and hits tab key
        And the user selects the text field with name: "Delivery address"
        And the user writes "PR" to the selected text field and hits tab key
        And the user clicks the "Delivery" tab selected by title
        And the user selects the text field with name: "Shipment site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK2ALL4_ARRAY_NBLIG"

    Scenario Outline: Add Lines

        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK2ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WK2ALL4_QTY"
        And the user adds the text <QTY> in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WK2ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell and hits tab key
        And the user selects last editable cell with X3 field name: "WK2ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell and hits enter key
        And an alert box appears
        And the user clicks the "Yes" opinion in the alert box

        Examples:
            | LIN | ITMREF   | QTY  | GROPRI  | XQCFOP |
            | 1   | "BMS001" | "26" | "31.25" | "6118" |
            | 2   | "BMS002" | "17" | "16.98" | "6118" |

    Scenario: Create document

        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        #Workaround para resolver um bug de não aparecer na left list da fatura encomendas tipo encomendas>>fatura
        #Criar, editar, apertar 'yes' na caixa de diálogo
        When the user clicks the "Management" tab selected by title
        And the user selects the text field with name: "Pay-by"
        And the user writes "Br005" to the selected text field and hits tab key
        And the user selects the text field with name: "Pay-by"
        And the user writes "Br004" to the selected text field and hits tab key
        When the user clicks the "Save" main action button on the right panel
        Then the "Header modification" screen is displayed
        And the user clicks the "Yes" button in the header
        Then a confirmation dialog appears with the message "Record has been modified"
        #Fim do workaround

        And the user selects the text field with X3 field name: "SOH0_SOHNUM"
        And the user stores the value of the selected text field with the key: "SOHDocumentNo"

    #--------------------------------------------------------------------------------
    #Creation of the invoice
    #--------------------------------------------------------------------------------

    Scenario: Create Invoice

        #Openning the function
        Given the user opens the "GESSIH" function
        # ##And the user waits 10 seconds
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Sales site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Type"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with name: "Bill-to customer"
        And the user writes "BR005" to the selected text field and hits tab key

        # BPCORD=br004
        # brcinv=br005
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "107" to the selected text field and hits tab key
        # #And the user waits (3) seconds

        #Filter with the order created above
        Then the user clicks the "Selection criteria" action button on the header drop down
        And the "Invoice preloading filter" screen is displayed
        And the user selects the text field with X3 field name: "SCRITINV_CRISOHNUM"
        And the user writes the stored text with key "SOHDocumentNo" in the selected text field and hits tab key
        And the user clicks the "OK" main action button on the right panel
        #Picking the order / All items
        And the user clicks the "Order selection" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SOHDocumentNo" and with the text containing "BR005" of the picking list panel
        And the user checks the selected picking list panel item
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"


    Scenario Outline: Alter Lines
        Given the user selects row that has the text <ITMREF> in column with X3 field name: "WK5ALL4_ITMREF"
        And the user selects cell with X3 field name: "WK5ALL4_XQCFOP" of selected row
        And the user adds the text <XQCFOP> in selected cell

        Examples:
            | ITMREF   | XQCFOP |
            | "BMS001" | "5118" |
            | "BMS002" | "5118" |


    #Create order and store order number

    Scenario: 2.1. Create and Store Doc Number

        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user stores the value of the selected text field with the key: "SIHDocumentNo"
        #Send to Sefaz and verify if authorized
        Then the user clicks the "SEFAZ" action button on the header drop down
        # ##And the user waits 10 seconds
        Then a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Authorized          : 001"
        And the user clicks the Close page action icon on the header panel
        And the user clicks the "Post" button in the header
        And the selected log panel includes the message "X3 validation Invoice/Credit"
        And the user clicks the Close page action icon on the header panel

    #--------------------------------------------------------------------------------
    #Creation of the receipt
    #--------------------------------------------------------------------------------

    Scenario: 3. Create delivery

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
        #Picking the order / All items
        And the user clicks the "Invoices" link on the left panel
        And the user selects the main picking list panel of the screen
        And the user selects the item with the stored text with key "SIHDocumentNo" and with the text containing "BR001" of the picking list panel
        And the user checks the selected picking list panel item

    Scenario Outline: Alter Lines
        Given the user selects row that has the text <ITMREF> in column with X3 field name: "WK4ALL1_ITMREF"
        And the user selects cell with X3 field name: "WK4ALL1_XQCFOP" of selected row
        And the user adds the text <XQCFOP> in selected cell

        Examples:
            | ITMREF   | XQCFOP |
            | "BMS001" | "6118" |
            | "BMS002" | "6118" |

    Scenario: Create document

        And the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        Given the user clicks the "Lines" tab selected by title
        And the user selects the fixed data table for x3 field name: "WK4ALL1_ARRAY_NBLIG"

    Scenario Outline: Tax Detail - Check Calculated Values
        Given the user selects row that has the text <ITMREF> in column with X3 field name: "WK4ALL1_ITMREF"
        And the user selects cell with X3 field name: "WK4ALL1_XQDETIMPOSTO" of selected row
        When the user clicks on the icon contained in the selected cell
        Then the "Tax determination" screen is displayed
        #Check Values
        And the user selects the text field with X3 field name: "XQDTIMP1_VALFINST"
        And the value of the selected text field is <XQVALFINST>
        Then the user clicks the Close page action icon on the header panel

        Examples:
            | ITMREF   | XQVALFINST |
            | "BMS001" | "143.000"  |

    Scenario: Logout

        And the user clicks the Close page action icon on the header panel
        And the user logs-out from the system