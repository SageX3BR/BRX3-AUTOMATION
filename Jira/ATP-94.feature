###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code: ATP-94
# - Description: PROCESSO PARA GERAÇÃO CORRETA DA USER STORY X3DEV-1322 (NOTAENT - UFs REMENTE E DESTINATARIO)
# - Jira:
# - Legislation: BRA
# - Created by : Gustavo Albanus
# - Created date : 19/09/2022
# - Updated by : Fausto A Neto
# - Updated date : 14/10/2022
# - Status : Done
# - Correções: Ajustado a Chave do Documento
###########################################################################

Feature: ATP-94

    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    Scenario: 2. PIH Product Creation
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "val(ctrans(num$(datetime$),"-:TZ","")+ num$(int(rnd(99999))))" to the selected text field and hits enter key
        And the user selects the text field with name: "Result"
        And the user stores the value of the selected text field with the key: "DOCSUP041"
        Then the user clicks the Close page action icon on the header panel
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "BRNFF" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key

    Scenario: 3. General data
        Given the user clicks the "General data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "110" to the selected text field and hits tab key

    Scenario: 4. Management
        Given the user clicks the "Management" tab selected by title
        When the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "DOCSUP041" in the selected text field and hits tab key
        And the user clicks the "Lines" tab selected by title

    Scenario Outline: 5. Add Lines
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
        And the user writes <XQCFOP> to the selected text field and hits enter key
        And the user clicks the Close page action icon on the header panel

        Examples:
            | LIN | ITMREF   | QTYUOM | NETPRI | XQCFOP |
            | 1   | "BMS001" | "1"    | "1000" | "2102" |

    Scenario: 6. Control
        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL3_CUMLINAMT1"
        And the user stores the value of the selected text field with the key: "CALCVALUE"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE" in the selected text field and hits tab key

    Scenario: 7. Creation
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"

    Scenario: 8. Transmission
        Given the user clicks the "SEFAZ" action button on the header drop down
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
        And the user clicks the "Post" button in the header
        And the user clicks the "Ok" opinion in the alert box
        And the user clicks the "Ok" opinion in the alert box
        And the user selects the text field with X3 field name: "WE8ALL0_NUM"
        And the user stores the value of the selected text field with the key: "PIHNUM"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 9. PIH CTE Creation
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        When the user opens the header drop down
        And the user opens the "Diagnosis..." section on the right panel
        And the user clicks the "Calculator" secondary action button on the right panel
        And the "Calculator" screen is displayed
        And the user selects the text field with name: "Calculation:"
        And the user writes "val(ctrans(num$(datetime$),"-:TZ","")+ num$(int(rnd(99999))))" to the selected text field and hits enter key
        And the user selects the text field with name: "Result"
        And the user stores the value of the selected text field with the key: "DOCSUP041"
        Then the user clicks the Close page action icon on the header panel
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "CTE" to the selected text field and hits tab key
        And the user selects the text field with name: "Supplier"
        And the user writes "BR001" to the selected text field and hits tab key

    Scenario: 10. General data - PIH CTE
        Given the user clicks the "General data" tab selected by title
        When the user selects the text field with name: "Fiscal operation"
        And the user writes "995" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALLXQ_NUMNFE"
        And the user writes the stored text with key "DOCSUP041" in the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALLXQ_SERNFE"
        And the user writes "1" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALLXQ_CHAVENFE"
        And the user writes "35250235074116000150650000000000031953520309" to the selected text field and hits tab key

    Scenario: 11. Management - PIH CTE
        Given the user clicks the "Management" tab selected by title
        When the user selects the text field with name: "Supplier doc no."
        And the user writes the stored text with key "DOCSUP041" in the selected text field and hits tab key

    Scenario: 12. Shipping Data - PIH CTE
        Given the user clicks the "Shipping data" tab selected by title
        When the user selects the text field with name: "Source state"
        And the user writes "SP" to the selected text field and hits tab key
        When the user selects the text field with name: "Municipality of Origin"
        And the user writes "Mauá" to the selected text field and hits tab key
        And the user hits escape
        And the user clicks the "Lines" tab selected by title


    Scenario Outline: 12. Add Lines
        Given the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        And the user selects last row of the selected data table
        And the user opens "Popup view" function on toolbox of the selected row
        And the user selects the drop down list with name: "Source"
        And the user clicks on "Invoice" option of the selected drop down list
        And the user hits tab
        And the user selects the text field with X3 field name: "WE8ALL3_NUMORI"
        And the user writes the stored text with key "PIHNUM" in the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_LINORI"
        And the user writes "1000" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQCFOP"
        And the user writes <XQCFOP> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQORIGEMICMS"
        And the user writes <XQORIGEMICMS> to the selected text field and hits enter key
        And the user clicks the Close page action icon on the header panel

        Examples:
            | LIN | XQCFOP | XQORIGEMICMS |
            | 1   | "2102" | "0"          |

    Scenario: 13. Edit Line CTE
        Given the user selects the fixed data table for x3 field name: "WE8ALL3_ARRAY_NBLIG"
        When the user selects editable table row number: 2
        And the user opens "Popup view" function on toolbox of the selected row
        And the user selects the drop down list with name: "Source"
        And the user clicks on "Miscellaneous" option of the selected drop down list
        And the user hits tab
        And the user selects the text field with X3 field name: "WE8ALL3_ITMREF"
        And the user writes "SER022" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_QTYUOM"
        And the user writes "1" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_NETPRI"
        And the user writes "500" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQCFOP"
        And the user writes "2353" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "WE8ALL3_XQEXISS"
        And the user writes "1" to the selected text field and hits enter key
        And the user clicks the Close page action icon on the header panel

    Scenario: 14. Control - PIH CTE
        Then the user selects the text field with X3 field name: "WE8ALLXQ_NUMNFE"
        Given the user clicks the "Control" tab selected by title
        When the user selects the text field with X3 field name: "WE8ALL3_CUMLINAMT1"
        And the user stores the value of the selected text field with the key: "CALCVALUE01"
        And the user selects the text field with X3 field name: "WE8ALL4_TOTLINAMT"
        Then the user writes the stored text with key "CALCVALUE01" in the selected text field and hits tab key

    Scenario: 15. Creation - PIH CTE
        Given the user clicks the "Create" main action button on the right panel
        Then a confirmation dialog appears with the message "Record has been created"
        And the user clicks the "Post" button in the header
        And the user clicks the "Ok" opinion in the alert box
        And the user clicks the "Ok" opinion in the alert box
        And the user waits 60 seconds
        And the user selects the text field with X3 field name: "WE8ALL0_NUM"
        And the user stores the value of the selected text field with the key: "DOCCTE"
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 16. Delete PIH CTE
        Given the user opens the "GESPIH" function
        When the user selects the data table in the popup
        And the user selects cell with text: "ALL     Full entry" and column header: ""
        And the user clicks on the selected cell
        Then the "Purchase invoice ALL : Full entry" screen is displayed
        And the user selects the text field with name: "Invoicing site"
        And the user writes "BR011" to the selected text field and hits tab key
        And the user selects the text field with name: "Invoice type"
        And the user writes "CTE" to the selected text field and hits tab key
        And the user selects the text field with name: "Entry number"
        And the user writes the stored text with key "DOCCTE" in the selected text field and hits tab key
        Given the user clicks the "Accounting cancellation" action button on the header drop down
        And the user clicks the "Yes" opinion in the alert box
        When the user clicks the "Delete" main action button on the right panel
        And the user clicks the "OK" button in the header
        And the user clicks the "Ok" opinion in the alert box
        And the user clicks the "Close page" main action button on the right panel

    Scenario: 17.Logout
        Then the user logs-out from the system