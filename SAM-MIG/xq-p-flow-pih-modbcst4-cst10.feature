###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:xq-p-flow-pih-modbcst6-cst10
# - Description: MODBCST 4
# - Jira: X3-202065 - [BR] [NF-e] [Purchase] Nota Técnica 2019.001 v1.40 - modBCST
# - Legislation: BR addon
# - Created by : Carla Cury
# - Created date : 01/06/2020
# - Updated by : Carla Cury
# - Updated date : 30/09/2020
# - Status : Automated
###########################################################################

Feature:xq-p-flow-pih-modbcst4-cst10

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Validate FCP_ST fields and calculation - ICMS CST-10-30-70-90
    #--------------------------------------------------------------------------------
    Scenario: Creation PIH
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        #Header
        #Criar string baseada em datetime$ + 5 Random
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "val(ctrans(num$(datetime$),"-:TZ","")+ num$(int(rnd(99999))))" to the selected text field and hits enter key
        And the user selects the text field with name: "Result"
        And the user stores the value of the selected text field with the key: "DOCSUP017"
        Then the user clicks the Close page action icon on the header panel
        #Fim da criação da String
        And the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL0_BPRSAC"
        Then the user writes "FORN" to the selected text field and hits tab key
        #General Tab
        When the user clicks the "General data" tab selected by title
        And the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key
        #Management Tab
        When the user clicks the "Management" tab selected by title
        And the user selects the text field with X3 field name: "WE8ALL1_BPRVCR"
        And the user writes the stored text with key "DOCSUP017" in the selected text field and hits tab key

    Scenario Outline: Add Lines
        Given the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        And the user selects last row of the selected data table
        And the user opens "Popup view" function on toolbox of the selected row
        And the user selects the drop down list with name: "Source"
        And the user clicks on "Miscellaneous" option of the selected drop down list
        And the user hits tab
        And the user selects the text field with X3 field name: "WE8ALL3_ITMREF"
        And the user writes <ITMREF> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_QTYUOM"
        And the user writes <QTYUOM> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_NETPRI"
        And the user writes <NETPRI> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQCFOP"
        And the user writes <XQCFOP> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQVARCFOP"
        And the user writes <XQVARCFOP> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQORIGEMICMS"
        And the user writes <XQORIGEMICMS> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQCSTICMS"
        And the user writes <XQCSTICMS> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQCENQ"
        And the user writes <XQCENQ> to the selected text field and hits enter key
        And the user clicks the Close page action icon on the header panel

        Examples:
            | ITMREF   | QTYUOM | NETPRI  | XQCFOP | XQVARCFOP | XQORIGEMICMS | XQCSTICMS | XQCENQ |
            | "BMS001" | "5"    | "17.58" | "2101" | "4"       | "0"          | "10"      | "999"  |
            | "BMS001" | "7"    | "19.85" | "2101" | "4"       | "0"          | "10"      | "999"  |

    Scenario: Create/Sefas/Validation
        #Control Tab
        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL3_CUMLINAMT1"
        And the user stores the value of the selected text field with the key: "CALCVALUE"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE" in the selected text field and hits tab key
        #Create and Send to Sefaz
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user clicks the "Close page" main action button on the right panel
        #Verificar status da nota (6 = Autorizada)
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "[F:XQPIH]NFESTATUS" to the selected text field and hits enter key
        And the value of the "Result" text field is "6"
        Then the user clicks the Close page action icon on the header panel
        #Post Invoice
        When the user clicks the "Post" button in the header
        And an alert box with the text "The document will be validated! You will no longer be able to Modify or Delete it. Continue?" appears
        And the user clicks the "Ok" option in the alert box
        And a dialog box appears
        And the user clicks the "Ok" opinion in the alert box


        #Tax Detail - Check Values
        When the user clicks the "Tax detail" action button on the header drop down
        Then the "Tax detail" screen is displayed

    Scenario Outline: Tax Detail - Check Calculated Values
        Given the user selects the text field with X3 field name: "XQPTD0_CURLIG"
        When the user writes <CURLIG> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQPTD1_MDBCICMSST"
        And the value of the selected text field is <MDBCICMSST>

        Examples:
            | CURLIG | MDBCICMSST                   |
            | "1"    | "4 - Margin Value added (%)" |
            | "2"    | "4 - Margin Value added (%)" |

    Scenario: Resume - Check Calculated Values
        Given the user clicks the Close page action icon on the header panel
        # And the user clicks the "Resume" tab selected by title
        # When the user selects the text field with X3 field name: "XQPIH2_TOTBASEFCPST"
        # And the value of the selected text field is "2,276.9100"
        # And the user selects the text field with X3 field name: "XQPIH2_TOTICMSFCPST"
        # And the value of the selected text field is "45.5400"

        And the user clicks the Close page action icon on the header panel
        #Logout
        Then the user logs-out from the system