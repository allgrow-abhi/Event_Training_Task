tableextension 50123 "General Ledger Entry" extends "G/L Entry"
{
    fields
    {
        field(50000; "Purchase Vendor Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Purchase Vendor Code';
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