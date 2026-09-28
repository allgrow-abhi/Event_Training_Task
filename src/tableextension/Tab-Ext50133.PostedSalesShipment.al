tableextension 50133 "Posted Sales Shipment" extends "Sales Shipment Header"
{
    fields
    {
        field(50001; "Sales Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Sales Code';
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