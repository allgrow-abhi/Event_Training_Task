tableextension 50124 "Sales Shipment Ext" extends "Sales Shipment Line"
{
    fields
    {
        field(50000; "Project Code"; code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Project Code';
        }
        field(50001; "Item Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item Code';
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