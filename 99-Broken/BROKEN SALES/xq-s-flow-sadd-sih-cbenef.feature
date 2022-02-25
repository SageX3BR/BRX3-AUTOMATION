###########################################################################
# Header
# -------------------------------------------------------------------------
# - Test code:xq-s-flow-sadd-sih-cbenef
# - Description: Validate Additional sales invoice SEFAZ authorization with cBenef code in the products
# - Jira: X3-203123
# - Legislation: BR addon
# - Created by : Fausto Neto
# - Created date : 03/07/2020
# - Updated by : Fausto Neto
# - Updated date : 06/07/2020
# - Status : Automated
###########################################################################
# Notes
# -------------------------------------------------------------------------
# Prerequisites:
#   - Site: site address must be in Paraná state
#
# ###########################################################################

Feature:xq-s-flow-sadd-sih-cBenef

    #--------------------------------------------------------------------------------
    #X3 Login Scenario
    #--------------------------------------------------------------------------------
    Scenario: 1.Login scenario
        Given the user is logged into Sage X3 with "param:loginType" using user name "param:loginUserName" and password "param:loginPassword"

    #--------------------------------------------------------------------------------
    #Validate additional sales invoice SEFAZ authorization
    #--------------------------------------------------------------------------------
    Scenario: 2. SIH Creation
        Given the user opens the "GESSIH" function
        And the user selects the data table in the popup
        And the user selects cell with text: "ALL Full entry invoice" and column header: ""
        And the user clicks on the selected cell
        Then the "Sales invoice ALL : Full entry invoice" screen is displayed
        #Header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "SIH0_SALFCY"
        And the user writes "BR041" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_SIVTYP"
        And the user writes "BRNFC" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "SIH0_BPCINV"
        And the user writes "BR001" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSIH0_CODOPF"
        And the user writes "410" to the selected text field and hits tab key
        And the user hits escape
        And the user clicks the "Lines" tab selected by title
        Then the user selects the fixed data table for x3 field name: "WK5ALL4_ARRAY_NBLIG"

    #Lines
    Scenario Outline: Add Lines
        Given the user selects editable table row number: <LIN>
        And the user selects last fixed cell with X3 field name: "WK5ALL4_ITMREF"
        And the user adds the text <ITMREF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_QTY"
        And the user adds the text <QTY> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_GROPRI"
        And the user adds the text <GROPRI> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCFOP"
        And the user adds the text <XQCFOP> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQOICMS"
        And the user adds the text <XQOICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCSTICMS"
        And the user adds the text <XQCSTICMS> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCODBF"
        And the user adds the text <XQCODBF> in selected cell
        And the user selects last editable cell with X3 field name: "WK5ALL4_XQCENQ"
        And the user adds the text <XQCENQ> in selected cell
        And the user hits enter

        Examples:
            | LIN | ITMREF   | QTY  | GROPRI  | XQCFOP | XQOICMS | XQCSTICMS | XQCODBF    | XQCENQ |
            | 1   | "BMS001" | "12" | "10.54" | "6101" | "0"     | "41"      | "PR800000" | "999"  |
            | 2   | "BMS002" | "9"  | "29.52" | "6101" | "0"     | "41"      | "PR800000" | "999"  |

    Scenario: Create
        When the user clicks the "Create" main action button on the right panel
        And a confirmation dialog appears with the message "Record has been created"

    Scenario: Resume - Transmission and Validation
        Given the user clicks the "SEFAZ" action button on the header drop down
        And a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Rejected            : 000"
        And the selected log panel includes the message "    Number of NF-e Pending return      : 000"
        And the user clicks the "Close page" main action button on the right panel
        And the user clicks the "Post" button in the header
        And the user clicks the "Close page" main action button on the right panel
        And the user selects the text field with X3 field name: "SIH0_NUM"
        And the user stores the value of the selected text field with the key: "SIHNUM"
        Then the user clicks the Close page action icon on the header panel

    Scenario: Create Additional Invoice
        Given the user opens the "GESXQSADD" function
        Then the "Additional sales invoice" screen is displayed
        #Header
        When the user clicks the "New" main action button on the right panel
        And the user selects the text field with X3 field name: "XQSADDI0_CPY"
        And the user writes "BR10" to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSADDI0_FCY"
        And the user writes "BR041" to the selected text field and hits tab key
        And the user selects the drop down list with X3 field name: "XQSADDI0_DOCTYP"
        And the user clicks on "Sales Invoice (SIH)" option of the selected drop down list
        Then the value of the selected drop down list is "Sales Invoice (SIH)"
        And the user selects the text field with X3 field name: "XQSADDI0_ORIDOCNUM"
        And the user writes the stored text with key "SIHNUM" in the selected text field and hits tab key
        #Entering Tax detail screen
        Given the user clicks the "Tax detail" action button on the header drop down
        Then the "Tax detail" screen is displayed

    Scenario Outline: Tax detail lines
        Given the user selects the text field with X3 field name: "XQSTD0_LIN"
        And the user writes <LIN> to the selected text field and hits tab key
        # #And the user waits 1 seconds
        And the user selects the text field with X3 field name: "XQSTD1_XQCODBF"
        #Checking if the cBenef was suggested from the source document
        And the value of the selected text field is <XQCODBF>
        And the user selects the text field with X3 field name: "XQSTD1_XQCENQ"
        And the user writes <XQCENQ> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_CSTIPI"
        And the user writes <CSTIPI> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_CSTPIS"
        And the user writes <CSTPIS> to the selected text field and hits tab key
        And the user selects the text field with X3 field name: "XQSTD1_CSTCOF"
        And the user writes <CSTCOF> to the selected text field and hits tab key
        # #And the user waits 1 seconds
        And the user clicks the "OK" action button on the header drop down

        Examples:
            | LIN | XQCODBF    | XQCENQ | CSTIPI | CSTPIS | CSTCOF |
            | "1" | "PR800000" | "301"  | "03"   | "07"   | "07"   |
            | "2" | "PR800000" | "301"  | "03"   | "07"   | "07"   |


    Scenario: Resume - Save and transmission
        Given the user clicks the "Close" main action button on the right panel
        And the user clicks the "Yes" opinion in the alert box
        Then the user clicks the "Create" main action button on the right panel
        Given the user clicks the "SEFAZ" action button on the header drop down
        When a log panel appears
        And the user selects the main log panel of the page
        And the selected log panel includes the message "    Number of NF-e Rejected            : 000"
        And the selected log panel includes the message "    Number of NF-e Pending return      : 000"
        Then the user clicks the "Close page" main action button on the right panel

        #Logout
        Given the user clicks the Close page action icon on the header panel
        Then the user logs-out from the system