pageextension 50125 "Purchase Order Ext." extends "Purchase Order"
{
    layout
    {
        addlast(General)
        {
            field("Vendor Code"; Rec."Vendor code")
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