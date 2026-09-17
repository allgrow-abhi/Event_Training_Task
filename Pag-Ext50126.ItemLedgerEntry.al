pageextension 50126 "Item Ledger Entry" extends "Item Ledger Entries"
{
    layout
    {
        addafter("Item No.")
        {
            field("Item Code AS"; Rec."Item Code AS")
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