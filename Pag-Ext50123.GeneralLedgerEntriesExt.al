pageextension 50123 "General Ledger Entries Ext" extends "General Ledger Entries"
{
    layout
    {
        addafter("Document No.")
        {
            field("Purchase Vendor Code"; Rec."Purchase Vendor Code")
            {
                ApplicationArea = all;
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}