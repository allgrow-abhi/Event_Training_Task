tableextension 50125 "Purchase Header Ext." extends "Purchase Header"
{
    fields
    {
        field(50126; "Vendor code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Vendor Code';
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