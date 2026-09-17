tableextension 50127 "Item Journal Line Ext" extends "Item Journal Line"
{
    fields
    {
        field(50000; "Item Code AS"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item Code AS';
        }
        // Add changes to table fields here
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}