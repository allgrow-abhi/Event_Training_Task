pageextension 50128 "Vendor Custom Field" extends "Vendor Ledger Entries"
{
    layout
    {
        addafter(Amount)
        {
            field("Vendor Code"; Rec."Vendor Code")
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