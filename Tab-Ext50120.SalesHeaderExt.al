tableextension 50120 "Sales Header Ext" extends "Sales Header"
{
    fields
    {
        field(50000; "Delivery"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Delivery';
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