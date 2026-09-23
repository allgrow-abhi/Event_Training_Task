pageextension 50131 "Item Card Ext" extends "Item Card"
{
    layout
    {
        addafter("Item Category Code")
        {
            field("Last Sales Unit Price"; Rec."Last Sales Unit Price")
            {
                ApplicationArea = all;
            }
            field("Last Purchase Unit Price"; Rec."Last Purchase Unit Price")
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