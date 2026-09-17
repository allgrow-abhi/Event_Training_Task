// Task 9

pageextension 50122 "Customer Ledger Entry" extends "Customer Ledger Entries"
{
    layout
    {
        addafter("Document No.")
        {
            field("Sales Code"; Rec."Sales Code")
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