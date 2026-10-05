pageextension 50119 "Employee Page Ext" extends "Employee Card"
{
    layout
    {
        addafter("Job Title")
        {
            field("Dimension Code"; Rec."Dimension Code")
            {
                ApplicationArea = All;
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