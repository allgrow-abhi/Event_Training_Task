tableextension 50132 "Purchase Line Ext" extends "Purchase Line"
{
    fields
    {
        field(50000; "Item Category"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item Category';
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